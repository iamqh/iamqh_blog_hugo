#!/bin/bash
docker stop iamqh_blog
docker rm iamqh_blog
docker run -d -e VIRTUAL_HOST=blog.iamqh.me --name iamqh_blog hugo-app:latest