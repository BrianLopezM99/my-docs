**FFuF** (también escrito como [[FFuF🪲]]) es una herramienta rápida de fuzzing para encontrar recursos web ocultos, como directorios, archivos, parámetros y subdominios. Es ampliamente utilizada en pruebas de penetración y hacking ético.

### 🔹 **Características principales de FFuF**

✅ **Velocidad y eficiencia**: Usa múltiples hilos para realizar fuzzing rápidamente.  
✅ **Flexibilidad**: Permite realizar ataques de fuerza bruta en URLs, parámetros, cabeceras HTTP y más.  
✅ **Soporte para diccionarios**: Puedes usar listas de palabras para probar directorios, subdominios, etc.  
✅ **Personalización avanzada**: Soporta expresiones regulares, filtros por tamaño de respuesta, códigos de estado HTTP y más.

---

### 🔹 **Instalación de FFuF**

Si usas **Kali Linux** o **Parrot OS**, ya viene preinstalado.  
Si necesitas instalarlo manualmente en Linux o macOS, puedes hacerlo con:

```bash
sudo apt install ffuf  # Debian/Ubuntu
```

O compilando desde su código fuente con **Go**:

```bash
go install github.com/ffuf/ffuf/v2@latest
```

---

