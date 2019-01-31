<?php

	/*Comprobar Sesion*/

	session_start();
	if(!isset($_SESSION["id"]) && !isset($_SESSION["nombre"])){
		echo "No has iniciado sesion";
		header('Location: index.php');
	}
?>

	<h3 style="position: fixed; color: #e4f1fe; padding-left: 10px;">Bienvenu: <?php echo $_SESSION["nombre"]; ?> </h3> 
	<h3 align="right" style="position: static; color: #e4f1fe;margin: 10px;"> 
		<?php 
		date_default_timezone_set('America/Mexico_City');
		setlocale(LC_TIME, "fr_FR");
		echo strftime("%A %d %B %G - %R"); ?> </h3>

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

	//$id = $_GET["id"];

	$query1 = "SELECT id_client, nom_client FROM clients ORDER BY id_client ASC";
	$query2 = "SELECT id_machine, prox_date FROM maintenance_prev ORDER BY id_prev ASC";
	
	$resultado1_c = mysqli_query($enlace, $query1);
	$resultado2_p = mysqli_query($enlace, $query2);

	if (isset($_POST[agregar])) {

		//RECUPERAR VALORES DEL FORMULARIO
		$id_machine = $_REQUEST[id_machine];
		$id_interv = $_REQUEST[id_interv];
		$prox_date = $_REQUEST[prox_date];
		
		$fecha = date('Y-m-d', strtotime("+$prox_date months"));

		$query = "INSERT INTO maintenance_prev (id_machine, id_interv, date, prox_date) VALUES ($id_machine, $id_interv, CURDATE(), '$fecha')";
		
		mysqli_query($enlace, $query);
		header('Location: tableau.php');

	}
	else{
	
?>

<html>
	<head>
		<title>Maintenance preventive</title>
		<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="CSS/ajouter_machine_style.css">
	</head>

	<body>

		<ul>
			<li><a href="tableau.php"><i class="material-icons">list_alt</i>&nbsp;Tableau principal</a></li>
			<li><a href="ajouter_machine.php"><i class="material-icons">add</i>&nbsp;Ajouter une machine</a></li>
			<li><a href="ajouter_maintenance.php"><i class="material-icons">add</i>&nbsp;Ajouter une maintenance</a></li>
			<li><a href="ajouter_oper.php"><i class="material-icons">add</i>&nbsp;Ajouter opération de maintenance</a></li>
			<li><a href="ajouter_panne.php"><i class="material-icons">create</i>&nbsp;Enregistrer une panne</a></li>
			<li><a href="ajouter_interv.php"><i class="material-icons">person_add</i>&nbsp;Nouveau intervenant</a></li>
			<li><a href="ajouter_client.php"><i class="material-icons">person_add</i>&nbsp;Nouveau client</a></li>
			<li><a href="#" class="active"><i class="material-icons">build</i>&nbsp;Maintenance préventive</a></li>
			<li><a href="cerrarSesion.php"><i class="material-icons">arrow_back</i>&nbsp;Sortir</a></li>
		</ul>
		
		<form id="maint_prev" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">

			<h3>Ajouter maintenance préventive</h3><br/>
				<p>Machine: 
					<select name="id_machine">
						<option>Sélectionnez...</option>
						
						<?php

							while ($row1_c = mysqli_fetch_assoc($resultado1_c)) {

								$query2 = "SELECT id_machine, nom_machine FROM machine WHERE id_client=".$row1_c["id_client"];
							$resultado2_m = mysqli_query($enlace, $query2);
						?>

						<optgroup label="<?php echo $row1_c["nom_client"]?>">
							
							<?php 
								while ($row2_m = mysqli_fetch_assoc($resultado2_m)) { ?>

							<option value="<?php echo $row2_m["id_machine"] ?>">
								<?php echo $row2_m["nom_machine"]?>
					
							</option>
							<?php } ?>

						</optgroup>
						<?php } ?>
					</select>*

				</p>
				
				<p>Intervenant
					<select name="id_interv">
						<option value="<?php echo $_SESSION["id"] ?>">
							<?php echo $_SESSION["nombre"] ?>
						</option>
					</select>*
				</p>

				<p>Prochaine maintenance dans...:
					<select name="prox_date">
						<option>Sélectionnez...</option>
						<option value="6">6 mois</option>
						<option value="12">12 mois</option>
					</select>
				</p>

				
			  
				<p>
					<input type="reset" value="Effacer" id="boton">
			  		<input type="submit" name="agregar" value="Ajouter maintenance" id="boton">
			  	</p>
		</form>

<br/>
		<form>
		<h2>Prochaines maintenances:</h2><br/>

			<?php 
				$cont = 0;
			   	$mes = strftime("%m");
			    $año = strftime("%G");		
			    ?> <h3> --<?php echo $año ?>-- </h3> <?php

			    while($row2_p = mysqli_fetch_assoc($resultado2_p)){
					$fechaEntero = strtotime($row2_p["prox_date"]);

					$prox_mach[$cont] = $row2_p["id_machine"];
					$prox_date[$cont] = date("n", $fechaEntero);
					$prox_an[$cont] = date("Y", $fechaEntero);
					$cont++;
				}
				//Prox_date tiene los meses de nuestros registros
				//Prox_an tiene los años de nuestros registros
				//Prox_mach tiene los id de las maquinas en esos registros	
				
				//AÑO EN CURSO
				//i lleva los meses del año
    		 	for ($i=1; $i <= 12; $i++) { 
			    		
			    	//Verificamos que la lista de meses empiece desde el mes actual, y que no ponga los meses anteriores
					if ($i>=$mes ) {

					    $fecha = date_create_from_format('!m', $i);
					    $meses = date_format($fecha, 'F');
					    	
					    ?> 
				

					<table border="3px">
					<tr><th colspan="100"><?php echo $meses; ?> </th></tr>
					<tr>
					<?php
					    
					    for ($an=0; $an < count($prox_an); $an++) { 
					    	if ($prox_date[$an] == $i && $prox_an[$an]==date("Y")) {

					    		$query3 = "SELECT id_client, nom_machine FROM machine WHERE id_machine=".$prox_mach[$an];
							$res_mach = mysqli_query($enlace, $query3);
						
							
							while ($row_mach = mysqli_fetch_assoc($res_mach)) { 
								?> <td > <?php echo $row_mach["nom_machine"]; ?> </td> <?php 
							}
							mysqli_free_result($res_mach);

							
					    	}
					    }?>
					    	
						</table><br/>
				

					    <?php						
					}
				} ?>
		

		<br/>
		<h3> --<?php echo date("Y", strtotime("+1 years")); ?>-- </h3>
		
				<?php
				//AÑO SIGUIENTE
				//i lleva los meses del año
    		 	for ($i=1; $i <= 12; $i++) { 
			    		
			    	$fecha = date_create_from_format('!m', $i);
					$meses = date_format($fecha, 'F');
					    	
					?> 
				
					<table border="3px">
					<tr><th colspan="100"><?php echo $meses; ?> </th></tr><?php
					    
					    for ($an=0; $an < count($prox_an); $an++) { 
					    	if ($prox_date[$an] == $i && $prox_an[$an]==date("Y", strtotime("+1 years"))) {

					    		$query3 = "SELECT id_client, nom_machine FROM machine WHERE id_machine=".$prox_mach[$an];
							$res_mach = mysqli_query($enlace, $query3);
							
							?> <tr> <?php
							while ($row_mach = mysqli_fetch_assoc($res_mach)) { 
								?> <td> <?php echo $row_mach["nom_machine"]; ?> </td> <?php 
							}
							mysqli_free_result($res_mach);

					    	}
					    }?>
					    	
				
						</table><br/>

					    <?php						
					
				} ?>
		
				
</form>
				   


	</body>
</html>

<?php }
	mysqli_free_result($resultado1_c);
	mysqli_free_result($resultado2_p);

	mysqli_close($enlace);

?>