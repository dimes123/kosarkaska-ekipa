%rebase('osnova')

<!DOCTYPE html>
<html>
<head>
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
  img {
    width: 200px;
  }
</style>
</head>
<body>

% if slika_obstaja:
<div class="row">
  <div class="column" style="text-align: center;">
    <h4> {{ime}} </h4>
  </div>
  <div class="column">
      <img src="/static/{{id}}.png"/>
  </div>
</div>
% else: 
<h2>{{ime}} </h2>
% end

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