% rebase('osnova')
<!-- head -->
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
  h1{
    text-align: center;
  }
  * {
  box-sizing: border-box;
  }

  .column {
    float: left;
    width: 20%;
    padding: 10px;
  }
  </style>
</head>
<!-- head -->

<!-- body -->
<body>
<h1> {{podatki_o_ekipi[2]}} </h1>
<div class="row">
  <div class="column">
    <p>
      <img src="/static/ErikSpoelstra.png" style="width:200px;height:200px;">
    </p>
  </div>
  <div class="column" style="align:left;">
    <h4> Podatki o ekipi: </h4>
    <p>
      <li>
          <b>Trener</b>: {{podatki_o_ekipi[1]}}
      </li>
      <li>
          <b>Kratica</b>: {{podatki_o_ekipi[0]}} 
      </li>
    </p>
  </div>
</div>

<br/>

<h2>Igralci</h2>
<table class="table table-hover table-sortable">
<thead class="thead-dark">
<tr>
    <th>Ime</th>
    <th>Številka dresa</th>
    <th>Pozicija</th>
</tr>
</thead>
    %for igralec in seznam_igralcev:
    <tr>
    <td>{{igralec[1]}}</td>
    <td>{{igralec[0]}}</td>
    <td>{{igralec[2]}}</td>
    </tr>
    %end
</table>
<br/>
<br/>


<form action="tekme/" method="get">

<h2>Tekme med dvema datumoma</h2>
<center>

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

<input type="submit" value="Prikaži tekme"  class="btn btn-primary">

</center>
</form>

</body>
<!-- body -->