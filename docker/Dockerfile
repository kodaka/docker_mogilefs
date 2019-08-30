FROM kodaka/mogilefs-base

RUN mkdir -p /usr/src/myapp && \
    mkdir -p /var/mogdata

COPY ./mogilefsd.conf /usr/src/myapp/mogilefsd.conf
COPY ./mogstored.conf /usr/src/myapp/mogstored.conf
COPY ./start.bash /usr/src/myapp/start.bash
RUN chmod +x /usr/src/myapp/start.bash

EXPOSE 7001
EXPOSE 7500
EXPOSE 7501
WORKDIR /usr/src/myapp
CMD ["./start.bash"]
