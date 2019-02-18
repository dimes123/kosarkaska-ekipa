%rebase('osnova')

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

.column {
  float: left;
  width: 50%;
  padding: 10px;
}


h4 {
  margin: 15px 0;
}
</style>
</head>
<body>

<h2>{{ime}}: </h2>

<div class="row">
  <div class="column">
    <p>
      <h4> V povprečju je dosegel: </h4>
      <li>
        <b>Skoki: </b> {{avg[0]}}
      </li>
      <li> 
        <b>Podaje: </b> {{avg[1]}}
      </li>
      <li>
        <b>Ukradene žoge: </b> {{avg[2]}}
      </li>
      <li>
        <b>Točke: </b> {{avg[3]}}
      </li>
    </p>
  </div>
  <div class="column">
    <h4> Najboljši dosežek: </h4>
    <p>
      <li>
        <b>Skoki: </b> {{max[0]}}
      </li>
      <li>
        <b>Podaje: </b> {{max[1]}}
      </li>
      <li>
        <b>Ukradene žoge: </b> {{max[2]}}
      </li>
      <li>
        <b>Točke: </b> {{max[3]}}
      </li>
    </p>
  </div>
</div>

</body>
</html>