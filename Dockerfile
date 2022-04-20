FROM klakegg/hugo:0.95.0-ubuntu-onbuild as hugo
COPY . /src

FROM nginx
COPY --from=hugo /target /usr/share/nginx/html