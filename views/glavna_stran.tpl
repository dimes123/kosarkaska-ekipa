% rebase('osnova')
<head>
  <script src = "/static/sorttable.js"></script>
  <style>
    div{
      margin-bottom: 10px;
    }
  </style>
</head>

<body>
<p>
Na voljo vam je {{ st_tekem }} tekem iz sezone 2017-18, v katerih je igrala košarkarska ekipa Miami Heat.
</p>
<p>
Izbirate lahko med {{ st_igralcev }}-imi rednimi igralci v tej sezoni, kjer je za vsakega od njih statistika na vsaki od tekem.
</p>
</br>

<h2 class="title is-5 is-spaced"">Izbire:</h2>
<br/>
<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
  <div class="btn-group  mr-4" role="group" aria-label="First group">
    <a href="http://localhost:8080/igralci/" class="btn btn-secondary" role="button" aria-pressed="true">Prikaži podatke o igralcih</a>
    <a href="http://localhost:8080/ekipa/" class="btn btn-secondary" role="button" aria-pressed="true">Prikaži podatke o ekipi</a>
  </div>
  <div class="btn-group  mr-4" role="group" aria-label="Third group">
    <a href="http://localhost:8080/povprecja/" class="btn btn-secondary" role="button" aria-pressed="true">Povprečja</a>
  </div>
  <div class="btn-group  mr-4" role="group" aria-label="Forth group">
    <a href="http://localhost:8080/naj_igralec/" class="btn btn-secondary" role="button" aria-pressed="true">Najboljši igralec</a>
  </div>
  <div class="btn-group  mr-4" role="group" aria-label="Fifth group">
    <a href="http://localhost:8080/dodaj_igralca/" class="btn btn-secondary" role="button" aria-pressed="true">Dodajanje igralca</a>
  </div>
</div>
<div>
<a class = "btn btn-primary" href = "http://localhost:8080/najboljsi/">Najboljsi igralec</a>
</div>



</body>