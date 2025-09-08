
## Enumeracion de usuarios en [[SMTP (Simple Mail Transfer Protocol)]]

- `scanner/smtp/smtp_enum`

## Verificar si un correo es valido

`nc 192.168.1.1 25`
`VRFY user@domain.com`

Si obtenemos de respuesta algo como lo siguiente es que el usuario existe:

`252 2.0.0 user@domain.com`
