# Dockerfile dla strony błędu
FROM nginx:alpine

# Skopiuj stronę HTML
COPY index.html /usr/share/nginx/html/index.html

# Modyfikuj konfigurację nginx jeśli trzeba
RUN echo 'server { \
    listen 80; \
    server_name _; \
    root /usr/share/nginx/html; \
    index index.html; \
    \
    location / { \
        try_files \$uri \$uri/ =404; \
    } \
    \
    # Cache control dla statycznej strony \
    location ~* \.(html)$ { \
        expires -1; \
        add_header Cache-Control "no-store, no-cache, must-revalidate"; \
    } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
