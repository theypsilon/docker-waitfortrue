# Wait For True

### Example
```
$ docker run --rm theypsilon/waitfortrue:1.0.0 curl --head www.google.com
```
WAITING FOR [curl --head www.google.com] during 100 seconds
OK

##### Debug mode
```
$ docker run --rm -e DEBUG=true theypsilon/waitfortrue:1.0.0 curl --head www.google.com
```
WAITING FOR [curl --head www.google.com] during 100 seconds
DEBUG ON
HTTP/1.1 200 OK
Date: Mon, 23 May 2016 06:58:14 GMT
Expires: -1
Cache-Control: private, max-age=0
Content-Type: text/html; charset=ISO-8859-1
P3P: CP="This is not a P3P policy! See https://www.google.com/support/accounts/answer/151657?hl=en for more info."
Server: gws
X-XSS-Protection: 1; mode=block
X-Frame-Options: SAMEORIGIN
Set-Cookie: NID=79=DNXrr_uEHM4AuHsKs04608AjkNaA71LK_wkYMhd8hjXCdJBBpaDI3GiwpXHsIdEBIaNbhtFDR4PABL-8MQX3OOrOuPfVCWpu6Pk5X63Avrn3ZvL1ZsfKF0E52xCsJ5-9wfCtxv-gdfnFYdE; expires=Tue, 22-Nov-2016 06:58:14 GMT; path=/; domain=.google.com; HttpOnly
Transfer-Encoding: chunked
Accept-Ranges: none
Vary: Accept-Encoding

OK

##### Modifying timeout (default value is 100 seconds)
```
$ docker run --rm -e TIMEOUT_SECONDS=5 theypsilon/waitfortrue:1.0.0 curl --head wrong.google.com
```
WAITING FOR [curl --head wrong.google.com] during 5 seconds
..!!
FAILED: timeout triggered after 5 seconds
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: wrong.google.com
