# !/bin/bash
# sed -i: "s/DOMAIN/localhost/g" /etc/nginx/sites-available/default
# sed -i: "s/DOMAINIP/localhost/g" /etc/nginx/sites-available/default
# sed -i: "s/ssl_certificate/#ssl_certificate/g" /etc/nginx/sites-available/default
# sed -i: "s/ssl_certificate_key/#ssl_certificate_key/g" /etc/nginx/sites-available/default
# Create a volume for Nginx configurations
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
# ENTRYPOINT ["nginx","-g","daemon off;"]

