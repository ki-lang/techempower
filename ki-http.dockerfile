FROM ubuntu:22.04

WORKDIR /app

COPY ./main.ki /app

RUN git clone https://github.com/ki-lang/ki && make && ./install.sh 
RUN ki build main.ki -o ./server --optimize

EXPOSE 8080

CMD ./server