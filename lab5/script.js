
// window.onload=iniciar;
// function iniciar(){
//     document.getElementById("enviar").addEventListener('click',validar,false);
// }
function validaContra(){
    let elemento=document.getElementById("contra");
    let pas1=document.getElementById("contra").value;
    let pas2=document.getElementById("contravali").value;
    console.log(pas1);
    console.log(pas2);
    let res1,res2,res3,res4,resmax;
    let espacios=false;
    let conta=0;
    if(!elemento.checkValidity()){
        res1=false;
        console.log("res1: "+ res1);
        return false;
    }
    while(espacios&&(conta<pas1.length)){
        if(pas1.charAt(conta)==" ")
            espacios=true;
        conta ++;
    }
    if(espacios){
        alert("La contraseña no puede tener espacios")
        res2=false;
        console.log("res2: "+ res2);
        return false;
    }
    if (pas1.length == 0 || pas2.length == 0) {
        alert("Los campos de la password no pueden quedar vacios");
        res3=false;
        console.log("res3: "+ res3);
        return false;
      }
      if (p1 != p2) {
        alert("Las passwords deben de coincidir");
        res4=false;
        console.log("res4: "+ res4);
        return false;
      }
      resmax=true;
        console.log("resmax: "+ resmax);

    return true;
}
function validar(e){
    if(validaContra() && confirm("Pulsa aceptar si quieres enviar el formulario"))
    {
        return true;
    }else{
        e.preventDefault();
        return false;
    }
}
