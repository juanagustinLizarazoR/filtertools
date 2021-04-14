# Programas de filtrado de datos

Desarrollo de programas de filtrado de datos en gawk y java.

## gawk

Es la implementación GNU del lenguaje de programación awk.  
Para realizar ejecutables:

1. Se utiliza el mecanismo **#! /usr/bin/gawk** en la parte superior del archivo con extensión .awk, el path especificado corresponde a la ubicación del binario de gawk. (Puede comprobarse este path utilizando el comando **which gawk.**).
2. Damos los permisos necesarios para ejecutar el programa con el comando **chmod +x [nombre del archivo].awk.**
3. Se ejecuta el programa **./[nombre del archivo].awk. -F\, [archivo de entrada] > [archivo de salida]**

### Uso de keywords

1. @include: Puede ser usada para leer archivos fuente awk externos, lo que permite dividir archivos largos en uno más corto y la reutilización de scripts comunes.Si definimos la variable de entorno AWKPATH incluyendo la dirección del directorio actual, la dirección donde se encuentran los programas awk por defecto y el directorio donde se encuentran nuestros programas. Podremos usar esta palabra clave @include "file" solo con el nombre del archivo y no su dirección relativa o absoluta. (En nuestro archivo de shell resource .bashrc o zshrc): export AWKPATH=".:/usr/share/awk:/home/user/path/to/source/files"  
   **Ejemplo de su uso:** @include "filter"   #_Se importa el script awk con el nombre filter_
