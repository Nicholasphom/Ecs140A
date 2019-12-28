
/* ----------- cut here ----------- */
 :-style_check(-singleton).

/* include name and student number */
% NIcholas Phomsopha
% 916223654

/* This runs all the simple tests. If it 
works correctly, you should see three identical 
and completed sudoku tables, and finally the 
word false (as test0c will fail.) */
test :-
	test0, nl,
	test0a, nl,
	test0b, nl,
	test0c.

/* This is a completly solved solution. */
test0 :-
	L = [
             [9,6,3,1,7,4,2,5,8],
             [1,7,8,3,2,5,6,4,9],
             [2,5,4,6,8,9,7,3,1],
             [8,2,1,4,3,7,5,9,6],
             [4,9,6,8,5,2,3,1,7],
             [7,3,5,9,6,1,8,2,4],
             [5,8,9,7,1,3,4,6,2],
             [3,1,7,2,4,6,9,8,5],
             [6,4,2,5,9,8,1,7,3]],
        sudoku(L),
        printsudoku(L).

/* This has a solution (the one in test0) which 
should be found very quickly. */
test0a :-
	L = [
             [9,_,3,1,7,4,2,5,8],
             [_,7,_,3,2,5,6,4,9],
             [2,5,4,6,8,9,7,3,1],
             [8,2,1,4,3,7,5,_,6],
	     [4,9,6,8,5,2,3,1,7],
             [7,3,_,9,6,1,8,2,4],
             [5,8,9,7,1,3,4,6,2],
             [3,1,7,2,4,6,9,8,5],
             [6,4,2,5,9,8,1,7,3]],
        sudoku(L),
        printsudoku(L).

/* This has a solution (the one in test0) and 
may take a few seconds to find. */
test0b :-
	L = [
             [9,_,3,1,7,4,2,5,_],
             [_,7,_,3,2,5,6,4,9],
             [2,5,4,6,_,9,_,3,1],
             [_,2,1,4,3,_,5,_,6],
             [4,9,_,8,_,2,3,1,_],
             [_,3,_,9,6,_,8,2,_],
             [5,8,9,7,1,3,4,6,2],
             [_,1,7,2,_,6,_,8,5],
             [6,4,2,5,9,8,1,7,3]],
        sudoku(L),
        printsudoku(L).

/* This one obviously has no solution (column 2 has 
two nines in it.) and it may take a few seconds 
to deduce this. */
test0c :-
	L = [
             [_,9,3,1,7,4,2,5,8],
             [_,7,_,3,2,5,6,4,9],
             [2,5,4,6,8,9,7,3,1],
             [8,2,1,4,3,7,5,_,6],
	     [4,9,6,8,5,2,3,1,7],
             [7,3,_,9,6,1,8,2,4],
             [5,8,9,7,1,3,4,6,2],
             [3,1,7,2,4,6,9,8,5],
             [6,4,2,5,9,8,1,7,3]],
        sudoku(L),
        printsudoku(L).

/* Here is an extra test for you to try. It would be
nice if your program can solve this puzzle, but it's
not a requirement. */

test0d :-
	L = [
             [9,_,3,1,_,4,2,5,_],
             [_,7,_,3,2,5,6,4,9],
             [2,5,4,6,_,9,_,3,1],
             [_,2,1,4,3,_,5,_,6],
             [4,9,_,8,_,2,3,1,_],
             [_,3,_,9,6,_,8,2,_],
             [5,8,9,7,1,3,4,6,2],
             [_,1,7,2,_,6,_,8,5],
             [6,4,2,5,_,8,1,7,3]],
        sudoku(L),
        printsudoku(L).


/* The next 3 tests are supposed to be progressively 
harder to solve. The solver we demonstrated in class
did not find a solution in a reasonable length of time for 
any of these, so if you manage to write a solver 
that does them in a reasonable length of time, 
expect to receive bonus points (what’s a reasonable
length of time?  Let’s call it 5 minutes. (BUT YOU 
MUST TELL US IN YOUR SUBMISSION THAT YOUR SOLVER
WORKS ON THESE TESTS OR WE WON'T RUN THESE TESTS
AND YOU WON’T GET THE BONUS POINTS YOU DESERVE.) */
test1 :-
	L = [
             [_,6,_,1,_,4,_,5,_],
             [_,_,8,3,_,5,6,_,_],
             [2,_,_,_,_,_,_,_,1],
             [8,_,_,4,_,7,_,_,6],
	     [_,_,6,_,_,_,3,_,_],
             [7,_,_,9,_,1,_,_,4],
             [5,_,_,_,_,_,_,_,2],
             [_,_,7,2,_,6,9,_,_],
             [_,4,_,5,_,8,_,7,_]],
        sudoku(L),
        printsudoku(L).

test2 :-
	L = [
             [_,_,4,_,_,3,_,7,_],
             [_,8,_,_,7,_,_,_,_],
             [_,7,_,_,_,8,2,_,5],
             [4,_,_,_,_,_,3,1,_],
	     [9,_,_,_,_,_,_,_,8],
             [_,1,5,_,_,_,_,_,4],
             [1,_,6,9,_,_,_,3,_],
             [_,_,_,_,2,_,_,6,_],
             [_,2,_,4,_,_,5,_,_]],
        sudoku(L),
        printsudoku(L).

test3 :-
	L = [
             [_,4,3,_,8,_,2,5,_],
	     [6,_,_,_,_,_,_,_,_],
             [_,_,_,_,_,1,_,9,4],
             [9,_,_,_,_,4,_,7,_],
             [_,_,_,6,_,8,_,_,_],
             [_,1,_,2,_,_,_,_,3],
             [8,2,_,5,_,_,_,_,_],
             [_,_,_,_,_,_,_,_,5],
             [_,3,4,_,9,_,7,1,_]],
        sudoku(L),
        printsudoku(L).


% print sudoku table
printsudoku([]).
printsudoku([H|T]) :-
	write(H),nl,
	printsudoku(T).
% 9x9 grid is only accpeted
sudoku(L) :- [R1,R2,R3,R4,R5,R6,R7,R8,R9] = L,
%obtains all 9 cols
%C2 is the second, etc.
getColumns(L,C1,C2,C3,C4,C5,C6,C7,C8,C9),
%C is a list of all columns and is used to check
% every col should have an valid value with no dupes form 1-9
C = [C1,C2,C3,C4,C5,C6,C7,C8,C9],
% subgrids are 3x3 grids, G1 is first, g2 second, etc.
%G are subgrids we used to check them, everyone contains 1-9 no repleats
getSubgrids(L,G1,G2,G3,G4,G5,G6,G7,G8,G9),
G = [G1,G2,G3,G4,G5,G6,G7,G8,G9],
% checks for duplications, 1st digit is rown number, second one is col number, 3rd is where left most subgrid is.
unique(R1,L,C,G,1,1,1), unique(R2,L,C,G,2,1,1), unique(R3,L,C,G,3,1,1),
unique(R4,L,C,G,4,1,4), unique(R5,L,C,G,5,1,4), unique(R6,L,C,G,6,1,4),
unique(R7,L,C,G,7,1,7), unique(R8,L,C,G,8,1,7), unique(R9,L,C,G,9,1,7).


% YOU NEED TO COMPLETE THIS PREDICATE, PLUS PROVIDE ANY HELPER PREDICATES BELOW.

%returns each column C1-9, C1 is leftmost
getColumns(
[[AA1, AB1, AC1, AD2, AE2, AF2, AG3, AH3, AI3],
 [BA1, BB1, BC1, BD2, BE2, BF2, BG3, BH3, BI3],
 [CA1, CB1, CC1, CD2, CE2, CF2, CG3, CH3, CI3],
 [DA4, DB4, DC4, DD5, DE5, DF5, DG6, DH6, DI6],
 [EA4, EB4, EC4, ED5, EE5, EF5, EG6, EH6, EI6],
 [FA4, FB4, FC4, FD5, FE5, FF5, FG6, FH6, FI6],
 [GA7, GB7, GC7, GD8, GE8, GF8, GG9, GH9, GI9],
 [HA7, HB7, HC7, HD8, HE8, HF8, HG9, HH9, HI9],
 [IA7, IB7, IC7, ID8, IE8, IF8, IG9, IH9, II9]],
 %c1
 [AA1,BA1,CA1,DA4,EA4,FA4,GA7,HA7,IA7],
 %c2
 [AB1,BB1,CB1,DB4,EB4,FB4,GB7,HB7,IB7],
 %c3
 [AC1,BC1,CC1,DC4,EC4,FC4,GC7,HC7,IC7],
 %c4
 [AD2,BD2,CD2,DD5,ED5,FD5,GD8,HD8,ID8],
 %c5
 [AE2,BE2,CE2,DE5,EE5,FE5,GE8,HE8,IE8],
 %c6
 [AF2,BF2,CF2,DF5,EF5,FF5,GF8,HF8,IF8],
 %c7
 [AG3,BG3,CG3,DG6,EG6,FG6,GG9,HG9,IG9],
 %c8
 [AH3,BH3,CH3,DH6,EH6,FH6,GH9,HH9,IH9],
 %c9
 [AI3,BI3,CI3,DI6,EI6,FI6,GI9,HI9,II9]
).


getSubgrids(
[[AA1, AB1, AC1, AD2, AE2, AF2, AG3, AH3, AI3],
 [BA1, BB1, BC1, BD2, BE2, BF2, BG3, BH3, BI3],
 [CA1, CB1, CC1, CD2, CE2, CF2, CG3, CH3, CI3],
 [DA4, DB4, DC4, DD5, DE5, DF5, DG6, DH6, DI6],
 [EA4, EB4, EC4, ED5, EE5, EF5, EG6, EH6, EI6],
 [FA4, FB4, FC4, FD5, FE5, FF5, FG6, FH6, FI6],
 [GA7, GB7, GC7, GD8, GE8, GF8, GG9, GH9, GI9],
 [HA7, HB7, HC7, HD8, HE8, HF8, HG9, HH9, HI9],
 [IA7, IB7, IC7, ID8, IE8, IF8, IG9, IH9, II9]],
 %g1
 [AA1,AB1,AC1,BA1,BB1,BC1,CA1,CB1,CC1],
 %g2
 [AD2,AE2,AF2,BD2,BE2,BF2,CD2,CE2,CF2],
 %g3
 [AG3,AH3,AI3,BG3,BH3,BI3,CG3,CH3,CI3],
 %g4
 [DA4,DB4,DC4,EA4,EB4,EC4,FA4,FB4,FC4],
 %g5
 [DD5,DE5,DF5,ED5,EE5,EF5,FD5,FE5,FF5],
 %g6
 [DG6,DH6,DI6,EG6,EH6,EI6,FG6,FH6,FI6],
 %g7
 [GA7,GB7,GC7,HA7,HB7,HC7,IA7,IB7,IC7],
 %g8
 [GD8,GE8,GF8,HD8,HE8,HF8,ID8,IE8,IF8],
 %g9
 [GG9,GH9,GI9,HG9,HH9,HI9,IG9,IH9,II9]
).


% constraint based function
% will take the list if its initilized 1-9, row column and grid as inputs, then pass it to other predicates.
% takes row we want to examine, list of all rows, all cols, then subgrids, ColNum,RowNum,GridNum is to keep track of what we are examining
unique([],L,C,G,RowNum,ColNum,GridNum).

unique([X|Xs],L,C,G,RowNum,ColNum,GridNum) :- 
    nonvar(X),
    pos_update(RowNum,ColNum,GridNum,NRow,NCol,NGrid),
    member(X, [1,2,3,4,5,6,7,8,9]), 
    getNonVars(Xs,Z),
    not(member(X,Z)),
    unique(Xs,L,C,G,NRow,NCol,NGrid).


/*
X is a variable, update pos as usual and get all of x possible in our row col and subgrid constraints, X is first element
of this list fo first passthrough and backtrack if neccesary
*/
unique([X|Xs],L,C,G,RowNum,ColNum,GridNum) :- 
    var(X),
    pos_update(RowNum, ColNum,GridNum, NRow, NCol,NGrid),
    getPossibleValues(L,C,G,RowNum,ColNum,GridNum,Poss),
    member(X, Poss),
    unique(Xs,L,C,G,NRow,NCol,NGrid).


% this increments col position and grid position, it is neccesary since i ran no_dups on the rows, grid number is always incremented, when we run constraints
% we always get the correct cols and grids
pos_update(RowNum, ColNum, GridNum, RowNum, NewColNum, NewGridNum) :-
        NewColNum is ColNum + 1, ((NewColNum =:= 4, NewGridNum is GridNum + 1);
                                 (NewColNum =:= 7, NewGridNum is GridNum + 1);
                                 (NewColNum \=4, NewColNum \= 7, NewGridNum is GridNum)).


/*
gets unset possible values for row and column and subgrid, when we remove all values in them the solver will run quicker, less backtracking
super fast.

*/                         
getPossibleValues(L,C,G,RowNum,ColNum,GridNum,Z) :-
    elem_get(L,RowNum, Row),
    diff_set([1,2,3,4,5,6,7,8,9], Row, I1),
    elem_get(C, ColNum, Col),
    diff_set(I1, Col, I2),
    elem_get(G, GridNum, Grid),
    diff_set(I2, Grid, Z).
    

elem_get([H|T],1,Row) :- getNonVars(H,Row).
elem_get([H|T], RowNum,Row) :- NewRowNum is RowNum - 1, elem_get(T, NewRowNum,Row).


% takes the set difference of first and second list

diff_set([X|Xs], Ys, [X|Zs]) :- not(member(X, Ys)), diff_set(Xs, Ys, Zs).
diff_set([X|Xs], Ys, Zs) :- member(X, Ys), diff_set(Xs,Ys,Zs).
diff_set([], Ys, []).  


% all elements gets put into this list

getNonVars([],[]).
getNonVars([X|Xs], Ys) :- var(X), getNonVars(Xs,Ys).
getNonVars([X|Xs], [X|Ys]) :- nonvar(X), getNonVars(Xs,Ys).