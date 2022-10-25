# check_winmem
Optimización automatica de memoria en windows con Nagios y RAMRush <br/>
Alojar los 3 ficheros necesarios en C:\Program Files\NSClient++\scripts <br/>

Es necesario añadir las siguientes lineas en el fichero nsclient.ini <br/>

[/settings/external scripts/wrapped scripts]<br/>
check_winmem = check_mem.ps1  $ARG1$ $ARG2$ <br/>


Definición del comando en Nagios:<br/>

define command <br/>
{<br/>
	command_name	check_winmem <br/>
	command_line	$USER1$/check_nrpe -H $HOSTADDRESS$ -t 60 -n -p 5666 -c check_winmem -a $ARG1$ $ARG2$ <br/>
}<br/>


Definición del servicio en Nagios:<br/>

define service<br/>
{<br/>
	use			generic-service<br/>
	host_name		HOST<br/>
	service_description		Memory Usage<br/>
	check_command		check_winmem! 45 15<br/>

}<br/>
