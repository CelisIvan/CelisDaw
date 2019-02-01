
window.onload=iniciar;
function iniciar(){
    document.getElementById("enviar").addEventListener('click',validar,false);
}
function validaContra(){
    let elemento=document.getElementById("contra");
    if(!elemento.checkValidity()){
        error(elemento);
        return false;
    }
    return true;
}
function validar(e){
    if(validaContra()&& validaPwd() &&confirm("Pulsa aceptar si quieres enviar el formulario"))
    {
        return true;
    }else{
        e.preventDefault();
        return false;
    }
}
function validaPwd(){
    let pas1=document.getElementById("contra").value;
let pas2=document.getElementById("contravali").value;
console.log(pas1);
console.log(pas2);
let espacios=false;
let conta=0;
while(espacios&&(conta<pas1.length)){
    if(pas1.charAt(cont)==" ")
        espacios=true;
    conta ++;
}
if(espacios){
    alert("La contraseña no puede tener espacios")
    return false;
}
if (pas1.length == 0 || pas2.length == 0) {
    alert("Los campos de la password no pueden quedar vacios");
    return false;
  }
  if (p1 != p2) {
    alert("Las passwords deben de coincidir");
    return false;
  } else {
    alert("Todo bien. Puede usted pasar");
    return true; 
  }
}