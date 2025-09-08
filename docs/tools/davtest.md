### 🔥 **davtest** - Explotación de WebDAV 🔥

`davtest` es una herramienta de pentesting diseñada para probar servidores **WebDAV** y determinar si permiten la subida de archivos maliciosos. WebDAV es una extensión del protocolo HTTP que permite subir, modificar y eliminar archivos en el servidor.

---

## 📌 **1. ¿Cómo funciona `davtest`?**

`davtest` intenta subir archivos con diferentes extensiones (.php, .asp, .jsp, .html, .txt, etc.) para ver cuáles son permitidos y si pueden ejecutarse en el servidor. También prueba la eliminación de archivos (`DELETE`), renombrado (`MOVE`) y creación de directorios (`MKCOL`).

---

## 🔹 **2. Instalación de `davtest`**

En Kali Linux y Parrot OS, `davtest` viene preinstalado. Si necesitas instalarlo, usa:

```
sudo apt install davtest
```

---

## 🔹 **3. Uso Básico**

```
davtest -url http://target.com/
```

✅ **Ejecuta pruebas automáticas para determinar qué tipos de archivos pueden subirse.**

---

## 🔹 **4. Opciones útiles**

|Opción|Descripción|
|---|---|
|`-url <URL>`|Especifica la URL objetivo.|
|`-upload <archivo>`|Prueba la subida de un archivo específico.|
|`-send <metodo>`|Especifica un método HTTP (ej. `PUT`, `DELETE`, `MOVE`).|
|`-move <archivo>`|Prueba la función de mover archivos en el servidor.|
|`-clean`|Borra los archivos subidos después de la prueba.|
|`-auth <usuario:contraseña>`|Usa autenticación básica si es necesaria.|
