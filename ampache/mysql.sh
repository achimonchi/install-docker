docker run -d \
--name mysql \
-p 127.0.0.1:3306:3306 \
-e MYSQL_ROOT_PASSWORD=admin \
mysql
