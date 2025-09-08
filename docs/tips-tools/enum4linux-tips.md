## 📌 **Uso Básico**

El [[enum4linux🐧]] el comando básico para enumerar información de un host es:

`enum4linux <IP_DEL_OBJETIVO>`

Ejemplo:

`enum4linux 192.168.1.10`

## 📌 **Opciones Principales**

Puedes ejecutar `enum4linux -h` para ver todas las opciones disponibles. Algunas de las más usadas son:

|Opción|Descripción|
|---|---|
|`-U`|Enumera usuarios.|
|`-G`|Enumera grupos.|
|`-S`|Enumera recursos compartidos (shares).|
|`-P`|Enumera políticas de contraseñas.|
|`-a`|Ejecuta todas las opciones anteriores automáticamente.|

Ejemplo para obtener solo los usuarios:

`enum4linux -U 192.168.1.10`

Ejemplo para obtener información completa:

`enum4linux -a 192.168.1.10`

## 📌 **Autenticación con Credenciales**

Si tienes credenciales de usuario, puedes usarlas con:

`enum4linux -u usuario -p contraseña <IP_DEL_OBJETIVO>`

O con hash NTLM en lugar de la contraseña:

`enum4linux -u usuario -H 'LM:NT' <IP_DEL_OBJETIVO>`

## 📌 **Alternativas Modernas**

Dado que `enum4linux` ya no se actualiza, algunas alternativas más modernas incluyen:

- `smbmap`
- `smbclient`
- `crackmapexec smb`

Ejemplo con `smbmap`:

`smbmap -H 192.168.1.10 -u usuario -p contraseña`