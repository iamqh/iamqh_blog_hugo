---
title: Mình đã tạo blog cá nhân trong 10 phút như thế nào?
date: 2020-06-22 18:39:34
tags: ["nodejs", "chem-gio"]
---
Sau khi viết một số bài trên Viblo, mình đã nảy ra ý định (thực ra là từ năm nhất rồi nhưng mà lười) làm một blog cá nhân để tổng hợp lại kiến thức cũng như nâng cao khả năng chém gió. Và... sau nửa buổi tối lục lọi trên Google và Github, cuối cùng mình cũng đã tìm được thứ mà mình cần: một **static blog framework** 

## **Tại sao lại là static?**
Thực tế, đa số các trang web chúng ta truy cập hiện nay đều là các **web động** (dynamic web), nghĩa là khi ta truy cập, server mới thực hiện quá trình load data và render ra HTML. Tuy nhiên, mục đích của mình chỉ là tạo ra một blog hiển thị nội dung có sẵn, nên việc triển khai một dynamic web là không cần thiết, lại còn phải config database, code củng nữa, mệt lắm :(

Nói thế nhưng việc tự soạn từng dòng HTML cũng là công việc cũng rất gì và này nọ đấy. Chưa kể nếu "chả may" blog có 1000 bài viết, bạn tự nhiên muốn đổi theme mới cho blog :)). Haizz, tính sao nhỉ? Dynamic web thì lười code, tải MySQL, static web thì ko tuỳ biến được hàng loạt. Và bùmm, chúng ta có **static site generators**

## **Hexo**
Static site generators sẽ giúp bạn tạo ra các nội dung với markdown (như mấy file Readme.md trên github ý). Chúng ta chỉ cần tập trung vào viết lách, còn theme, tạo HTML thì đã có em nó lo hết từ A đến Z. Đúng thứ mà mình cần

Có rất nhiều static site generator, như Hexo, Hugo,... Tuy nhiên mình đã biết javascript nên sẽ chọn Hexo đơn giản vì nó viết bằng Node.js.

Ok, lan man thế đủ rồi, vào việc thôi

## **Cài đặt môi trường**
Trước tiên, chúng ta cần cài những thứ sau:
- Node.js 8 trở nên (mình đang dùng Node.js 12)
- git
- Trình soạn thảo (mình dùng VS Code)
- Firebase-cli

Sau đó, chúng ta cài đặt `hexo-cli` thông qua `npm`

```
$ npm install -g hexo-cli
```

Xong rồi, mất tầm 2 phút nhỉ :D

## **Tạo một blog local**
Tạo một thư mục chứa blog của bạn, rồi chạy lệnh sau:
```
$ hexo init <folder>
$ cd <folder>
$ npm install
```
Chạy blog tại local:
```
$ hexo server
```
Rồi, mở thử http://localhost:4000 xem sao! Mất thêm 2 phút nữa :D

## **Viết thử một bài xem sao**
Để tạo bài viết mới, ta dùng lệnh
```
$ hexo new <tên-bài-viết>
```
Hexo sẽ tạo một file `<tên-bài-viết>.md` trong ` /source/_post` và thư mục chứa asset của post đó trong ` /source/_post/<tên-bài-viết>`. Chúng ta chỉ cần soạn bài trên file `md` thôi thôi.

Sau đó, để tạo HTML, chỉ cần chạy lệnh:
```
$ hexo generate
```

Giờ chạy lại server và xem kết quả! Mất thêm 2 phút nữa :(

## **Hexo theme**
Hexo cung cấp cả một tá theme nhiều thể loại, chúng ta cũng có thể tạo một theme riêng cho mình luôn :D. 

Cài đặt theme ra sao? Mỗi thư mục con trong folder `/themes/` là một theme, bạn chỉ cần clone source của theme mình thích và nhét vào là được. VD mình tải theme [Apolo](https://github.com/pinggod/hexo-theme-apollo), nhét nó vào `/themes/`. Bây giờ mở file `_config.yml` trong thư mục blog ra, cấu hình lại them từ `landscape` sang `apollo`:
```yml
# Extensions
## Plugins: https://hexo.io/plugins/
## Themes: https://hexo.io/themes/
#theme: landscape
theme: apollo
```

Ok, chạy lại server và xem kết quả :D. Mất thêm 2 phút nữa

*Lưu ý, một điều rất hay ở đây là hexo tách mỗi theme ra thành một project riêng, có package.json riêng, có _config.yaml riêng vì thế rất rõ ràng và tiện lợi, nếu bạn cài đặt theme khác thì chú ý tài liệu của theme để cấu hình theme cho đúng nhé.*

## **Deploy**
Giờ để người khác cũng đọc được blog của mình thì cần phải deploy nó. Có nhiều cách để deploy, VD dùng Github Pages hay Gitlab Pages. Tuy nhiên, trong bài này thì mình dùng Firebase Hosting.

Trước hết tạo một project trên Firebase Console, sau đó mở cmd tại thư mục blog lên, đăng nhập vào firebase:
```
$ firebase login
```

Sau đó, deploy bằng lệnh
```
$ firebase deploy
```

Lúc này firebase sẽ bắt chọn project để deploy, chọn đúng project mình vừa tạo là được. Rồi, thế là blog của bạn đã được đưa lên `https://<id-project>.web.app`

Mất thêm 2 phút nữa. Vậy là chúng ta đã có một blog cá nhân cho riêng mình rồi!

## **Lời kết**
Vậy là bài viết của mình đã xong rồi. Trang blog này của mình cũng sử dụng Hexo để làm. Cảm ơn các bạn đã theo dõi mình chém gió từ nãy đến giờ!!

Hy vọng qua bài viết này, các bạn cũng sẽ tạo được blog riêng cho mình.
