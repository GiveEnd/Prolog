% Факты о людях и сменах
works_day(mary).
works_day(suzy).
works_day(jane).

works_evening(sam).
works_evening(jane).
works_evening(bob).
works_evening(patricia).

% Знание друг друга
knows(X, Y) :- works_day(X), works_day(Y), X \= Y.
knows(X, Y) :- works_evening(X), works_evening(Y), X \= Y.
