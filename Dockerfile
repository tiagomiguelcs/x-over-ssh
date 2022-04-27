FROM ubuntu
RUN apt update && apt install -y net-tools && apt install -y build-essential && apt install -y iproute2
