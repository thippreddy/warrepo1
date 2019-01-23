FROM tomcat:latest
ADD /target/CounterWebApp.war /usr/local/tomcat/webapps/
