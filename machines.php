<?php
	
	require_once 'conexion.php';
	$enlace = mysqli_connect($hostname, $username, $password, $database);

	/* comprobar la conexión */
	if (!$enlace) {
	    echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
	    echo "errno de depuración: " . mysqli_connect_errno() . PHP_EOL;
	    echo "error de depuración: " . mysqli_connect_error() . PHP_EOL;
	    exit;
	}

	$id = $_GET["id"];
	$clients = "SELECT nom_client FROM clients WHERE id_client=".$id;

	if($id)
		$query = "SELECT id_machine, nom_machine FROM machine WHERE id_client=".$id;
	else
		$query = "SELECT id_machine, nom_machine FROM machine ORDER BY id_machine ASC";

	$resultado = mysqli_query($enlace, $query);
	$res_clients = mysqli_query($enlace, $clients);
	$row = mysqli_fetch_assoc($res_clients);
?>
<html>
	<head>
		<title>Machines</title>
		<link rel="stylesheet" type="text/css" href="CSS/machines_style.css">
	</head>

	<body>

		<center>

		<iframe align="right" height="90%" src="demo.php" name="operations"></iframe>

		<?php if(mysqli_num_rows($resultado)>0) { ?>

			<table border="1" cellpadding="5" cellspace="5">

				<tr>
				    <th>Machines <?php echo $row["nom_client"]?></th>
				</tr>
				

				<?php while ($fila = mysqli_fetch_assoc($resultado)) { ?>

		        <tr>
		        	<td><a href="operations.php?id=<?php echo $fila["id_machine"]; ?>&nombre=<?php echo $fila["nom_machine"]; ?>" 
		        		target="operations"><?php echo $fila["nom_machine"] ?>   </a></td>
		    	</tr>
				
				<?php } ?>

			</table>

		<?php } else echo "Ce client n'a pas machines";?>


		<?php
			/* liberar la serie de resultados */
			mysqli_free_result($resultado);
			mysqli_free_result($res_clients);

			mysqli_close($enlace);

		?>

		</center>

	</body>
</html>