async function getEstudiante() {
    try {
       let resp = await fetch(base_url+"controllers/estudiante.php?op=listregistros");
        json = await resp.json();
        if (json.status) {
            let data = json.data;
            data.forEach((item) => {
                let newtr = document.createElement("tr");
                newtr.id = "row_"+item.idEstudiante;
                newtr.innerHTML = `
                <tr>
                    <th scope="row">${item.idEstudiante}</th>
                    <td>${item.PrimerNombre}</td>
                    <td>${item.SegundoNombre}</td>
                    <td>${item.PrimerApellido}</td>
                    <td>${item.SegundoApellido}</td>
                    <td>${item.Genero}</td>
                    <td>${item.Fecha_Nacimiento}</td>
                    <td>${item.option}</td>
                </tr>`;
              document.querySelector("#tblBodyEstudiante").appendChild(newtr);
            });
        }
       console.log (json);
    } catch (err) {
        console.log("Ocurrió un error: " +err);
    }
}

if(document.querySelector("#tblBodyEstudiante")){
    getEstudiante();
}
if (document.querySelector("#frmRestro")){
        let frmRegistro = document.querySelector("#frmRestro");
        frmRegistro.onsubmit = function(e){
        e.preventDefault();
        fntGuardar();
        }
              async function fntGuardar() {
                let strNombre = document.querySelector("#txtNombre").value;
       let strNombre1 = document.querySelector("#txtNombre1").value;
        let strApellido = document.querySelector("#txtApellido").value;
       let strApellido1 = document.querySelector("#txtApellido1").value;
       let strGenero = document.querySelector("#txtGenero").value;
       let strfechaNacimiento = document.querySelector("#txtfechaNacimiento").value;
       if (strNombre == "" || strNombre1 == "" || strApellido == "" || strApellido1 == "" || strGenero == "" || strfechaNacimiento == "") {
        alert("Todos los campos son obligatorios");
         return;
              }
              try {
                const data = new FormData(frmRegistro);
                let resp= await fetch(base_url+"controllers/estudiante.php?op=registro",{
                  method: 'POST',
                   mode:'cors',
                   cache:'no-cache',
                   body: data
              });
            
              console.log(resp);
            } catch(err){
              console.log("ocurrio un error: "+err);
            }
            }           
        
   // json = await resp.json();
     
    
    }  // Aquí puedes agregar la lógica para guardar los datos

