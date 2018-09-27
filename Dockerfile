FROM anapsix/alpine-java:8
RUN apk add --no-cache curl
COPY ./build/libs/*SNAPSHOT.jar app.jar
ENV JAVA_OPTS=""
HEALTHCHECK --interval=10s --timeout=3s \
  CMD curl -f http://localhost:8888/health || exit 1
EXPOSE 8888
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar"]

