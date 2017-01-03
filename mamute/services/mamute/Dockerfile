FROM java:8-jdk
MAINTAINER Manuel Gómez <mgomez@mahisoft.com>

ENV VERSION=1.5.0

RUN groupadd -r mamute && useradd -r -g mamute mamute
RUN mkdir -p /opt/mamute && chown mamute:mamute /opt/mamute
WORKDIR /opt/mamute
USER mamute

RUN \
  wget -nv https://github.com/caelum/mamute/releases/download/v1.5.0/mamute-1.5.0.war && \
  unzip mamute-${VERSION}.war && \
  rm mamute-${VERSION}.war

COPY hibernate.cfg.xml WEB-INF/classes/production/hibernate.cfg.xml
COPY production.properties WEB-INF/classes/production.properties

ENV \
  VRAPTOR_ENV=production \
  \
  MAMUTE_HOST=localhost \
  MAMUTE_PORT=80 \
  PORT=${MAMUTE_PORT} \
  \
  DB_HOST=mysql \
  DB_PORT=3306 \
  DB_USERNAME=mamute \
  DB_PASSWORD=mamute \
  DB_NAME=mamute \
  \
  MAIL_SERVER=mail.example.com \
  MAIL_PORT=25 \
  MAIL_USE_TLS=true \
  MAIL_USERNAME=user \
  MAIL_PASSWORD=password

EXPOSE 80

COPY docker-entrypoint.sh .
ENTRYPOINT ["docker-entrypoint.sh"]
