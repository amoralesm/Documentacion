# GIT

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

**Commiteando las Staged files**
> git commit -m "Mensaje" &emsp;#Commit con un pequeño mensaje
> git commit &emsp; #Commit abriendo el editor por defecto, para poner un mensaje mas grande

**Commitear directamente**
*Te saltas la parte de añadir los archivos el área de Preparación. Los commiteas directamente sin staging.*
>git commig-am "Mensaje"

**Borrando ficheros**
>git rm file.js &emsp;#Lo borra tanto del directorio local como del área de staging
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
