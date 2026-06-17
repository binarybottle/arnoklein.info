
<?php 
  $image_height = 640;
  $imageID = rand(1,1950);
  $offsetX = 0;
  $offsetY = 0;
  $plus    = 5;
  $nclicks = 8;
  $offset_plus = -2;
  $offset_crosshairs = 10;

  $zeros = 5 - strlen($imageID);
  $zeros = str_repeat("0", $zeros);
  $imageIDstr = $zeros.$imageID;
?>

<html>
<head>

 <script type="text/javascript" src="scripts/jquery.js"></script>
 <script type="text/javascript" src="scripts/wz_jsgraphics.js"></script>
 <script type="text/javascript">

   $(document).ready(function(){

     var imageID  = "<?= $imageID ?>";
     var offsetX  = <?= $offsetX ?>;
     var offsetY  = <?= $offsetY ?>;
     var plus     = <?= $plus ?>;
     var nclicks  = <?= $nclicks-1 ?>;
     var offset_plus = <?= $offset_plus ?>;
     var offset_crosshairs = <?= $offset_crosshairs ?>;

     var shiftX     = offsetX + offset_crosshairs
     var shiftY     = offsetY + offset_crosshairs
     var shiftXplus = shiftX + offset_plus
     var shiftYplus = shiftY + offset_plus

     jQuery(document).ready(function(){
       var X = [];
       var Y = [];
       $("#picture").mousemove(function(e){
         $('#live').html((e.pageX - this.offsetLeft - shiftX) +', '+ (e.pageY - this.offsetTop - shiftX));
       }); 
       $("#picture").click(function(e){
         var iX = X.length;
         X[iX] = e.pageX - this.offsetLeft - shiftX;
         Y[iX] = e.pageY - this.offsetTop - shiftY;

         jg.setColor("#ff0000");
         jg.drawLine(X[iX]+shiftXplus-plus, Y[iX]+shiftYplus, X[iX]+shiftXplus+plus, Y[iX]+shiftYplus);
         jg.drawLine(X[iX]+shiftXplus, Y[iX]+shiftYplus-plus, X[iX]+shiftXplus, Y[iX]+shiftYplus+plus);
         jg.paint();

         $('#click').html(X[iX] +', '+ Y[iX]);

         if (iX==nclicks) {

           $.get("store_points.php", { imageID: imageID, 'X[]': X, 'Y[]': Y });

           // Refresh page
           setTimeout("location.reload(true);",1000);

         }

       }); 
     });
   });
 </script>

 <link rel="stylesheet" type="text/css" href="./shared/style.css">

</head>
<body>
 <title>Click on facial features</title>

  <!-- IMAGE -->
  <div id="picture">
    <img src="<? echo 'images/e'.$imageIDstr.'.jpg';?>" height="<? echo $image_height;?>">
  </div>
  <br />

  <!-- TEXT -->
  <span class="caption">#<? echo $imageID;?></span>
  <div id="live">0, 0</div>
  <div id="click">0, 0</div>

  <!-- GRAPHICS -->
  <script type="text/javascript">
    var jg = new jsGraphics("picture");
  </script>

  <!-- CROSSHAIRS -->
  <script type="text/javascript" src="scripts/crosshairs.js"></script>

</body>
</html>
