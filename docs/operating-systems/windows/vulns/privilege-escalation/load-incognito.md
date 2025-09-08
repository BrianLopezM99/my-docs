El comando **`load incognito`** en Meterpreter se utiliza para cargar un **plugin de Meterpreter** que permite **suplantar (o robar)** credenciales de Windows almacenadas en el sistema. Este plugin es útil cuando se tiene un **permiso de suplantación de identidad** (como el **`SeImpersonatePrivilege`**) porque facilita el acceso a los **tokens de autenticación** de otros usuarios en la máquina comprometida.

### Función de **`load incognito`** en Meterpreter:

El plugin **`incognito`** en Meterpreter permite a un atacante realizar las siguientes acciones en una máquina comprometida:

1. **Ver tokens de acceso**: Permite listar los tokens de acceso disponibles en el sistema, que corresponden a las credenciales de los usuarios que están autenticados o que se encuentran en sesiones activas.
2. **Suplantar a un usuario (Impersonación)**: Utilizando los **tokens de otros usuarios**, un atacante puede suplantar a otro usuario y ejecutar comandos y acciones en su nombre, obteniendo acceso a los recursos a los que ese usuario tiene acceso.

### Cómo funciona el plugin **Incognito**:

Cuando ejecutas **`load incognito`**, se activa el plugin y permite realizar varias operaciones relacionadas con la **suplantación de identidad** en el sistema. Algunas de las acciones más comunes que se pueden realizar una vez cargado el plugin son:

1. **Listar tokens**: Puedes ver los tokens de acceso de otros usuarios, lo que te permite identificar qué usuarios están autenticados y qué privilegios tienen.
    
    Comando:
    
    ```shell
    incognito_list_tokens
    ```
    
    Este comando muestra todos los tokens de usuario en el sistema que se pueden suplantar.
    
2. **Suplantar un token**: Puedes suplantar el token de otro usuario (por ejemplo, un usuario con privilegios elevados como un administrador) para ejecutar comandos en su nombre.
    
    Comando:
    
    ```shell
    incognito_impersonate_token <token>
    ```
    
    Aquí, **`<token>`** es el ID del token que quieres suplantar. Este token se obtiene de la lista de tokens que puedes ver con el comando **`incognito_list_tokens`**.
    
3. **Obtener credenciales almacenadas**: También puedes intentar recuperar credenciales de otros usuarios que están almacenadas en el sistema, como contraseñas en caché o credenciales de red. Esto puede ser útil para obtener acceso a otros recursos o máquinas en la red.
    

### Requisitos para usar **`load incognito`**:

Para ejecutar el comando **`load incognito`** con éxito, necesitas tener ciertos permisos en el sistema. En particular, se necesita el privilegio de **suplantación de identidad** (**`SeImpersonatePrivilege`**), ya que se está actuando en nombre de otro usuario.

- **`SeImpersonatePrivilege`** es el privilegio necesario para poder suplantar a otro usuario después de la autenticación.
- Si tienes **`SeImpersonatePrivilege`**, puedes usar el comando **`incognito`** para interactuar con los tokens de otros usuarios y realizar **suplantación de identidad**.

### Ejemplo de flujo con **`load incognito`**:

1. Cargar el plugin **`incognito`**:
    
    ```shell
    load incognito
    ```
    
2. Listar los tokens disponibles (usuarios autenticados):
    
    ```shell
    list_tokens -u
    ```
    
3. Suplantar a un usuario (por ejemplo, un administrador):
    
    ```shell
    impersonate_token USER\\Administrator
    ```
    
4. Ahora, cualquier comando que ejecutes será ejecutado con los privilegios del usuario cuyo token has suplantado.

### Riesgos y uso en ataques:

El uso del plugin **`incognito`** es muy útil en ataques de **escalada de privilegios** y **movimiento lateral** dentro de redes comprometidas. Permite a un atacante tomar el control de cuentas de usuario con más privilegios sin necesidad de conocer sus contraseñas. En escenarios de **pivoting** o **post-explotación**, esto puede ser esencial para obtener acceso a más recursos en la red, especialmente si el atacante está buscando alcanzar un nivel de privilegio más alto (por ejemplo, obtener acceso como administrador o SYSTEM).

### Resumen:

El comando **`load incognito`** en Meterpreter permite cargar el plugin **Incognito**, que facilita la **suplantación de identidad** en sistemas Windows. Este plugin te permite **robar tokens de usuario** y ejecutar acciones como si fueras ese usuario, lo que es especialmente útil para **escalar privilegios** o **moverse lateralmente** en una red comprometida. Para utilizar este plugin, debes tener permisos de suplantación de identidad (como **`SeImpersonatePrivilege`**), lo cual es necesario para manipular tokens de otros usuarios.