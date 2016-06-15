openssl genrsa -des3 -out site.key 2048
openssl rsa -in site.key -out site.key.insecure
mv site.key site.key.secure
mv site.key.insecure site.key
openssl req -new -key site.key -out site.csr
openssl x509 -req -days 365 -in site.csr -signkey site.key -out site.crt
