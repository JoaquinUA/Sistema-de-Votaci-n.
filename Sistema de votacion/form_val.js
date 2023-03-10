//variables DOM
let nom_apellido = document.getElementsByName("nom_apellido")[0];
let alias = document.getElementsByName("alias")[0];
let rut = document.getElementsByName("rut")[0];
let email = document.getElementsByName("email")[0];
let region = document.getElementsByName("region")[0];
let comuna = document.getElementsByName("comuna")[0];
let candidato = document.getElementsByName("candidato")[0];
let checkbox = document.getElementsByClassName("cb")
let submit = document.getElementsByName("votar")[0];


// event listeners
window.addEventListener("load",get_candidato(),false);
window.addEventListener("load",get_regiones(),false);

region.addEventListener("change", get_comunas);
submit.addEventListener("click",votar);

for(i=0;i<checkbox.length;i++){
    checkbox[i].addEventListener("change",val_cb);
}

// funcion para validar digito verificador
function dv(T){
    var M=0,S=1;
    for(;T;T=Math.floor(T/10))
        S=(S+T%10*(9-M++%6))%11;
    return S?S-1:'k';
}
// funciones para validar formulario
function val_nom(){
    if(nom_apellido.value.length==0){
        document.getElementsByClassName("error_nom")[0].innerHTML = "el nombre está vacío"
        return false;
    }
    else{
        document.getElementsByClassName("error_nom")[0].innerHTML = ""
        return true;
    }
}
function val_alias(){
    let regex =  /^[A-Za-z0-9]*$/
    if( alias.value.length>=5 && regex.test(alias.value) == true){
        document.getElementsByClassName("error_alias")[0].innerHTML = ""
        return true;
    }
    else{
        document.getElementsByClassName("error_alias")[0].innerHTML = "el alias está vacío"
        return false;
    }
}
function val_rut(){
    let rutCompleto=document.getElementsByName("rut")[0].value
    rutCompleto = rutCompleto.replace("‐","-");
    if (!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/.test( rutCompleto )){
        document.getElementsByClassName("error_rut")[0].innerHTML = "rut incorrecto"
        return false;
    }
        // aqui mensaje :alert("rut incorrecto");
    var tmp 	= rutCompleto.split('-');
    var digv	= tmp[1]; 
    var rut 	= tmp[0];
    if ( digv == 'K' ) digv = 'k' ;
    
    if (dv(rut) == digv ){
        document.getElementsByClassName("error_rut")[0].innerHTML = ""
        return true;
    }else{
        document.getElementsByClassName("error_rut")[0].innerHTML = "rut incorrecto, Debe estar Sin puntos y con guión"
        return false;
    }
}
function val_email(){
    let regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
    if(regex.test(email.value) == true){
        document.getElementsByClassName("error_email")[0].innerHTML = ""
        return true;
    }
    else{
        document.getElementsByClassName("error_email")[0].innerHTML = "Email inválido"
        return false;
    }
}
function get_comunas(){
    let abr = region.value;
    if(region.value !="--"){
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange= function(){
            if(this.readyState == 4 && this.status == 200){
                comuna.innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET","requestHandler.php?tipo=comunas&abr="+abr,true);
        xmlhttp.send();
    }
    else{
        comuna.innerHTML = "";
    }
}
function val_region(){
    if(region.value != ""){
        document.getElementsByClassName("error_region")[0].innerHTML = ""
        return true;
    }
    else{
        document.getElementsByClassName("error_region")[0].innerHTML = "Seleccione una región"
        return false;
    }
    
}
function get_regiones(){
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange= function(){
        if(this.readyState == 4 && this.status == 200){
            region.innerHTML = this.responseText;
        }
    };
    xmlhttp.open("GET","requestHandler.php?tipo=regiones",true);
    xmlhttp.send();
}
function get_candidato(){
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange= function(){
        if(this.readyState == 4 && this.status == 200){
            candidato.innerHTML = this.responseText;
        }
    };
    xmlhttp.open("GET","requestHandler.php?tipo=candidatos",true);
    xmlhttp.send();
    
    
}
function val_candidato(){
    if(candidato.value != 0){
        document.getElementsByClassName("error_candidato")[0].innerHTML = ""
        return true;
    }
    else{
        document.getElementsByClassName("error_candidato")[0].innerHTML = "Debe elegir un candidato"
        return false;
    }
}
function val_cb(e){
    let check =0;
    for(i=0;i<checkbox.length;i++){
        if(checkbox[i].checked == true){
            check++;
        }
     }
     if(check>=2){
        document.getElementsByClassName("error_cb")[0].innerHTML = ""
        return true;
     }
     else{
        document.getElementsByClassName("error_cb")[0].innerHTML = "Debe marcar al menos 2 opciones"
        return false;
     }
}

function votar(e){
    e.preventDefault();
    let nom = val_nom(); // cambiar por validación de que el formulario está completo
    let alias = val_alias();
    let email = val_email();
    let rut = val_rut();
    let region = val_region();
    let candidato = val_candidato();
    let cb = val_cb();
    // crear json con valores del formulario
    if(nom  && alias && email && rut && region && candidato && cb){
        let form = JSON.stringify(crearJsonForm());
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange= function(){
            if(this.readyState == 4 && this.status == 200){
                document.getElementById("respuesta").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET","requestHandler.php?tipo=votar&form="+form,true);
        xmlhttp.send();
    }


}
function crearJsonForm(){ 
    let cb_string = "";
    for(i=0;i<checkbox.length;i++){
        if(checkbox[i].checked == true){
            cb_string.concat(checkbox[i].value)
            if(i<checkbox.length-1) cb_string.concat(",");
        }
     }
     //form.nombre = nom_apellido.value
     // no me deja colocar los values así
     return {
        nombre: nom_apellido.value,
        alias: alias.value,
        rut: rut.value,
        email: email.value,
        region: region.value,
        comuna: comuna.value,
        candidato: candidato.value,
        checkbox: cb_string   
    }
}