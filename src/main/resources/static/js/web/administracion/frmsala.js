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
    $("#cboestado").empty();
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
    $("#hddisala").val($(this).attr("data-idsala"));
 });
