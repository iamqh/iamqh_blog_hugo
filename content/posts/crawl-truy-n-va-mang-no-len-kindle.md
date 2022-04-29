+++
date = 2022-04-28T17:00:00Z
draft = true
tags = ["python", "crawl"]
title = "Crawl truyện và mang nó lên Kindle"

+++
Chuyện là đợt dính covid vừa rồi phải cách ly một mình một cõi, mình mới nhận ra là mình còn sở hữu một em kindle paper white đời thứ 3 vẫn còn ngon. Hồi đấy mua về để đọc truyện mà sau lại lười quá, vứt xó rồi quên luôn :sweat_smile:. Cách ly chán quá, nên mình có thời gian đọc cày xong **Kimetsu no yaiba** luôn. Rảnh thật đấy :relieved:. Mấy hôm nay thì mình có đọc tiếp Conan, bác tác giả ra chap mới lâu thiệt chứ. Thế là tình cờ phát hiện ra một trang truyện dịch lại những quyển tiêu thuyết (không phải là manga nha). Cơ mà đọc trên kindle quen rồi, đọc trên máy điện thoại hay tablet mình thấy khó tập trung hơn. Nên mình quyết định thử chuyển mấy cuốn truyện đó lên Kindle được hay không!

# Crawl data

Okay, let's start! Trước hết thì trang web mình tìm được là [Truyện dịch](). Như các bạn đã thấy, trang web đã có đầy đủ các thông tin cơ bản của 1 ebook như cover, tác giả, lời giới thiệu và mục lục.

Bây giờ chúng ta cùng vào xem thử một chương của tiểu thuyết xem sao. May quá, toàn bộ đều chỉ là html bình thường, không phải load js gì cả. Vậy thì việc crawl data sẽ không gặp khó khăn gì cả! Mình sẽ sử dụng python kết hợp với lxml để crawl thôi. Sau khi trích xuất được content của từng chapter, mình sẽ lưu nó lại thành từng file `markdown` tương ứng với từng chapter. Còn tại sao lại là markdown thì phần sau sẽ rõ

```python
# Thêm sau
```

# Tạo ebook

Mình rất là khó chịu với việc đọc phải ebook nào mà không có mục lục, khi đó để xem mình đang đọc đến đâu hoặc là chọn nhanh 1 chương là gần như không thể. Vì vậy mình tách mỗi chapter thành 1 file markdown, và dùng MarkdownPP để gắn chúng lại với nhau.

```python
# Thêm sau
```

Như các bạn thấy ở trên, trc khi thêm từng chapter, mình đều để 1 heading, điều này sẽ giúp chúng ta dễ dàng trong bước tạo ebook này.

Okay, vậy là đã tạo được 1 ebook "tạm đọc được". Giờ mình sẽ dùng pandoc để chuyển markdown sang ebook định dạng epub.

Làm cái này mình mới nhận ra là làm ebook cũng style bằng css. Tất nhiên là nó không đến mức phức tạp như web, chỉ là style 1 vài tag cơ bản thôi. Ví dụ như style dưới đây

```css
    body { font-family: Georgia,"Times New Roman",Times; margin: 5%; text-align: justify; font-size: medium; }
    code { font-family: monospace; }
    section h1 { text-align: left; font-size: 4.5em; font-weight: bold; margin-bottom: 0; padding-bottom: 0; font-style: italic; }
    h1 + p { margin-top: 0; padding-top: 0; }
    h2 { text-align: left; font-size: 1.5em; }
    h3 { text-align: left; font-size: 1em; font-weight: bold; }
    h4 { text-align: left; }
    h5 { text-align: left; }
    h6 { text-align: left; }
    h1.title { text-align: left; font-size: 2em; margin-top: 50%; }
    h2.author { font-size: 1.3em; }
    h3.date { }
    div.title h1 { text-align: left; font-size: 2em; margin-top: 50%; }
    ol.toc { padding: 0; margin-left: 1em; }
    ol.toc li { list-style-type: none; margin: 0; padding: 0; }
    hr { border: none; text-align: center; }
    hr:after { content: '* * *'; }
    #toc > ol > li > a { display: none; }
    #the-night-alphabet blockquote { margin-top: 50%; font-style: italic; }
    #the-night-alphabet h1 { text-align: center; font-size: 4em; page-break-after: always; }
```

Sau khi style xong thì mình build ebook thôi

```python
# Thêm sau
```

Cuối cùng là vứt nó lên kindle bằng cách gửi qua mail mình đã đăng kí. Và đây là thành quả

![](https://i.imgur.com/ofncrv2.jpeg)

# Kết

Đây là toàn bộ source code mà mình đã dùng để crawl và chuyển sang epub. Các bạn có thể tham khảo tại [repo này]().

Còn rất nhiều điều có thể làm tiếp tại dự án này, như là thêm ảnh cover cho ebook, tạo extension cho chrome để có thể download trực tiếp từ trang web hoặc tạo 1 con web riêng để mọi người có thể điền link vào và tải về, vân vân và mây mây...

Xin cảm ơn các bạn đã kiên nhẫn đọc đến tận đây (tui nói vậy thôi chứ tui biết bạn scroll xuống đây từ đầu trang, chỉ tốn có 3 giây). Nếu thấy có thêm ý tưởng hay có gì muốn góp ý, các bạn hãy comment phía bên dưới nhé!!