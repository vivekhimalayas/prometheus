# prometheus monitoring.

I wanted to do blackbox,server stats monitoring and alerting via prometheus. I could have done that in standalone servers in ec2 or any other server. 
I tried to do all three in a single container due to cost limitations and other factors. It didnt work exactly as expected. I pointed my nodejs app to a load balancer and used blackbox rules to monitor the endpoint. In an ideal scenario, I would have run three different services with the rules files which I have commited in this repo but was not able to do so due to limitaitons. 

I downloaded binaries of prometheus,blackbox_Exporter and tried to run both of them in a single container which was not working. Only one of the containers are starting and not both of them. I tried to run both of them in a bash script which is a bad thing to do but I wanted to give it a try.

Nomenclature of files 
Dockerfile - Normal docker file where I tried two services and hence I exposed two ports.
Prometheus.yml - Where I wrote rules to monitor the application. I would have run node exporter service on the application and collected its metrics and pushed it to prometheus server in the static_configs target section. Blackbox exporter would have used module 2xx to monitor the endpoint. 
blackbox_rules.yml: It would have alerted if the application was down.
alertmanagers - I would have configured alert manager to run on a separate container or port to send alerts based on classification.
