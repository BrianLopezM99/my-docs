
### Comando:

`net localgroup`

### Qué hace este comando:

- Muestra todos los grupos locales en el sistema, como **Administradores**, **Usuarios**, **Invitados**, **Operadores de copias de seguridad**, etc.

### Para ver los detalles de los miembros de un grupo específico:

Si deseas ver los miembros de un grupo específico (por ejemplo, el grupo **Administradores**), puedes usar el siguiente comando:

`net localgroup Administradores`

### Ejemplo de uso:

Si ejecutas este comando en una ventana de CMD, te dará una lista de todos los miembros que pertenecen al grupo **Administradores** del sistema:

```
C:\> net localgroup Administradores El comando se completó correctamente.  Grupo de usuarios local Administradores
-----------------------------------------     Administrador     Usuario1     Usuario2     ...
```

### Notas adicionales:

- Los comandos **`net localgroup`** solo muestran grupos locales en el equipo actual, **no** los grupos de dominio si el equipo está unido a un dominio.
- Para ver los grupos de dominio (si el equipo está conectado a un dominio), usarías una herramienta como **`net group`** o **`dsquery`**.


Para ver a qué **grupos locales** pertenece tu cuenta de usuario en **Windows** usando **CMD (Command Prompt)**, puedes usar el siguiente comando:

### Comando:

```
net user <tu_nombre_de_usuario>
```

### Ejemplo:

Si tu nombre de usuario es **"Juan"**, el comando sería:

```
net user Juan
```

### Qué hace este comando:

- Muestra información sobre tu cuenta de usuario, incluidos los **grupos** a los que perteneces.
- En la salida, podrás ver algo como esto:

```
C:\> net user Juan
Nombre de usuario                    Juan
Full Name                            Juan Perez
Comentario                           Cuenta de usuario
...

Miembro de los grupos siguientes:
    * Administradores
    * Usuarios
    * ...
```

### Explicación:

- Bajo la sección **"Miembro de los grupos siguientes"**, verás una lista de los grupos locales a los que pertenece tu cuenta de usuario.
- En el ejemplo anterior, **Juan** sería miembro de los grupos **Administradores** y **Usuarios**.

### Notas:

- Este comando solo muestra los **grupos locales** a los que pertenece tu cuenta en ese equipo específico.
- Si estás en un entorno de dominio, también podrías ser miembro de **grupos de dominio**, pero este comando solo muestra los grupos locales. Para ver los grupos de dominio, necesitarías usar herramientas adicionales, como **`dsget`** o **`net group`** (si estás en un dominio).
