# --restart=always

docker pull mysql
docker run -e MYSQL_ROOT_PASSWORD=password -e MYSQL_USER=wpuser -e MYSQL_PASSWORD=password -e MYSQL_DATABASE=wpdb -d --name mysql -v /Users/sasadangelo/mywebsite/mysql:/var/lib/mysql mysql
docker pull wordpress
docker run -e VIRTUAL_HOST=www.mywebsite2.com -e WORDPRESS_DB_USER=wpuser -e WORDPRESS_DB_PASSWORD=password -e WORDPRESS_DB_NAME=wpdb --name wordpress -p 8080:80 --link mysql:mysql -v /Users/sasadangelo/mywebsite/wordpress:/var/www/html wordpress
docker run -d --name nginx -p 80:80 -e DEFAULT_HOST=www.mywebsite2.com -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy:alpine

# --restart=always
#docker run -d --name nginx -p 80:80 -p 443:443 -e ENABLE_IPV6=true -e DEFAULT_HOST=www.mywebsite2.com -e VIRTUAL_PROTO=uwsgi -v /Users/sasadangelo/mywebsite/nginx/htpasswd:/etc/nginx/htpasswd -v /Users/sasadangelo/mywebsite/nginx/conf.d:/etc/nginx/conf.d:ro -v /Users/sasadangelo/mywebsite/nginx/certs:/etc/nginx/certs -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy:alpine

#docker run -d --name nginx -p 80:80 -e DEFAULT_HOST=www.mywebsite2.com -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy:alpine


docker run -it --rm --link mysql:mysql -v webagency_wordpress_volume:/var/www/html --net webagency_default wordpress:cli /bin/bash
