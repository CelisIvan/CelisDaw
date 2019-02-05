document.getElementById("productos").style.display="none";
document.getElementById("formu3").style.display="none";
document['miformu']['contra'].focus();

function validaContra(){
    let pas1=document['miformu']['contra'].value;
    let pas2=document['miformu']['contravali'].value;
    console.log(pas1);
    console.log(pas2);
    if(pas1!=pas2)
    {
        alert("¡Las contraseñas deben coincidir!");
        document['miformu']['contravali'].focus();
    }
    else{
        alert("Perfecto, ya puedes empezar a comprar");
        document.getElementById("productos").style.display="block";
    }
    return false;
}
function Calcula(){
    let cant1=document.getElementById("numchoco").value;
    let cant2=document.getElementById("numpocky").value;
    let cant3=document.getElementById("numcrack").value;
    let pre1= cant1* 15.5;
    let pre2=cant2 * 30;
    let pre3= cant3 *10.5;
    if(cant1!=null&&cant2!=null&&cant3!=null)
    {
        document.getElementById("calculo").innerHTML="Precio chocoretas sin iva: $" + (pre1*0.86) + "     -    Precio con iva: $" + pre1+ "<br/>"+ "Precio pocky sin iva: $" + (pre2*0.86) + " Precio con iva: $" + pre2 + "<br/>" + "Precio chocoretas sin iva: $" + (pre1*0.86) + "     -    Precio con iva: $" + pre1 +"<br/>";

    }
}
function Comprar(){
    let cant1=document.getElementById("numchoco").value;
    let cant2=document.getElementById("numpocky").value;
    let cant3=document.getElementById("numcrack").value;
    if(cant1!=null&&cant2!=null&&cant3!=null){
        alert("¡Perfecto! Ahora solo llena la siguiente forma para conservar tus datos y que te llegue el pedido :v");
        document.getElementById("formu3").style.display="block";
    }
    return false;
}
function Confirma(){
    let corr= document.getElementById("Correo").value;
    let direc= document.getElementById("Direccion").value;
    
        let numani=document['miformu3']['numanim'].value;
        if(numani<10){
            document.getElementById("numanimtext").innerHTML="Estás verde mijo";
        }
         else if (numani>=10 && numani.value<25){
            document.getElementById("numanimtext").innerHTML="Es un excelente número";
        }else{
            document.getElementById("numanimtext").innerHTML="WOW, son demasiados";
        }

        let res=document['miformu3']['sino'].value;
        if(res=="Sí"||res=="SÍ"||res=="Si"||res=="si"||res=="SI"||res=="sí"){
            document.getElementById("acdes").innerHTML="Mugre rico, no todos tenemos esos privilegios";
        }else{
            document.getElementById("acdes").innerHTML="Lo sé, está gacho";
        }
        alert("Enviaremos un correo de confirmación a" + corr +" Y el paquete con tu pedido a" +direc);
    
    return false;
}

