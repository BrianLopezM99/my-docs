### 🔎 **¿Qué es NSE (Nmap Scripting Engine)?**

**NSE (Nmap Scripting Engine)** es un motor de scripting integrado en **Nmap** que permite automatizar tareas avanzadas durante los escaneos. Utiliza scripts escritos en **Lua** para detectar vulnerabilidades, obtener información detallada de servicios y realizar auditorías de seguridad más profundas.

---

## 🛠️ **¿Para qué sirve NSE?**

✅ **Detección de vulnerabilidades** (Ej: identificar servicios desactualizados o con exploits conocidos).  
✅ **Enumeración de servicios** (Ej: descubrir versiones de software en ejecución).  
✅ **Autenticación y fuerza bruta** (Ej: probar contraseñas en SSH, FTP, etc.).  
✅ **Detección de malware y backdoors** en sistemas comprometidos.  
✅ **Escaneos avanzados de firewall y detección de IDS**.

---

## 📜 **Ejemplos de uso de NSE**

### 🔍 **Listar todos los scripts disponibles**

`nmap --script-help=default`

### 🛠️ **Ejecutar un script en un escaneo**

`nmap --script http-title 192.168.1.1`

🔹 Muestra el título de una página web en el puerto 80 del host escaneado.

### 🔑 **Detectar vulnerabilidades conocidas**

`nmap --script vuln 192.168.1.1`

🔹 Busca vulnerabilidades en el host objetivo.

### 💣 **Realizar fuerza bruta en SSH**

`nmap --script ssh-brute -p 22 192.168.1.1`

🔹 Intenta adivinar credenciales en un servidor SSH.

### 🖥️ **Enumerar recursos compartidos en una red Windows [[Server Message Block (SMB)]]**

`nmap --script smb-enum-shares 192.168.1.1`

🔹 Lista los recursos compartidos accesibles en el sistema.

### 📡 **Buscar servidores DNS abiertos**

`nmap --script dns-recursion 192.168.1.1`

🔹 Verifica si un servidor DNS permite consultas recursivas.
