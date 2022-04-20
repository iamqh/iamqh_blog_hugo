FROM klakegg/hugo:0.95.0-ubuntu-onbuild
COPY . /src
CMD ["server"]
