# GIT

## Creando Snapshots
**Inicializando Repositorios**
>git init

**Staging Files**
*Staging es preparar. Se puede entender esto como un "area de preparado o preparación"*
>git add file1.js
>git add file1.js file2.js
>git add *.js
>git add .

**Ver el estado actual**
>git status &emsp;#Full status
>git status -s &emsp;#Short status

**Cambiar el editor por defecto de Git**
 >git config --global core.editor "'C:\Program Files (x86)\Notepad++\notepad++.exe' -multiInst -notabbar -nosession -noPlugin" &emsp;#En este caso se ha cambiado por Notepad++

**Commiteando las Staged files**
> git commit -m "Mensaje" &emsp;#Commit con un pequeño mensaje
> git commit &emsp; #Commit abriendo el editor por defecto, para poner un mensaje mas grande

**Commitear directamente**
*Te saltas la parte de añadir los archivos el área de Preparación. Los commiteas directamente sin staging. Comitea todos los archivos que detecte con cambios y que estuvieran trackeados de antemano.*
>git commit -am "Mensaje"

**Subir los commits al repositorio**
>git push

**Borrando ficheros**
>git rm file.js &emsp;#Lo borra tanto del directorio local (solo si no está en el área de staging)
>git rm --cached file1.js &emsp;#Lo borra solo del área de staging

**Movimiendo o renombrando ficheros**
>git mv file1.js file2.js &emsp;#Renombra el fichero
>git mv file1.js carpeta2/file2.js &emsp;#Renombra y mueve el fichero
>git mv file1.js carpeta2/file1.js &emsp;#Mueve el fichero

**Viendo diferencias entre ficheros**
*Diferencias entre los ficheros locales y el repositorio*
>git diff &emsp;#Archivos trackeados. Staged o no staged.
>git diff --staged &emsp;# Solo de los archivos Staged.

**Ver Historial**
>git log &emsp;#Completo
>git log --oneline &emsp;#Resumido
>git log --reverse &emsp;#Del más viejo al mas nuevo

**Ver un commit concreto**
*Muestran toda la información de un commit*
>git show 921a2ff &emsp;#Commit concreto especificado
>git show HEAD &emsp;#Ultimo commit realizado
>git show HEAD~2 &emsp;#Commit dos anteriores al último
>git show HEAD:file1.js &emsp;#Versión de file1.js que hay en el ultimo commit

**Descartando cambios del índice revertir 'Git add'**
*Copia los archivos del repositorio al índice*
>git restore --staged file.js

**Descartando cambios locales**
*Copia los archivos del índice a local*
>git restore file.js
>git restore file.js file1.js
>git restore . &emsp;#Descarta todos los cambios locales, menos los archivos no trackeados
>git clean -fd &emsp;#Borra todos los archivos no trackeados

**Restaurando versiones anteriores**
> git restore --source=HEAD~2 file.js


## Manejando el Historial
**Ver el historial**
> git log --stat &emsp;#Muestra la lista de las modificaciones (resumida)
> git log --path &emsp;#Muestra todos los cambios concretos realizados

**Filtrar historial**
>git log -3  &emsp;#3 últimas entradas
>git log --author="Mosh"  &emsp;#Por autor
>git log --before="2020-08-17"  &emsp;#Por fecha
>git log --after="one week ago"  &emsp;#Por fecha
>git log --grep="GUI"  &emsp;#Commits que contengan la palabra 'GUI' en su mensaje
>git log --S"GUI" &emsp;#Commits que contengan la palabra 'GUI' en su cambios
>git log hash1..hash2 &emsp;#Muestra un rango de commits (no se como funciona)
>git log file.txt &emsp;#Muestra todos los commits que han tocado file.txt


**Formateando el output del log**
*Muestra los mismos logs, pero podemos decirle como queremos que nos lo muestre en esta ocasión. Solo sirve para este comando, no cambia la propia configuración de GIT.*
> git log --pretty=format:"%an committed %H" &emsp;#Muestra todos los commits con el formato 'NOMBRE an committed COMMIT_ID'

**Creando alias**
Un alias es un acrónimo de otro comando. De esta forma puedes definir un alias corto y escribirlo en vez de un comando mucho mas complejo.
>git config --global alias.lg "log --oneline" &emsp;#Tras esto, puedes escribir 'git lg' y ejecutara el mismo comando que 'git log --oneline'. Esto resulta tremendamente útil para ir escribiendo alias de los comandos que mas utilicemos


**Viendo un commit**