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
    
    $query_panne = "select machine.nom_machine, panne.date, panne.organe, panne.operation, panne.nature_panne, panne.cause_panne, panne.commentaire from panne inner join machine on panne.id_machine=machine.id_machine where machine.id_client=".$id;

    $resultado_panne = mysqli_query($enlace, $query_panne);

    if(mysqli_num_rows($resultado_panne)>0) {

        $delimiter = ",";
        $filename = $nombre."_panne_" . date('Y-m-d') . ".csv";
        
        //create a file pointer
        $f = fopen('php://memory', 'w');
        
        //set column headers
        $fields = array('Machine',
            'Date',
            'Organe',
            'Operation',
            'Nature panne',
            'Cause panne',
            'Commentaire');

        fputcsv($f, $fields, $delimiter);
        
        //output each row of the data, format line as csv and write to file pointer
        while ($fila_panne = mysqli_fetch_assoc($resultado_panne)) { 

            $lineData = array($fila_panne["nom_machine"],
            $fila_panne["date"],
            $fila_panne["organe"],
            $fila_panne["operation"],
            $fila_panne["nature_panne"],
            $fila_panne["cause_panne"],
            $fila_panne["commentaire"]);

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