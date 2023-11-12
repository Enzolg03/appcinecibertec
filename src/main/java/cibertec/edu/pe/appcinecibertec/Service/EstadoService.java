package cibertec.edu.pe.appcinecibertec.Service;

import cibertec.edu.pe.appcinecibertec.Model.bd.Estado;
import cibertec.edu.pe.appcinecibertec.Model.response.ResultadoResponse;
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

    public ResultadoResponse registrarEstado(Estado estado){
        Estado nuevoEstado = new Estado();
        if(estado.getIdestado() > 0){
            nuevoEstado.setIdestado(estado.getIdestado());
        }
        nuevoEstado.setDescestado(estado.getDescestado());
        String mensaje = "Estado registrado";
        boolean respuesta = true;
        try{
            estadoRepository.save(nuevoEstado);
        }
        catch (Exception e){
            mensaje = "Estado NO registrado";
            respuesta = false;
        }
        return ResultadoResponse.builder().respuesta(respuesta).mensaje(mensaje).build();
    }

    public ResultadoResponse eliminarEstado(Integer idestado){
        String mensaje = "Estado eliminado";
        boolean respuesta = true;
        try{
            estadoRepository.deleteById(idestado);
        }
        catch (Exception ex){
            mensaje = "Estado NO ELIMINADO";
            respuesta = false;
        }
        return ResultadoResponse.builder().respuesta(respuesta).mensaje(mensaje).build();
    }
}

