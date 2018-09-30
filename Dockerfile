FROM anapsix/alpine-java:8
RUN apk add --no-cache curl
COPY ./build/libs/*SNAPSHOT.jar app.jar
ENV JAVA_OPTS=""
ENV PROFILE="pro"
EXPOSE 8888
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=$PROFILE -jar /app.jar"]

