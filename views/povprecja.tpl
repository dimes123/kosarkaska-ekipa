%rebase('osnova')


<p> Izberi igralca za akterega želiš dobiti povprečja: </p>

<form action="povpigralec/" method="get">

  <label for="exampleSelect1">Igralci:</label>
  <div class = "form-row">
    <div class = "col-xs-3 col-md-3">
        <select class="form-control", name='igralci'>
        % for ime in vse_osebe:
            <option value="{{ime[1]}}">{{ime[1]}}</option>
        % end
        </select>
    </div>
    <div class = "col-xs-3 col-md-3">
        <input type="submit" value="Povprečje igralca" class="btn btn-primary">
    </div>
  </div>
<form/>

 