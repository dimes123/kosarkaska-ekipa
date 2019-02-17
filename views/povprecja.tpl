%rebase('osnova')


<p> Tu lahko izbiraš med naslednjimi povprečji: <p/>

<form action="povpigralec/" method="get">

<h1 class="title is-3 is-spaced">Igralci:<h1/>
<select multiple name="igralci">
% for ime in vse_osebe:
    <option value="{{ime[1]}}">{{ime[1]}}</option>
% end

<br/>
<br/>
<input type="submit" value="Povprečje igralca">
<form/>

<br/>
<br/>
<a href = "http://localhost:8080/povpekipa/" class = "button">Povprečje ekipe</a>
