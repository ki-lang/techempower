
# ki Techempower benchmark

## Endpoints

```
GET /plaintext
GET /json (not ready yet)
```

## Docker commands

```
# Start
sudo docker build -f ki-http.dockerfile -t kihttp .
sudo docker run -d --network="host" kihttp
# Stop
sudo docker ps
sudo docker stop {ID}
sudo docker rm {ID}
```

## Test local

ki build main.ki -o ./server