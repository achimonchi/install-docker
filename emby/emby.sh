docker run -d \
-v $PWD/config:/mnt/config \
-v $PWD/share:/mnt/share \
--name my_emby \
-p 8081:8096 \
emby/embyserver
