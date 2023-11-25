#!/bin/bash
# Sets up & starts your nginx server. Expects to be run with nginx already
# installed

cat <<EOF >"/etc/nginx/sites-available/$DOMAIN"
server {
  listen 80;
  listen [::]:80;

  server_name $DOMAIN;
  server_tokens off;

  location / {
    proxy_pass http://localhost:3000;
    proxy_set_header X-Forwarded-Proto \$scheme;
  }

  location /socket.io/ {
    proxy_pass http://localhost:4000/socket.io/;
    proxy_http_version 1.1;
    proxy_set_header Upgrade \$http_upgrade;
    proxy_set_header Connection "Upgrade";
    proxy_set_header Host \$host;
  }

  location /peerjs/ {
    proxy_pass http://localhost:3000/peerjs/;
    proxy_http_version 1.1;
    proxy_set_header Upgrade \$http_upgrade;
    proxy_set_header Connection "Upgrade";
    proxy_set_header Host \$host;
  }

  client_max_body_size 2048M;
  proxy_connect_timeout 600;
  proxy_send_timeout 600;
  proxy_read_timeout 600;
  send_timeout 600;
}
EOF

ln -s "/etc/nginx/sites-available/$DOMAIN" /etc/nginx/sites-enabled/
systemctl restart nginx
