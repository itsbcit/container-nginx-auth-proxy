# nginx-auth-proxy

Add some basic authentication to any webapp by proxying it through this nginx container.

## env vars needed

- `AUTH_TOKEN`

token to be passed as Bearer token for nginx to allow to below

- `PROXY_ADDR`

server to proxy to. Can be DNS or IP

- `PROXY_PORT`

port of server to proxy to

- `PROXY_SCHEME`

optional. default is http. what your backend is.

- `NGINX_SCHEME`

optional. default is 8080. This is basically the nginx "listen" directive. Can be used to change port, or add ssl. If this var contains the string `ssl` it will use the 10 year self-signed from when the container was started.
