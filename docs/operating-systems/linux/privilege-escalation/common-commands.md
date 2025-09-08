 **Comandos en Linux** que pueden ayudarte a **encontrar archivos con permisos inseguros** y que podrían ser útiles para **escalar privilegios** o **corregir problemas de seguridad**. Aquí te dejo algunas alternativas y variaciones.

---

## **📌 1️⃣ Buscar archivos con permisos peligrosos (`o+w`, `777`, `SUID`, `GUID`)**

### **1.1. Archivos que cualquier usuario puede escribir (`o+w`)**

```bash
find / -type f -perm -o+w 2>/dev/null
```

🔎 Encuentra archivos normales (`-type f`) **que cualquier usuario puede escribir** (`-perm -o+w`).

---

### **1.2. Directorios que cualquier usuario puede modificar (`o+w`)**

```bash
find / -type d -perm -o+w 2>/dev/null
```

🔎 Encuentra **directorios** que cualquier usuario puede modificar.  
💡 **IMPORTANTE**: Si un directorio `/home/user/privado` tiene `o+w`, un atacante puede **crear archivos en él**.

---

### **1.3. Archivos con permisos `777` (cualquiera puede leer, escribir y ejecutar)**

```bash
find / -perm 777 2>/dev/null
```

🔎 **Peligroso** en carpetas como `/etc`, `/var`, `/root`, `/usr/bin`, etc.

---

### **1.4. Archivos con SUID (`setuid`)**

```bash
find / -type f -perm -4000 2>/dev/null
```

🔎 Encuentra archivos que tienen el **bit SUID activo**, lo que significa que se ejecutan con los permisos del dueño (normalmente **root**).

💡 **Si encuentras un binario con SUID en `/usr/bin`, podrías explotarlo para obtener privilegios elevados**.

---

### **1.5. Archivos con GUID (`setgid`)**

```bash
find / -type f -perm -2000 2>/dev/null
```

🔎 Encuentra archivos con el **bit GUID activo**, lo que significa que se ejecutan con los permisos del grupo al que pertenecen.

---

## **📌 2️⃣ Buscar archivos de un usuario específico**

### **2.1. Archivos propiedad de `root` y modificables por cualquier usuario**

```bash
find / -user root -perm -o+w 2>/dev/null
```

🔎 Encuentra archivos **propiedad de root** pero que **cualquier usuario puede modificar**.

💡 **Esto es un gran riesgo de seguridad**: si puedes editar un script de root, podrías modificarlo para ejecutar comandos maliciosos.

---

### **2.2. Archivos dentro de `/etc` que cualquier usuario puede modificar**

```bash
find /etc -perm -o+w 2>/dev/null
```

🔎 Si encuentras archivos en `/etc` con permisos de escritura para otros usuarios, **pueden ser usados para persistencia o escalación de privilegios**.

---

## **📌 3️⃣ Buscar archivos ocultos en el sistema**

```bash
find / -name ".*" 2>/dev/null
```

🔎 Encuentra **archivos ocultos**, que pueden ser usados para esconder backdoors.

---

## **📌 4️⃣ Buscar archivos que contienen contraseñas**

### **4.1. Archivos que contengan la palabra `password`**

```bash
grep -iRl "password" /etc 2>/dev/null
```

🔎 Busca archivos que contengan la palabra "password" en `/etc`.

### **4.2. Buscar en todo el sistema (`/`)**

```bash
grep -iRl "password" / 2>/dev/null
```

💡 **Útil para encontrar credenciales almacenadas en texto plano.**

---

## **📌 5️⃣ Buscar procesos ejecutados por `root`**

```bash
ps aux | grep root
```

🔎 Muestra procesos ejecutándose como `root`.  
💡 **Si encuentras un proceso mal configurado, podrías explotarlo para ganar privilegios.**

---

## **📌 6️⃣ Buscar archivos con credenciales SSH**

```bash
find / -name "id_rsa" 2>/dev/null
```

🔎 Encuentra claves privadas SSH (`id_rsa`), que pueden permitir acceso a otros servidores.

---

Para **generar una contraseña segura y agregarla al archivo `/etc/shadow`**, puedes seguir estos pasos:

## **📌 1️⃣ Generar una contraseña cifrada con `openssl`**


```bash
openssl passwd -6 -salt $(openssl rand -base64 6) "MiSuperPassword123!"
```
