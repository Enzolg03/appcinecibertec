package cibertec.edu.pe.appcinecibertec.Controller.administracion;

import cibertec.edu.pe.appcinecibertec.Model.bd.Sala;
import cibertec.edu.pe.appcinecibertec.Model.dto.request.SalaDto;
import cibertec.edu.pe.appcinecibertec.Model.response.ResultadoResponse;
import cibertec.edu.pe.appcinecibertec.Service.SalaService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@AllArgsConstructor
@Controller
@RequestMapping("/administracion/sala")
public class SalaController {
    private SalaService salaService;

    @GetMapping("/frmSala")
    public String frmMantSala(Model model){
        model.addAttribute("listasalas", salaService.listarSalas());
        return "administracion/frmSala";
    }
    @PostMapping("/registrar")
    @ResponseBody
    public ResultadoResponse registrarSala(
            @RequestBody SalaDto salaDto
    ){
        return salaService.guardarActualizarSala(salaDto);
    }
    @GetMapping("/listar")
    @ResponseBody
    public List<Sala> listarSala(){
        return salaService.listarSalas();
    }
}
