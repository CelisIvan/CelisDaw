$(document).ready(function(){
    var funcion = 1;
    $.ajax({
        type: 'POST',
        url: 'controlador.php',
        data:{funcion:funcion}
    })
    .done(function(lugares){
        $('#selectlugar').html(lugares)
    })
    .fail(function(){
        console.log('error');
    })
});

$(document).ready(function(){
    var funcion = 2;
    $.ajax({
        type: 'POST',
        url: 'controlador.php',
        data:{funcion:funcion}
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
    var funcion = 3;
    $.ajax({
        type: 'POST',
        url: 'controlador.php',
        data:{funcion:funcion}
    })
    .done(function(lista){
        $('#listain').html(lista)
    })
    .fail(function(){
        console.log('error');
    })
}
$(document).ready(function(){
        var funcion = 4;
        $('#ambos').submit(function(ev){
            ev.preventDefault();
            var lugar= $('#selectlugar').val();
            var incidente= $('#selectincidente').val();
            console.log(lugar);
            console.log(incidente);
            $.ajax({
                url: 'controlador.php',
                type: 'POST',
                data:{funcion:funcion, id_lugar:lugar,id_incidente:incidente},
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







