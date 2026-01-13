# Użyj lokalnego serwera HTTP zamiast nginx
FROM alpine:3.18

# Instaluj prosty serwer HTTP
RUN apk add --no-cache busybox

# Skopiuj stronę HTML
COPY . /www
WORKDIR /www

# Uruchom prosty serwer HTTP na porcie 8080
EXPOSE 8080
CMD ["busybox", "httpd", "-f", "-p", "8080", "-h", "/www"]
