package cibertec.edu.pe.appcinecibertec.repository;

import cibertec.edu.pe.appcinecibertec.Model.bd.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {
    //filtra Nomusuario mendiante lo que se escriba
    //select * from tb_usuario where idusuario = '%'
    Usuario findByNomusuario(String nomusuario);
}
