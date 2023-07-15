# springboot-docker-demo
Basic Kotlin Springboot app using docker 

After serving the app, going to `localhost:8080/hello` will display a msg

## Commands  

`docker build -t sb-docker-demo .`

`docker run -p 8080:8080 sb-docker-demo` 