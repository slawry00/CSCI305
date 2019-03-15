/**
 * Spencer Lawry
 * Prolog Assignment
 * CSCI 305
 */


 people([office(hunter,_), office(laura,_), office(jim,_), office(sally,_), office(jack,_)]).
 not_adjacent(A, B) :- A =\= B + 1,  A =\= B - 1.
 /*pos_nums([Head|Tail], D, C) :- member(Head, D); Head = [],
                             \+ member(Head, Tail),
                             \+ member(Head, C),
                             pos_nums(Tail, D, append([Head],C,_)).*/
 is_num([C|D]) :- C = 1 ; C = 2 ; C = 3; C = 4; C = 5, \+(member(C,D)), (is_num(D.
 layout(X) :- people(X),
              member(office(hunter,H), X), H \= 5,
              member(office(laura,L), X), L \= 1,
              member(office(jim,J), X), J \= 1, J \= 5, not_adjacent(J,L), not_adjacent(J,Ja),
              member(office(sally,S), X), S > L,
              member(office(jack,Ja), X),
              pos_nums([H,L,J,S,Ja],[1,2,3,4,5], []).

