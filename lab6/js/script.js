
document.getElementById('info').onmouseover=cambiacolor;
document.getElementById('info').onmouseleave=cambianegro;
document.getElementById("oculto").style.display="none";
let num=0;
setInterval(function(){document.getElementById("segundos").innerHTML=num+=1;},1000);
function cambiacolor()
{
    document.getElementById("info").style.color="blue";
}
function cambianegro()
{
    document.getElementById("info").style.color="black";
}

function allowDrop(ev) {
    ev.preventDefault();
  }
  
  function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
  }
  
  function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
  }
  function mostrar(){
    document.getElementById("oculto").style.display="block";
  }