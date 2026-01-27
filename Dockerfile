FROM nginx:alpine

# Kopiuj stronę błędu
COPY index.html /usr/share/nginx/html/index.html
COPY 404.html /usr/share/nginx/html/404.html  # Opcjonalnie

# Prawidłowy nginx config
RUN echo 'server { \
    listen 80; \
    server_name _; \
    root /usr/share/nginx/html; \
    index index.html index.htm; \
    \
    location / { \
        try_files \$uri \$uri/ /index.html;  # Root / → index.html, nieznane → index.html \
    } \
    \
    error_page 404 /404.html;  # Custom 404 jeśli chcesz \
    \
    location ~* \.(html)$ { \
        expires -1; \
        add_header Cache-Control "no-store, no-cache"; \
    } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
