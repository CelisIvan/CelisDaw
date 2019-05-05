<?php
// Array with names
$a[] = "Anakin Skywalker";
$a[] = "Obi-Wan Kenobi";
$a[] = "Leia Organa";
$a[] = "Palpatine";
$a[] = "C3P-0";
$a[] = "R2-D2";
$a[] = "Lando Calrissian";
$a[] = "Han Solo";
$a[] = "Yoda";
$a[] = "Palpatine";
$a[] = "Ki-Adi Mundi";
$a[] = "Plo Koon";
$a[] = "Kit Fisto";
$a[] = "Ewok";
$a[] = "Chewbacca";
$a[] = "Luke Skywalker";
$a[] = "Padme Amidala";
$a[] = "Rey";
$a[] = "Poe Dameron";
$a[] = "Finn";
$a[] = "Tarkin";
$a[] = "Jyn Erso";
$a[] = "Boba Fett";
$a[] = "Jango Fett";
$a[] = "Qui-gon Jinn";
$a[] = "Jar-jar Binks";
$a[] = "Maz Kanata";
$a[] = "Rex";
$a[] = "Cody";
$a[] = "Ahsoka Tano";
$a[] = "Luminara Unduli";
$a[] = "Bale Organa";
$a[] = "Stormtrooper";
$a[] = "Jabba the Hutt";
$a[] = "Barriss Offe";
$a[] = "Shaak Ti";
$a[] = "Dooku";
$a[] = "Grievous";
$a[] = "Mace Windu";


// get the q parameter from URL
$q = $_REQUEST["q"];

$hint = "";

// lookup all hints from array if $q is different from "" 
if ($q !== "") {
  $q = strtolower($q);
  $len=strlen($q);
  foreach($a as $name) {
    if (stristr($q, substr($name, 0, $len))) {
      if ($hint === "") {
        $hint = $name;
      } else {
        $hint .= ", $name";
      }
    }
  }
}

// Output "no suggestion" if no hint was found or output correct values 
echo $hint === "" ? "no suggestion" : $hint;
?>