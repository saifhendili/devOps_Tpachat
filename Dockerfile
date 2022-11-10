FROM openjdk:11
EXPOSE 8089
ADD /target/tpachatprojectt.jar tpachatprojectt.jar
ENTRYPOINT ["java", "-jar", "/tpachatprojectt.jar"]