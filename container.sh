#!/bin/bash

command=$1

# list services
services=("frontend" "backend")

#list ports that services will use
ports=(8080 8081)

# loop the services
for i in ${!services[@]}
do
	if [ "$command" = "RUN" ];
	then
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
	elif [ "$command" = "STOP" ];
	then
		echo "Stoping running container ${services[$i]} ..."
		sleep 1
		# script for stop docker container
		docker stop "${services[$i]}"
		sleep 1
		echo "Container ${services[$i]} stopping completely"
		sleep 1
	elif [ "$command" = "REMOVE" ];
	then
		echo "Removing container ${services[$i]} ..."
		sleep 1
		# script for stop docker container
		docker rm -f "${services[$i]}"
		sleep 1
		echo "Container ${services[$i]} stopping completely"
		sleep 1
	else
		echo "Masukkan sebuah command [RUN, STOP, REMOVE]"
	fi
done


#docker run -d \
#--name $1 \
#-h $1 \
#-p $2:80 \
#-v $3:/usr/share/nginx/html \
#nginx
