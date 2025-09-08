**[[HTTRack]]** es una herramienta de código abierto que permite **copiar** o **descargar** sitios web completos a tu computadora para navegar sin conexión. Es un **clonador de sitios web** que descarga todos los archivos y recursos (HTML, imágenes, scripts, hojas de estilo, etc.) de un sitio web para permitirte verlo localmente como si estuvieras en línea.

HTTrack es ampliamente utilizado en pruebas de seguridad y análisis de sitios web, ya que puede ayudarte a obtener una **copia local** de un sitio web para realizar un **análisis offline** o **auditorías de seguridad**. También es útil para **archivar** sitios web o hacer **copias de seguridad** de contenido web.

### Características principales de HTTrack:

1. **Descargar sitios completos:** HTTrack descarga todos los archivos necesarios para que puedas navegar por un sitio web sin conexión. Esto incluye imágenes, archivos CSS, JavaScript, etc.
    
2. **Seguimiento de enlaces:** La herramienta sigue todos los enlaces internos y externos, y descarga el contenido relacionado. Se asegura de que la estructura del sitio web se mantenga.
    
3. **Configuración flexible:** Puedes personalizar qué partes del sitio descargar, cómo manejar los enlaces o excluir contenido específico (por ejemplo, imágenes o archivos grandes).
    
4. **Modo multihilo:** HTTrack permite descargar el sitio web usando múltiples conexiones simultáneas, lo que acelera el proceso.
    
5. **Soporte para reanudación:** Si la descarga se interrumpe, HTTrack puede reanudar la descarga desde donde se quedó.
    
6. **Configuración de restricciones de acceso:** Permite configurar proxies, credenciales de autenticación, y limitar la velocidad de descarga, lo que puede ser útil para pruebas de penetración o auditorías.

---
Ejecutar HTTrack desde terminal

`httrack http://www.ejemplo.com -O /ruta/a/la/carpeta/donde/guardar`
