FROM openshift/base-centos7

LABEL io.k8s.description="Simple HTTP Server" \
      io.k8s.display-name="Simple HTTP Server" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,http"

COPY assemble /usr/libexec/s2i/
COPY run /usr/libexec/s2i/
COPY usage /usr/libexec/s2i/

# Drop the root user and make the content of /opt/app-root owned by user 1001
RUN chown -R 1001:1001 /opt/app-root

EXPOSE 8080

USER 1001

CMD [ "/usr/libexec/s2i/usage" ]
