[[smbmap]]
### 📌 **Ejemplos de Uso**

1️⃣ **Enumerar recursos compartidos en una máquina SMB anónima**

```bash
smbmap -H 192.168.1.10
```

👉 Muestra los recursos compartidos accesibles sin autenticación.

2️⃣ **Enumerar recursos con credenciales (usuario y contraseña)**

```bash
smbmap -H 192.168.1.10 -u usuario -p contraseña
```

👉 Lista los recursos accesibles con ese usuario.

3️⃣ **Listar archivos dentro de un recurso compartido**

```bash
smbmap -H 192.168.1.10 -u usuario -p contraseña -r "Compartido"
```

👉 Muestra el contenido de la carpeta "Compartido".

4️⃣ **Descargar un archivo de un recurso compartido**

```bash
smbmap -H 192.168.1.10 -u usuario -p contraseña -r "Compartido" -A "archivo.txt"
```

👉 Descarga "archivo.txt" si es accesible.

5️⃣ **Subir un archivo a un recurso compartido (si hay permisos de escritura)**

```bash
smbmap -H 192.168.1.10 -u usuario -p contraseña -r "Compartido" --upload archivo.txt
```

6️⃣ **Ejecutar un comando en la máquina objetivo (si tiene privilegios)**

```bash
smbmap -H 192.168.1.10 -u usuario -p contraseña --exec "whoami"
```

👉 Si el usuario tiene permisos, devuelve el nombre de usuario con el que se ejecutó el comando.

### 🔥 **Casos de Uso en Hacking Ético**

- **Identificar recursos compartidos sin protección** en redes empresariales.
- **Buscar archivos sensibles** accesibles por cualquier usuario.
- **Detectar permisos incorrectos** que permitan a usuarios no autorizados modificar archivos.
- **Ejecutar código malicioso** en servidores mal configurados.

### 🚀 **Alternativas a SMBMap**

- `smbclient` (herramienta nativa de Samba)
- `enum4linux` (para obtener información detallada de SMB y NetBIOS)
- `nmap --script smb-*` (para escaneo de SMB con scripts de Nmap)
