<?php
    require_once('model.php');

    class voto_controller
    {
        protected $nom_apellido;
        protected $alias;
        protected $rut;
        protected $email;
        protected $region;
        protected $comuna;
        protected $candidato;
        protected $cb;
        public $model;

        public function queryComunas($abr){
            $this->setModel();
            //print_r($this->model);
            $this->model->getSelectComunas($abr);
        }
        public function queryRegiones(){
            $this->setModel();
            //print_r($this->model);
            $this->model->getSelectRegiones();
        }
        public function queryCandidatos(){
            $this->setModel();
            $this->model->getSelectCandidatos();
        }
        public function queryVotos($form){
            // agregar los demas campos a la base de datos , a la query en el modelo y a la llama del metodo votar en la siguiente linea
            $this->setModel();
            $this->model->votar($form);
        }


        
        public function setModel(){
            $this->model = new voto_model;
        }
    }

   





?>