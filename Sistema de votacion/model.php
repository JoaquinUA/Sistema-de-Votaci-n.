<?php
    require_once("db_con.php");
    class voto_model{
        public $servername = "localhost";
        public $username = "";
        public $password = "";
        public $dbname = "votaciones";
        

        public function getSelectComunas($abr){

            $con = getConnection($this->servername,$this->username,$this->password,$this->dbname);
            $sql = "SELECT * from comunas where region_abr = '$abr'";
            $result = $con->query($sql);
            if ($result->num_rows > 0) {

                while($row = $result->fetch_array(MYSQLI_ASSOC)) {
                    echo " <option>".$row["nombre"]."</option>";
                }
               mysqli_close($con);
            } else {
                mysqli_close($con);
                echo "error";
            }
        }
        public function getSelectRegiones(){
            $con = getConnection($this->servername,$this->username,$this->password,$this->dbname);
            $sql = "SELECT * from regiones ";
            $result = $con->query($sql);
            if ($result->num_rows > 0) {
                echo "<option value=''></option>";
                while($row = $result->fetch_array(MYSQLI_ASSOC)) {
                    echo " <option value='".$row["abreviatura"]."'>".$row["nombre"]."</option>";
                }
               mysqli_close($con);
            } else {
                mysqli_close($con);
                echo "error";
            }
        }
        public function getSelectCandidatos (){

            $con = getConnection($this->servername,$this->username,$this->password,$this->dbname);
            $sql = "SELECT * from candidatos ";
            $result = $con->query($sql);
            if ($result->num_rows > 0) {
                echo "<option value=0></option>";
                while($row = $result->fetch_array(MYSQLI_ASSOC)) {
                    echo " <option value='".$row["idcandidatos"]."'>".$row["nombre"]."</option>";
                }
               mysqli_close($con);
            } else {
                mysqli_close($con);
                echo "error";
            }
        }
        public function rutNotDuplicated($rut){
            $con = getConnection($this->servername,$this->username,$this->password,$this->dbname);
            $sql = "SELECT rut_votante from votos where rut_votante = '$rut'";
            $result = $con->query($sql);
            if ($result->num_rows == 0) {
                mysqli_close($con);
                return true; // rut no está duplicado
                
            }
            else{
                mysqli_close($con);
                echo " rut ya se encuentra en la base de datos";
                return false;
            }
            
        }
        public function votar($form){
            //print_r($form);
            $obj = json_decode($form,false);;
            $nombre= $obj->{'nombre'};
            $rut = $obj->{'rut'};
            $alias= $obj->{'alias'};
            $candidato = $obj->{'candidato'};
            $email = $obj->{'email'};
            $region = $obj->{'region'};
            $comuna = $obj->{'comuna'};
            $checkbox = $obj->{'checkbox'};

            if($this->rutNotDuplicated($rut)){
                $con = getConnection($this->servername,$this->username,$this->password,$this->dbname);
                $sql ="insert into votos ( rut_votante,id_candidato,nom_apellido,alias,email,region,comuna,checkbox) values('$rut','$candidato','$nombre','$alias','$email','$region','$comuna','$checkbox')";
                if (mysqli_query($con, $sql)) {
                    mysqli_close($con);
                    echo "Voto realizado con exito";
                }
                else{
                    mysqli_close($con);
                    echo " error";
                }
                
            };

            
        }

    }
?>