[[xfreerdp🪟]] es una implementación de código abierto del protocolo [[RDP (Remote Desktop Protocol)]], que permite a los usuarios conectarse de forma remota a máquinas Windows o servidores que soporten este protocolo. Es parte del proyecto **FreeRDP**, que ofrece una alternativa libre y gratuita a las herramientas de escritorio remoto propietarias, como el cliente de Escritorio Remoto de Microsoft.

### Características principales de xfreerdp:
1. **Multiplataforma**: Funciona en sistemas operativos como Linux, macOS y Windows.
2. **Soporte para RDP avanzado**: Incluye características como soporte para gráficos avanzados, redirección de dispositivos (impresoras, discos, etc.), y sonido.
3. **Flexibilidad**: Permite personalizar la conexión con múltiples opciones de línea de comandos.
4. **Seguridad**: Soporta cifrado y autenticación avanzada, como NLA (Network Level Authentication).

### Uso básico:
Para conectarse a un servidor remoto usando xfreerdp, puedes usar un comando como este:

```bash
xfreerdp /v:<dirección_ip> /u:<usuario> /p:<contraseña>
```

- `/v:` especifica la dirección IP o el nombre del servidor.
- `/u:` define el nombre de usuario.
- `/p:` indica la contraseña.

### Ejemplo:
```bash
xfreerdp /v:192.168.1.100 /u:Administrador /p:micontraseña
```

### Opciones adicionales:
- `/size:` para definir la resolución de la pantalla (ejemplo: `/size:1280x1024`).
- `/sound:` para habilitar el sonido.
- `/clipboard:` para habilitar el uso compartido del portapapeles.

xfreerdp es una herramienta potente y versátil para administrar conexiones remotas en entornos profesionales o personales.