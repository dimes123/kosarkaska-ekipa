% rebase('osnova')
<head>
<script src = "/static/sorttable.js"></script>
<style>
table
{
    width:80%;
}
table td, table th {
  border: 1px solid black;
  text-align: center;
}
h2 {
    text-align: center;
}

</style>
</head>

<body>
<h1 class = "title is-3 is-spaced"> {{podatki_o_ekipi[2]}} </h1>
<li>
    <b>Trener</b>: {{podatki_o_ekipi[1]}}
</li>
<li>
    <b>Kratica</b>: {{podatki_o_ekipi[0]}} 
</li>

<br/>
<h2 class="title is-3 is-spaced">Igralci</h2>
<table class="sortable">
<tr>
    <th>Ime</th>
    <th>Številka dresa</th>
    <th>Pozicija</th>
</tr>
    %for igralec in seznam_igralcev:
    <tr>
    <td>{{igralec[1]}}</td>
    <td>{{igralec[0]}}</td>
    <td>{{igralec[2]}}</td>
    </tr>
    %end
</table>
<br/>
<center> Če želiš natančnejše podatke o posameznem igralcu, si jih poglej na osnovni strani. <center/>

<br/>

<h2 class="title is-3 is-spaced">Tekme med dvema datumoma</h2>


<form action="tekme/" method="get">
<div>
<div class="form-group row">
  <label for="example-date-input" class="col-2 col-form-label">Začetni datum:</label>
  <div class="col-2.5">
    <input type="date", class = "form-control", name="zacetek", min="2017-10-18", max="2018-04-11", value="2017-10-18", required>
  </div>
</div>
<div class="form-group row">
  <label for="example-date-input", class="col-2 col-form-label">Končni datum:</label>
  <div class="col-2.5">
    <input type="date", class = "form-control", name="konec", min="2017-10-18", max="2018-04-11", value="2018-04-11", required>
  </div>
</div>

<center>
<input type="submit" value="Prikaži tekme"  class="btn btn-primary">
</center>
</form>


</body>