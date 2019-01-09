% rebase('osnova')

<h1 class="title is-3 is-spaced"> Igralci v sezoni 2017-18 pri Miami Heat </h1>

<h5 class="subtitle is-5">Seznam igralcev:</h5>
<ol>
    % for number, name, position in igralci: 
        <li>
            <a href ="/igralci/{{ number }}/">
                {{ name }} ({{ number }}.) <small>{{ position }}</small> 
            </a>
        </li>
    % end
</ol>


