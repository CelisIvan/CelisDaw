<?php

$arr1 = array(25,623,54,234,543,234,123);
$arr2= array(124,545,546,754,934,563,344);


function imprime_arr($arreglo){ 
  foreach($arreglo as $valor) {
      echo $valor;
      echo " , ";
  }
}
function promedio($arreglo){
  
  $prome = array_sum($arreglo) / count($arreglo);
  echo $prome ;  
}
function mediana($arreglo){
  
  $arrlenght = count($arreglo);
  sort($arreglo);
  
  $arrmed=floor(($arrlenght - 1) / 2);
  if($arrlenght % 2 != 0){
      $med = $arreglo[$arrmed];
  } 
  else{ 
     $med = ($arreglo[$arrmed] + ($arreglo[$arrmed + 1])) / 2;
  }
  
  echo $med ;
}
function potencias(){ 
  echo '<table class="table table-dark">';
  for($i=0 ; $i <= 10; $i++){
      echo '<tr>';
      for($j = 1; $j <= 3; $j++){
          $num = pow($i,$j);
          echo '<td>' . $num . '</td>';        
      }
      echo '</tr>';   
  }
  echo '</table>';
  
}
function problema(){
    $a=1;
    $b=3;
    $c=1;
    $d=3;
    //cin >>a>>b>>c>>d;
    $pro1= $a / $b;
    $pro2= $c / $d;
    $res = ($pro1)/(1.0-((1.0-$pro1)*(1.0-$pro2)));
    echo "<br> La probabilidad de que gane smallR es de :". $res;
}

?>
