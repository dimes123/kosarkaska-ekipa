%rebase('osnova')


<h1 class = "title is-3 is-spaced"> Dodajanje igralca </h1>


<div class = "form-row">
    <div class = "col-md-6">
        % if napaka:
        <div class="alert alert-danger" role="alert">
            Prišlo je do napake. Številko {{st}} že ima {{ime}} na svojem dresu.
        </div>
        % end
    </div>
</div>

<form method = 'POST' role = 'form' class = "form-horizontal">
<div class = "form-row">
    <div class = "col-xs-4 col-md-2">
        <div for = "stDresa">Stevilka</div>
        <input type = "number", class = "form-control", name = "stDresa", placeholder="Številka dresa",required>
    </div>
    <div class = "col-xs-4 col-md-2">
        <div for = "imeIgralca">Ime</div>
        %if not napaka:
        <input type = "text", class = "form-control", name = "imeIgralca", placeholder="Ime igralca", required>
        %else:
        <input type = "text", class = "form-control", name = "imeIgralca", placeholder="Ime igralca", value = {{imeIgralca}} required>
        %end
    </div>
    <div class = "col-xs-4 col-md-2">
        <div for = "pozicija">Pozicija</div>
                %if not napaka:
                    <select class="custom-select" size="1", name = "pozicija", required>
                        <option value="PG">PG</option>
                        <option value="SG">SG</option>
                        <option value="SF">SF</option>
                        <option value="PF">PF</option>
                        <option value="C">C</option>
                    </select>
                %else:
                    <select class="custom-select" size="1", name = "pozicija", value = "{{ pozicija }}" required>
                        <option hidden value={{ pozicija }}>{{ pozicija }}</option>
                        <option name="PG" value="PG">PG</option>
                        <option name="SG" value="SG">SG</option>
                        <option name="SF" value="SF">SF</option>
                        <option name="PF" value="PF">PF</option>
                        <option name="C" value="C">C</option>
                    </select>
                %end
    </div>
</div>
<div class ="form-row">
    <div class = "col-xs-4 col-md-2">
        <div for = "visina">Višina</div>
        %if not napaka:
        <input type = "text", class = "form-control", name = "visina", aria-describedby = "visina" placeholder="Visina",required>
        %else:
        <input type = "text", class = "form-control", name = "visina", aria-describedby = "visina", value = {{visina}} placeholder="Visina",required>
        %end
        <small id="visina" class="form-text text-muted">Višina v čevljih [ft]</small>
    </div>
    <div class = "col-xs-4 col-md-2">
        <div for = "teza">Teža</div>
        %if not napaka:
        <input type = "number", class = "form-control", name = "teza", aria-describedby = "teza" placeholder="Teža", required>
        %else:
        <input type = "number", class = "form-control", name = "teza", aria-describedby = "teza", value = {{teza}} required>
        %end
        <small id="teza" class="form-text text-muted">Teža v funtih [lbs]</small>
    </div>
    <div class = "col-xs-4 col-md-2">
        <div for = "letoRojstva">LetoRojstva</div>
        %if not napaka:
        <input type = "number", class = "form-control", name = "letoRojstva", placeholder = "Leto Rojstva", required>
        %else:
        <input type = "number", class = "form-control", name = "letoRojstva", value = {{letoRojstva}} required>
        %end
    </div>
</div>
<br>
<button type="submit" class="btn btn-primary" value = "Submit/">Dodaj</button>
</form>
