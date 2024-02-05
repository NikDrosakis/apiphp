FROM nginx:alpine
COPY setup/default.conf /etc/nginx/conf.d/
COPY php /var/www/html/
#RUN usermod -u dros dros
#ENTRYPOINT ["/docker-entrypoint.sh"]
