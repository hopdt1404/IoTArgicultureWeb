### Install Project

Requirement:
+ Install java (https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-18-04)
+ Install maven (https://linuxize.com/post/how-to-install-apache-maven-on-ubuntu-20-04/)
+ Install Intellij (https://www.jetbrains.com/help/idea/installation-guide.html)
+ Git (https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
+ Database (https://phoenixnap.com/kb/how-to-install-mysql-on-ubuntu-18-04)
+ MQTT broker: http://www.steves-internet-guide.com/install-mosquitto-linux/ 
#### Start Install

1: Source code
```` bash
git clone https://github.com/hopdt1404/IoTArgicultureWeb
git checkout --track -b local_branch_name origin/develop
````  
2: Ij
Open projects code by Ij (Gateway, Irrigation)

a. Irrigation
As resource root
````bash
Select folder src/click right mouse
Make Directory as/Resource root
````

Install lib

Method 1 use terminal
````bash
cd .../Irrigation
nmv install
````

Method 2: Ij
```` bash
select folder Irrigation(root project)/click right mouse
maven/{Dependencies, Reload project if installed lib}
````

MQTT
````bash
sudo service mosquitto start
sudo service  mosquitto stop
(stop mosquitto before run -v ?? check latter)
mosquitto -v

````
Config - Run

Todo: latter
```bash 
select Run/ {Run ....} 
```





+ Gateway  + Imprint


Install bokeower

https://gpcoder.com/4747-huong-dan-java-design-pattern-observer/


/iot_agriculture/identify/{farm_id, device_id, ... }/get/ 


DB: 
Tables:

Controlling: DeviceID, PlotID: ok
Devices: PlotID, DeviceTypeID: ok
DeviceTypes: ok
Farms: LocateID, FarmTypeID, UserID: ok
FarmTypes: first
Locates: ok
Plots: PlotTypeID, FarmID pk
PlotTypes: ok
Sensing: DeviceID, PlotID: ok
Users: ok
WeatherForecastAtATimes: ok
WeatherForecasts: LocateID

=> create table -> add fk latter


https://www.codejava.net/java-se/jdbc/jdbc-tutorial-sql-insert-select-update-and-delete-examples
https://www.tutorialspoint.com/jdbc/jdbc-where-clause.htm