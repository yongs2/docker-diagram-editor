FROM node:latest
MAINTAINER yongs2 yongs2@hotmail.com

USER root
ARG APP_DIR=/app

# 디렉토리 생성 및 패키지 설치
RUN mkdir -p ${APP_DIR} \
	&& cd ${APP_DIR} \
	&& git clone https://github.com/markbleichert/diagram-editor \
	&& cd ${APP_DIR}/diagram-editor \
	&& rm -rf node_modules package-lock.json \
	&& npm install --unsafe-perm=true --allow-root --no-optional \
	&& npm install

COPY webpack.config.js ${APP_DIR}/diagram-editor/

# WORKDIR 로 설정
WORKDIR ${APP_DIR}/diagram-editor

#가상 머신에 오픈할 포트
EXPOSE 8080

#컨테이너에서 실행될 명령을 지정
CMD ["npm", "start"]
