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
	if($id)
		$query = "SELECT id_machine, nom_machine FROM machine WHERE id_client=".$id;
	else
		$query = "SELECT id_machine, nom_machine FROM machine ORDER BY id_machine ASC";

	$resultado = mysqli_query($enlace, $query);
?>
<html>
	<head>
		<title>Machines</title>
	</head>

	<body>

		<iframe align="right" width="80%" height="550px" src="operations.php" name="operations"></iframe>

		<?php if(mysqli_num_rows($resultado)>0) { ?>
		<table border="1" cellpadding="5" cellspace="5">

		<tr>
		    <th>Nombre </th>
		</tr>
		

		<?php while ($fila = mysqli_fetch_assoc($resultado)) { ?>
        <tr>
        	<td><a href="operations.php?id=<?php echo $fila["id_machine"]; ?>" target="operations"><?php echo $fila["nom_machine"] ?> </td>
    	</tr>

		
		<?php } ?>
		</table>
		<?php } else echo "Ce machine n'a pas des operations de maintenance";?>

		

		<?php
			/* liberar la serie de resultadoados */
			mysqli_free_resultado($resultado);

			mysqli_close($enlace);

		?>


	</body>
</html>