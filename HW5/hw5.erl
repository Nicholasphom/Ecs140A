
-module(hw5).
-export([mylast/1]).
-export([myreverse/1]).
-export([myremoveduplicates/1]).
-export([myreplaceall/3]).

myremoveduplicates(L) -> myremoveduplicates(L, []).
myremoveduplicates([H|T], Acc) ->
case lists:member(H,Acc) of
true -> myremoveduplicates(T, Acc);
false -> myremoveduplicates(T, [H|Acc])
end;
myremoveduplicates([], Acc) ->
lists:reverse(Acc).


mylast([])->
[] ;
mylast([H|[]])->
H ;
mylast([_|T])->
mylast(T).



myreverse(List)         -> myreverse_(List, []).
myreverse_([], List)    -> List;
myreverse_([H|T], List) -> myreverse_(T, [H|List]).


myreplaceall(ER, EE, List)          -> myreplaceall_(ER, EE, List, []).
myreplaceall_(_,_,[],List)          -> myreverse(List);
myreplaceall_(ER, EE, [EE|T], List) -> myreplaceall_(ER, EE, T, [ER|List]);
myreplaceall_(ER, EE, [H|T], List)  -> myreplaceall_(ER, EE, T, [H|List]).

