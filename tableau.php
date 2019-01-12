<?php

	/*Comprobar Sesion*/

	session_start();
	if(!isset($_SESSION["id"]) && !isset($_SESSION["nombre"])){
		echo "No has iniciado sesion";
		header('Location: index.php');
	}

	/* Ritchie esta es la variable de la ID ---> */echo $_SESSION["id"];

	require_once 'conexion.php';
	$enlace = mysqli_connect($hostname, $username, $password, $database);

	/* comprobar la conexión */
	if (!$enlace) {
	    echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
	    echo "errno de depuración: " . mysqli_connect_errno() . PHP_EOL;
	    echo "error de depuración: " . mysqli_connect_error() . PHP_EOL;
	    exit;
	}

	$query = "SELECT id_client, nom_client FROM clients ORDER BY id_client ASC";
	$resultado = mysqli_query($enlace, $query);
?>

<html>
	<head>
		<title>Proyecto</title>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="CSS/tableau_style.css">
	</head>

	<body>

		<ul>
			<li><a href="" class="active"><i class="material-icons">list_alt</i>&nbsp;Tableau principal</a></li>
			<li><a href=""><i class="material-icons">add</i>&nbsp;Ajouter une machine</a></li>
			<li><a href=""><i class="material-icons">add</i>&nbsp;Ajouter une maintenance</a></li>
			<li><a href=""><i class="material-icons">create</i>&nbsp;Enregistrer une panne</a></li>
			<li><a href=""><i class="material-icons">person_add</i>&nbsp;Nouveau intervenant</a></li>
			<li><a href=""><i class="material-icons">person_add</i>&nbsp;Nouveau client</a></li>
			<li><a href="cerrarSesion.php"><i class="material-icons">arrow_back</i>&nbsp;Sortir</a></li>
		</ul>

		<table class="clients">

			<tr>
			    <th colspan="100%">LISTE DES CLIENTS</th>
			</tr>
			
			<tr>
	        	<td><a href="machines.php?id=<?php echo 0;?>" target="machines"><strong>TOUS</strong></a></td>

			<?php while ($fila = mysqli_fetch_assoc($resultado)) { ?>

	        	<td><a href="machines.php?id=<?php echo $fila["id_client"]; ?>" target="machines"><?php echo $fila["nom_client"] ?> </a></td>

			<?php } ?>	    	

			</tr>

		</table> 

		<iframe width="100%" height="550px" src="machines.php" name="machines"></iframe>
		
		<?php
		/* liberar la serie de resultadoados */
		mysqli_free_resultado($resultado);

		mysqli_close($enlace);

		?>
	</body>
</html>