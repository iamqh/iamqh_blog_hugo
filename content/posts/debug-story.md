---
title: Câu chuyện debug
date: 2021-05-29 07:53:49
tags: ["iOS", "chem-gio"]
---

Hôm trước tester có report cho mình một lỗi đó là khi đã thanh toán thành công rồi mà trên app mobile lại hiện là hoá đơn không hợp lệ. Nghe có vẻ magic :slightly_smiling_face:. Nào, cùng bắt đầu hành trình tìm cái ngu của bản thân nào!

## Hiểu vấn đề

Bước đầu tiên là cần phải hiểu vấn đề đã. Nếu trên client báo lỗi như vậy thì có 2 khả năng
- Lỗi server
- Lỗi client (cụ thể ở đây là app iOS)

Tuy nhiên, bên Android vẫn chạy được đúng, nên là có vẻ khả năng mình code ngu nó đã hiện hữu rồi đấy :sob:. Giờ phải xem là mình đang code ngu chỗ nào.

## Tìm hiểu nguyên nhân

Có vẻ đây là lỗi khi client call API lên server. Từ khi được khai sáng thì công cụ mình hay dùng nhất để xem client đã gửi những gì lên server đó là [Proxyman](https://proxyman.io/). Cắm Proxyman vào trong simulator, thanh toán thử 1 lần. Ồ, mọi thứ mượt mà, không thấy lỗi liếc gì cả. Nghe có vẻ khoai.

Mình nhờ tester tái hiện lại lỗi. Hoá ra, lỗi chỉ xảy ra khi mình chưa thanh toán luôn mà chọn lại danh sách hoá đơn rồi mới thanh toán. Kết quả là Proxyman bắt được 2 request thanh toán từ client đến server cho 2 danh sách hoá đơn khác nhau. 

Vậy là có thể chắc chắn là do mình code ngu rồi :sweat_smile:. Sửa sai thôi

## Phân tích nguyên nhân

Trước hết thì mình cùng đảo qua flow của phần thanh toán này chút nhé.

![](/debug_overview.png)

Hmm, nhìn vào sơ đồ bên trên và với thực tế bị duplicate API thì có vẻ lỗi nằm ở phần Notification Center. Và ở trong AppDelegate mình chỉ sử dụng đúng 1 tên duy nhất để thông báo. Vì vậy, rất có thể là đã có nhiều hơn 1 instance đã lắng nghe và gửi request lên server. Nhưng mà chỉ có duy nhất màn hình Payment là "hứng" cái thông báo đó thôi. Từ đó mình dự đoán màn hình Payment đang có vấn đề với Notification Center :fearful:


## Cùng đi fix bug

Thông thường, trong 1 ViewController đang observe 1 Notification, chúng ta sẽ bắt đầu lắng nghe khi viewDidAppear và dừng lắng nghe khi viewDidDisapear. Nhưng app hiện tại thì mình sử dụng RxSwift, gói hết chúng vào 1 DisposeBag, nó sẽ được giải phóng đồng thời cùng với ViewController. Vì vậy có thể bug xuất hiện do ViewController đã không deinit đúng như mong đợi, hay nói 1 cách đơn giản là mình code ngu nên bị leak memory cmnr :joy:

Mình thử đặt log vào hàm deinit của màn hình Payment thì không thấy nó in ra. Nghĩa là mình dự đoán đã chính xác :sunglasses:. Okay, vậy thì đi fix bug thôi

Không nằm ngoài dự đoán, nguyên nhân bị leak memory là do retain cycle trong các closure. Cách đơn giản để fix chúng là thêm `[weak self]` mà thôi. Giờ sửa lại rồi chạy thử xem sao. Kết quả là phần log của deinit đã hiện. Giờ test thử theo luồng mà tester cung cấp. Tuyệt vời, không thấy bị nữa, Proxyman cũng chỉ bắt được 1 request mà thôi. Có vẻ mình đã xử gọn được con bug này rồi :joy:

## Kết

Đấy, thế mới thấy là leak memory ngoài việc ảnh hưởng đến hiệu năng của ứng dụng nó còn làm sai cả business nữa. Nghiêm trọng quá. Thôi, cũng coi như có thêm tí kinh nghiệm để lần sau code bớt ngu đi :joy: