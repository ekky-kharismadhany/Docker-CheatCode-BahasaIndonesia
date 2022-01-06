#list image dalam docker daemon
docker image ls
# download image
docker image pull namaImage:tag
# hapus image
docker image rm namaImage:tag
# list container dalam docker
docker container ls -a
# buat kontainer
docker container create --name namaContainer namaImage:latest
# menjalankan container
docker container start namaContainer
# menghentikan container
docker container stop namaContainer
# menghapus container
docker container rm containerId/namaContainer
# melihat container dalam log
docker container logs namaContainer/containerId # -f untuk realtime
# masuk ke dalam container
docker container exec -i -t namaContainer/containerId /bin/bash # -i: argumen interaktif, -t alokasi tty
# port forwarding 
docker container create --name namaContainer --publish hostPort:containerPort namaImage:tag
# menambah env variable, tambah "..." apabila ada spasi
docker container create --name namaContainer --env key=value
# Melihat penggunaan resource yang digunakan oleh container
docker container stats
# Alokasi memori dan cpu, --memory --cpus
docker container create --name namaContainer --memory 100m --cpus 1 namaImage:tag
# Bind mount
docker container create --name namaContainer --publish hostPort:containerPort --mount="type=bind,source=/path/in/host,destination=path/in/container" namaImage:tag
# container volume
# membuat container volume 
docker volume create namaVolume
# menghapus container volume
docker volume rm namaVolume
# daftar container volume
docker volume ls
# mounting volume ke container
docker container create --name mongovolume --publish hostPort:containerPort  --mount="type=volume,source=namaVolume,destination=/data/db" namaImage:tag
# membuat network
docker network create --driver namaDriver namaNetwork
# menghapus network
docker network rm namaNetwork
# listing network
docker network ls
# Membuat container dengan network
docker container create --name namaContainer --network namaNetwork image:tag