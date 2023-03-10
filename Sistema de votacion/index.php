<?php
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>

        .error{
            color:red;
        }
        form{
            border:1px solid black;
            width: 600px; 
            margin-left:10px;
            padding-left: 10px;
        }
        #grilla_inputs{
            
            display:grid;
            grid-template-columns: 200px 200px 1fr ;
        }
        label{
   
            grid-column: 1 / 2;
            pointer-events: none;
            
        }
        input,select{
            grid-column: 2/3;
            pointer-events: all;
            
        }
        .cb_div{
            display:inline;
            margin-left:10px;
        }
        

       
    </style>
</head>
<body>
    <form>
        <h3>FORMULARIO DE VOTACIÓN</h3>
        <div id="grilla_inputs">
                <label for="nom_apellido">Nombre y Apellido</label>
                <input type="text" name="nom_apellido"/> 
                     <div class="error error_nom"></div>
    
                <label for="alias">Alias</label>
                <input type="text" name="alias"/>
                <div class="error error_alias"></div>
                 
    
                <label for="rut">RUT</label>
                <input type="text" name="rut"  value=""/>
                <div class="error error_rut"></div> 
                
    
                <label for="email">Email</label>
                <input type="text" name="email" /> 
                <div class="error error_email"></div>
                 
    
                <label for="region">Región</label>
                <select name="region">
                    
                </select>
                <div class="error error_region"></div>
                
    
                <label for="comuna">Comuna</label>
                    <select name="comuna" onload="get_candidato()">
                        <option value="0"></option>
                    </select>
                 
                <label for="candidato">Candidato</label>
                    <select name="candidato">
                        
                    </select>
                    <div class="error error_candidato"></div>
            </div><!-- Fin de grilla_inputs -->
             
            <label id="cb_row"> Como se enteró de nosotros ?
                <div class="cb_div">
                    <input type="checkbox" class = "cb" name="web" value="Web"/>
                    <label for="web">Web</label>

                </div>
                
                <div class="cb_div">
                    <input type="checkbox" class = "cb" name="tv" value="TV"/>
                    <label for="tv" >TV</label>

                </div>

                <div class="cb_div">
                    <input type="checkbox" class = "cb" name="redes_sociales" value="rs" />
                    <label for=redes_sociales>Redes Sociales</label>
                    
                </div>

                <div class="cb_div">
                    <input type="checkbox" class = "cb" name="amigo" value="Amigo"/>
                    <label for="amigo" >Amigo</label>
                </div>
                <div class="error error_cb"></div>
            </label>
            <br>
            <input type="submit" name="votar" value="Votar"/>
            <p id="respuesta"></p>
    </form>
    <script src="form_val.js"></script>
</body>
</html>
<?php


?>