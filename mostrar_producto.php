<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Producto</title>
  <link rel="stylesheet" href="./css/estilos.css">
  <script type="text/javascript">
    setTimeout(function() {
    window.location.href = "index.html";
    }, 5000);
  </script>

  <script type="text/javascript">
    if (window.addEventListener) {
      var codigo = "";
      window.addEventListener("keydown", function(e) {
        codigo += String.fromCharCode(e.keyCode);
        if (e.keyCode == 13) {
          window.location = "mostrar_producto.php?codigo=" + codigo;
          codigo = "";
        }
      }, true);
    }
  </script>
</head>

<body>
  <div class="fondo">
    <div class="subfondo">
      <?php
      include("./inc/settings.php");
      try {
        $conn = new PDO("mysql:host=" . $host . ";dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $stmt = $conn->prepare("SELECT * FROM productos WHERE producto_codigo = " . $_GET["codigo"]);
        $stmt->execute();

        // set the resulting array to associative
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        $renglones = $stmt->rowCount();

        if ($renglones == 1) {
          echo "<div class='logo2'><img src='img/loog.png'alt='' width='150px' height='100px'></div>";
          echo "<h1 class='nombre'>".$result["producto_nombre"]."</h1>";
          echo "<h1 class='precio'> &nbsp; $".$result["producto_precio"]."</h1>";
          echo "<h1 class='desc'><br>"." &nbsp; &nbsp;".$result["producto_desc"]."</h1>";
          echo "<div class='imgp'><img src='".$result["producto_imagen"]."' width='400px' height='350px'></div>";
          echo "<h1 class='cantidad'>Disponible en surcursal:" . $result["producto_cantidad"] . "</h1>";
        } else {
          echo "<h1>El artículo que usted está buscando<br>no se ha encontrado<br>por favor pase a servicio al cliente</h1>";
          echo "<div class='noenc'> <img src='img/noencontrado.png' alt='' width='500px' height='400px'> </div>";
        }
      } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
      }
      ?>
    </div>
  </div>
</body>

</html>