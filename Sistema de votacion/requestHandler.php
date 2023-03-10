<?php
    require_once("controller.php");

    //llama a un distinto metodo del controlador segun lo que venga en el get request
    switch($_GET["tipo"]){
        case "candidatos":
            $controller = new voto_controller;
            $controller->queryCandidatos();
            unset($controller);
            break;    
        case "comunas":
            $abr = $_GET["abr"];
            $controller = new voto_controller;
            $controller->queryComunas($abr);
            unset($controller);
            break;
        case "regiones":
            $controller = new voto_controller;
            $controller->queryRegiones();
            unset($controller);
            break;    
        case "votar":
            $form = $_GET["form"];
            $controller = new voto_controller;
            $controller->queryVotos($form);
            unset($controller);
            break; 
           
    }
    
?>