# create image and install dependencies
FROM ubuntu:24.04
RUN apt-get update
RUN apt-get install -y curl jq
RUN apt-get upgrade -y

# install zScan script
COPY zScan_v1.sh /usr/local/bin
RUN chmod +x /usr/local/bin/zScan_v1.sh

ENTRYPOINT [ "/usr/local/bin/zScan_v1.sh" ]