
WORKDIR /app

COPY ./main.ki run.sh ./

RUN git clone https://github.com/ki-lang/ki && make && ./install.sh 
RUN git clone https://github.com/ki-lang/techempower && ki build ./main.ki -o ./server --optimize

EXPOSE 8088

CMD sh ./server