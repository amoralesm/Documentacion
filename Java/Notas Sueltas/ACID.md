Modelo ACID en BBDD son un conjunto de normas que tienen como objetivo garantizar la seguridad de las transacciones.
ACID es el acronimo para los conceptos de:
- Atomicidad
- Consistencia
- Aislamiento
- Durabilidad

**Atomicidad**: Para que una transacción se de por completada, deben realizarse correctamente todas sus partes, o ninguna (rollback).

**Consistencia**: Una transacción debe llevar el sistema de un estado válido a otro que también lo sea. Se deben respetar constraints, cascades, triggers etc de la bbdd.

**Aislamiento**: La realización de una operación en bbdd no deberia afectar a otras operaciones en bbdd simultaneas a ella. Debe haber aislamiento total.

**Durabilidad**: Capacidad de persistencia de los cambios incluso si el sistema falla. Algo que ya se ha realizado, debe ser permanente.