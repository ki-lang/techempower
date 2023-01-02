FROM ubuntu:22.04

WORKDIR /app

# Build ki lang from source
RUN apt-get update
RUN apt-get install sudo -y
RUN apt-get install git -y
RUN apt-get install build-essential -y
wget -O - https://ki-lang.dev/dist/install.sh | bash -s techempower

# Copy app code
COPY ./main.ki /app
# Build app
RUN ki build main.ki -o ./server --optimize -v

EXPOSE 8080

CMD ./server
