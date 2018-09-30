FROM alpine:latest

#ENV CONFIG_JSON=none CERT_PEM=none KEY_PEM=none VER=3.35

#RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
# && mkdir -m 777 /v2raybin \ 
# && cd /v2raybin \
# && curl -L -H "Cache-Con#trol: no-cache" -o v2ray.zip https://github-production-release-asset-2e65be.s3.amazonaws.com/41912791/ca1d6180-c360-11e8-870f-b9c385d919a2?X-Amz-

Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20180930%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-

Date=20180930T050307Z&X-Amz-Expires=300&X-Amz-

Signature=073a0f85f01fb63a5b491ec02daa0223f7993842cd7259cc56ec1c84c7fc4bf2&X-Amz-

SignedHeaders=host&actor_id=19473333&response-content-disposition=attachment%3B filename%3Dv2ray-linux-64.zip&response-

content-type=application%2Foctet-stream \
# && unzip v2ray.zip \
# && mv /v2raybin/v2ray-v$VER-linux-64/v2ray /v2raybin/ \
# && mv /v2raybin/v2ray-v$VER-linux-64/v2ctl /v2raybin/ \
# && mv /v2raybin/v2ray-v$VER-linux-64/geoip.dat /v2raybin/ \
# && mv /v2raybin/v2ray-v$VER-linux-64/geosite.dat /v2raybin/ \
# && chmod +x /v2raybin/v2ray \
# && rm -rf v2ray.zip \
# && rm -rf v2ray-v$VER-linux-64 \
# && chgrp -R 0 /v2raybin \
# && chmod -R g+rwX /v2raybin 

RUN mkdir -m 777 /v2ray

ADD entrypoint.sh /entrypoint.sh
ADD config.json /v2ray/config.json
RUN chmod +x /entrypoint.sh 
ENTRYPOINT  /entrypoint.sh 

EXPOSE 8080
