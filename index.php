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

	$query = "SELECT id_client, nom_client FROM clients ORDER BY id_client ASC";
	$resultado = mysqli_query($enlace, $query);
?>

<html>
	<head>
		<title>Proyecto</title>
	</head>

	<body>
		Que tal david :v a ver si te puedes copiar el diseño de la pagina del Jaime, sobre todo en las tablas, para que cuando seleccionas algo se pinte de otro color indicando la seleccion, asi como el menu de tu sitio web, pero aplicado sobre estas tablas.

		<br/>Este es el menu

		<table border="1">
			<tr>
				<td><a href="index.php">Tableau principal</a></td>
				<td>Ajouter une machine</td>
				<td>Ajouter une maintenance</td>
				<td>Enregistrer une panne</td>
				<td>Nouveau intervenant</td>
				<td>Nouveau client</td>
			</tr>
		</table>

		<br/>

		<table border="1" cellpadding="5" cellspace="5">

			<tr>
			    <th>LISTE DES CLIENTS</th>
			</tr>
			
			<tr>
	        	<td><a href="machines.php?id=<?php echo 0;?>" target="machines"><strong>TOUS</strong></td>
	        </tr>

			<?php while ($fila = mysqli_fetch_assoc($resultado)) { ?>
	        <tr>
	        	<td><a href="machines.php?id=<?php echo $fila["id_client"]; ?>" target="machines"><?php echo $fila["nom_client"] ?> </td>
	    	</tr>

		<?php } ?>

		</table> 

		<iframe width="100%" height="550px" src="machines.php" name="machines"></iframe>
		
		<?php
		/* liberar la serie de resultadoados */
		mysqli_free_resultado($resultado);

		mysqli_close($enlace);

		?>
	</body>
</html>