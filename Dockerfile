# Site statique Tsena Cozy servi par Nginx
FROM nginx:1.28-alpine

# Configuration Nginx du site
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf

# Fichiers du site
COPY index.html /usr/share/nginx/html/
COPY css/ /usr/share/nginx/html/css/
COPY img/ /usr/share/nginx/html/img/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -q --spider http://127.0.0.1/ || exit 1
