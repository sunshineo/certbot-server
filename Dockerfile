FROM python:2

EXPOSE 80
WORKDIR /home
RUN mkdir -p .well-known/acme-challenge/

ADD run.sh /home/
RUN chmod +x /home/run.sh
CMD /home/run.sh