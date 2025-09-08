Para enumerar información del sistema en Linux, hay varios comandos que puedes usar según el tipo de información que necesites. Aquí tienes una lista organizada por categorías:

---

## 🔹 **Información General del Sistema**

### 1️⃣ **Versión del sistema operativo**

```bash
cat /etc/os-release
```

🔹 Muestra la versión y nombre de la distribución.

```bash
uname -a
```

🔹 Muestra información general del sistema, incluyendo el kernel.

```bash
lsb_release -a
```

🔹 Muestra detalles completos del sistema (en distribuciones con `lsb`).

```bash
hostnamectl
```

🔹 Muestra información sobre el hostname y la versión del SO.

---

## 🔹 **Información del Kernel y CPU**

### 2️⃣ **Ver versión del kernel**

```bash
uname -r
```

🔹 Muestra la versión exacta del kernel.

```bash
cat /proc/version
```

🔹 Muestra la versión del kernel y detalles del compilador.

```bash
dmesg | head -10
```

🔹 Muestra los primeros registros del arranque del kernel.

### 3️⃣ **Información del procesador**

```bash
lscpu
```

🔹 Muestra información detallada del CPU.

```bash
cat /proc/cpuinfo
```

🔹 Muestra detalles de cada núcleo del procesador.

```bash
nproc
```

🔹 Muestra el número de núcleos disponibles.

---

## 🔹 **Información de la Memoria**

### 4️⃣ **Ver memoria RAM instalada y en uso**

```bash
free -h
```

🔹 Muestra la memoria total, usada y disponible en formato legible.

```bash
cat /proc/meminfo
```

🔹 Muestra información detallada de la memoria.

---

## 🔹 **Información del Disco**

### 5️⃣ **Ver espacio en disco**

```bash
df -h
```

🔹 Muestra el espacio usado y disponible en todas las particiones.

```bash
lsblk
```

🔹 Muestra la estructura de particiones y discos conectados.

```bash
fdisk -l
```

🔹 Muestra detalles de las particiones del disco.

```bash
du -sh /ruta/del/directorio
```

🔹 Muestra el tamaño de un directorio específico.

---

## 🔹 **Información de los Dispositivos y Hardware**

### 6️⃣ **Ver dispositivos conectados**

```bash
lspci
```

🔹 Lista los dispositivos PCI (tarjetas de red, sonido, etc.).

```bash
lsusb
```

🔹 Lista los dispositivos USB conectados.

```bash
dmidecode -t system
```

🔹 Muestra información sobre el fabricante del sistema, modelo y número de serie.

```bash
dmesg | grep -i usb
```

🔹 Muestra mensajes del sistema relacionados con dispositivos USB.

---

## 🔹 **Información de Usuarios y Grupos**

### 7️⃣ **Ver usuarios activos en el sistema**

```bash
who
```

🔹 Muestra los usuarios conectados actualmente.

```bash
w
```

🔹 Muestra usuarios activos y lo que están haciendo.

```bash
last
```

🔹 Muestra el historial de inicios de sesión.

```bash
getent passwd
```

🔹 Lista todos los usuarios del sistema.

```bash
getent group
```

🔹 Lista todos los grupos del sistema.

---

## 🔹 **Información de Red**

### 8️⃣ **Ver configuración de red**

```bash
ip a
```

🔹 Muestra direcciones IP y estado de las interfaces de red.

```bash
ifconfig
```

🔹 Alternativa antigua para ver la configuración de red.

```bash
netstat -tulnp
```

🔹 Muestra los puertos abiertos y los procesos que los están usando.

```bash
ss -tulnp
```

🔹 Similar a `netstat`, pero más rápido y moderno.

```bash
ip r
```

🔹 Muestra la tabla de rutas del sistema.

```bash
cat /etc/resolv.conf
```

🔹 Muestra los servidores DNS configurados.

---

## 🔹 **Procesos y Servicios**

### 9️⃣ **Ver procesos en ejecución**

```bash
ps aux
```

🔹 Lista todos los procesos en ejecución.

```bash
top
```

🔹 Muestra los procesos más activos en tiempo real.

```bash
htop
```

🔹 Alternativa más visual para ver procesos (requiere instalación).

### 🔟 **Ver servicios activos**

```bash
systemctl list-units --type=service
```

🔹 Lista los servicios en ejecución en sistemas con `systemd`.

```bash
service --status-all
```

🔹 Muestra el estado de los servicios en sistemas sin `systemd`.

---

## 🔹 **Enumerar Usuarios**

Para enumerar usuarios y grupos en Linux, puedes usar varios comandos dependiendo de la información que necesites. Aquí tienes los más importantes:

### 1️⃣ **Listar todos los usuarios del sistema**

```bash
cat /etc/passwd
```

🔹 Muestra la lista de usuarios registrados en el sistema. Cada línea tiene esta estructura:

```
usuario:x:UID:GID:información:casa:shell
```

Ejemplo:

```
root:x:0:0:root:/root:/bin/bash
```

📌 **Importante:**

- `UID 0` es el usuario **root**.
- Los usuarios del sistema suelen tener `UID < 1000`.
- Los usuarios normales tienen `UID ≥ 1000`.

```bash
getent passwd
```

🔹 Alternativa más flexible para listar usuarios.

```bash
awk -F':' '{ print $1}' /etc/passwd
```

🔹 Muestra solo los nombres de usuario.

```bash
cut -d: -f1 /etc/passwd
```

🔹 Otra forma de listar solo los nombres de usuario.

---

## 🔹 **Usuarios Conectados**

### 2️⃣ **Ver quién está conectado**

```bash
who
```

🔹 Muestra los usuarios actualmente conectados.

```bash
w
```

🔹 Similar a `who`, pero con más detalles.

```bash
whoami
```

🔹 Muestra el usuario actual.

```bash
id
```

🔹 Muestra el UID, GID y los grupos del usuario actual.

```bash
last
```

🔹 Muestra el historial de inicios de sesión.

```bash
lastlog
```

🔹 Muestra la última vez que cada usuario inició sesión.

---

## 🔹 **Enumerar Grupos**

### 3️⃣ **Listar todos los grupos del sistema**

```bash
cat /etc/group
```

🔹 Muestra todos los grupos en el sistema.

```bash
getent group
```

🔹 Alternativa para listar los grupos.

```bash
awk -F':' '{ print $1}' /etc/group
```

🔹 Muestra solo los nombres de los grupos.

```bash
cut -d: -f1 /etc/group
```

🔹 Otra forma de mostrar solo los nombres de los grupos.

---

## 🔹 **Ver Grupos de un Usuario**

### 4️⃣ **Listar los grupos a los que pertenece un usuario**

```bash
groups <usuario>
```

🔹 Muestra los grupos de un usuario específico.

```bash
id <usuario>
```

🔹 Muestra el UID, GID y grupos del usuario.

Ejemplo para el usuario `juan`:

```bash
id juan
```

Salida:

```
uid=1001(juan) gid=1001(juan) grupos=1001(juan),27(sudo),100(users)
```

📌 **Notas:**

- El usuario `root` pertenece al grupo `root (0)`.
- Si un usuario pertenece a `sudo` o `wheel`, puede ejecutar comandos como administrador.

---

## 🔹 **Ver Permisos de un Usuario**

### 5️⃣ **Listar los permisos de un usuario**

```bash
sudo -l -U <usuario>
```

🔹 Muestra qué comandos puede ejecutar el usuario con `sudo`.

Ejemplo:

```bash
sudo -l -U juan
```

---

## 🔹 **Usuarios y Grupos Administradores**

### 6️⃣ **Ver quién tiene permisos de administrador**

```bash
getent group sudo
```

🔹 Muestra los usuarios con permisos de `sudo` en Debian/Ubuntu.

```bash
getent group wheel
```

🔹 Muestra los usuarios con permisos de `sudo` en CentOS/RHEL.

```bash
grep '^sudo\|^wheel' /etc/group
```

🔹 Funciona en cualquier distribución.

---

## 🔹 **Buscar Usuarios con UID y GID Específicos**

### 7️⃣ **Listar usuarios con UID mayor o igual a 1000 (usuarios normales)**

```bash
awk -F':' '$3 >= 1000 { print $1, $3 }' /etc/passwd
```

### 8️⃣ **Listar usuarios con UID 0 (root)**

```bash
awk -F':' '$3 == 0 { print $1 }' /etc/passwd
```

🔹 Si hay más de un usuario con UID 0, puede ser sospechoso.

---



---

## 🔹 **Información General de la Red**

Para enumerar información de red en Linux, puedes usar varios comandos dependiendo de lo que necesites. Aquí te dejo los más importantes organizados por categoría:

### 1️⃣ **Ver interfaces de red y direcciones IP**

```bash
ip a
```

🔹 Muestra todas las interfaces de red con sus direcciones IP.

```bash
ifconfig
```

🔹 Alternativa antigua para ver interfaces de red (necesita instalar `net-tools`).

```bash
hostname -I
```

🔹 Muestra solo la dirección IP asignada al equipo.

```bash
ip r
```

🔹 Muestra la tabla de rutas del sistema.

```bash
ip link show
```

🔹 Muestra información de las interfaces de red (estado y configuración).

---

## 🔹 **Configuración de Red y Puertas de Enlace**

### 2️⃣ **Ver la puerta de enlace predeterminada**

```bash
ip route show default
```

🔹 Muestra la puerta de enlace (gateway) del sistema.

```bash
route -n
```

🔹 Alternativa antigua para ver rutas y puertas de enlace.

---

## 🔹 **DNS y Servidores de Nombres**

### 3️⃣ **Ver los servidores DNS configurados**

```bash
cat /etc/resolv.conf
```

🔹 Muestra los servidores DNS utilizados por el sistema.

```bash
systemd-resolve --status | grep 'DNS Servers'
```

🔹 En sistemas modernos con `systemd-resolved`, muestra los servidores DNS activos.

---

## 🔹 **Conexiones Activas y Puertos Abiertos**

### 4️⃣ **Ver conexiones activas y procesos que las usan**

```bash
netstat -tulnp
```

🔹 Lista los puertos abiertos y qué procesos los están usando (requiere `net-tools`).

```bash
ss -tulnp
```

🔹 Alternativa moderna y más rápida que `netstat`.

```bash
lsof -i
```

🔹 Lista los procesos que están usando la red.

```bash
iptables -L -n -v
```

🔹 Muestra las reglas del firewall `iptables`.

```bash
firewalld-cmd --list-all
```

🔹 En sistemas con `firewalld`, muestra reglas activas.

---

## 🔹 **Escaneo de Red y Dispositivos Conectados**

### 5️⃣ **Ver dispositivos en la misma red**

```bash
arp -a
```

🔹 Muestra dispositivos conectados en la red local.

```bash
ip neigh show
```

🔹 Alternativa a `arp -a`, muestra la caché ARP.

### 6️⃣ **Escanear la red en busca de dispositivos activos**

```bash
nmap -sn 192.168.1.0/24
```

🔹 Escanea la red local para encontrar dispositivos activos (requiere `nmap`).

```bash
ping -c 4 192.168.1.1
```

🔹 Envía 4 paquetes `ping` a una dirección IP para verificar si responde.

```bash
traceroute google.com
```

🔹 Muestra la ruta de los paquetes hasta un destino.

```bash
mtr google.com
```

🔹 Alternativa interactiva y más detallada que `traceroute` (requiere `mtr`).

---

## 🔹 **Wi-Fi y Redes Inalámbricas**

### 7️⃣ **Ver redes Wi-Fi disponibles**

```bash
nmcli dev wifi list
```

🔹 Muestra redes Wi-Fi cercanas (en sistemas con `NetworkManager`).

```bash
iwlist wlan0 scan
```

🔹 Muestra redes Wi-Fi disponibles (requiere permisos de root).

```bash
iwconfig
```

🔹 Muestra información de la red inalámbrica actual.

---

## 🔹 **Análisis de Tráfico de Red**

### 8️⃣ **Capturar paquetes de red**

```bash
tcpdump -i eth0
```

🔹 Captura tráfico en la interfaz `eth0` (requiere `tcpdump`).

```bash
tcpdump -i wlan0 port 80
```

🔹 Captura tráfico HTTP en la interfaz Wi-Fi.

```bash
wireshark
```

🔹 Herramienta gráfica para analizar tráfico de red (requiere instalación).

---



## 🔹 **Enumerar Procesos y Cron Jobs en Linux**

## **📌 Procesos en Ejecución**

### 1️⃣ **Ver todos los procesos activos**

```bash
ps aux
```

🔹 Lista todos los procesos con detalles como usuario, PID, uso de CPU y memoria.

```bash
ps -ef
```

🔹 Alternativa con formato diferente (muestra árbol de procesos).

```bash
top
```

🔹 Monitoriza en tiempo real los procesos más activos.

```bash
htop
```

🔹 Versión mejorada de `top` (requiere instalación: `sudo apt install htop`).

---

### 2️⃣ **Buscar un proceso específico**

```bash
ps aux | grep nombre_proceso
```

🔹 Filtra procesos por nombre.

Ejemplo para buscar procesos de `nginx`:

```bash
ps aux | grep nginx
```

```bash
pgrep -l nombre_proceso
```

🔹 Muestra solo los PIDs de un proceso específico.

---

### 3️⃣ **Ver procesos de un usuario en específico**

```bash
ps -u usuario
```

🔹 Lista los procesos ejecutados por un usuario.

---

### 4️⃣ **Ver procesos en forma de árbol**

```bash
pstree -p
```

🔹 Muestra procesos en estructura jerárquica con sus PIDs.

```bash
ps -e --forest
```

🔹 Alternativa sin necesidad de instalar `pstree`.

---

### 5️⃣ **Ver procesos que consumen más CPU o RAM**

```bash
ps aux --sort=-%cpu | head -10
```

🔹 Muestra los 10 procesos con mayor uso de CPU.

```bash
ps aux --sort=-%mem | head -10
```

🔹 Muestra los 10 procesos que más memoria están usando.

---

### 6️⃣ **Matar un proceso**

```bash
kill PID
```

🔹 Mata un proceso usando su PID.

```bash
kill -9 PID
```

🔹 Mata un proceso forzadamente.

```bash
pkill nombre_proceso
```

🔹 Mata un proceso por su nombre.

```bash
killall nombre_proceso
```

🔹 Mata todos los procesos con el mismo nombre.

---

## **📌 Enumerar Cron Jobs**

### 7️⃣ **Ver los cron jobs de un usuario específico**

```bash
crontab -l
```

🔹 Muestra las tareas programadas del usuario actual.

```bash
sudo crontab -l -u usuario
```

🔹 Muestra las tareas programadas de otro usuario.

---

### 8️⃣ **Ver los cron jobs del sistema**

```bash
ls -la /etc/cron.*
```

🔹 Muestra las carpetas donde se guardan los cron jobs del sistema.

```bash
cat /etc/crontab
```

🔹 Muestra el archivo `crontab` del sistema.

```bash
ls -l /var/spool/cron/crontabs/
```

🔹 Lista los archivos de cron job de cada usuario.

---

### 9️⃣ **Ver los logs de cron jobs**

```bash
cat /var/log/syslog | grep CRON
```

🔹 En distribuciones como Ubuntu/Debian.

```bash
cat /var/log/cron
```

🔹 En sistemas basados en RHEL/CentOS.

---