[[Tools ⛏️/SMTP-User-Enum 📨|SMTP-User-Enum 📨]]
#### **Uso:**

`./smtp-user-enum -M VRFY -U usuarios.txt -t servidor.com`

También puedes probar con `EXPN` o `RCPT TO`:

`./smtp-user-enum -M RCPT -U usuarios.txt -t servidor.com`

### **Diccionarios útiles**

`/usr/share/commix/src/txt/usernames.txt`
`/usr/share/metasploit-framework/data/wordlists/unix_users.txt`


### **Conectarse a SMTP para enviar correo falso a usuario root**

```
telnet demo.ine.local 25
HELO attacker.xyz
mail from: admin@attacker.xyz
rcpt to:root@openmailbox.xyz
data
Subject: Hi Root
Hello,
This is a fake mail sent using telnet command.
From,
Admin
.
```

el punto (.) indica el final de la data a enviar

### **Usando sendemail**

```
sendemail -f admin@attacker.xyz -t root@openmailbox.xyz -s demo.ine.local -u Fakemail -m "Hi root, a fake from admin" -o tls=no
```

