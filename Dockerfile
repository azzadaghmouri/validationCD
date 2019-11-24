FROM java:8
EXPOSE 8761
ADD /target/reservation-service-0.0.1-SNAPSHOT.jar docker-reservation.jar
ENTRYPOINT ["java","-jar","docker-reservation.jar"]