### **[[Crackmapexec (CME)]]**

`crackmapexec` (CME) es una herramienta de post-explotación y pentesting enfocada en redes Windows y Active Directory. Su principal función es **automatizar la interacción con protocolos como SMB, WinRM, LDAP y MSSQL**, permitiendo probar credenciales, ejecutar comandos y moverse lateralmente en una red.

---

## **🔹 Características principales de CME**

✅ **Autenticación en masa:** Puedes probar credenciales en múltiples hosts simultáneamente.  
✅ **Soporte para SMB, WinRM, LDAP, MSSQL y RDP:** Facilita la explotación de redes Windows.  
✅ **Enumeración de usuarios y recursos compartidos:** Permite listar usuarios, grupos y shares SMB.  
✅ **Ejecución remota de comandos:** Puedes ejecutar comandos en sistemas remotos sin necesidad de acceso físico.  
✅ **Movilidad lateral:** Si logras credenciales válidas, puedes expandir tu acceso en la red.

---

## **🔹 Instalación de CrackMapExec**

Si usas **Kali Linux** o **Parrot OS**, CME ya viene instalado. Si no, puedes instalarlo manualmente con:

`pip install crackmapexec`

O desde su repositorio oficial:

`git clone https://github.com/Porchetta-Industries/CrackMapExec cd CrackMapExec pip3 install -r requirements.txt python3 setup.py install`
