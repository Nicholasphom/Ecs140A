%%% Sudoku Puzzle Solution %%%
solve_sudoku(Cells):-
 
  % Declare the 4x4 Sudoku Puzzle Board as Cells
  % where Rows are defined by [A-D] and Columns by [1-4]
  Cells =
  [
      [A1,A2,A3,A4],
      [B1,B2,B3,B4],
      [C1,C2,C3,C4],
      [D1,D2,D3,D4]
  ],

  % Define Bounds for Cell Values
   
  Possible = [1,2,3,4],
 
  % Select consistent values for first row (A1-A4)
 
  pick_value(Possible,Possible, A1, RowA_234, Col1_BCD),
  pick_value(RowA_234,Possible, A2, RowA__34, Col2_BCD),
  pick_value(RowA__34,Possible, A3, RowA___4, Col3_BCD),
  pick_value(RowA___4,Possible, A4, _RowA___, Col4_BCD),
 
  % Select consistent values for second row (B1-B4)
   
  pick_value(Possible,Col1_BCD, B1, RowB_234, Col1__CD), not(A2=B1),
  pick_value(RowB_234,Col2_BCD, B2, RowB__34, Col2__CD), not(A1=B2),
  pick_value(RowB__34,Col3_BCD, B3, RowB___4, Col3__CD), not(A4=B3),
  pick_value(RowB___4,Col4_BCD, B4, _RowB___, Col4__CD), not(A3=B4),

  % Select consistent values for third row (C1-C4)
   
  pick_value(Possible,Col1__CD, C1, RowC_234, Col1___D),
  pick_value(RowC_234,Col2__CD, C2, RowC__34, Col2___D),
  pick_value(RowC__34,Col3__CD, C3, RowC___4, Col3___D),
  pick_value(RowC___4,Col4__CD, C4, _RowC___, Col4___D),

  % Select consistent values for fourth row (D1-D4)
   
  pick_value(Possible,Col1___D, D1, RowD_234, _), not(C2=D1),
  pick_value(RowD_234,Col2___D, D2, RowD__34, _), not(C1=D2),
  pick_value(RowD__34,Col3___D, D3, RowD___4, _), not(C4=D3),
  pick_value(RowD___4,Col4___D, D4, _RowD___, _), not(C3=D4),

  true.

%%% Pick a value Val from the set of possible RowVals and ColVals.
%%% Reduce the possible values accordingly to RowValRest and
%%% ColValRest.

pick_value(RowVals,ColVals, Value, RowValRest, ColValRest) :-
   pickValue(RowVals,Value,RowValRest),
   pickValue(ColVals,Value,ColValRest).
   
%%% Pick a possible value and return the remaining ones %%%
%%% pickValue(Possible,Picked,Rest) -> Possible - Picked = Rest

pickValue([H|Rest],H, Rest).
pickValue([H|Tail],Picked,[H|Rest]):- pickValue(Tail,Picked,Rest).  


%%% Sudoku Test %%%
go1(L):-
    L = [ [_,4,2,_], [_,2,1,_], [4,_,_,2], [2,_,_,1] ],
    solve_sudoku(L).

go2(L,N):-
   findall(L, solve_sudoku(L), ALL),
   length(ALL,N).
   
%?- time( go2(L,N) ).
% 27,890 inferences, 0.02 CPU in 0.02 seconds (98% CPU, 1784960 Lips)
% L = [[[1, 2, 3, 4], [3, 4, 1, 2], [2, 1, 4, 3], [4, 3, 2, 1]], [[1, 2, 3, 4], [3, 4, 1, 2], [2, 3, 4, 1], [4, 1, 2|...]], [[1, 2, 3, 4], [3, 4, 1, 2], [4, 1, 2|...], [2, 3|...]], [[1, 2, 3, 4], [3, 4, 1|...], [4, 3|...], [2|...]], [[1, 2, 3|...], [3, 4|...], [2|...], [...|...]], [[1, 2|...], [3|...], [...|...]|...], [[1|...], [...|...]|...], [[...|...]|...], [...|...]|...]
% N = 288 ;
%
% No    