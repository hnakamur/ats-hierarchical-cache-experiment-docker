ats-hierarchical-cache-experiment-docker
========================================

## Usage

### Build and start containers

```
docker-compose build
docker-compose up -d
```

### Send a http request

```
$ echo $DOCKER_HOST
tcp://192.168.99.100:2376
$ curl -sv 192.168.99.100
* Rebuilt URL to: 192.168.99.100/
*   Trying 192.168.99.100...
* Connected to 192.168.99.100 (192.168.99.100) port 80 (#0)
> GET / HTTP/1.1
> Host: 192.168.99.100
> User-Agent: curl/7.43.0
> Accept: */*
>
< HTTP/1.1 200 OK
< Date: Tue, 16 Feb 2016 02:15:15 GMT
< Server: ATS/6.1.1
< Last-Modified: Tue, 16 Feb 2016 00:33:59 GMT
< ETag: "a-52bd84a0f4bc0"
< Accept-Ranges: bytes
< Content-Length: 10
< Cache-Control: s-maxage=180
< Content-Type: text/html; charset=UTF-8
< Age: 0
< Via: http/1.1 copr-builder-883070330.novalocal (ApacheTrafficServer/6.1.1 [uScMsSfWpSeN:t cCMi p sS]), http/1.1 copr-builder-883070330.novalocal (ApacheTrafficServer/6.1.1 [uScMsSfWpSeN:t cIMi pSs ])
< Connection: keep-alive
<
It works!
* Connection #0 to host 192.168.99.100 left intact
$ curl -sv 192.168.99.100
* Rebuilt URL to: 192.168.99.100/
*   Trying 192.168.99.100...
* Connected to 192.168.99.100 (192.168.99.100) port 80 (#0)
> GET / HTTP/1.1
> Host: 192.168.99.100
> User-Agent: curl/7.43.0
> Accept: */*
>
< HTTP/1.1 200 OK
< Date: Tue, 16 Feb 2016 02:15:15 GMT
< Server: ATS/6.1.1
< Last-Modified: Tue, 16 Feb 2016 00:33:59 GMT
< ETag: "a-52bd84a0f4bc0"
< Accept-Ranges: bytes
< Content-Length: 10
< Cache-Control: s-maxage=180
< Content-Type: text/html; charset=UTF-8
< Age: 4
< Via: http/1.1 copr-builder-883070330.novalocal (ApacheTrafficServer/6.1.1 [uScMsSfWpSeN:t cCMi p sS]), http/1.1 copr-builder-883070330.novalocal (ApacheTrafficServer/6.1.1 [uScHs f p eN:t cCHi p s ])
< Connection: keep-alive
<
It works!
* Connection #0 to host 192.168.99.100 left intact
```
