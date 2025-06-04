# Use Tomcat as base image from docker official
FROM tomcat:10.1-jdk17-temurin

# Remove default ROOT webapp
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the WAR file to Tomcat
COPY target/tesco.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080

CMD ["catalina.sh", "run"]

