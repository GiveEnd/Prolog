% генерация списка заданной длины из диапазона [Min, Max]
generate_list(0, _, _, []) :- !.
generate_list(N, Min, Max, [H|T]) :-
    between(Min, Max, H),  % перебор числа из диапазона
    N1 is N - 1,          % уменьшение длины
    generate_list(N1, Min, Max, T).

% проверка на палиндром
is_palindrome(List) :-
    reverse(List, List).  % список равен своему перевернутому виду

% генерация всех списков палиндромов
generate_palindromes(Length, Min, Max, Palindrome) :-
    generate_list(Length, Min, Max, List),
    is_palindrome(List),                    
    Palindrome = List.                      
