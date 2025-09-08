[[smbmap]] es una herramienta de enumeración y explotación de recursos compartidos en redes que usan el protocolo **SMB (Server Message Block)**. Se utiliza principalmente en auditorías de seguridad y pruebas de penetración para detectar configuraciones débiles o incorrectas en servidores SMB.

### 📌 **¿Para qué sirve?**

`SMBMap` permite a los atacantes o pentesters:

- Enumerar **recursos compartidos** en un servidor SMB.
- Identificar **permisos de acceso** (lectura, escritura, ejecución) en los recursos compartidos.
- Listar y descargar archivos accesibles.
- Subir archivos si el servidor lo permite.
- Ejecutar comandos de manera remota en servidores Windows (si se tienen las credenciales adecuadas).

### ⚙ **Instalación**

En **Kali Linux** y otras distribuciones enfocadas en seguridad, `smbmap` suele venir preinstalado. Si no lo tienes, puedes instalarlo con:

```bash
sudo apt install smbmap
```

O clonarlo desde su repositorio en GitHub:

```bash
git clone https://github.com/ShawnDEvans/smbmap.git
cd smbmap
pip3 install -r requirements.txt
```

