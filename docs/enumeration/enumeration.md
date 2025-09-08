### 🔍 **¿Qué es la Enumeración en Pentesting?**

La **[enumeración]** en pentesting es el proceso de recopilar información detallada sobre un sistema objetivo después del escaneo inicial. Se centra en identificar recursos, servicios, usuarios, credenciales y otras configuraciones que puedan ser explotadas más adelante en la fase de explotación.

---

## **🛠️ Objetivos de la Enumeración**

1. **Identificar usuarios y grupos** (ejemplo: enumeración de usuarios en Active Directory).
2. **Descubrir servicios y sus versiones** (ejemplo: SMB, FTP, HTTP).
3. **Recuperar información de redes** (ejemplo: dominios, subdominios, rutas, dispositivos).
4. **Obtener credenciales débiles o mal configuradas** (ejemplo: hashes de contraseñas).
5. **Extraer información sobre permisos y configuraciones** (ejemplo: privilegios de usuarios en bases de datos).

---

## **📌 Tipos de Enumeración y Herramientas**

### 🔹 **1. Enumeración de Usuarios y Credenciales**

- **Técnicas**: Enumerar usuarios válidos en sistemas como Windows (Active Directory), SSH o correos electrónicos.
- **Herramientas**:
    - `enum4linux` (SMB y Active Directory)
    - `rpcclient` (Enumeración de usuarios en Windows)
    - `nmap --script smb-enum-users` (Usuarios SMB)
    - `hydra` o `medusa` (Ataques de fuerza bruta)
    -  [[Msfconsole🛡️]] (modulos de enumeracion)

### 🔹 **2. Enumeración de Servicios y Puertos**

- **Técnicas**: Identificar versiones y configuraciones de servicios como HTTP, SMB, FTP, etc.
- **Herramientas**:
    - `nmap -sV` (Detección de versiones de servicios)
    - `nikto` (Enumeración de vulnerabilidades web)
    - `whatweb` (Detección de tecnologías web)

### 🔹 **3. Enumeración de Recursos Compartidos (SMB, NFS, FTP)**

- **Técnicas**: Buscar archivos o carpetas accesibles en redes.
- **Herramientas**:
    - `smbclient -L //IP` (Listar recursos compartidos en SMB)
    - `showmount -e IP` (Ver carpetas compartidas en NFS)
    - `ftp` (Ver archivos en servidores FTP abiertos)

### 🔹 **4. Enumeración de DNS y Subdominios**

- **Técnicas**: Descubrir subdominios y registros DNS para identificar más puntos de entrada.
- **Herramientas**:
    - `nslookup` / `dig` (Consultar registros DNS)
    - `theHarvester` (Recopilar información de dominios)
    - `sublist3r` (Enumeración de subdominios)

### 🔹 **5. Enumeración de Directorios y Archivos Web**

- **Técnicas**: Buscar directorios ocultos o archivos sensibles en servidores web.
- **Herramientas**:
    - `gobuster dir -u http://victima.com -w wordlist.txt`
    - `dirb` o `feroxbuster` (Fuerza bruta de directorios)

---

## **🔑 Importancia de la Enumeración en un Pentest**

1. **Revela posibles vectores de ataque** antes de explotar vulnerabilidades.
2. **Ayuda a encontrar credenciales y configuraciones débiles**.
3. **Facilita el reconocimiento de la estructura de la red** objetivo.
4. **Permite planear mejor la fase de explotación**, enfocándose en servicios vulnerables.