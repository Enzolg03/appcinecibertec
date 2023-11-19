package cibertec.edu.pe.appcinecibertec.repository;

import cibertec.edu.pe.appcinecibertec.Model.bd.Rol;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RolRepository extends JpaRepository<Rol, Integer> {
    //filtra Nomrol mendiante lo que se escriba
    //select * from tb_rol where idrol = '%'
    Rol findByNomrol (String nomrol);
}
