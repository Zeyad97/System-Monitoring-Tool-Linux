FROM ubuntu:24.04

RUN apt update && \
    apt install -y dialog util-linux net-tools iputils-ping coreutils procps bash curl nano

RUN apt install -y python3
COPY serve.sh /serve.sh
RUN chmod +x /serve.sh

COPY monitor.sh /monitor.sh
COPY gui_monitor.sh /gui_monitor.sh
COPY html_report.sh /html_report.sh

RUN chmod +x /monitor.sh /gui_monitor.sh /html_report.sh

CMD ["/bin/bash"]

