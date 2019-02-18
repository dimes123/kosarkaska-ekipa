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

<h1 class="title is-3 is-spaced"">Izbire:</h1>
<div>
    <a class = "btn btn-primary" href = "http://localhost:8080/igralci/">Prikaži podatke o igralcih</a>
</div>
<div>
    <a class = "btn btn-primary" href = "http://localhost:8080/ekipa/">Prikaži podatke o ekipi</a>
</div>
<div>
        <a class = "btn btn-primary" href = "http://localhost:8080/povprecja/">Povprečja</a>
</div>
<div>
    <a class = "btn btn-primary" href = "http://localhost:8080/naj_igralec/">Najboljši igralec</a>
</div>
<div>
<a class = "btn btn-primary" href = "http://localhost:8080/dodaj_igralca/">Dodajanje igralca</a>
</div>

</body>