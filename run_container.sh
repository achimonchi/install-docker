#!/bin/bash

# list services
services=("frontend" "backend")

#list ports that services will use
ports=(8080 8081)

# loop the services
for i in ${!services[@]}
do
	echo "Starting running container ${services[$i]} ..."
	sleep 1
	# script for running docker container
	docker run -d \
	--name "${services[$i]}" \
	-h "${services[$i]}" \
	-p "${ports[$i]}:80" \
	-v "$PWD/${services[$i]}:/usr/share/nginx/html" \
	nginx
	sleep 1
	echo "Container ${services[$i]} running completely on port ${ports[$i]}"
	sleep 1
done


#docker run -d \
#--name $1 \
#-h $1 \
#-p $2:80 \
#-v $3:/usr/share/nginx/html \
#nginx
