```
wmic qfe get Caption,Description,HotFixID,InstalledOn
```

Sirve para listar las actualizaciones de Windows (hotfixes o parches) instaladas en el sistema.
### Explicación de cada parte:

- **`wmic`** → Ejecuta la herramienta Windows Management Instrumentation Command-line (WMIC).
- **`qfe`** → Se refiere a _Quick Fix Engineering_, que es el módulo que gestiona los parches del sistema.
- **`get`** → Indica que queremos obtener información.
- **`Caption,Description,HotFixID,InstalledOn`** → Especifica qué columnas de información mostrar:
    - **Caption**: Nombre descriptivo de la actualización.
    - **Description**: Generalmente indica que es una "Actualización de seguridad".
    - **HotFixID**: Identificador único de la actualización (KBXXXXXX).
    - **InstalledOn**: Fecha en que se instaló el parche.

Para enumerar usuarios y grupos en Windows, puedes usar varios métodos dependiendo del nivel de detalle que necesites. Aquí te dejo algunas opciones con sus respectivos comandos.

---

## 🔹 **Enumeración de Usuarios en Windows**

### 1️⃣ **Ver usuarios locales en el sistema**

```cmd
net user
```

🔹 Muestra todos los usuarios creados en el sistema.

### 2️⃣ **Ver detalles de un usuario específico**

```cmd
net user <nombre_usuario>
```

🔹 Sustituye `<nombre_usuario>` por el usuario que quieras consultar.  
🔹 Esto te dará información sobre grupos, permisos, fecha de última conexión, etc.

### 3️⃣ **Enumerar usuarios con WMIC**

```cmd
wmic useraccount get name,sid
```

🔹 Muestra el nombre y el **Security Identifier (SID)** de cada usuario.

### 4️⃣ **Ver usuarios en una máquina remota**

```cmd
wmic /node:<IP_o_NombreDelEquipo> useraccount get name
```

🔹 Útil para auditorías en redes.

---

## 🔹 **Enumeración de Grupos en Windows**

### 1️⃣ **Ver todos los grupos locales**

```cmd
net localgroup
```

🔹 Muestra todos los grupos del sistema (como Administradores, Usuarios, Invitados, etc.).

### 2️⃣ **Ver usuarios dentro de un grupo específico**

```cmd
net localgroup Administradores
```

🔹 Sustituye `Administradores` por otro grupo si necesitas información de otro.

### 3️⃣ **Enumerar grupos con WMIC**

```cmd
wmic group get name,sid
```

🔹 Muestra los nombres y SIDs de los grupos.

---

## 🔹 **Enumeración de Usuarios y Grupos en Active Directory (si estás en un dominio)**

Si estás en un dominio, puedes usar **PowerShell**.

### 1️⃣ **Listar todos los usuarios de Active Directory**

```powershell
Get-ADUser -Filter * | Select Name,SamAccountName
```

🔹 Muestra los nombres de usuario en un entorno de dominio.

### 2️⃣ **Ver todos los grupos de Active Directory**

```powershell
Get-ADGroup -Filter * | Select Name
```

### 3️⃣ **Ver los miembros de un grupo en Active Directory**

```powershell
Get-ADGroupMember -Identity "Administradores del dominio"
```

---

## 🔹 **Enumeración con Herramientas Avanzadas**

Si necesitas más herramientas avanzadas, puedes usar:

- **PowerView** (parte de PowerSploit) → para enumeración en entornos de dominio.
- **BloodHound** → para analizar la estructura de permisos en redes Windows.
- **PsExec** → para ejecutar comandos remotamente.


---

## 🔹 **Información general de la red**

Para obtener información de la red en Windows, hay varios comandos que puedes usar dependiendo del nivel de detalle que necesites. Aquí tienes una lista de los más útiles:

### 1️⃣ **Ver configuración de red (IP, máscara, puerta de enlace, DNS)**

```cmd
ipconfig /all
```

🔹 Muestra información completa sobre todas las interfaces de red del sistema, incluyendo direcciones IP, MAC, servidores DNS y DHCP.

### 2️⃣ **Ver interfaces de red activas**

```cmd
ipconfig
```

🔹 Muestra solo las interfaces con conexión activa.

### 3️⃣ **Mostrar tabla de enrutamiento**

```cmd
route print
```

🔹 Muestra las rutas disponibles en el sistema, útil para analizar tráfico de red y posibles configuraciones incorrectas.

### 4️⃣ **Ver conexiones de red y puertos abiertos**

```cmd
netstat -ano
```

🔹 Muestra todas las conexiones activas, los puertos abiertos y los PID de los procesos que los están usando.

**Opciones útiles:**

- `netstat -an` → Muestra conexiones activas con direcciones IP y puertos.
- `netstat -ano` → Incluye el **PID** de los procesos que están usando cada conexión.
- `netstat -r` → Muestra la tabla de enrutamiento.
- `netstat -s` → Muestra estadísticas de paquetes enviados y recibidos.

---

## 🔹 **Escaneo y análisis de red**

### 5️⃣ **Ver equipos en la misma red (con NetBIOS)**

```cmd
nbtstat -n
```

🔹 Muestra los nombres NetBIOS registrados en el sistema.

```cmd
nbtstat -A <IP>
```

🔹 Consulta el nombre NetBIOS de un equipo en la red.

```cmd
net view
```

🔹 Lista los equipos accesibles en la red local.

### 6️⃣ **Hacer ping a un dispositivo para verificar conectividad**

```cmd
ping <IP_o_Dominio>
```

🔹 Envía paquetes ICMP para comprobar si un host está accesible.

```cmd
ping -t <IP>
```

🔹 Hace ping continuo hasta que se detenga manualmente (`Ctrl + C`).

### 7️⃣ **Rastrear la ruta a un host**

```cmd
tracert <IP_o_Dominio>
```

🔹 Muestra los nodos intermedios por los que pasa un paquete antes de llegar a su destino.

### 8️⃣ **Escaneo de puertos abiertos en un host**

```cmd
netstat -an | find "LISTENING"
```

🔹 Muestra solo los puertos que están en estado **LISTENING**.

```cmd
powershell Test-NetConnection -ComputerName <IP_o_Dominio> -Port <NúmeroPuerto>
```

🔹 Verifica si un puerto está abierto en un equipo remoto.

### 9️⃣ **Obtener información sobre la dirección MAC y el fabricante**

```cmd
getmac /v /fo list
```

🔹 Muestra las direcciones MAC de todas las interfaces.

```cmd
arp -a
```

🔹 Muestra la tabla ARP con direcciones IP y MAC de los dispositivos conectados.

---

## 🔹 **Información de redes Wi-Fi**

### 🔟 **Ver redes Wi-Fi guardadas**

```cmd
netsh wlan show profiles
```

🔹 Lista todas las redes Wi-Fi a las que se ha conectado el equipo.

```cmd
netsh wlan show profile name="<SSID>" key=clear
```

🔹 Muestra los detalles de una red Wi-Fi específica, incluyendo la clave de seguridad en texto plano.

---

## 🔹 **Escaneo avanzado con herramientas**

Si necesitas algo más avanzado, puedes usar:

- **Nmap** → Para escanear redes y descubrir dispositivos.
- **Wireshark** → Para capturar y analizar paquetes de red.
- **PowerView** → Para enumeración en entornos de dominio.

---

## 🔹 **Procesos en ejecución**

Para enumerar **procesos y servicios** en Windows, puedes usar diferentes comandos según el nivel de detalle que necesites. Aquí tienes las opciones más útiles:

### 1️⃣ **Listar todos los procesos activos**

```cmd
tasklist
```

🔹 Muestra una lista de procesos con su **PID (Process ID)**, uso de memoria y nombre del ejecutable.

```cmd
tasklist /svc
```

🔹 Muestra los procesos junto con los servicios que están ejecutando.

```cmd
tasklist /fi "imagename eq notepad.exe"
```

🔹 Filtra los procesos por nombre (ejemplo: `notepad.exe`).

```cmd
tasklist /fi "pid eq 1234"
```

🔹 Muestra información del proceso con el ID `1234`.

### 2️⃣ **Ver detalles avanzados de un proceso**

```cmd
wmic process list full
```

🔹 Muestra información detallada de todos los procesos en ejecución.

```cmd
wmic process where name="chrome.exe" get ProcessId,ParentProcessId,CommandLine
```

🔹 Muestra el PID, el proceso padre y la línea de comando con la que se inició un proceso específico (`chrome.exe` en este caso).

### 3️⃣ **Terminar un proceso**

```cmd
taskkill /PID 1234 /F
```

🔹 Mata el proceso con el ID `1234`.

```cmd
taskkill /IM notepad.exe /F
```

🔹 Mata todos los procesos con el nombre `notepad.exe`.

---

## 🔹 **Servicios en Windows**

### 4️⃣ **Listar servicios en ejecución**

```cmd
net start
```

🔹 Muestra una lista de servicios que están **en ejecución**.

```cmd
wmic service get Name,DisplayName,State
```

🔹 Muestra los servicios junto con su nombre y estado (Running o Stopped).

### 5️⃣ **Ver detalles de un servicio específico**

```cmd
sc query <NombreDelServicio>
```

🔹 Sustituye `<NombreDelServicio>` por el nombre real del servicio.

Ejemplo para el servicio de Windows Update:

```cmd
sc query wuauserv
```

### 6️⃣ **Iniciar o detener un servicio**

```cmd
sc start <NombreDelServicio>
```

🔹 Inicia un servicio.

```cmd
sc stop <NombreDelServicio>
```

🔹 Detiene un servicio.

Ejemplo:

```cmd
sc start wuauserv
sc stop wuauserv
```

### 7️⃣ **Obtener la configuración completa de un servicio**

```cmd
sc qc <NombreDelServicio>
```

🔹 Muestra el binario que ejecuta el servicio, tipo de inicio, permisos, etc.

Ejemplo:

```cmd
sc qc Spooler
```

### 8️⃣ **Ver servicios en un equipo remoto**

```cmd
sc \\<IP_o_NombreDelEquipo> query
```

🔹 Lista los servicios en un equipo remoto.

---

## 🔹 **Monitoreo avanzado con PowerShell**

### 9️⃣ **Ver procesos en ejecución**

```powershell
Get-Process
```

🔹 Muestra los procesos en ejecución con detalles como uso de memoria y CPU.

```powershell
Get-Process | Where-Object { $_.ProcessName -like "*chrome*" }
```

🔹 Filtra los procesos por nombre.

### 🔟 **Listar servicios y su estado**

```powershell
Get-Service
```

🔹 Muestra todos los servicios con su estado (Running o Stopped).

```powershell
Get-Service -Name Spooler
```

🔹 Muestra detalles del servicio `Spooler`.

---

## 🚀 **Herramientas avanzadas**

Si quieres algo más gráfico o detallado:

- **Process Explorer** → Alternativa avanzada al Administrador de Tareas.
- **Process Hacker** → Para ver detalles avanzados de procesos y servicios.
- **Autoruns** → Para analizar programas que se inician con el sistema.

---
