<?php 

DEFINE('DB_USERNAME', 'root');
DEFINE('DB_PASSWORD', 'root');
DEFINE('DB_HOST', 'localhost');
DEFINE('DB_DATABASE', 'proyecto');

$mysqli = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_DATABASE);

if (mysqli_connect_error()) {
  die('Connect Error ('.mysqli_connect_errno().') '.mysqli_connect_error());
}

else{
    $sql = "SELECT * from intervenants where correo='".$_POST["correo"]."' and pass='".$_POST["pass"]."';";
    $result = $mysqli->query($sql);
    if ($result->num_rows > 0) {
        // output data of each row

        while($row = $result->fetch_assoc()) {

          session_start();
          $_SESSION["id"] = $row["id_interv"];
          $_SESSION["nombre"] = $row["nom_interv"];
          echo $_SESSION["id"];

        }

      header('Location: tableau.php');

    } else {
?>

<script type="text/javascript">
  alert("Email et/ou Mot de passe incorrect");
  location.href="index.php";
</script>

<?php
    }

}

?>