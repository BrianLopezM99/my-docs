[[smbclient📋]]
## 🔍 **Listar recursos compartidos en un servidor**

Para ver los recursos compartidos en un servidor SMB:

`smbclient -L //<IP_o_NOMBRE_DEL_SERVIDOR> -U <usuario>`

Ejemplo:

`smbclient -L //192.168.1.10 -U administrador`

Esto pedirá la contraseña y mostrará los recursos compartidos.

Si el servidor no requiere autenticación, puedes probar con `-N` (sin contraseña):

`smbclient -L //192.168.1.10 -N`

Podemos realizar fuerza bruta para detectar si hay archivos ocultos con este script
[[Enumerate SMB hidden recourses]]

Tambien podemos realizar ataques de fuerza bruta a inicios de sesion del smb una vez tengamos listados los usuarios con enum4linux, utilizando el auxiliar de metasploit smb_login

---

## 📂 **Conectarse a un recurso compartido**

Para acceder a un recurso compartido:

`smbclient //<IP_o_NOMBRE_DEL_SERVIDOR>/<RECURSO> -U <usuario>`

Ejemplo:

`smbclient //192.168.1.10/Documentos -U administrador`

Después de ingresar la contraseña, entrarás en un shell interactivo similar a FTP, donde puedes usar comandos como:

- `ls` → Listar archivos en el recurso compartido.
- `cd <directorio>` → Cambiar de directorio.
- `get <archivo>` → Descargar un archivo.
- `put <archivo>` → Subir un archivo.
- `exit` → Salir del cliente.

---

## 📥 **Descargar un archivo directamente**

Si quieres descargar un archivo sin entrar al modo interactivo:

`smbclient //<IP>/Compartido -U usuario -c "get archivo.txt"`

Ejemplo:

`smbclient //192.168.1.10/Publico -U administrador -c "get informe.pdf"`

---

## 📤 **Subir un archivo directamente**

Si quieres subir un archivo sin modo interactivo:

`smbclient //<IP>/Compartido -U usuario -c "put archivo_local archivo_remoto"`

Ejemplo:

`smbclient //192.168.1.10/Documentos -U administrador -c "put notas.txt notas_servidor.txt"`

---

## 🔑 **Conectarse a SMB con una contraseña en línea de comandos**

Para evitar que `smbclient` te pida la contraseña interactivamente, puedes pasarla en la línea de comandos (⚠️ No recomendado por seguridad):

`smbclient //<IP>/Compartido -U usuario%contraseña`

Ejemplo:

`smbclient //192.168.1.10/Documentos -U administrador%SuperSecreta123`

**Alternativa más segura:** Guardar la contraseña en un archivo y usar `--password-file`:

`echo "SuperSecreta123" > smb_pass.txt chmod 600 smb_pass.txt smbclient //<IP>/Compartido -U administrador --password-file=smb_pass.txt`

---

## 🏴 **Montar un recurso SMB en Linux**

Si prefieres acceder al recurso compartido como una carpeta en el sistema:

`sudo mount -t cifs //<IP>/Compartido /mnt/smb -o username=usuario,password=contraseña`

Ejemplo:

`sudo mount -t cifs //192.168.1.10/Documentos /mnt/smb -o username=admin,password=SuperSecreta123`

Para desmontarlo:

`sudo umount /mnt/smb`

---

## 🔄 **Automatización con Credenciales Guardadas**

Si accedes frecuentemente a un recurso SMB, puedes guardar las credenciales en `/etc/samba/credentials`:

1. Crea el archivo:
    
    `sudo nano /etc/samba/credentials`
    
2. Agrega:
    
    `username=admin password=SuperSecreta123`
    
3. Guarda y cambia los permisos:
    
    `sudo chmod 600 /etc/samba/credentials`
    
4. Monta automáticamente:
    
    `sudo mount -t cifs //192.168.1.10/Documentos /mnt/smb -o credentials=/etc/samba/credentials`
    

---

## 🛠 **Solución de problemas**

### ❌ **Error: "NT_STATUS_ACCESS_DENIED"**

- Verifica que el usuario y contraseña sean correctos.
- Si el servidor requiere autenticación NTLMv1, agrega `--option='client min protocol=NT1'`:
    
    `smbclient //<IP>/Compartido -U usuario --option='client min protocol=NT1'`
    

### ❌ **Error: "Could not resolve address for ..."**

- Intenta con la dirección IP en lugar del nombre del servidor.

### ❌ **Error: "Mount error(13): Permission denied"**

- Puede ser un problema de permisos, prueba con `sec=ntlm`:
    
    `sudo mount -t cifs //192.168.1.10/Documentos /mnt/smb -o username=admin,password=SuperSecreta123,sec=ntlm`
    

---
