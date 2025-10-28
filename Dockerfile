# Imagen base con Java 25 (para ejecutar Spring Boot)
FROM eclipse-temurin:25-jdk

# Crea directorio de trabajo
WORKDIR /app

# Copia el jar que Maven genera dentro del contenedor
COPY target/spring-petclinic-4.0.0-SNAPSHOT.jar app.jar

# Expone el puerto 8080 (por donde corre la app)
EXPOSE 8080

# Comando para arrancar la app
ENTRYPOINT ["java", "-jar", "app.jar"]
