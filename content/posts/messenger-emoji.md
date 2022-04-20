---
title: Hành trình tìm lại emoji của messenger
date: 2021-05-14 20:29:16
tags: ["javascript", "chem-gio"]
---
Hế lu mọi người, sau một năm sủi để tìm cách thoát ế, mình mới nhớ ra là mình vẫn còn 1 cái blog :grin:. Trở lại lần này, mình tự mày mò thêm 1 vài tính năng mới cho cái blog đã bị mạng nhện bám kín này như là đổi qua lại giữa <b>Dark/light theme</b>, hay là tự làm hệ thống comment riêng cho blog. Mấy cái này nếu có thời gian mình sẽ viết sau (hoặc là sủi tiếp :relieved:)

Hôm nay mình sẽ nói về hành trình tìm lại hệ thống emoji của messenger cái thời mình học năm nhất, năm hai (khoảng năm 2016-2017 gì đó) và đưa nó lên blog nhé.
## Emoji của messenger
Hẳn đến đây chắc các bạn đang tự hỏi: "Emoji của messenger bây giờ vẫn có mà, việc gì phải tìm lại?". Tuy nhiên mình đang nói đến cái này:

![](/y-nghia-cua-nu-cuoi-khong-con-gi-de-noi-1200x1241.jpg)

Đây, chính nó, đây là icon đã bị Facebook khai tử 4 năm về trước, cái thời mà mỗi khi chúng ta nhận được nó là "Thôi chết, ăn loằn rồi..". Thực ra thì icon mặt cười hiện tại nhìn lâu thì vẫn thấy ghét nhưng không thể nào trông "hãm" được như icon trên cả. Nên là mình quyết định sẽ mang nó về blog này :sunglasses:

## Tìm lại font/ảnh
Giờ mình tìm lại thì chỉ có ảnh ở trên [Emojipedia](https://emojipedia.org/) thôi chứ font thì không tìm thấy. Thôi, lại đào ông Google lên vậy. Sau khi lục tung cái google lên, mình đã tìm được [cái này](https://github.com/needim/wdt-emoji-bundle/). Về cơ bản thì nó là một sheet ảnh gồm tất cả các emoji của messenger và đã được index dưới định dạng json bao gồm shortname, position trên sheet.

Vì vậy mình có thể convert thành css được theo [cách này](https://jsfiddle.net/wytmv6da/3/).
```css
.em {
  display: inline-block;
  height: 1em;
  width: 1em;
  overflow: hidden;
  line-height: 18px;
  font-size: 22px;
  vertical-align: middle;
  margin-top: -4px;
  color: transparent !important;
  background: url(https://raw.githubusercontent.com/needim/wdt-emoji-bundle/master/sheets/sheet_messenger_64_indexed_128.png);
  background-size: 4100%;
}

.em .em-grinning {
	background-position: 65% 37.5%
}

.em.em-grin {
	background-position: 65% 40%
}
```
Mình sẽ đặt tên từng class của css theo shortname của emoji và dựa vào position trên sheet để "cắt" được ảnh ra thành từng emoji.

## Mang lên blog
Ok, vậy là phần tìm ảnh đã xong, bây giờ là mang nó lên blog. Như đã nói ở [bài viết trước](/2020/06/22/toi-da-tao-blog-ca-nhan-trong-10-phut/), blog này mình tạo ra nhờ Hexo, nên việc làm sao để chuyển các shortname trong bài viết ở markdown sang thành emoji tương ứng cũng sẽ nhờ đến Hexo. Rất may là Hexo có hệ thống tự viết scripts và plugin khá tiện lợi. Ý tưởng của mình là trước khi bắt đầu generate từ markdown sang html, mình sẽ cho dữ liệu markdown chạy qua một lớp filter để tìm những shortname dưới dạng chuẩn là `:<shorname>:` thành html class dạng `<i class="em em-<shortname>"></i>`

Code thì đơn giản thôi, dùng regex replace là xong ^^
```javascript
hexo.extend.filter.register('before_post_render', data => {
    data.content = data.content.replace(/ :(\w+):/ig, (match, p1) => { 
        return renderEmoji(p1)
    });

    return data;
});

function renderEmoji(name) {
    return ` <i class='em em-${name}'></i>`;
}
```

Nhét nó vào folder `scripts` rồi clean project rồi build lại... Bùm ... :slightly_smiling_face:, I'm back!!

## Kết
Hiện tại thì cách này của mình mới chỉ hỗ trợ cho shortname, chứ chưa hỗ trợ cho kí tự unicode, có thể mình sẽ thêm trong tương lai.
