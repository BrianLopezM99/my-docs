### Ejemplo de uso:

Para ejecutar un comando remoto a través de [[Windows Remote Management (WinRM)]] , usando **PowerShell**, se puede usar el siguiente comando:

```powershell
Enter-PSSession -ComputerName <nombre_o_ip_del_computador> -Credential (Get-Credential)
```

Este comando permite entrar en una sesión remota en el sistema especificado, y podrás ejecutar comandos como si estuvieras en la máquina local.

Para ejecutar un comando específico en lugar de entrar en una sesión interactiva, puedes usar el siguiente comando:

```powershell
Invoke-Command -ComputerName <nombre_o_ip_del_computador> -ScriptBlock { <comando_a_ejecutar> }
```

### Comandos de configuración de WinRM:

1. **Ver el estado del servicio WinRM**: Para verificar si WinRM está habilitado y en ejecución en el equipo remoto:
    
    ```powershell
    winrm get winrm/config
    ```
    
2. **Configurar un servidor remoto**: Si necesitas configurar WinRM para que acepte conexiones remotas en una máquina específica:
    
    ```powershell
    Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*" -Force
    ```
    
3. **Habilitar la autenticación remota mediante HTTPS**: Para mejorar la seguridad, es posible habilitar WinRM sobre HTTPS. Esto requiere la configuración de un certificado SSL en el servidor de destino:
    
    ```powershell
    winrm quickconfig -transport:https
    ```
    

