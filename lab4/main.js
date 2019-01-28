let num;
num= prompt("Introduce un numero plox:")
var i;
for(i=1;i<=num;i++){
    document.write(i+"--------"+ Math.pow(i,2)+ "--------"+ Math.pow(i,3))
    document.write("<br/>")
}
let rand1= Math.floor((Math.random()*300)+1);
let rand2= Math.floor((Math.random()*300)+1);
ini_mseg= new Date();
console.log(26);
let num2= prompt("¿Cuanto da la suma de "+rand1+" + "+rand2 +"?")
console.log(num2);
fin_mseg=new Date();
let tini=ini_mseg.getTime();
let tend=fin_mseg.getTime();
let a = (tend- tini)/1000;
if(num2==(rand1+rand2)){
    alert("CORRECTO, TARDASTE"+" "+ a + " SEGUNDOS");
}
else{
    alert("INCORRECTO, ADEMÁS TE TARDASTE "+ a + "SEGUNDOS");
}
let nums = new Array(20);
for(i=0;i<20;i++){
    nums[i]=Math.floor((Math.random()*42)-20);
}

let pos=0,neg=0,ceros=0;
document.write("<br/>")
function contador(arre){
    document.write("El arreglo es el siguiente:")
    for(i=0;i<=arre.length-1;i++){
        document.write(arre[i]+" ,")
        if(arre[i]<0){
            neg+=1;
        }
        if(arre[i]>0){
            pos+=1;
        }
        if(arre[i]==0){
            ceros+=1;
        }
    }
    document.write("<br/>"+"negativos: "+neg+ "<br/>");
document.write("ceros: "+ceros+ "<br/>");
document.write("positivos: "+pos+"<br/>");
}
contador(nums);
let reng= new Array(10);
let j;
for(i=0;i<10;i++){
    reng[i]=new Array(10)
    for(j=0;j<10;j++){
        reng[i][j]=Math.floor((Math.random()*20)+1);
    }
}
document.write("<br/>")
document.write("<br/>")
document.write("MATRIZ: <br/>")
for(i=0;i<10;i++){
    for(j=0;j<10;j++){
    document.write(reng[i][j]+"|");
    }
    document.write("<br/>");
}
let acum=0;
function promedio(arra){
    for(i=0;i<10;i++){
        acum=0;
        for(j=0;j<10;j++){
            acum+=arra[i][j];
        }
        document.write("Promedio renglon " + (i+1) +": " + (acum/10)+"<br/>");
    }
}
promedio(reng);
function invertir(numero)
{ 
  let invertido = 0;
  let resto = numero;
  do {
    invertido = invertido * 10 + (resto % 10)
    resto = Math.floor(resto / 10)
  } while ( resto > 0 )
  return invertido
}
let numerin = prompt("Introduce un numero largo(4 o más dígitos)");
alert("El numero invertido es: "+ invertir(numerin));
/*ALGORITMO DE SOLUCION AL PROBLEMA
NO FUNCIONA PUESTO QUE HABRÍA QUE MANDAR MUCHOS PARÁMETROS Y ASÍ Y DA FLOJERA, PERO EL ALGORITMO SIRVE, según yo :P*/
function primo(x)
{
    let i;
    if(x<2)
        return false ;
    for(i=2 ; i<=sqrt(x); i++)
    {
        if(x%i==0)
            return false ;
    }
    return true ;
}
function principal(){
    let rain ;
     //let n=promt("Ingresa un numero")
    let rep=n;
    while(n>0)
    {
        //let num=prompt("ingresa numeros");
        rain=Math.floor(Math.sqrt(num));
        if(num!=(rain*rain))
            document.write("NO");
        else if(!primo(rain))
            document.write("NO");
        else if(primo(rain))
            document.write("YES");
    }
} 




