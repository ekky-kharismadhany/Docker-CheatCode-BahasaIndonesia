# membuat container bernama mongo1 yang dengan port 27017 dengan type mount-nya bind
# Disimpan dalam folder /home/aqua/Documents/Kode/belajarDocker/dest
docker container create --name mongovolume --publish 27017:27017 --env MONGO_INITDB_ROOT_USERNAME=ekky --env MONGO_INITDB_ROOT_PASSWORD=ekky --mount="type=bind,source=mongodata1,destination=/data/db" mongo:latest 
# Membuat koneksi mongodb dengan mongo express
docker network create --driver bridge mongoNetwork
docker container create --name mongodb --network mongoNetwork --env MONGO_INITDB_ROOT_USERNAME=ekky --env MONGO_INITDB_ROOT_PASSWORD=ekky mongo:latest 
docker image pull mongo-express:latest
docker container create --name mongoExpress --network mongoNetwork --env ME_CONFIG_MONGODB_URL="mongodb://ekky:ekky@mongodb:27017/" mongo-express:latest
docker container start mongodb
docker container start mongoExpress