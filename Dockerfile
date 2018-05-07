FROM nginx
COPY simplehtml.html /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d
