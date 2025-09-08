
[[Msfconsole🛡️]]
### Iniciar PostgreSQL para poder usar workspaces en msfconsole

-  `service postgresql start`
-  `db_status`
- `db_import file.xml`

Comandos utiles en este caso:

- `hosts
- `services`


## Enumeracion de [[File Transfer Protocol (FTP)]]

- `use auxiliary/scanner/ftp/ftp_version` <- Para descubrir version del FTP
- `use auxiliary/scanner/ftp/ftp_login` <- Para fuerza bruta de inicio de sesion en FTP

Diccionarios utiles para estos comandos:
- `/usr/share/metasploit-framework/data/wordlists/common_users.txt`
- `/usr/share/metasploit-framework/data/wordlists/unix_passwords.txt`


### Setear variables en estado global

- `setg RHOSTS 192.168.1.1`
### Manera de buscar cosas en msfconsole

- search type:auxiliary name:smb

## Apache

- Enumerar usuarios de apache:
	`auxiliary/scanner/http/apache_userdir_enum`
	Diccionario recomendado: `/usr/share/metasploit-framework/data/wordlists/common_users.txt`

- Fuerza bruta de inicio de sesion:
	`auxiliary/scanner/http/http_login`


## [[SSH (Secure Shell)]]

- Fuerza bruta para login de ssh
	`auxiliary/scanner/ssh/ssh_login`

## Modules MSFCONSOLE

### Recon

- `local_exploit_suggester` -> enumera posibles brechas de seguridad en linux, windows y mac, enfocadas a la escalada de privilegios.

## Comandos en meterpreter

### pgrep

`pgrep explorer` -> utilizado para buscar el proceso 'explorer', si hay instancias del proceso `explorer.exe`, el cual es el proceso principal del explorador windows, devolvera el ID

```
pgrep explorer
2448
```


### migrate 

`migrate` -> migrar, mover la sesion de meterpreter a otro proceso en el sistema, en este caso `migrate 2448`, le indica a meterpreter que debe trasladar la sesion de su proceso actual al 2448, que es `explorar.exe`

**¿Por qué se hace esto?**

Migrar a un proceso como `explorer.exe` tiene varias razones en un ataque:

1. **Evasión de detección**: El proceso `explorer.exe` es una parte fundamental del sistema operativo y generalmente no será monitoreado de la misma forma que un proceso sospechoso que podría estar relacionado con una intrusión. Esto ayuda a evitar que las herramientas de seguridad o antivirus detecten la sesión de Meterpreter.
    
2. **Persistencia**: Migrar a un proceso en ejecución podría permitir que la sesión de Meterpreter continúe funcionando incluso si el proceso original de la sesión se termina o se reinicia.
    
3. **Manipulación del sistema**: Al migrar a un proceso común y conocido, los atacantes pueden interactuar de manera más sutil con el sistema, sin levantar demasiadas sospechas.

### getprivs

El comando `getprivs` en Meterpreter se utiliza para enumerar los privilegios que tiene la sesión de Meterpreter sobre el sistema comprometido. Al ejecutar este comando, Meterpreter muestra los privilegios que están disponibles o habilitados en el contexto de seguridad de la sesión actual.
#### Ejemplo de salida típica de `getprivs`:

Cuando ejecutas `getprivs`, podrías ver una salida similar a esta:

```
[*] Privileges:
    SeDebugPrivilege     (Enabled)
    SeBackupPrivilege    (Enabled)
    SeRestorePrivilege   (Enabled)
    SeShutdownPrivilege  (Enabled)
    SeChangeNotifyPrivilege (Enabled)
    SeTakeOwnershipPrivilege (Enabled)
```

#### Explicación de algunos privilegios comunes:

1. **SeDebugPrivilege**: Permite a un usuario o proceso depurar otros procesos. Si está habilitado, puede ser usado para obtener acceso completo a otros procesos o manipularlos, lo que puede ser útil en un ataque para escalar privilegios.
    
2. **SeBackupPrivilege**: Permite al usuario realizar copias de seguridad de archivos del sistema, incluso si no tiene permisos sobre esos archivos. Es un privilegio que se usa para copiar archivos incluso si están protegidos.
    
3. **SeRestorePrivilege**: Permite a un usuario restaurar archivos desde una copia de seguridad. Similar al privilegio anterior, pero en la dirección opuesta: puede restaurar archivos incluso si no tiene permisos sobre esos archivos.
    
4. **SeShutdownPrivilege**: Permite apagar el sistema. Si un atacante tiene este privilegio, puede apagar el sistema remoto.
    
5. **SeTakeOwnershipPrivilege**: Permite tomar la propiedad de archivos y objetos del sistema, lo que podría ser útil para modificar archivos o configuraciones a las que normalmente no tendría acceso.
    
6. **SeChangeNotifyPrivilege**: Permite a los usuarios recibir notificaciones de cambios en el sistema, como cambios en los archivos o directorios.
    

#### ¿Por qué es importante este comando?

- **Escalada de privilegios**: Si encuentras que la sesión de Meterpreter tiene privilegios como `SeDebugPrivilege` o `SeTakeOwnershipPrivilege`, esto podría abrir puertas para una escalada de privilegios. Con estos privilegios, un atacante podría tomar control completo del sistema, manipular otros procesos, o acceder a archivos protegidos.
    
- **Evasión y persistencia**: Algunos de estos privilegios pueden ser útiles para evadir la detección, restaurar archivos de configuración o realizar copias de seguridad/restauración del sistema de manera que no se noten fácilmente.
    