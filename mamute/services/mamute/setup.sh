#!/bin/bash


cat > 'WEB-INF/classes/production/hibernate.cfg.xml' <<EOF
<?xml version='1.0' encoding='utf-8'?>
<!DOCTYPE hibernate-configuration PUBLIC
  "-//Hibernate/Hibernate Configuration DTD//EN"
  "http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
  <session-factory>
    <property name="connection.url">jdbc:mysql://${DB_HOST}:${DB_PORT}/${DB_NAME}</property>
    <property name="connection.driver_class">com.mysql.jdbc.Driver</property>
    <property name="dialect">org.hibernate.dialect.MySQL5InnoDBDialect</property>
    <property name="connection.username">${DB_USERNAME}</property>
    <property name="connection.password">${DB_PASSWORD}</property>
    <property name="show_sql">false</property>
    <property name="format_sql">false</property>
    <property name="hibernate.cache.region.factory_class">org.hibernate.cache.ehcache.EhCacheRegionFactory</property>
    <property name="hibernate.cache.use_query_cache">false</property>
    <property name="hibernate.cache.use_second_level_cache">false</property>
    <property name="hibernate.generate_statistics">false</property>
    <property name="connection.provider_class">org.hibernate.service.jdbc.connections.internal.C3P0ConnectionProvider</property>
    <property name="c3p0.acquire_increment">1</property>
    <property name="c3p0.idle_test_period">100</property>
    <property name="c3p0.max_size">100</property>
    <property name="c3p0.min_size">10</property>
    <property name="c3p0.timeout">100</property>
  </session-factory>
</hibernate-configuration>
EOF


cat > 'WEB-INF/classes/production.properties' <<EOF
host = https://${MAMUTE_HOST}:${MAMUTE_PORT}
home.url = /
mail_logo_url = http://${MAMUTE_HOST}:${MAMUTE_PORT}/imgs/logo-mail.png
use.routes.parser.hack = false
feature.auth.db = true
feature.facebook.login = false
feature.solr = false
feature.signup = false
deletable.questions = false
attachments.root.fs.path = /var/lib/mamute/attachments

vraptor.simplemail.main.server = ${MAIL_SERVER}
vraptor.simplemail.main.port = ${MAIL_PORT}
vraptor.simplemail.main.tls = ${MAIL_USE_TLS}
vraptor.simplemail.main.username = ${MAIL_USERNAME}
vraptor.simplemail.main.password = ${MAIL_PASSWORD}
vraptor.errorcontrol.error.subject = Production error at Mahisoft Mamute
vraptor.simplemail.main.from = no-reply@mahisoft.com
vraptor.simplemail.main.from.name = Mahisoft Mamute

feature.google.login = true
google.redirect_uri = /sign-up/google/
google.client_id = ${GOOGLE_AUTH_CLIENT_ID}
google.client_secret = ${GOOGLE_AUTH_CLIENT_SECRET}
EOF


exec './run.sh' "${@}"
