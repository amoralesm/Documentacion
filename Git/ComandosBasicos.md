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

**Descartando cambios del índice revertir 'Git add'**
*Copia los archivos del repositorio al índice*
>git restore --staged file.js

**Descartando cambios locales**
*Copia los archivos del índice a local*
>git restore file.js
>git restore file.js file1.js
>git restore . &emsp;#Descarta todos los cambios locales, menos los archivos no trackeados
>git clean -fd &emsp;#Borra todos los archivos no trackeados

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
De esta manera puedes borrarlos del indice (por ejemplo) y dejar de trackearlos.
>git rm file.js &emsp;#Lo borra de local y del índice
>git rm --cached file1.js &emsp;#Lo borra solo del área de staging

**Movimiendo o renombrando ficheros**
>git mv file1.js file2.js &emsp;#Renombra el fichero
>git mv file1.js carpeta2/file2.js &emsp;#Renombra y mueve el fichero
>git mv file1.js carpeta2/file1.js &emsp;#Mueve el fichero

**Viendo diferencias entre ficheros**
*Diferencias entre los ficheros locales y el repositorio*
>git diff &emsp;#Diferencias entre local y índice
>git diff --staged &emsp;# Diferencias entre índice y el repo

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

**Restaurando versiones anteriores**
> git restore --source=HEAD~2 file.js


## Manejando el Historial
**Ver el historial**
Todos estos comandos pueden aplicarse también a un commit concreto poniendo su id.
> git log --stat &emsp;#Muestra las estadísticas o número de modificaciones
> git log --patch &emsp;#Muestra todos los cambios concretos realizados
>git log -p &emsp;#Lo mismo que el anterior
>git shortlog &emsp;#Versión reducida agrupada por QUIEN realizó el commit
>git log --oneline &emsp;#Versión reducida

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
>git show HEAD~2 &emsp;#Ver el penúltimo commit
>git show HEAD~2:file.txt &emsp;#Ver la versión de file.txt en el penúltimo commit

**Comparando commits**
>git diff HEAD~2 HEAD &emsp;#Entre HEAD y el penúltimo commit
>git diff HEAD~2 HEAD file.txt &emsp;#Entre HEAD y el penúltimo commit con las versiones de file.txt

**Checking out a commit**
El comando checkout permite cambiar entre ramas. En el caso de los commits, permite moverte a un commit y crear una rama a partir de ese commit.
>git checkout dad47ed &emsp;#Permite moverte a una rama de ese commit
>git checkout master &emsp;#Permite moverte a la rama de master
>git checkout -b testing &emsp;#Permite moverte a la rama de testing y la crea (-b) si no existe

**Encontrando un mal commit**
A veces sucede que aparece un bug, y no sabemos en que momento o commit este bug empezó a suceder. Git nos permite recorrer el árbol de commits mediante un algoritmo (divide y vencerás) para encontrar en que commit se produjo el mal código.
>git bisect start &emsp;#Comienza un bisect. Operación que nos permitirá buscar el commit problemático.
>git bisect bad &emsp;#Marca el commit actual como malo. Si acabamos de darnos cuenta de que esta sucediendo un bug, supongo que es un bug que esta ocurriendo en la versión actual del código.
>git bisect good ca49180 &emsp;#Indicamos a git en que commit funcionaba todo correctamente

Git aplicará el algoritmo, cambiándonos las versiones locales a los commits entre el commit malo y el bueno. En cada versión, deberemos hacer las pruebas pertinentes para ver si hay bug. Indicaremos a git si esta versión es buena o mala con git bisect good/bad. Una vez terminadas las revisiones que nos indica git, localizará el commit con el codigo erróneo.
>git bisect skip/reset &emsp;#Nos permite saltarnos esta versión y pasar a la siguiente
>git bisect run &emsp;#Nos permite empezar el bisect de nuevo
>git bisect log &emsp;#Para ver un log de los commits que has marcado como buenos/malos hasta ese momento
>git bisect reset &emsp;#Salir del bisect

**Ver el autor de cada línea en un fichero**
>git blame file1.txt

**Tagging**
En git puedes poner tags a determinados commits para etiquetarlos y volverlos ***inmutables***. Normalmente se usan para etiquetar versiones estables.
>git tag &emsp;#Lista todos los tags
>git tag v1.0 &emsp;#Etiqueta el ultimo commit como V1.0
>git tag v1.0 5e7892s &emsp;#Etiqueta un commit concreto
>git tag -d v1.0

En este punto podemos movernos al tag y hacer checkout como si se tratase de una rama
>git checkout v1.0

No podríamos editar esta rama, por que es inmutable, pero siempre podríamos movernos a otra y guardar ahí los cambios de la v1.0 que hagamos.

## Ramas & Merges