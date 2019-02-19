%rebase('osnova')

<h2>Najboljši na posamezni tekmi</h2>

%if stevec == 1:
<form method = 'POST' role = 'form'>
    <div class = "form-row">
    <div class = "col-xs-3 col-md-3">
        <select class = "custom-select" size = "1" name = "izbiraEkipe">
            %for ekipa in seznamEkip:
                <option value = "{{ekipa}}">{{ekipa}}</option>
            %end
        </select>
    </div>
    <div class = "col-xs-3 col-md-3">
        <button type="submit" class="btn btn-primary" value = "Submit/">Izberi</button>
    </div>
    </div>
</form>
%end
%if stevec == 2:
<h4>Izbral si ekipo {{ekipa}}. Sedaj izberi datum.</h4>
<form method = 'POST' role = 'form'>
    <div class = "form-row">
    <div class = "col-xs-3 col-md-3">
        <select class = "custom-select" size = "1" name = "izbiraDatuma">
            %for datum in seznamDatumov:
                <option value = "{{datum}}">{{datum}}</option>
            %end
        </select>
    </div>
    <div class = "col-xs-3 col-md-3">
        <button type="submit" class="btn btn-primary" value = "Submit/">Izberi</button>
    </div>
    </div>
</form>
%end
% if stevec > 2:
<h4>Na {{datum}} proti nasportniku {{ekipa[0]}} so bili dosežki igralcev naslednji:</h4>
<h5><b>Največ točk:</b> <a href = "/igralci/{{najvecT[0]}}/">{{najvecT[2]}}</a> : <i>{{najvecT[1]}}</i></h5>
<h5><b>Največ podaj</b>: <a href = "/igralci/{{najvecP[0]}}/">{{najvecP[2]}}</a> : <i>{{najvecP[1]}}</i></h5>
<h5><b>Največ skokov</b>: <a href = "/igralci/{{najvecS[0]}}/">{{najvecS[2]}}</a> : <i>{{najvecS[1]}}</i></h5>
<h5><b>Največ ukradenih</b>: <a href = "/igralci/{{najvecU[0]}}/">{{najvecU[2]}}</a> : <i>{{najvecU[1]}}</i></h5>

<a class = "btn btn-secondary" href = "http://localhost:8080/najboljsi/">Novo iskanje</a>
% end
