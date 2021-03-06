% rebase('osnova')
<head>
<script src = "/static/sorttable.js"></script>
    <style>
    table {
      width:80%;
    }
    table td, table th {
      border: 1px solid black;
      text-align: center;
    }
    * {
      box-sizing: border-box;
    }

    .column {
      float: left;
      width: 40%;
      padding: 10px;
    }
    </style>
</head>

<body>
<h1 class="title is-3 is-spaced"> {{podatki_o_igralcu[1]}} </h1>


% if slika_obstaja:
<div class="row">
  <div class="column">
    <p>
        <img src="/static/{{id}}.png" width="50%" height="50%"/>
    </p>
  </div>
  <div class="column" style="align:left;">
    <h4> Podatki o igralcu: </h4>
    <p>
        <ol>
            <li>
                <b>Številka</b>: {{podatki_o_igralcu[0]}}
            </li>
            <li>
                <b>Višina</b>: {{podatki_o_igralcu[3]}} 
            </li>
            <li>
                <b>Teža</b>: {{podatki_o_igralcu[4]}} pounds
            </li>
            <li>
                <b>Leto rojstva</b>: {{podatki_o_igralcu[5]}}
            </li>
        </ol>
    </p>
    <div > 
        <form method = 'POST' role = 'form' class = "form-horizontal">
            <button type="submit" class="btn btn-danger" value = "Submit/">Odstrani</button>
        </form>
    </div>
  </div>
</div>
%else:
<h4> Podatki o igralcu: </h4>
    <p>
        <ol>
            <li>
                <b>Številka</b>: {{podatki_o_igralcu[0]}}
            </li>
            <li>
                <b>Višina</b>: {{podatki_o_igralcu[3]}} 
            </li>
            <li>
                <b>Teža</b>: {{podatki_o_igralcu[4]}} pounds
            </li>
            <li>
                <b>Leto rojstva</b>: {{podatki_o_igralcu[5]}}
            </li>
        </ol>
    </p>
    <form method = 'POST' role = 'form' class = "form-horizontal">
            <button type="submit" class="btn btn-danger" value = "Submit/">Odstrani</button>
    </form>
% end

<br />
<h2 class="title is-3 is-spaced" >Statistika igralca</h2>
<table class="table table-hover table-sortable">
<thead class="thead-dark">
<tr>
    <th>Datum</th>
    <th>Nasprotnik</th>
    <th>Skoki</th>
    <th>Podaje</th>
    <th>Ukradene žoge</th>
    <th>Točke</th>
</tr>
</thead>
    %for tekma in seznam_tekem:
    <tr>
    <td>{{tekma[1]}}</td>
    <td>{{tekma[7]}}</td>
    <td>{{tekma[2]}}</td>
    <td>{{tekma[3]}}</td>
    <td>{{tekma[4]}}</td>
    <td>{{tekma[5]}}</td>
    </tr>
    %end
</table>
</body>