[[Server Message Block (SMB)]] es un **[[protocolos de red]]** que permite compartir archivos, impresoras y otros recursos entre dispositivos dentro de una red, especialmente en sistemas [[Windows]].

## 📌 **Características de SMB**

✅ **Protocolo cliente-servidor**: Un cliente solicita acceso a un recurso y un servidor lo proporciona.  
✅ **Autenticación y permisos**: Permite controlar el acceso a archivos y carpetas.  
✅ **Transparencia de red**: Permite que los recursos compartidos se usen como si estuvieran en el equipo local.  
✅ **Compatibilidad con Windows, Linux y macOS**: Puede implementarse en Linux y macOS con **Samba**.

---

## 🔎 **Versiones de SMB**

|Versión|Año|Características|
|---|---|---|
|**SMBv1**|1984|Obsoleto, inseguro (usado en ataques como WannaCry).|
|**SMBv2**|2006|Mejor rendimiento, menos uso de ancho de banda.|
|**SMBv3**|2012|Cifrado de extremo a extremo, más seguridad.|

**❌ SMBv1 está desactualizado y debe desactivarse para evitar vulnerabilidades.**

---

## ⚠️ **Vulnerabilidades y ataques comunes**

- **EternalBlue (MS17-010)** → Explotado por el ransomware **WannaCry**.
- **Relay Attack** → Robo de credenciales mediante ataques de intermediario (MITM).
- **Null Sessions** → Accesos anónimos mal configurados pueden filtrar información sensible.