docker run -d \
--name=ampache \
-v $PWD/music:/media:ro \
-p 8080:80 \
ampache/ampache
