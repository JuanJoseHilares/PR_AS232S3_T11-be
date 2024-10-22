package service.spec;

import java.util.List;

public interface CrudServiceSpec<T> {

    // Crea un nuevo registro
    void create(T bean);

    // Reactiva un registro inactivo
    void reactivate(int id);

    // Actualiza los datos de un registro existente
    void update(T bean);

    // Realiza una eliminación lógica de un registro
    void softDelete(int id);

    // Consulta todos los registros de la tabla
    List<T> getAll();

    // Retorna un registro basado en el id
    T getById(int id);

    // Consulta datos en base a un criterio
    List<T> getFilters(T bean);
}
