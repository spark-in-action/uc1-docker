
FROM websphere-liberty:webProfile7

RUN installUtility install --acceptLicense defaultServer websocket-1.0

RUN wget -O - https://github.com/spark-in-action/first-edition/releases/download/dashboard/WebStatsDashboard.war > /opt/ibm/wlp/usr/servers/defaultServer/dropins/WebStatsDashboard.war

ADD starter.sh /opt/ibm/wlp/starter.sh
RUN chmod +x /opt/ibm/wlp/starter.sh
ENV LICENSE accept
CMD ["/opt/ibm/wlp/starter.sh"]

