package cibertec.edu.pe.appcinecibertec.Service;

import cibertec.edu.pe.appcinecibertec.Model.bd.Estado;
import cibertec.edu.pe.appcinecibertec.Model.bd.Sala;
import cibertec.edu.pe.appcinecibertec.Model.dto.request.SalaDto;
import cibertec.edu.pe.appcinecibertec.Model.response.ResultadoResponse;
import cibertec.edu.pe.appcinecibertec.repository.SalaRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@AllArgsConstructor
@Service
public class SalaService {
    private SalaRepository salaRepository;

    public List<Sala> listarSalas(){
        return salaRepository.findAll();
    }
    public ResultadoResponse guardarActualizarSala(SalaDto salaDto){
        String mensaje = "Sala registrada correctamente";
        boolean respuesta = true;
        try{
            Sala nuevaSala = new Sala();
            if(salaDto.getIdsala() > 0){
                nuevaSala.setIdsala(salaDto.getIdsala());
            }
            nuevaSala.setDescsala(salaDto.getDescsala());
            nuevaSala.setAsientos(salaDto.getAsientos());
            Estado estado = new Estado();
            estado.setIdestado(salaDto.getIdestado());
            nuevaSala.setEstado(estado);
            salaRepository.save(nuevaSala);
        }catch (Exception ex){
            mensaje = "Sala NO registrada";
            respuesta = false;
        }
        return ResultadoResponse.builder().respuesta(respuesta).mensaje(mensaje).build();
    }
}
