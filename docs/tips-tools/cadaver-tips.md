
[[Cadaver🏴‍☠️]]
### 📌 **1. Conectarse a un servidor WebDAV**

```bash
cadaver http://target.com/webdav/
```

Esto abrirá una sesión interactiva, y podrás ingresar el nombre de usuario y la contraseña si es necesario.

---

### 📌 **2. Listar Archivos en un Directorio**

Una vez conectado, puedes usar el comando `ls` para listar los archivos en el directorio actual:

```bash
ls
```

Esto te mostrará los archivos y carpetas disponibles en el directorio remoto.

---

### 📌 **3. Subir un Archivo al Servidor**

Para subir un archivo local al servidor WebDAV, usa el comando `put`:

```bash
put archivo_local.txt
```

Esto subirá el archivo `archivo_local.txt` desde tu máquina local al servidor.

---

### 📌 **4. Descargar un Archivo desde el Servidor**

Para descargar un archivo del servidor WebDAV, usa el comando `get`:

```bash
get archivo_remoto.txt
```

Esto descargará el archivo `archivo_remoto.txt` del servidor a tu máquina local.

---

### 📌 **5. Crear un Directorio en el Servidor**

Si quieres crear un directorio remoto en el servidor, usa el comando `mkdir`:

```bash
mkdir nuevo_directorio
```

Esto creará un directorio llamado `nuevo_directorio` en el servidor WebDAV.

---

### 📌 **6. Eliminar un Archivo en el Servidor**

Para eliminar un archivo remoto en el servidor, usa el comando `delete`:

```bash
delete archivo_a_borrar.txt
```

Esto eliminará el archivo `archivo_a_borrar.txt` del servidor WebDAV.

---

## 🔹 **6. Autenticación**

Si el servidor WebDAV requiere autenticación básica, `cadaver` te pedirá que ingreses el nombre de usuario y la contraseña al intentar conectarte. También puedes proporcionarlo directamente en la URL:

```bash
cadaver http://usuario:contraseña@target.com/webdav/
```

---

## 🔥 **Conclusión**

`cadaver` es una herramienta útil para interactuar con servidores WebDAV a través de la línea de comandos. Puedes usarla para:

✅ Subir y descargar archivos.  
✅ Crear, mover y eliminar directorios.  
✅ Navegar por los directorios remotos.
