[[Dirb]] es una herramienta de **fuzzing** de directorios y archivos en aplicaciones web, similar a **DirBuster**, pero con una interfaz de línea de comandos más simple. Al igual que **DirBuster**, **`dirb`** se usa para realizar un ataque de **fuzzing** y descubrir recursos ocultos, como directorios o archivos que no están fácilmente accesibles desde el sitio web.

### Características de **`dirb`**:

- **Fuzzing de directorios y archivos**: Similar a **DirBuster**, **`dirb`** prueba rutas de directorios y archivos en el servidor web mediante un diccionario de palabras.
- **Interfaz de línea de comandos**: **`dirb`** es más sencillo en comparación con **DirBuster** porque no tiene interfaz gráfica, pero es igualmente efectivo para la búsqueda de directorios y archivos.
- **Soporte para autenticación básica**: Al igual que **`dirbuster`**, **`dirb`** permite usar autenticación básica HTTP para acceder a sitios protegidos.
- **Configuración mínima**: Es más fácil de usar para aquellos que prefieren una herramienta basada en la terminal, sin muchas configuraciones adicionales.

### Ejemplos de uso de **`dirb`**:

#### 1. **Fuzzing de directorios y archivos básicos**:

Este es el caso más común, donde simplemente proporcionas la URL y un archivo de diccionario para comenzar el fuzzing. Aquí hay un ejemplo:

```bash
dirb http://target.com /ruta/a/diccionario/wordlist.txt
```

- **`http://target.com`**: La URL del servidor donde deseas hacer fuzzing.
- **`/ruta/a/diccionario/wordlist.txt`**: La ruta al archivo diccionario que contiene las palabras (rutas de directorios o archivos) que se utilizarán para las pruebas.

#### 2. **Fuzzing con autenticación básica**:

Si el sitio web requiere autenticación básica (nombre de usuario y contraseña), puedes usar **`dirb`** con el parámetro **`-u`** para especificar las credenciales de la siguiente manera:

```bash
dirb http://target.com /ruta/a/diccionario/wordlist.txt -u bob:password_123321
```

- **`-u bob:password_123321`**: Especifica las credenciales para la autenticación básica HTTP en formato `usuario:contraseña`.

#### 3. **Fuzzing sin mostrar respuestas 404 (para evitar ruido)**:

Si prefieres no ver las respuestas 404 (que indican que un directorio o archivo no existe), puedes usar el parámetro **`-s`** para filtrar esas respuestas:

```bash
dirb http://target.com /ruta/a/diccionario/wordlist.txt -s 404
```

- **`-s 404`**: Muestra solo las respuestas que no son un error 404, es decir, aquellas que podrían ser directorios o archivos válidos.

#### 4. **Fuzzing con un proxy**:

Si deseas pasar el tráfico a través de un proxy (como **Burp Suite**), puedes usar el parámetro **`-p`** para especificar la dirección del proxy:

```bash
dirb http://target.com /ruta/a/diccionario/wordlist.txt -p http://127.0.0.1:8080
```

- **`-p http://127.0.0.1:8080`**: Especifica que todo el tráfico pase a través de un proxy en la dirección **127.0.0.1:8080** (asegúrate de que el proxy esté configurado y ejecutándose en ese puerto).

#### 5. **Fuzzing recursivo**:

**`dirb`** también permite realizar fuzzing recursivo, lo que significa que si encuentra un directorio válido, seguirá buscando dentro de él para descubrir otros directorios o archivos:

```bash
dirb http://target.com /ruta/a/diccionario/wordlist.txt -r
```

- **`-r`**: Activa la opción de búsqueda recursiva. Si se encuentra un directorio válido, **`dirb`** intentará buscar dentro de él también.

#### 6. **Fuzzing con un archivo de salida (para guardar los resultados)**:

Puedes guardar los resultados del fuzzing en un archivo de texto para analizarlos más tarde. Aquí tienes un ejemplo:

```bash
dirb http://target.com /ruta/a/diccionario/wordlist.txt -o resultados.txt
```

- **`-o resultados.txt`**: Guarda la salida del fuzzing en el archivo `resultados.txt`.

### Otras opciones útiles:

- **`-t <número>`**: Establece el número de hilos (threads) para el fuzzing. Un valor mayor puede acelerar el proceso, pero depende de la capacidad del servidor y la red.
- **`-X <extensiones>`**: Permite añadir extensiones a las rutas durante el fuzzing. Por ejemplo, si quieres buscar directorios que terminen en `.php`, `.html`, etc., puedes hacer algo como esto:

```bash
dirb http://target.com /ruta/a/diccionario/wordlist.txt -X .php,.html
```

- **`-S`**: Desactiva el uso de HTTPS (por defecto, **`dirb`** intentará usar HTTPS si el sitio lo soporta).