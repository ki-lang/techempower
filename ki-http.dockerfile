FROM ubuntu:22.04

WORKDIR /app

# Build ki lang from source
RUN apt-get update
RUN apt-get install sudo -y
RUN apt-get install git -y
RUN apt-get install build-essential -y
RUN apt-get install libcurl4-gnutls-dev -y
RUN apt-get install llvm clang -y
RUN apt-get install libz-dev openssl -y
RUN git clone https://github.com/ki-lang/ki && cd ki && git checkout rewrite && make && bash ./install.sh

# Copy app code
COPY ./main.ki /app
# Build app
RUN ki build main.ki -o ./server --optimize -v

EXPOSE 8080

CMD ./server
