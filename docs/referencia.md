### 🔥 **psexec.py** - Herramienta para Ejecución Remota en Windows 🔥

`psexec.py` es un **script de Python** que emula la funcionalidad de la herramienta **PsExec** de **Sysinternals** (ahora propiedad de Microsoft). PsExec es una herramienta muy utilizada para ejecutar comandos y programas de forma remota en sistemas Windows, especialmente útil para administradores de sistemas y en pruebas de penetración.

El script `psexec.py` permite realizar **ejecuciones remotas de comandos** en sistemas Windows sin necesidad de tener acceso físico al sistema o de estar presente en la red de forma local.

---

## 📌 **¿Qué hace `psexec.py`?**

`psexec.py` es una versión de código abierto y simplificada del comando `PsExec` y permite lo siguiente:

1. **Ejecución remota de comandos**: Puedes ejecutar comandos en una máquina remota de Windows, similar a como lo harías con el comando `cmd` o PowerShell.
2. **Transferencia de archivos**: Puedes transferir archivos hacia o desde la máquina remota mientras ejecutas los comandos.
3. **Ejecución con privilegios elevados**: Al igual que PsExec, puedes ejecutar comandos con privilegios de administrador (si la cuenta tiene los permisos adecuados).
4. **Recopilación de información**: Puedes ejecutar comandos de recopilación de información en una máquina Windows remota, como obtener detalles de red, lista de procesos, etc.

---

## 🔹 **Instalación y Requisitos**

`psexec.py` suele encontrarse en repositorios de herramientas de pentesting como **SecLists**, **Kali Linux**, o en **GitHub**. Para ejecutarlo, necesitas tener Python instalado en tu sistema.

1. **Instalación de dependencias**: Si no tienes Python, instálalo desde [python.org](https://www.python.org/downloads/).
    
2. **Dependencias adicionales**: Algunas versiones del script pueden requerir dependencias como `impacket` para manejar la autenticación y las conexiones SMB:
    
    ```bash
    pip install impacket
    ```
    
El módulo **`psexec`** de **Metasploit** se usa cuando tienes credenciales válidas de un usuario con privilegios administrativos en un sistema Windows que tiene SMB habilitado (puerto 445 abierto).

### **📌 Cuándo usar `psexec` en SMB**

Debes considerar `psexec` si se cumplen las siguientes condiciones:

1. **Acceso SMB habilitado** → El puerto `445` está abierto en el objetivo.
2. **Credenciales válidas** → Tienes un usuario y contraseña con privilegios administrativos.
3. **Permisos suficientes** → El usuario debe tener permisos para ejecutar procesos remotos en el sistema.
4. **Servicios SMB y ADMIN$ accesibles** → El servicio `ADMIN$` debe estar disponible en el sistema objetivo.

---

## 🔹 **Uso Básico de `psexec.py`**

Para ejecutar el script, debes especificar la dirección IP de la máquina remota, junto con el nombre de usuario y la contraseña, o la clave de acceso si estás utilizando autenticación NTLM.

### **Sintaxis Básica**:

```bash
python psexec.py <usuario>:<contraseña>@<IP objetivo> <comando a ejecutar>
```

### **Ejemplo**:

Si quieres ejecutar el comando `ipconfig` en la máquina remota con la IP `192.168.1.100`, usa:

```bash
python psexec.py administrator:password@192.168.1.100 ipconfig
```

Esto ejecutará `ipconfig` en la máquina remota y te devolverá el resultado.

---

## 🔹 **Características y Opciones Comunes**

|Opción|Descripción|
|---|---|
|`<usuario>:<contraseña>`|Nombre de usuario y contraseña para autenticarte en el sistema remoto.|
|`<IP objetivo>`|Dirección IP del sistema remoto en el que deseas ejecutar el comando.|
|`<comando>`|El comando o script que deseas ejecutar de manera remota.|
|`-hashes`|Si se usa autenticación NTLM, puedes especificar los hashes en lugar de la contraseña.|

---

## 🔹 **Ejemplo de Ejecución Remota de Comandos**

1. **Ejecución de un Comando Simple**:
    
    ```bash
    python psexec.py admin:password@192.168.1.100 whoami
    ```
    
    Esto ejecutará el comando `whoami` en la máquina remota para obtener el usuario actual.
    
2. **Transferir Archivos a una Máquina Remota**: Puedes usar `psexec.py` para copiar un archivo desde tu máquina local a una máquina remota:
    
    ```bash
    python psexec.py admin:password@192.168.1.100 -c /ruta/a/archivo.exe
    ```
    
    El comando anterior copiará el archivo `archivo.exe` a la máquina remota y lo ejecutará.
    

---

## 🔹 **¿Para qué se utiliza `psexec.py`?**

`psexec.py` es muy útil en entornos de pruebas de penetración, auditorías de seguridad y administración remota, ya que:

1. **Ejecución Remota de Comandos**: Permite ejecutar casi cualquier comando en un sistema Windows remoto.
2. **Tareas de Administración de Sistemas**: Ideal para administradores de sistemas que necesitan gestionar máquinas remotas sin necesidad de acceder físicamente a ellas.
3. **Exploits y Pentesting**: Durante pruebas de penetración, se puede utilizar `psexec.py` para ejecutar exploits o scripts maliciosos en sistemas comprometidos.

---

## 🔥 **Conclusión**

`psexec.py` es una herramienta potente para la **ejecución remota de comandos** en máquinas Windows. Si bien es útil para administradores de sistemas, también es ampliamente utilizada en pruebas de penetración para explotar vulnerabilidades en sistemas Windows sin necesidad de acceso físico a la máquina.