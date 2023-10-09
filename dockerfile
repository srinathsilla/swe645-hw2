FROM --platform=linux/amd64 tomcat:10.1-jdk11-openjdk

RUN mkdir /usr/local/tomcat/webapps/

COPY student-survey-form.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]