# DangX

This is a simple configuration of running a Node.JS API behind Nginx.

```
             Docker Container
+---------------------------------------------------+
|                                                   |
|        ^     +                                    |
|        |     |  :8080                             |
|        +     v                                    |
|                                                   |
|  +-------------------+        +----------------+  |
|  |                   | :8081  |                |  |
|  |                   |  +---> |                |  |
|  |    Nginx          |        |   Node.JS      |  |
|  |                   |        |                |  |
|  |                   |  <---+ |                |  |
|  +-------------------+        +----------------+  |
|                                                   |
|                                                   |
+---------------------------------------------------+
```

## Technologies

* Docker
* Alpine Linux
* Node.JS
* Nginx
* pm2

## The Setup

* [Alpine](https://alpinelinux.org/) Linux as the main OS
* Node.JS is listening from port `8081`
* Nginx is configured as a Web Server and Reverse Proxy Server
  * Web Server
    * listen at port `8080`
    * http://localhost:8080
  * Reverse Proxy Server
    * proxy all requests to `/api/xxx`
    * eg:
      * http://localhost/api/user/list
      * http://localhost/api/dashboard/list
* Mounted Folder
  * routes, models, *.js are mounted onto the container except for some other files/folders, see .dockerignore
* pm2 manages Node.JS server in `watch` mode. Changes to *.js files triggers a server restart

## Commands

* $ docker-compose up            # starts the container
* $ docker-compose up --build    # rebuild the image

## References

* https://www.nginx.com/resources/admin-guide/reverse-proxy/
* https://docs.docker.com/compose/overview/
* https://alpinelinux.org/about/
* https://docs.docker.com/engine/reference/builder/
* https://docs.docker.com/engine/reference/commandline/docker/

## License

MIT
