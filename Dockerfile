FROM anapsix/alpine-java:8
COPY ./build/libs/*SNAPSHOT.jar app.jar
ENV JAVA_OPTS=""
EXPOSE 8888
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar"]

