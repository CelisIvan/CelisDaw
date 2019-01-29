//ELEVAR NUMEROS DE 1 A N AL CUADRADO Y AL CUBO
let num;
num= prompt("Introduce un numero plox:")
var i;
for(i=1;i<=num;i++){
    document.write(i+"--------"+ Math.pow(i,2)+ "--------"+ Math.pow(i,3))
    document.write("<br/>")
}
//generar los numeros aleatorios
let rand1= Math.floor((Math.random()*300)+1);
let rand2= Math.floor((Math.random()*300)+1);
//crear una fecha al momento de generar los numeros
ini_mseg= new Date();
//console.log(26);
let num2= prompt("¿Cuanto da la suma de "+rand1+" + "+rand2 +"?")
//console.log(num2);
//Crear una nueva fecha al momento de recibir la respuesta
fin_mseg=new Date();
//hacer la resta de las fechas (se expresa en milisegundos)
let tini=ini_mseg.getTime();
let tend=fin_mseg.getTime();
let a = (tend- tini)/1000;
// Mostrar los mensajes de acuerdo a la respuesta
if(num2==(rand1+rand2)){
    alert("CORRECTO, TARDASTE"+" "+ a + " SEGUNDOS");
}
else{
    alert("INCORRECTO, LA RESPUESTA ES " + (rand1+rand2) +" ADEMÁS TE TARDASTE "+ a + "SEGUNDOS");
}
//Crear un arreglo con numeros aleatorios
let nums = new Array(20);
for(i=0;i<20;i++){
    nums[i]=Math.floor((Math.random()*42)-20);
}

let pos=0,neg=0,ceros=0;
document.write("<br/>")
function contador(arre){
    //escribir el arreglo en el documento
    document.write("El arreglo es el siguiente:")
    //contar lo que se pide
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
//CREAR UN ARREGLO
let reng= new Array(10);
let j;
for(i=0;i<10;i++){
    //CADA POSICIÓN DEL ARREGLO ES UN NUEVO ARREGLO
    reng[i]=new Array(10)
    for(j=0;j<10;j++){
        reng[i][j]=Math.floor((Math.random()*20)+1);
    }
}
document.write("<br/>")
document.write("<br/>")
document.write("MATRIZ: <br/>")
//ESCRIBIR LA MATRIZ
for(i=0;i<10;i++){
    for(j=0;j<10;j++){
    document.write(reng[i][j]+"|");
    }
    document.write("<br/>");
}
let acum=0;
//promedio por renglón
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
//INVERTIR NUMERO RECIBIDO
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
    for(i=2 ; i<=Math.sqrt(x); i++)
    {
        if(x%i==0)
            return false ;
    }
    return true ;
}
document.write("<br/>"+"<br/>"+"RESPUESTAS AL PROBLEMA"+"<br/>")
//FUNCIÓN PARA EMPEZAR A RESOLVER EL POPRBLEMA
function principal(){
    let rain ;
     let n=prompt("Ingresa la cantidad de números a analizar")
    while(n--)
    {
        let num=prompt("Ingresa un numero");
        rain=Math.floor(Math.sqrt(num));
        if(num!=(rain*rain))
            document.write(num +"¿Es un T-primo?: NO"+"<br/>");
        else if(!primo(rain))
            document.write(num +"¿Es un T-primo?: NO"+"<br/>");
        else if(primo(rain))
            document.write(num+"¿Es un T-primo?: YES"+"<br/>");
    }
} 
principal();




