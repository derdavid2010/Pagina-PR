<?php

	$id = $_GET["id"];
	$nombre = $_GET["nom"];

	require_once 'conexion.php';
    $enlace = mysqli_connect($hostname, $username, $password, $database);

    /* comprobar la conexión */
    if (!$enlace) {
        echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
        echo "errno de depuración: " . mysqli_connect_errno() . PHP_EOL;
        echo "error de depuración: " . mysqli_connect_error() . PHP_EOL;
        exit;
    }
    
    $query_maint = "SELECT machine.nom_machine, maintenance.date, maintenance.commentaire FROM maintenance inner join machine on maintenance.id_machine=machine.id_machine where machine.id_client=".$id;

    $resultado_maint = mysqli_query($enlace, $query_maint);

    if(mysqli_num_rows($resultado_maint)>0) { 

        $delimiter = ",";
        $filename = $nombre."_maintenance_" . date('Y-m-d') . ".csv";
        
        //create a file pointer
        $f = fopen('php://memory', 'w');
        
        //set column headers
        $fields = array('Machine',
            'Date',
            'Comentaire');

        fputcsv($f, $fields, $delimiter);
        
        //output each row of the data, format line as csv and write to file pointer
        while ($fila_maint = mysqli_fetch_assoc($resultado_maint)) { 

            $lineData = array($fila_maint["nom_machine"],
            $fila_maint["date"],
            $fila_maint["commentaire"]);

            fputcsv($f, $lineData, $delimiter);
        }
        
        //move back to beginning of file
        fseek($f, 0);
        
        //set headers to download file rather than displayed
        header('Content-Type: text/csv');
        header('Content-Disposition: attachment; filename="' . $filename . '";');
        
        //output all remaining data on a file pointer
        fpassthru($f);
    }
    exit;

?>