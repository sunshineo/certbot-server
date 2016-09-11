# certbot-server
A simple server running in docker that can verify domain ownership for letsencrypt certbot

## Usage

Start certbot using something like:
```
docker run -it --rm -p 443:443 -p 80:80 --name certbot -v "/etc/letsencrypt:/etc/letsencrypt" -v "/var/lib/letsencrypt:/var/lib/letsencrypt" quay.io/letsencrypt/letsencrypt:latest certonly --manual
```
For more details about letsencrypt and the certbot, go to https://letsencrypt.org/

Follow the instruction and you will get a setp with
```
Make sure your web server displays the following content at
http://www.yourdomain.com/.well-known/acme-challenge/2MJGFaHRmiw_wJQGlt_7ssI3ZGmADDgYyY18cRQjE8w before continuing:

2MJGFaHRmiw_wJQGlt_7ssI3ZGmADDgYyY18cRQjE8w.h7pc-_YDDkjA_0G5sVWdjFbjyIXqHKLue8F-sBPUuGY

If you don't have HTTP server configured, you can run the following
command on the target server (as root):

mkdir -p /tmp/certbot/public_html/.well-known/acme-challenge
cd /tmp/certbot/public_html
printf "%s" 2MJGFaHRmiw_wJQGlt_7ssI3ZGmADDgYyY18cRQjE8w.h7pc-_YDDkjA_0G5sVWdjFbjyIXqHKLue8F-sBPUuGY > .well-known/acme-challenge/2MJGFaHRmiw_wJQGlt_7ssI3ZGmADDgYyY18cRQjE8w
# run only once per server:
$(command -v python2 || command -v python2.7 || command -v python2.6) -c \
"import BaseHTTPServer, SimpleHTTPServer; \
s = BaseHTTPServer.HTTPServer(('', 80), SimpleHTTPServer.SimpleHTTPRequestHandler); \
s.serve_forever()"
Press ENTER to continue
```

## Use this image since your website is running with docker
The docker command (replace the token string with what you get when you run the command above)
```
docker run -d -e CODE=2MJGFaHRmiw_wJQGlt_7ssI3ZGmADDgYyY18cRQjE8w.h7pc-_YDDkjA_0G5sVWdjFbjyIXqHKLue8F-sBPUuGY sunshineo/certbot-server 
```
