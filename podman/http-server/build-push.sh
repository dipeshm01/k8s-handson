docker build -t httpserver .
docker tag httpserver:latest dipeshm77/httpserver:v1
docker push  dipeshm77/httpserver:v1