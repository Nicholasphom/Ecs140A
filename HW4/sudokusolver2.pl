/* CPSC312 Assignment 5 */
/* Sudoku Solver 2013 */

/* For this assignment you will need to implement your 
own 9x9 Sudoku solver in SWI-Prolog.  Basically you 
have a 9x9 grid, and you must fill in the 
grid so that each row, each column, and each of 9 3x3 
grids all contain the numbers 1 through 9. */

/* You will need to fill in the sudoku predicate below, 
and also supply any helper predicates. You should think 
about what has to be true to make a sudoku table valid 
and work out how to check for each of these conditions. */

/* To test your program we will type "test." into 
SWI-Prolog and study the results. We will also attempt 
the further tests, 1, 2 and 3, if you have told us that 
they will work. (These may take too long to compute.) */

/* When marking we will be looking for solutions that 
work correctly, but we also want to see clearly commented 
code explaining what each predicate is doing. If 
your code does not work but appears to be close to the 
correct solution or your comments are along the correct 
lines, then you will receive some credit. If your code is not 
clearly commented showing an understanding of what is 
happening then you will receive considerably fewer marks
than you might have otherwise. */

% WHAT YOU NEED TO HAND IN
/* You should use handin to submit a plain text file
named 'sudoku.pl' that contains your sudoku predicate and 
any helper predicates. We should be able to run this by 
using the tests provided. The file should contain your 
names and student numbers (the collaborative learning
policy for CPSC 312 is still in effect), plus a brief 
summary of which of the tests you think will work, 
or any extra information we will need. This is important, 
because if you think that the program should work on all 
the tests, but this information is not provided in your
submission (in some place up front where we can easily
see it), then we will assume that it doesn't work. */

/* Keep in mind that you may not use the Constraint
Logic Programming features supplied by SWI-Prolog.
You are limited to what's in the Art of Prolog textbook. */

/* You must submit your solution no later than 11:59pm,
Monday, November 18, 2013. */

/* ----------- cut here ----------- */

/* 
Alex Yuen
82562109
h7p7
*/

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
harder to solve. Our first attempt at a solver did not 
find a solution in a reasonable length of time for 
any of these, so if you manage to write a solver 
that does them in a reasonable length of time, 
expect to recieve top or possibly bonus marks. (BUT 
YOU MUST TELL US THIS IN YOUR SUBMISSION OR WE WON'T 
RUN THESE TESTS.) */
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


% print suduko table
printsudoku([]).
printsudoku([H|T]) :-
	write(H),nl,
	printsudoku(T).


% Expects a list of lists 9 by 9 grid.
sudoku(L) :- worthy_row(L),
			 worthy_column(L), !,
			 worthy_box(L).

worthy_row([]).
worthy_row([H|T]) :- valid_numbers(H), diff(H), worthy_row(T). % returns true if the numbers on every row are valid and different

worthy_column([[],[],[],[],[],[],[],[],[]]).
worthy_column([[H1|T1],[H2|T2],[H3|T3],[H4|T4],[H5|T5],[H6|T6],[H7|T7],[H8|T8],[H9|T9]]) :- 
	[H1,H2,H3,H4,H5,H6,H7,H8,H9] = LT, % take the first element of each row and put it into a list (transposes the row)
	diff(LT), !, % check if the column has unique elements
	worthy_column([T1,T2,T3,T4,T5,T6,T7,T8,T9]). % check the rest of the columns for unique elements

valid_numbers([]).
valid_numbers([H|T]) :- is_valid_num(H), valid_numbers(T). % returns true if every number in the list is valid.

is_valid_num(X) :- member(X,[1,2,3,4,5,6,7,8,9]). % a number is valid if it is an integer from 1 to 9

diff([_]).
diff([H|T]) :- not(member(H,T)), diff(T). % returns true if all elements in a list are unique


% checks all 3x3 grids in the sudoku puzzle to see if the elements are unique
worthy_box([[],[],[],[],[],[],[],[],[]]).
worthy_box([[B1,B2,B3|T1],
		   [B4,B5,B6|T2],
		   [B7,B8,B9|T3],

		   [B11,B12,B13|T4],
		   [B14,B15,B16|T5],
		   [B17,B18,B19|T6],

		   [B21,B22,B23|T7],
		   [B24,B25,B26|T8],
		   [B27,B28,B29|T9]]) :- 
	[B1,B2,B3,B4,B5,B6,B7,B8,B9] = L1,
	[B11,B12,B13,B14,B15,B16,B17,B18,B19] = L2,
	[B21,B22,B23,B24,B25,B26,B27,B28,B29] = L3,
	diff(L1), !,
	diff(L2), !,
	diff(L3), !,
	worthy_box([T1,T2,T3,T4,T5,T6,T7,T8,T9]).