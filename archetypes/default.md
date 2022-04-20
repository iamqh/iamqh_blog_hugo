---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
---

{{replaceRE " :\\b([a-z\\-_]+)\\b:" " <i class='em em-$1'></i>" .Content}}