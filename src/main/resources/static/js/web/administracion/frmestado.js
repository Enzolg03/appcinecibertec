$(document).on("click","#btnnuevo", function(){
    //alert("Hola estoy con JQUERY")
    $("#txtdescripcion").val("");
    $("#hddidestado").val("0");
    $("#modalestado").modal("show");
});
$(document).on("click",".btnactualizar", function(){
    $("#modalestado").modal("show");
    $("#txtdescripcion").val($(this).attr("data-descestado"));
    $("#hddidestado").val($(this).attr("data-idestado"));
 });
 $(document).on("click","#btnguardar", function(){
     $.ajax({
        type: "POST",
        contentType: "application/json",
        url: "/administracion/estado/registrar",
        data: JSON.stringify({
            idestado: $("#hddidestado").val(),
            descestado: $("#txtdescripcion").val()
        }),
        success: function(resultado){
            if(resultado.respuesta){
                listarEstados();
            }
            alert(resultado.mensaje);
            $("#modalestado").modal("hide")
        }
     })
 });

function listarEstados(){
    $.ajax({
        type: "GET",
        url: "/administracion/estado/listar",
        dataType: "json",
        success: function(resultado){
            //borramos el contenido de la tabla
            $("#tblestado > tbody").html("")
            //con each recorremos cada fila y obtenemos el valor del resultado
            $.each(resultado, function(index, value){
            //reconstruimos la tabla
            $("#tblestado > tbody").append("<tr>" +
            "<td>" + value.idestado + "</td>" +
            "<td>" + value.descestado + "</td>" +
            "<td>" +
                "<button type='button' class='btn btn-info btnactualizar'" +
                " data-idestado='"+value.idestado+"'"+
                " data-descestado='"+value.descestado+"'>"+
                "<i class='bi bi-pencil-square'></i>"+
                "</button> </td>" +
            "<td>" +
                "<button type='button' class='btn btn-danger btneliminar'" +
                " data-idestado='"+value.idestado+"'"+
                " data-descestado='"+value.descestado+"'>"+
                "<i class='bi bi-trash'></i>"+
                "</button> </td>"+
            "</tr>");
            })
        }
    })
}

$(document).on("click",".btneliminar", function(){
    $("#modalestado").modal("show");
});
