#!/bin/bash
docker stop iamqh_blog
docker rm iamqh_blog
docker run -d -e VIRTUAL_HOST=blog.iamqh.me -p 2909:80 --name iamqh_blog hugo-app:latest