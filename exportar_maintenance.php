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
    
    $query_maint = "SELECT * FROM maintenance WHERE id_machine=".$id;

    $resultado_maint = mysqli_query($enlace, $query_maint);

    $nombre = $_GET["nombre"];

    if(mysqli_num_rows($resultado_maint)>0) { 

        echo "ok";

        $delimiter = ",";
        $filename = $nombre."_maintenance_" . date('Y-m-d') . ".csv";
        
        //create a file pointer
        $f = fopen('php://memory', 'w');
        
        //set column headers
        $fields = array('Machine',
            'Operation',
            'Intervenant',
            'Date',
            'Echeance',
            'Compteur',
            'Comentaire');

        fputcsv($f, $fields, $delimiter);
        
        //output each row of the data, format line as csv and write to file pointer
        while ($fila_maint = mysqli_fetch_assoc($resultado_maint)) { 

            $lineData = array($fila_maint["id_machine"],
            $fila_maint["id_oper"],
            $fila_maint["id_interv"],
            $fila_maint["date"],
            $fila_maint["echeance"],
            $fila_maint["compteur"],
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