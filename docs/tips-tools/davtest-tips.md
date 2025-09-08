[[davtest💻]]
### 📌 **1. Prueba de subida de archivos automáticamente**

`davtest -url http://target.com/`

✅ **Resultado esperado (ejemplo)**:

`[+] PUT /test.txt OK [-] PUT /shell.php FAILED [+] PUT /test.html OK`

➡️ **Significa que se pueden subir archivos `.txt` y `.html`, pero no `.php`.**

---

### 📌 **2. Intentar subir un archivo específico**

`davtest -url http://target.com/ -upload shell.php`

✅ **Esto intenta subir `shell.php` manualmente para ver si es aceptado.**

---

### 📌 **3. Intentar mover archivos (si el servidor lo permite)**

`davtest -url http://target.com/ -move test.txt`

✅ **Si `MOVE` está permitido, el archivo puede ser renombrado o movido.**

---

### 📌 **4. Autenticación en servidores protegidos**

Si el servidor requiere usuario y contraseña:

`davtest -url http://target.com/ -auth admin:password`

✅ **Esto intentará la prueba de subida usando autenticación HTTP básica.**

---

### 📌 **5. Limpiar archivos después de la prueba**

`davtest -url http://target.com/ -clean`

✅ **Si el servidor lo permite, borra los archivos subidos.**

---

## 🔹 **6. Detección de Vulnerabilidades**

Si el servidor **permite subir archivos ejecutables** (`.php`, `.jsp`, `.aspx`), podrías inyectar una **webshell** y obtener acceso remoto.

![[Pasted image 20250226224459.png]]