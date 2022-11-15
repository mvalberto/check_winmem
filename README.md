# check_winmem
Optimización automatica de memoria en windows con Nagios y RAMRush <br/>
Alojar los 3 ficheros necesarios en C:\Program Files\NSClient++\scripts <br/>

nsclient.ini <br/>
```yaml
[/settings/external scripts/wrapped scripts]
check_winmem = check_mem.ps1  $ARG1$ $ARG2$ 
```

Definición del comando en Nagios:
```yaml
define command 
{
       command_name	check_winmem <br/>
       command_line	$USER1$/check_nrpe -H $HOSTADDRESS$ -t 60 -n -p 5666 -c check_winmem -a $ARG1$ $ARG2$ 
}
```

Definición del servicio en Nagios:<br/>
```yaml
define service
{
        use			generic-service
        host_name		HOST
        service_description     Memory Usage
        check_command		check_winmem! 45 15

}
```
