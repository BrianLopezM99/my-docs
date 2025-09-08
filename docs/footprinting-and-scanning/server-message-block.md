### 🔍 **¿Qué es SMB?**

**SMB (Server Message Block)** es un protocolo de red utilizado principalmente en sistemas Windows para compartir archivos, impresoras y otros recursos entre dispositivos en una red. También puede ser implementado en Linux y macOS mediante Samba.

---

## 🛠️ **¿Para qué se usa SMB?**

✅ **Compartir archivos y carpetas** en una red local.  
✅ **Acceder a impresoras y otros dispositivos** compartidos.  
✅ **Autenticación de usuarios y permisos de acceso** en redes empresariales.  
✅ **Mapear unidades de red** para acceder a archivos remotos como si fueran locales.

---

## 📌 **Puertos utilizados por SMB**

- **Puerto 139/TCP** → Utilizado en SMB sobre NetBIOS (antiguo, Windows XP y anteriores).
- **Puerto 445/TCP** → Utilizado en SMB directo (Windows 2000 en adelante, sin necesidad de NetBIOS).

---

## ☢️ **Seguridad en SMB**

❌ **Evita SMBv1**: Es un protocolo obsoleto y vulnerable (desactívalo si es posible).  
🔐 **Usa credenciales seguras**: No permitas accesos anónimos sin restricciones.  
🛡️ **Monitorea el tráfico SMB**: Puede ser un punto de entrada para ataques de ransomware.

---

## 🔎 **Explorando SMB con Nmap (NSE)**

SMB es un objetivo común en auditorías de seguridad, ya que ha tenido múltiples vulnerabilidades explotables como **EternalBlue (MS17-010)**, utilizado por el ransomware **WannaCry**.

### 🛠️ **Detectar si SMB está activo en un host**

`nmap -p 445 --script smb-os-discovery 192.168.1.1`

🔹 Descubre el sistema operativo y detalles del servicio SMB.

## 🔐**Obtener informacion sobre el nivel de seguridad del SMB**

`nmap -p445 --script smb-security-mode 192.168.1.1`


## 🙍‍♂️**Enumerar sesiones activas en el servicio SMB**

`nmap -p445 --script smb-enum-sessions 192.168.1.1`

Este script intenta enumerar sesiones de SMB activas en el host de destino. Esto puede revelar:  
✅ Usuarios conectados a recursos compartidos.  
✅ Dispositivos que tienen sesiones abiertas en la máquina.  
✅ Posibles accesos anónimos o usuarios con credenciales débiles.


## **🙍‍♂️Enumerar sesiones activas en el servicio SMB con credenciales**

Algunos servidores bloquean la enumeracion de sesiones a usuarios anonimos. Si el script no devuelve informacion, prueba con credenciales:

`nmap -p445 --script smb-enum-sessions --script-args smbuser=usuario,smbpass=contraseña demo.ine.local`

🔹Esto puede revelar mas detalles si tenemos acceso autorizado.

## **📂 Listar recursos compartidos en una red Windows***

`nmap --script smb-enum-shares -p 445 192.168.1.1`

🔹 Muestra carpetas compartidas y permisos.


## **Enumerar usuarios windows en la maquina objetivo**

`nmap -p445 --script smb-enum-users --script-args smbuser=yoususer,smbpass=yourpass 192.168.1.1`


## **Obtener informacion sobre las estadisticas del servidor**

`nmap -p445 --script smb-server-stats --script-args smbuser=youruser,smbpass=yourpass 192.168.1.1`

## **Obtener informacion sobre los dominios del servidor**

`nmap -p445 --script smb-enum-domains --script-args smbuser=youruser,smbpass=yourpass 192.168.1.1`

## **Enumerar grupos en la maquina objetivo**

`nmap -p445 --script smb-enum-groups --script-args smbuser=youruser,smbpass=yourpass 192.168.1.1`

## **Enumerar servicios en la maquina objetivo**

`nmap -p445 --script smb-enum-services --script-args smbuser=youruser,smbpass=yourpass 192.168.1.1`

## **Enumerar todas las carpetas y drivers compartidos**

Usado para listar archivos, carpetas, similar al comando "dir" en windows, en todas las carpetas compartidas.

`nmap -p445 --script smb-enum-shares,smb-ls --script-args smbuser=youruser,smbpass=yourpass 192.168.1.1`

## Descubrir nombre de equipo NetBIOS del servidor SMB

`nmap --script smb-os-discovery-nse -p 445 192.168.1.1`