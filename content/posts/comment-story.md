---
title: "Chuyện comment, mộng mơ và cái sự lười"
date: 2021-08-03 19:03:10
tags: ["chem-gio"]
---

Chuyện kể rằng có một cậu thanh niên đua đòi đi làm blog. Sau khi tạo ra blog và làm hẳn một bài viết để chém gió cách làm blog trong 10 phút, cậu ta lại muốn blog phải có chỗ để các bạn đọc có thể góp ý, bởi lẽ cậu này viết ẩu lắm, bài viết ra không sai chỗ này thì cũng sai chỗ kia.

Và thế là, cậu cũng sắm cho blog của mình một nút comment. Hồi đó, mọi người dùng Disqus nhiều lắm, nên là cậu cũng dùng Disqus.

Theo thời gian, người ta nói nhiều về mặt trái của Disqus, nào là dữ liệu mình không trực tiếp nắm giữ, rồi thì thời gian load lâu, thi thoảng không hiện, vân vân và mây mây :cloud:. Và thế là, cậu cũng học đòi nghỉ chơi với Disqus và tự build một cái nút comment riêng cho blog của mình.

## Thực tế

Nói thì dễ, nhưng bắt tay vào làm thì cậu ta nhận ngay một cú tát vào mặt. Blog được host trên github, làm gì có server, cậu cũng chả có tiền để mà mua server hay mua domain. Thế là cậu nghĩ đến con server crawl comic của mình trên heroku. Cơ mà máu lười trong cậu lại trỗi dậy mạnh mẽ, thế là dù có mỗi 2 cái API <b>post</b> và <b>get list</b> comment thôi, cậu cũng không thèm code mà tìm đến 1 phương án khác "ít phải code" hơn.

Cậu muốn trước khi comment, người ta cần phải login, vốn là con người lười biếng, cậu xài luôn dịch vụ login của Google, đỡ phải code ra cái authentication system rồi phải xem xem để thông tin user ở đâu. Phía frontend cũng chỉ cần lấy ra tên hiển thị và avatar của user đã đăng nhập, cho nó vào comment payload rồi gửi đi là xong.

Và vì là người lười ơi là lười, cậu ta biết rằng có nhiều người (như cậu ta) thấy phải login là khỏi cần comment luôn, vì phải tốn thêm 1 bước đăng nhập. Vậy là bên cạnh việc login, cậu thêm 1 tuỳ chọn cho phép mọi người comment mà không cần login luôn. Khi đó, frontend sẽ gán tên thành "Không tên" và avatar sẽ là ảnh con Unown trong Pokémon. Nghe hợp lý phết nhờ.

Ý tưởng thế nghe có vẻ ổn rồi. Giờ đến phần chọn 1 phương án thay cho việc phải code API. Và rồi vì đã dùng đến Google Auth rồi, cậu ta quyết định dùng luôn dịch vụ Firestore của ông Google luôn.

![](/comment_sys.jpg)

## Mộng mơ

Sau khi dựng xong và hoàn thành phần frontend, mọi thứ có vẻ hoạt động tốt. Máu mộng mơ của cung Song ngư trong cậu lại trỗi dậy. Cậu bắt đầu mơ mộng đến cái viễn cảnh blog của cậu có nhiều người vào đọc. Lúc này cậu bắt đầu phát hiện ra là hình như cậu chưa có cơ chế bảo mật nào để tránh các bạn đọc spam comment cả. Không biết cái này là do cậu lười hay là do cậu luôn nghĩ là chả có mấy người đọc blog của mình nữa.

Cậu bắt đầu nghĩ về việc spam comment, có 2 loại nghịch ngợm mà cậu có thể nghĩ đến:
- **Loại thủ công 0.4:** Những comment không có nội dung của các thanh niên kiên nhẫn spam và ấn Submit
- **Loại công nghệ cao:** Phát huy tinh thần công nghệ bốn chấm không, các bạn sẽ tự viết những đoạn script tự động submit với số lượng và cường độ cao ngút (nghe giống hồi trẻ trâu đi xin script để auto like facebook của người sau này thành người yêu mình :relieved:)

Với loại đầu tiên thì để đáp lại sự kiên nhẫn của độc giả, có lẽ chúng ta cũng nên xử lý bằng cách xoá thủ công cho phải phép chứ nhỉ.

Còn đối với các đối tượng 4.0, thì chắc cũng phải dùng 4.0 để xử lý. Cơ mà dù sao thì gốc rễ của vấn đề đến từ việc chủ nhà lười không tìm biện pháp giữ nhà. Cho nên biện pháp biện pháp khắc phục sẽ là cố gắng phát hiện các comment được tạo bởi máy tính chứ không phải con người. Cơ mà hiện tại blog đang dùng Firebase nên chủ nhà vẫn chưa biết phải làm sao.

Có một vài phương án có vẻ khả quan như:
- Giới hạn tần suất submit form (rõ ràng là youtube có tính năng này mà VCS lại không dùng)
- Năn nỉ bạn đọc không spam nữa (dù thực tế thì đang chả có ai thèm comment cả :sob:)
- Xác minh "tính người" mỗi khi comment
- Vân vân và mây mây :cloud:

Đến đây cậu thanh niên nọ đột nhiên bị kéo ra khỏi cơn mơ vì bị 2 đứa cháu bắt đầu ăn vạ đòi bế. Vậy nên các bạn đọc thông thái hãy góp ý cho cậu ấy để cậu có thể hoàn thiện được comment system cho blog của mình nhé!

## Kết

Bài này viết cho vui vậy thôi chứ cậu thanh niên bờ lốc gơ này không có ý định share hay open mã nguồn của cái comment system này đâu. Cậu ấy viết bài này không có mục đích nào khác ngoài việc năn nỉ mọi người có thể đọc, chia sẻ và góp ý cho blog của cậu ngày một tốt lên mà thôi :blush: