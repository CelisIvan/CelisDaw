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
function Comprar(){
    let cant1=document.getElementById("numchoco").value;
    let cant2=document.getElementById("numpocky").value;
    let cant3=document.getElementById("numcrack").value;
    if(cant1!=null&&cant2!=null&&cant3!=null){
        document.getElementById("formu3").style.display="block";
    }
    return false;
}

