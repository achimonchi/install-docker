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
