FROM ubuntu:20.04 as install

RUN apt-get update \
  && apt-get install -y wget zip

RUN wget https://localtonet.com/download/linux-x64.zip \
  && unzip linux-x64.zip \
  && chmod 777 localtonet

FROM scratch
WORKDIR /app
COPY --from=install /localtonet ./

ENTRYPOINT [ "localtonet" ]