<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<table class="w3-table-all w3-hoverable" id="listaus">
	<thead>			
		<tr class="w3-pale-red">
		<th>Hakusana: </th>
		<th colspan="3"><input type="text " id="hakusana"></th>
		<th><input class="w3-button w3-pale-blue" type="button" value="hae" id="nappula"></th>	
		<tr class="w3-pale-green">
			<th>Asiakas_id</th>
			<th>Etunimi</th>
			<th>Sukunimi</th>
			<th>Puhelin</th>	
			<th>Sposti</th>						
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<script>

	
	$(document).ready(function(){
		haeAsiakkaat();
		
		
		$("#nappula").click(function(){		
			haeAsiakkaat();
		});
		$(document.body).on("keydown", function(event){
			 if(event.which==13){ 
				  haeAsiakkaat();
			  }});
	});
	
	

	
	
	
	

   

function haeAsiakkaat(){
	$("#listaus tbody").empty();
	$.ajax({url:"Asiakkaat/"+$("#hakusana").val(), type:"GET", dataType:"json", success:function(result){	
		$.each(result.asiakkaat, function(i, field){  
        	var htmlStr;
        	htmlStr+="<tr>";
        	htmlStr+="<td>"+field.asiakas_id+"</td>";
        	htmlStr+="<td>"+field.etunimi+"</td>";
        	htmlStr+="<td>"+field.sukunimi+"</td>";
        	htmlStr+="<td>"+field.puhelin+"</td>";
        	htmlStr+="<td>"+field.sposti+"</td>";  
        	
        	htmlStr+="</tr>";
        	$("#listaus tbody").append(htmlStr);
        });	
    }});
	
}

</script>
</body>
</html>