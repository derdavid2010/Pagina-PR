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
	$query_panne = "SELECT * FROM panne WHERE id_machine=".$id;
	$query_maint = "SELECT * FROM maintenance WHERE id_machine=".$id;

	$resultado_panne = mysqli_query($enlace, $query_panne);
	$resultado_maint = mysqli_query($enlace, $query_maint);

	$nombre = $_GET["nombre"];
?>

<html>
	<head>
		<title>Operations</title>
		<link rel="stylesheet" type="text/css" href="CSS/operations_style.css">
	</head>

	<body>
		<center><h2><?php echo $nombre; ?></h2></center>
		<!-- OPERACIONES DE MANTENIMIENTO -->
		<h3>Liste des operations de maintenance</h3>
		<?php if(mysqli_num_rows($resultado_maint)>0) { ?>
		<a href="exportar_maintenance.php?id=<?php echo $id; ?>&nombre=<?php echo $nombre; ?>" target="_blank">Exporter le fichier CSV</a>
		<br/>
		<table border="1" cellpadding="5" cellspace="5">

		<tr>
		    <th>Machine</th>
		    <th>Operation</th>
		    <th>Intervenant</th>
		    <th>Date</th>
		    <th>Echeance</th>
		    <th>Compteur</th>
		    <th>Comentaire</th>
		</tr>
		
		<?php while ($fila_maint = mysqli_fetch_assoc($resultado_maint)) { ?>
        <tr>
        	<td><?php echo $fila_maint["id_machine"] ?></td>
        	<td><?php echo $fila_maint["id_oper"] ?></td>
        	<td><?php echo $fila_maint["id_interv"] ?></td>
        	<td><?php echo $fila_maint["date"] ?></td>
        	<td><?php echo $fila_maint["echeance"] ?></td>
        	<td><?php echo $fila_maint["compteur"] ?></td>
        	<td><?php echo $fila_maint["commentaire"] ?></td>
    	</tr>

		
		<?php } ?>
		</table>
		<?php } else echo "Ce machine n'a pas des operations de maintenance";?>

		<!-- OPERACIONES DE PANNE -->
		<h3>Liste des pannes</h3>
		<?php if(mysqli_num_rows($resultado_panne)>0) { ?>
		<a href="exportar_panne.php?id=<?php echo $id; ?>&nombre=<?php echo $nombre; ?>" target="_blank">Exporter le fichier CSV</a>
		<br/>
		<table border="1" cellpadding="5" cellspace="5">

		<tr>
		    <th>Machine</th>
		    <th>Intervenant</th>
		    <th>Date</th>
		    <th>Organe</th>
		    <th>Operation</th>
		    <th>Nature panne</th>
		    <th>Cause panne</th>
		    <th>Garantie</th>
		    <th>Temps d'arret</th>
		    <th>PR</th>
		    <th>Temps interv</th>
		    <th>Compteur</th>
		    <th>Commentaire</th>
		</tr>
		
		<?php while ($fila_panne = mysqli_fetch_assoc($resultado_panne)) { ?>
        <tr>
        	<td><?php echo $fila_panne["id_machine"] ?></td>
        	<td><?php echo $fila_panne["id_interv"] ?></td>
        	<td><?php echo $fila_panne["date"] ?></td>
        	<td><?php echo $fila_panne["organe"] ?></td>
        	<td><?php echo $fila_panne["operation"] ?></td>
        	<td><?php echo $fila_panne["nature_panne"] ?></td>
        	<td><?php echo $fila_panne["cause_panne"] ?></td>
        	<td><?php echo $fila_panne["garantie"] ?></td>
        	<td><?php echo $fila_panne["temps_darret"] ?></td>
        	<td><?php echo $fila_panne["PR"] ?></td>
        	<td><?php echo $fila_panne["tps_interv"] ?></td>
        	<td><?php echo $fila_panne["compteur"] ?></td>
        	<td><?php echo $fila_panne["commentaire"] ?></td>
    	</tr>

		<?php } ?>
		</table>
		<?php } else echo "Ce machine n'a pas des pannes";?>


		<?php 

			/* liberar la serie de resultados */
			mysqli_free_result($resultado_panne);
			mysqli_free_result($resultado_maint);

			mysqli_close($enlace);

		?>
	</body>
</html>