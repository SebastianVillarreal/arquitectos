  var url ="";
  var body ="";


   fetch(url,{
    method:'post',
        headers: {
      "Content-type": "application/x-www-form-urlencoded; charset=UTF-8"
    },
    body: "ide="+encuestaid+"&iduto="+iduto
  }
  /*
        method:'post',
        headers: {
        "Content-Type": "application/json"
        },
        body: JSON.stringify({"id_encuesta":encuestaid,"id_usuario":usuarioid,"id_usuario_to":usuarioidto,"result":result.data })
    }*/
    )  
.then(function(response) {
    if (response.status===200) {
  // Do stuff with the response
 response.json().then(function updateFromOnline(data) {
  console.log(data);
 });
}

});