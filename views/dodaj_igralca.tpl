%rebase('osnova')


<h1 class = "title is-3 is-spaced"> Dodajanje igralca </h1>


<form method = "POST" role = "form" action = "#">
<div class = "form-row">
    <div class = "col-xs-4 col-md-2">
        <div for = "stDresa">Stevilka</div>
        <input type = "number", class = "form-control", id = "stDresa", placeholder="Številka dresa", required>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
    <div class = "col-xs-4 col-md-2">
        <div for = "imeIgralca">Ime</div>
        <input type = "text", class = "form-control", id = "imeIgralca", placeholder="Ime igralca" value="" required>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
    <div class = "col-xs-4 col-md-2">
        <div for = "pozicija">Pozicija</div>
            <select class="custom-select" size="1">
                <option value="1">PG</option>
                <option value="2">SG</option>
                <option value="3">SF</option>
                <option value="4">PF</option>
                <option value="3">C</option>
            </select>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
</div>
<div class ="form-row">
    <div class = "col-xs-4 col-md-2">
        <div for = "visina">Višina</div>
        <input type = "text", class = "form-control", id = "visina", aria-describedby = "visina" placeholder="Visina" value="" required>
        <small id="visina" class="form-text text-muted">Višina v čevljih [ft]</small>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
    <div class = "col-xs-4 col-md-2">
        <div for = "teza">Teža</div>
        <input type = "number", class = "form-control", id = "teza", aria-describedby = "teza" placeholder="Teža" value="" required>
        <small id="teza" class="form-text text-muted">Teža v funtih [lbs]</small>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
    <div class = "col-xs-4 col-md-2">
        <div for = "letoRojstva">LetoRojstva</div>
        <input type = "text", class = "form-control", id = "letoRojstva", value="" required>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>
</div>
<button type="submit" class="btn btn-primary">Dodaj</button>
</form>
