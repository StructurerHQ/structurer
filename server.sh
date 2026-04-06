source .env

docker stop structurer 2>/dev/null || true
docker rm structurer 2>/dev/null || true

docker run --name structurer \
  -p 8055 \
  --restart unless-stopped \
  -e VIRTUAL_HOST=$VIRTUAL_HOST  \
  -e LETSENCRYPT_HOST=$LETSENCRYPT_HOST \
  -e LETSENCRYPT_EMAIL=$LETSENCRYPT_EMAIL \
  -v `pwd`/dist:/usr/share/nginx/html:ro \
  -v `pwd`/nginx/default.conf:/etc/nginx/conf.d/default.conf:ro \
  -d nginx
