<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="scripts/main.js"></script>
<title>Asiakkaiden listaus</title>
<style>
.oikealle{
	text-align: right;
}
</style>
</head>
<body onkeydown="tutkiKey(event)">
<table class="w3-table-all w3-hoverable" id="listaus">
	<thead>	
		<tr class="w3-pale-red">
			<th colspan="5" id="ilmo"></th>
			<th><a id="uusiAsiakas" href="lisaaasiakasnative.jsp">Lisää uusi asiakas</a></th>
		</tr>	
		<tr class="w3-pale-red">
			<th class="oikealle">Hakusana:</th>
			<th colspan="4"><input type="text" id="hakusana"></th>
			<th><input class="w3-button w3-pale-blue" type="button" value="hae" id="hakunappi" onclick="haeTiedot()"></th>
		</tr>			
		<tr class="w3-pale-green">
			<th>Asiakas_id</th>
			<th>Etunimi</th>
			<th>Sukunimi</th>
			<th>Puhelin</th>
			<th>Sposti</th>
			<th></th>							
		</tr>
	</thead>
	<tbody id="tbody">
	</tbody>
</table>
<script>
haeTiedot();	
document.getElementById("hakusana").focus();
function tutkiKey(event){
	if(event.keyCode==13){
		haeTiedot();
	}		
}

function haeTiedot(){	
	document.getElementById("tbody").innerHTML = "";
	fetch("Asiakkaat/" + document.getElementById("hakusana").value,{
	      method: 'GET'
	    })
	.then(function (response) {
		return response.json()	
	})
	.then(function (responseJson) {		
		console.log(responseJson);
		
		var asiakkaat = responseJson.asiakkaat;	
		var htmlStr="";
		for(var i=0;i<asiakkaat.length;i++){			
        	htmlStr+="<tr>";
        	htmlStr+="<td>"+asiakkaat[i].asiakas_id+"</td>";
        	htmlStr+="<td>"+asiakkaat[i].etunimi+"</td>";
        	htmlStr+="<td>"+asiakkaat[i].sukunimi+"</td>";
        	htmlStr+="<td>"+asiakkaat[i].puhelin+"</td>";
        	htmlStr+="<td>"+asiakkaat[i].sposti+"</td>";  
        	htmlStr+="<td><a href='muutaasiakasnative.jsp?asiakas_id="+asiakkaat[i].asiakas_id+"'>Muuta</a>&nbsp;";
        	htmlStr+="<span class='poista' onclick=poista('"+asiakkaat[i].asiakas_id+"')>Poista</span></td>";
        	htmlStr+="</tr>";        	
		}
		document.getElementById("tbody").innerHTML = htmlStr;		
	})	
}


function poista(asiakas_id){
	if(confirm("Poista asiakas " + asiakas_id +"?")){	
		fetch("Asiakkaat/"+ asiakas_id,{
		      method: 'DELETE'		      	      
		    })
		.then(function (response) {
			return response.json()
		})
		.then(function (responseJson) {	
			var vastaus = responseJson.response;		
			if(vastaus==0){
				document.getElementById("ilmo").innerHTML= "Asiakkaan poisto epäonnistui.";
	        }else if(vastaus==1){	        	
	        	document.getElementById("ilmo").innerHTML="Asiakkaan " + asiakas_id +" poisto onnistui.";
				haeTiedot();        	
			}	
			setTimeout(function(){ document.getElementById("ilmo").innerHTML=""; }, 5000);
		})		
	}	
}
</script>
</body>
</html>