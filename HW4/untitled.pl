same_elements([], []).
same_elements(L1, X) :-
	permutation(L1,X).

same_elements(L1,L2) :-
	sort(L1,Sort1),
	sort(L2,Sort2),
	Sort1 == Sort2.

	clean([],Soln,Y) :- reverse(Y,Soln).
clean([H|T],Soln,Y) :- isin(H,Y),!,clean(T,Soln,Y).
clean([H|T],Soln,Y) :- clean(T,Soln,[H|Y]).

remove_duplicates(L1,L2) :- clean(L1,L2,[]). 