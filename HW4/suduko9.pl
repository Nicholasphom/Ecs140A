solve([
	A1, B1, C1, D1, E1, F1, G1, H1, I1,
	A2, B2, C2, D2, E2, F2, G2, H2, I2,
	A3, B3, C3, D3, E3, F3, G3, H3, I3,
	A4, B4, C4, D4, E4, F4, G4, H4, I4,
	A5, B5, C5, D5, E5, F5, G5, H5, I5,
	A6, B6, C6, D6, E6, F6, G6, H6, I6,
	A7, B7, C7, D7, E7, F7, G7, H7, I7,
	A8, B8, C8, D8, E8, F8, G8, H8, I8,
	A9, B9, C9, D9, E9, F9, G9, H9, I9]):-
	%it would be possible to create functions to split the puzzle into
	%rows, columns and blocks but honestly, it is not worth it.
	R1 = [A1, B1, C1, D1, E1, F1, G1, H1, I1],
	R2 = [A2, B2, C2, D2, E2, F2, G2, H2, I2],
	R3 = [A3, B3, C3, D3, E3, F3, G3, H3, I3],
	R4 = [A4, B4, C4, D4, E4, F4, G4, H4, I4],
	R5 = [A5, B5, C5, D5, E5, F5, G5, H5, I5],
	R6 = [A6, B6, C6, D6, E6, F6, G6, H6, I6],
	R7 = [A7, B7, C7, D7, E7, F7, G7, H7, I7],
	R8 = [A8, B8, C8, D8, E8, F8, G8, H8, I8],
	R9 = [A9, B9, C9, D9, E9, F9, G9, H9, I9],
	
	Col1 = [A1, A2, A3, A4, A5, A6, A7, A8, A9],
	Col2 = [B1, B2, B3, B4, B5, B6, B7, B8, B9],
	Col3 = [C1, C2, C3, C4, C5, C6, C7, C8, C9],
	Col4 = [D1, D2, D3, D4, D5, D6, D7, D8, D9],
	Col5 = [E1, E2, E3, E4, E5, E6, E7, E8, E9],
	Col6 = [F1, F2, F3, F4, F5, F6, F7, F8, F9],
	Col7 = [G1, G2, G3, G4, G5, G6, G7, G8, G9],
	Col8 = [H1, H2, H3, H4, H5, H6, H7, H8, H9],
	Col9 = [I1, I2, I3, I4, I5, I6, I7, I8, I9],
	
	Block1 = [A1,B1,C1,A2,B2,C2,A3,B3,C3],
	Block2 = [D1,E1,F1,D2,E2,F2,D3,E3,F3],
	Block3 = [G1,H1,I1,G2,H2,I2,G3,H3,I3],
	Block4 = [A4,B4,C4,A5,B5,C5,A6,B6,C6],
	Block5 = [D4,E4,F4,D5,E5,F5,D6,E6,F6],
	Block6 = [G4,H4,I4,G5,H5,I5,G6,H6,I6],
	Block7 = [A7,B7,C7,A8,B8,C8,A9,B9,C9],
	Block8 = [D7,E7,F7,D8,E8,F8,D9,E9,F9],
	Block9 = [G7,H7,I7,G8,H8,I8,G9,H9,I9],
	
	%collect all rows, columns, blocks in a single list
	AllLists = [R1, R2, R3, R4, R5, R6, R7, R8, R9,
				Col1,Col2, Col3, Col4, Col5, Col6, Col7, Col8, Col9, 
				Block1, Block2, Block3, Block4, Block5, Block6,Block7,Block8,Block9],
	fill_loop(AllLists).

fill_loop(AllLists):-
	get_varcount(AllLists, VarCountKeyList),
	sort(2,@=<,VarCountKeyList,SortedOnVarCount),
	fill_them(SortedOnVarCount),
	(not(all_filled(AllLists)) -> 
	fill_loop(AllLists); true).

%all_filled(-ListOfLists):- true if all lists have 0 var members
all_filled([]).
all_filled([List|Rest]):-
	count_vars(List,0), all_filled(Rest).
	
%count_vars(-List,+VarCount):- true if VarCount matches the amount of unitialised list members
count_vars([],0).
count_vars([X|T],N):- var(X), count_vars(T,N1), N is N1 + 1,!.
count_vars([X|T],N):- nonvar(X), count_vars(T,N).
	
%get_varcount(?ListOfLists, ?TupleList):- true if TupleList is a list of tuples containing all Lists with their varcount
get_varcount([],[]).
get_varcount([List|Rest],[[List,Count]|T]):-
	count_vars(List,Count),
	get_varcount(Rest,T).
	
%fill_them(ListOfLists):- true if all lists have 0 uninitialised members or if the first non-0 list can be filled
fill_them([]).
fill_them([[_,0]|T]):-
	fill_them(T).
fill_them([[L,A]|_]):-
	A =\= 0,
	fill_one_to_nine(L).

%helper

%helper function, because otherwise we will get all subsets and its permutations 
permut([],[]).
permut([H|T],L):- permut(T,L1),sel(H,L,L1).

sel(X,[X|T],T).
sel(X,[Y|T],[Y|T2]):- sel(X,T,T2).

%fill_one_to_nine(L):- permut([1,2,3,4,5,6,7,8,9],L).

fill_one_to_nine(L):-
	find_nonvars(L,NVars), find_vars(NVars,Vars),!,permut(Vars,M), fill_one_to_nine(L,M).

fill_one_to_nine(_,[]):- !.
fill_one_to_nine([A|T],M):- nonvar(A), fill_one_to_nine(T,M).
fill_one_to_nine([X|T],[X|T2]):- fill_one_to_nine(T,T2).

find_nonvars([],[]).
find_nonvars([A|T],[A|T2]):- nonvar(A),find_nonvars(T,T2),!.
find_nonvars([A|T],T2):- var(A),find_nonvars(T,T2).

find_vars(L,M):-
	find_vars(L,[1,2,3,4,5,6,7,8,9],M),!.
find_vars([],L,L).
find_vars([X|T],L,Vars):-
	sel(X,L,M), find_vars(T,M,Vars).




%% sudoku writer

write_sudoku(L):-
	write_row(L,L1), 
	write_row(L1,L2),
	write_row(L2,L3),
	write('- - - + - - - + - - -'),nl,
	write_row(L3,L4),
	write_row(L4,L5),
	write_row(L5,L6),
	write('- - - + - - - + - - -'),nl,
	write_row(L6,L7),
	write_row(L7,L8),
	write_row(L8,[]),nl.
	
write_row([A,B,C,D,E,F,G,H,I|T],T):-
	format('~d ~d ~d | ~d ~d ~d | ~d ~d ~d',[A,B,C,D,E,F,G,H,I]),nl.


%% solver

main(X):-
	puzzle(X,L),get_time(Start), solve(L),write_sudoku(L), get_time(End), Time is End-Start, 
	format('It took ~f seconds to solve the sudoku', [Time]),!.

%Should succeed in any case
puzzle(1,L):-
	L = [
	3, 9, 1, 2, 8, 6, 5, 7, 4,
	4, 8, 7, 3, 5, 9, 1, 2, 6,
	6, 5, 2, 7, 1, 4, 8, 3, 9,
	8, 7, 5, 4, 3, 1, 6, 9, 2,
	2, 1, 3, 9, 6, 7, 4, 8, 5,
	9, 6, 4, 5, 2, 8, 7, 1, 3,
	1, 4, 9, 6, 7, 3, 2, 5, 8,
	5, 3, 8, 1, 4, 2, 9, 6, 7,
	7, 2, 6, 8, 9, 5, 3, 4, 1
	].
	
%very easy
puzzle(2,L):-
	L= [
	_, 2, _, 4, 5, 6, 7, 8, 9,
	4, 5, 7, _, 8, _, 2, 3, 6,
	6, 8, 9, 2, 3, 7, _, 4, _,
	_, _, 5, 3, 6, 2, 9, 7, 4,
	2, 7, 4, _, 9, _, 6, 5, 3,
	3, 9, 6, 5, 7, 4, 8, _, _,
	_, 4, _, 6, 1, 8, 3, 9, 7,
	7, 6, 1, _, 4, _, 5, 2, 8,
	9, 3, 8, 7, 2, 5, _, 6, _
	].

%medium level
%old record ~2500 seconds
%new record 0.3 seconds
puzzle(3,L):-
	L = [
	_, _, 6, 	_, 1, _, 	2, _, _,
	_, _, 1, 	_, _, 6,	_, 7, 8,
	_, _, 3, 	2, _, _,	_, _, _,
	
	_, 8, _, 	5, 9, _, 	_, 2, _,
	_, 9, _,	6, 2, 4, 	_, 1, _,
	_, 6, _, 	_, 8, 1,	_, 9, _,
	
	_, _, _, 	_, _, 8, 	4, _, _,
	6, 3, _, 	1, _, _, 	5, _, _,
	_, _, 8, 	_, 7, _, 	1, _, _
	].
	
%insane level
%2.33 seconds
puzzle(4,L):-
	L = [
	_, _, 7,	_, _, _,	_, 8, 5,
	_, _, _,	4, 5, _,	1, _, 7,
	_, 1, 5,	_, _, 6,	_, 4, _,
	
	_, _, _,	_, 1, _,	_, 7, 4,
	_, _, _,	_, _, _,	_, _, _,
	1, 3, _,	_, 9, _,	_, _, _,
	
	_, 5, _,	8, _, _,	3, 6, _,
	4, _, 9,	_, 3, 5,	_, _, _,
	3, 8, _, 	_, _, _,	4, _, _
	].

puzzle(5,L) :-
	L = [
             [_,4,3,_,8,_,2,5,_],
	     [6,_,_,_,_,_,_,_,_],
             [_,_,_,_,_,1,_,9,4],
             [9,_,_,_,_,4,_,7,_],
             [_,_,_,6,_,8,_,_,_],
             [_,1,_,2,_,_,_,_,3],
             [8,2,_,5,_,_,_,_,_],
             [_,_,_,_,_,_,_,_,5],
             [_,3,4,_,9,_,7,1,_]].