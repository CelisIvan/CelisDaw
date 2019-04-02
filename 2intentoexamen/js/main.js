$(document).ready(function(){

    $.ajax({
        type: 'POST',
        url: 'controlador.php',
        data:{'peticion': 'cargar_lugares'}
    })
    .done(function(lugares){
        $('#selectlugar').html(lugares)
    })
    .fail(function(){
        console.log('error');
    })
});

$(document).ready(function(){

    $.ajax({
        type: 'POST',
        url: 'controlador2.php',
        data:{'peticion': 'cargar_incidentes'}
    })
    .done(function(lugares){
        $('#selectincidente').html(lugares)
    })
    .fail(function(){
        console.log('error');
    })
})

$(document).ready(cargar_lista());

function cargar_lista(){

    $.ajax({
        type: 'POST',
        url: 'controlador3.php',
        data:{'peticion': 'cargarlista'}
    })
    .done(function(lista){
        $('#listain').html(lista)
    })
    .fail(function(){
        console.log('error');
    })
}
$(document).ready(function(){
        $('#ambos').submit(function(ev){
            ev.preventDefault();
            var lugar= $('#selectlugar').val();
            var incidente= $('#selectincidente').val();
            console.log(lugar);
            console.log(incidente);
            $.ajax({
                url: 'guardar.php',
                type: 'POST',
                data:{id_lugar:lugar,id_incidente:incidente},
                dataType:'text',
            })
            .done(function(data){
                console.log(lugar);
            console.log(incidente);
                $('#selectlugar').val("0");
                $('#selectincidente').val("0");
                $('#listain').html("");
                $('#listain').html(data);
            })
            .fail(function(){
                console.log('error krnal');
            })
        });
        
});







