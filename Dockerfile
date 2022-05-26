
# FROM registry.redhat.io/ubi8/ubi
FROM registry.access.redhat.com/ubi8

USER root

RUN yum install -y --disableplugin=subscription-manager --nodocs nginx && yum clean all

COPY dist /usr/share/nginx/html
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# RUN chmod g+rx -R /usr/share/nginx/html
# RUN chmod o+rx -R /usr/share/nginx/html
# RUN chmod g+rx -R /etc/nginx/nginx.conf
# RUN chmod o+rx -R /etc/nginx/nginx.conf
# RUN ls -lart /etc/nginx
# RUN ls -lart /usr/share/nginx/html

# RUN touch /run/nginx.pid /var/log/nginx-access.log \
#     && chgrp -R 0 /var/log/nginx /run/nginx.pid /var/log/nginx-access.log \
#     && chmod -R g+rwx /var/log/nginx /run/nginx.pid /var/log/nginx-access.log
EXPOSE 8080
USER 1001
  
CMD nginx -g "daemon off;"
