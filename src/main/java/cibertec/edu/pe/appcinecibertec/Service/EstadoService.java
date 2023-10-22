package cibertec.edu.pe.appcinecibertec.Service;

import cibertec.edu.pe.appcinecibertec.Model.bd.Estado;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import cibertec.edu.pe.appcinecibertec.repository.EstadoRepository;
import java.util.List;

@Service
@AllArgsConstructor
public class EstadoService {

    private EstadoRepository estadoRepository;

    public List<Estado> listadoEstados(){
        return estadoRepository.findAll();
    }

    public boolean registrarEstado(Estado estado){
        return estadoRepository.save(estado) !=null;
    }

    public void eliminarEstado(Integer idestado){
       estadoRepository.deleteById(idestado);
    }
}

