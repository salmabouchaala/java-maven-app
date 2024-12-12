# Utiliser une image de base officielle
FROM maven:3.8.5-openjdk-17

# Définir le répertoire de travail
WORKDIR /app

# Copier le projet dans l'image Docker
COPY . .

# Compiler le projet avec Maven
RUN mvn clean install

# Définir la commande de démarrage
CMD ["java", "-jar", "target/my-app.jar"]
