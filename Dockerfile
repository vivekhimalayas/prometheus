FROM      quay.io/prometheus/busybox:latest

COPY blackbox_exporter  /bin/blackbox_exporter
COPY blackbox.yml       /etc/blackbox_exporter/config.yml
COPY promtool /bin/promtool
COPY prometheus /bin/prometheus
COPY console_libraries/ /usr/share/prometheus/console_libraries/
COPY consoles/ /usr/share/prometheus/consoles/
COPY prometheus.yml  /etc/prometheus/prometheus.yml
COPY blackbox_rules.yml /etc/prometheus/blackbox_rules.yml
COPY start-all.sh /bin/start-all.sh
RUN chmod 755 /bin/start-all.sh
RUN ln -s /usr/share/prometheus/console_libraries /usr/share/prometheus/consoles/ /etc/prometheus/

RUN mkdir -p /prometheus && \
    chown -R nobody:nogroup etc/prometheus /prometheus

USER       nobody


EXPOSE      9115 9090

VOLUME     [ "/prometheus" ]
WORKDIR    /prometheus

CMD /bin/start-all.sh
