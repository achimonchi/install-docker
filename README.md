# Script Automation Running Container
Ini adalah script sederhana untuk menjalankan container pada docker. Saat ini script ini dibuat menggunakan `shell` script. Script ini dibuat untuk belajar dalam automation running container. 

## Inside
Pada project ini, menggunakan images `NGINX` untuk menampilkan simple web. Adapun services yang disediakan adalah sebagai berikut :
```bash
# list services
services=("frontend" "backend")

#list ports that services will use
ports=(8080 8081)
```
Pada services, kamu bisa mengubah nama yang digunakan. Lalu, pada ports berfungsi sebagai ports yang akan digunakan oleh masing masing services. Jika kamu mengubah nama services, pastikan kamu juga mengubah volume binding yang digunakan. Yaitu :
```bash
docker run -d \
  --name "${services[$i]}" \
  -h "${services[$i]}" \
  -p "${ports[$i]}:80" \
  -v "$PWD/${services[$i]}:/usr/share/nginx/html" \
  nginx
```
Volume binding bisa di temukan pada option `-v`. Bisa dilihat, volume binding akan menyesuaikan dengan nama services. Pada project ini, ada 2 services yang running, yaitu `Frontend` dan `Backend`. Masing masing mempunyai direktorinya sendiri. 

> 
> Jadi, jika kamu ingin mengubah nama services, pastikan membuat nama direktori yang sama dengan nama serivces.
>

## How to Use
Adapun cara menggunakannya, adalah sebagai berikut :
- Clone repository ini.
```bash
$ git clone https://github.com/achimonchi/install-docker.git
```

### Running simple container
- Masukkan command berikut
```bash
$ bash container.sh [ COMMAND YANG DIINGINKAN ]
```
  Untuk command yang disupport, adalah :
  1. `RUN`
    Berfungsi untuk running container. 
  2. `STOP`
    Bergfungsi untuk memberhentikan container.
  3. `REMOVE`
    Berfungsi untuk menghapus container.

### Running Emby Server
- Masukkan command berikut :
```bash
$ cd emby
$ sh emby.sh
```
Maka secara otomatis, akan membuat container untuk emby server. Nama container yang akan terbentuk adalah : `my_emby` dengan port `8081`. Berikut adalah isi script dari emby.sh :
```bash 
docker run -d \  # berfungsi untuk running container secara daemon
-v $PWD/config:/mnt/config \ # berfungsi untuk mounting file config container. $PWD berisi folder saat ini
-v $PWD/share:/mnt/share \ # berfungsi untuk meletakkan file video.
--name my_emby \ # memberi nama container
-p 8081:8096 \ # expose port ke 8081. Silahkan diubah sesuai kebutuhan
emby/embyserver # nama image
```
Maka, container `my_emby` akan running pada port `8081`
### Running Ampache Server
- Masukkan command berikut :
```bash
$ cd ampache
$ sh ampache.sh
```
Maka secara otomatis, akan membuat container untuk `ampache` server. Nama container yang akan terbentuk adalah : `ampache` dengan port `8080`. Berikut adalah isi script dari ampache.sh :
```bash
docker run -d \   # running container secara daemon
--name=ampache \  # memberi nama container
-v $PWD/music:/media:ro \ # mounting / binding volume music
-p 8080:80 \      # expose port ke 8080
ampache/ampache   # nama images
```
Maka, container `ampache` akan running pada port `8080`
