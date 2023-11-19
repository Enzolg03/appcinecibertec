$(document).on("click","#btnnuevo", function(){
    //alert("Hola estoy con JQUERY")
    $("#txtdescripcion").val("");
    $("#txtasientos").val("");
    $("#cboestado").empty();
    $("#hddisala").val("0");
    $.ajax({
            type: "GET",
            url: "/administracion/estado/listar",
            dataType: "json",
            success: function(resultado){
                $.each(resultado, function(index, value){
                    $("#cboestado").append(
                    `<option value="${value.idestado}">${value.descestado}</option>`)
                });
            }
        });
    $("#modalsala").modal("show");
});
$(document).on("click",".btnactualizar", function(){
    $("#modalsala").modal("show");

    $("#txtdescripcion").val($(this).attr("data-descsala"));
    $("#txtasientos").val($(this).attr("data-asientos"));
    $("#hddisala").val($(this).attr("data-idsala"));
    $("#cboestado").empty();
    var idestado = $(this).attr("data-idestado");
    $.ajax({
                type: "GET",
                url: "/administracion/estado/listar",
                dataType: "json",
                success: function(resultado){
                    $.each(resultado, function(index, value){
                        $("#cboestado").append(
                        `<option value="${value.idestado}">${value.descestado}</option>`)
                    });
                    $("#cboestado").val(idestado);
                }
            });
    $("#modalsala").modal("show");
 });
 $(document).on("click","#btnguardar", function(){
     $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/administracion/sala/registrar",
        data: JSON.stringify({
            idsala: $("#hddisala").val(),
            descsala: $("#txtdescripcion").val(),
            asientos: $("#txtasientos").val(),
            idestado: $("#cboestado").val()
        }),
        success: function(resultado){
            if(resultado.respuesta){
                listarSalas();
            }
            alert(resultado.mensaje);
            $("#modalsala").modal("hide")
        }
     })
 });

 function listarSalas(){
     $.ajax({
         type: "GET",
         url: "/administracion/sala/listar",
         dataType: "json",
         success: function(resultado){
             //borramos el contenido de la tabla
             $("#tblsala > tbody").html("")
             //con each recorremos cada fila y obtenemos el valor del resultado
             $.each(resultado, function(index, value){
             //reconstruimos la tabla
             $("#tblsala > tbody").append("<tr>" +
             "<td>" + value.idsala + "</td>" +
             "<td>" + value.descsala + "</td>" +
             "<td>" + value.asientos + "</td>" +
             "<td>" + value.estado.descestado + "</td>" +
             "<td>" +
                 "<button type='button' class='btn btn-info btnactualizar'" +
                 " th:data-idsala='"+value.idsala+"'"+
                 " th:data-descsala='"+value.descsala+"'"+
                 " th:data-asientos='"+value.asientos+"'"+
                 " th:data-idestado='"+value.estado.idestado+"'>"+
                 "<i class='bi bi-pencil-square'></i>"+
                 "</button> </td>" +
             "</tr>");
             })
         }
     })
 }