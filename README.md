# Programas de filtrado de datos

Desarrollo de programas de filtrado de datos en gawk y java.

## gawk

Es la implementación GNU del lenguaje de programación awk.  
Para realizar ejecutables:

1. Se utiliza el mecanismo **#! /usr/bin/gawk** en la parte superior del archivo con extensión .awk, el path especificado corresponde a la ubicación del binario de gawk. (Puede comprobarse este path utilizando el comando **which gawk.**).
2. Damos los permisos necesarios para ejecutar el programa con el comando **chmod +x [nombre del archivo].awk.**
3. Se ejecuta el programa **./[nombre del archivo].awk. -F\, [archivo de entrada] > [archivo de salida]**
