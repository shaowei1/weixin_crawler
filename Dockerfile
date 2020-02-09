FROM python:3.7

RUN sed -i 's@http://deb.debian.org@http://mirrors.aliyun.com@g' /etc/apt/sources.list && \
    sed -i 's@http://security.debian.org@http://mirrors.aliyun.com@g' /etc/apt/sources.list && \
    cat /etc/apt/sources.list && \
    rm -Rf /var/lib/apt/lists/* && \
    apt-get update

COPY ./pip.conf /etc/pip.conf
COPY ./start.sh /start.sh


COPY ./app /app

WORKDIR /app/

ENV PYTHONPATH=/app

RUN chmod +x /start.sh && \
    pip install -U pip && \
    pip3 install --upgrade pip  --no-cache-dir && \
    pip3 install --no-cache-dir -r /app/requirements.txt

EXPOSE 80

#ENTRYPOINT ["/entrypoint.sh"]
CMD ["/start.sh"]