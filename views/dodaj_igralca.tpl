%rebase('osnova')


<h1 class = "title is-3 is-spaced"> Dodajanje igralca </h1>

% if napaka:
<div class="alert alert-danger" role="alert">
  Prišlo je do napake. Igralec ni bil dodan v bazo.
</div>
% end

<form method = 'POST' role = 'form' class = "form-horizontal">
<div class = "form-row">
    <div class = "col-xs-4 col-md-2">
        <div for = "stDresa">Stevilka</div>
        <input type = "number", class = "form-control", name = "stDresa", placeholder="Številka dresa",required>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
    <div class = "col-xs-4 col-md-2">
        <div for = "imeIgralca">Ime</div>
        <input type = "text", class = "form-control", name = "imeIgralca", placeholder="Ime igralca", required>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
    <div class = "col-xs-4 col-md-2">
        <div for = "pozicija">Pozicija</div>
            <select class="custom-select" size="1", name = "pozicija", required>
                <option value="PG">PG</option>
                <option value="SG">SG</option>
                <option value="SF">SF</option>
                <option value="PF">PF</option>
                <option value="C">C</option>
            </select>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
</div>
<div class ="form-row">
    <div class = "col-xs-4 col-md-2">
        <div for = "visina">Višina</div>
        <input type = "text", class = "form-control", name = "visina", aria-describedby = "visina" placeholder="Visina",required>
        <small id="visina" class="form-text text-muted">Višina v čevljih [ft]</small>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
    <div class = "col-xs-4 col-md-2">
        <div for = "teza">Teža</div>
        <input type = "number", class = "form-control", name = "teza", aria-describedby = "teza" placeholder="Teža", required>
        <small id="teza" class="form-text text-muted">Teža v funtih [lbs]</small>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
    <div class = "col-xs-4 col-md-2">
        <div for = "letoRojstva">LetoRojstva</div>
        <input type = "number", class = "form-control", name = "letoRojstva", placeholder = "Leto Rojstva", required>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
</div>
<button type="submit" class="btn btn-primary" value = "Submit/">Dodaj</button>
</form>
