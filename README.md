# check_winmem
Auto optimice memory usage in windows server 

Es necesario añadir las siguientes lineas en el fichero nsclient.ini

[/settings/external scripts/wrapped scripts]
check_winmem = check_mem.ps1


Definición del comando en Nagios:

define command
{
	command_name	check_winmem
	command_line	$USER1$/check_nrpe -H $HOSTADDRESS$ -t 30 -p 5666 -c check_winmem
}


Definición del servicio en Nagios:

define service
{
	use			generic-service
	host_name		HOST
	service_description		Memory Usage
	check_command		check_winmem! 

}
