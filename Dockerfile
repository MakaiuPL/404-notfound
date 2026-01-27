FROM nginx:alpine

COPY index.html /usr/share/nginx/html/index.html

RUN echo 'server { \
    listen 80; \
    root /usr/share/nginx/html; \
    index index.html index.htm; \
    \
    # Obsługa wszystkich ścieżek przez index.html (SPA-style) \
    location / { \
        root /usr/share/nginx/html; \
        try_files \$uri /index.html =404; \
    } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
