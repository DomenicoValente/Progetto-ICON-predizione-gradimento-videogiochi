% Esperienza dello sviluppatore

% Altro è un gioco dello stesso sviluppatore di G, uscito prima di G
gioco_precedente_dev(G, Altro) :-
    sviluppato_da(G, Dev),
    sviluppato_da(Altro, Dev),
    Altro \= G,
    uscita(G, Data),
    uscita(Altro, DataAltro),
    DataAltro < Data.

% N = numero di giochi precedenti (distinti) dello sviluppatore di G
n_giochi_precedenti_dev(G, N) :-
    findall(Altro, gioco_precedente_dev(G, Altro), Lista),
    sort(Lista, Unici),
    length(Unici, N).

% Esperienza del publisher 

gioco_precedente_pub(G, Altro) :-
    pubblicato_da(G, Pub),
    pubblicato_da(Altro, Pub),
    Altro \= G,
    uscita(G, Data),
    uscita(Altro, DataAltro),
    DataAltro < Data.

n_giochi_precedenti_pub(G, N) :-
    findall(Altro, gioco_precedente_pub(G, Altro), Lista),
    sort(Lista, Unici),
    length(Unici, N).

% Autopubblicazione

% G è autopubblicato se lo stesso soggetto è sviluppatore e publisher
autopubblicato(G) :-
    sviluppato_da(G, D),
    pubblicato_da(G, D).