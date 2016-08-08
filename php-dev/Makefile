dl:
	mkdir -p ./Dockerfiles/php/extensions
	wget http://pecl.php.net/get/redis-3.0.0.tgz -O ./Dockerfiles/php/extensions/redis.tgz
	wget http://pecl.php.net/get/xdebug-2.4.0.tgz -O ./Dockerfiles/php/extensions/xdebug.tgz
	wget http://pecl.php.net/get/mongodb-1.1.8.tgz -O ./Dockerfiles/php/extensions/mongodb.tgz

rm:
	docker rm -vf dev_nginx
	docker rm -vf dev_php
	docker rm -vf dev_mongo
	docker rm -vf dev_mysql
	docker rm -vf dev_redis

rmi:
	docker rmi -f dockerfiles_dev_nginx
	docker rmi -f dockerfiles_dev_php
	docker rmi -f dockerfiles_dev_mongo
	docker rmi -f dockerfiles_dev_mysql
	docker rmi -f dockerfiles_dev_redis

