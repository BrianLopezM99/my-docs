[[FFuF🪲]]
### 🔹 **Ejemplos de uso**

🔹 **Buscar directorios ocultos en un sitio web**

```bash
ffuf -u https://target.com/FUZZ -w wordlist.txt
```

🔹 **Buscar archivos con extensiones específicas**

```bash
ffuf -u https://target.com/FUZZ -w wordlist.txt -e .php,.txt,.html
```

🔹 **Enumerar subdominios**

```bash
ffuf -u https://FUZZ.target.com -w subdomains.txt -H "Host: FUZZ.target.com"
```

🔹 **Fuzzing de parámetros en una URL**

```bash
ffuf -u "https://target.com/page.php?id=FUZZ" -w wordlist.txt
```
