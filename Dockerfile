FROM registry.acs.aliyun.com/open/centos:3.0.0
RUN yum install -y java-1.8.0-openjdk.x86_64

# exec local server
# COPY ik-crm-search-service/* /app/
COPY entrypoint.sh /app/

RUN echo "exec command"
RUN mkdir -p /app
RUN rm -r /app/logs
RUN mkdir -p /acs/conf

WORKDIR /app/

RUN ln -sf /acs/log /app/logs/

# EXPOSE 8090

# VOLUME /var/lib/elasticsearch

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT /entrypoint.sh
