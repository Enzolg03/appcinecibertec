package cibertec.edu.pe.appcinecibertec.Model.response;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ResultadoResponse {
    private boolean respuesta;
    private String mensaje;
}
