FROM ubuntu:22.04

WORKDIR /app

RUN apt-get update
# used by the ki installation script
RUN apt-get install sudo -y
# ld dependencies
RUN apt-get install build-essential -y
# used for downloading the install script and ki binaries
RUN apt-get install curl -y
# dependency from openssl (probably)
RUN apt-get install zlib1g-dev -y

# Download & install ki compiler
RUN curl -s https://ki-lang.dev/dist/install.sh | bash -s techempower

# Copy app code
COPY ./main.ki /app
# Build app
RUN ki build main.ki -o ./server --optimize --static -v

EXPOSE 8080

CMD ./server
