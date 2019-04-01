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

$(document).ready(function(){

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
})


