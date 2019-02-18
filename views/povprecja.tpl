%rebase('osnova')


<p> Tu lahko izbiraš med naslednjimi povprečji: <p/>

<form action="povpigralec/" method="get">

  <div class="form-group">
    <label for="exampleSelect1">Igralci:</label>
    <select class="form-control", name='igralci'>
    % for ime in vse_osebe:
        <option value="{{ime[1]}}">{{ime[1]}}</option>
    % end
    </select>
  </div>
<input type="submit" value="Povprečje igralca" class="btn btn-primary">
<form/>

 