## <mark style="background: #FFF3A3A6;">Servlets</mark>

#### <mark style="background: #FF5582A6;">@RestController</mark>

En una clase. Indica que es un controllador y van a ir definidas las endpoints

```java
@RestController  
public class UsuarioController
```

#### <mark style="background: #FF5582A6;">@RequestMapping</mark>

En una clase. Indica el Endpoint padre de cualquier metodo de la siguiente clase.
```java
@RequestMapping(value = "test")  
```

En un metodo. Indica que este metodo va a ser un Endpoint concreto. Debe estar en una clase con la entiqueta  @RestController.

*Con la flag value indicamos el endpoint concreto. En el siguiente caso seria .../test/usuarios
```java
@RequestMapping(value = "usuarios")  
public List<Usuario> getUsuarios(){
```

*Si se quiere pasar parametros por argumento, hay que definirlo asi*:
```java
@RequestMapping(value = "usuario/{id}")  
public Usuario getUsuario(@PathVariable Long id){
```

## <mark style="background: #FFF3A3A6;">BBDD</mark>

### Anotaciones propias de un [[DAO]]:

#### <mark style="background: #FF5582A6;">@Repository</mark>

Indica que la clase actual va a funcionar como un bean (@component) de repositorio (guardar, buscar y modificar objetos)

#### <mark style="background: #FF5582A6;">@Transactional</mark>

Indica que es una transacción. Una transacción es una operación en BBDD que cumple con las propiedades [[ACID]].

```java
@Repository  
@Transactional  
public class UsuarioDaoImp implements UsuarioDao{
```

#### <mark style="background: #FF5582A6;">@PersistenceContext</mark>

Es una etiqueta de java JPA, no de Spring en si. Esta etiqueta se usa para indicar a Spring que en este punto debe inyectarse un objeto [[EntityManager]]. Cuando Spring arranca y carga toda la configuración, crea el objeto y lo inyecta en el EntityManager indicado.

```java
@PersistenceContext  
private EntityManager entityManager;
```


### Anotaciones propias de un Model:

Las siguientes etiquetas irian en cada clase que represente una tabla en bbdd (modelos).

#### <mark style="background: #FF5582A6;">@Entity</mark>

Etiqueta de la interfaz JPA. Recordad que JPA no es mas que un estandar sin implementacion, luego hay que escoger una impl. En este caso estamos usando la impl de Spring basada en hibernate, que mejora ciertos aspectos.

Esta etiqueta marca la clase actual como una entidad JPA. Indicando asi que representa un objeto en BBDD. Si no se indica nada mas, **la clase debe tener el mismo nombre** que la tabla a la que representa en BBDD.

```java
@Entity  
public class Usuario {...}
```

#### <mark style="background: #FF5582A6;">Table</mark>

Etiqueta JPA. Personaliza la configuracion de la tabla. Admite varias flags. Por ejemplo, si el nombre de la clase no coincide con la tabla en bbdd, podemos indicar que nombre tiene la tabla con la que se asocia.

```java
@Entity  
@Table(name = "usuarios")  
public class Usuario {...}
```
