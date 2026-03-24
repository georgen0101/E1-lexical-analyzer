% roots_dfa.pls
% Author: Jorge Nieto
% Date: March 23, 2026
% Project: Lexical Analysis using DFA
% Description: DFA that detects substrings "bene" or "scend".

% States

start_state(q0).
accepting_state(q4).


% Helpers

letter(C) :- char_type(C, lower).
not_in(C, L) :- \+ member(C, L).


% TRANSITIONS

% --- q0 ---
transition(q0, b, q1).
transition(q0, s, q5).
transition(q0, C, q0) :-
    letter(C),
    not_in(C, [b,s]).

% --- q1 ("b") ---
transition(q1, e, q2).
transition(q1, b, q1).
transition(q1, s, q5).
transition(q1, C, q0) :-
    letter(C),
    not_in(C, [b,e,s]).

% --- q2 ("be") ---
transition(q2, n, q3).
transition(q2, b, q1).
transition(q2, s, q5).
transition(q2, C, q0) :-
    letter(C),
    not_in(C, [b,n,s]).

% --- q3 ("ben") ---
transition(q3, e, q4).     % "bene"
transition(q3, b, q1).
transition(q3, s, q5).
transition(q3, C, q0) :-
    letter(C),
    not_in(C, [b,e,s]).

% --- q4 (ACCEPT: bene OR scend) ---
transition(q4, C, q4) :- letter(C).

% --- q5 ("s") ---
transition(q5, c, q6).
transition(q5, s, q5).
transition(q5, b, q1).
transition(q5, C, q0) :-
    letter(C),
    not_in(C, [b,c,s]).

% --- q6 ("sc") ---
transition(q6, e, q7).
transition(q6, s, q5).
transition(q6, b, q1).
transition(q6, C, q0) :-
    letter(C),
    not_in(C, [b,e,s]).

% --- q7 ("sce") ---
transition(q7, n, q8).
transition(q7, s, q5).
transition(q7, b, q1).
transition(q7, C, q0) :-
    letter(C),
    not_in(C, [b,n,s]).

% --- q8 ("scen") ---
transition(q8, d, q4).     % merged into q4
transition(q8, s, q5).
transition(q8, b, q1).
transition(q8, C, q0) :-
    letter(C),
    not_in(C, [b,d,s]).



% DFA EXECUTION

parse_word(Word) :-
    (   accepts(Word)
    ->  format('~w -> ACCEPTED~n', [Word])
    ;   format('~w -> REJECTED~n', [Word])
    ).


run(State, []) :-
    accepting_state(State).

run(State, [C|Rest]) :-
    transition(State, C, Next),
    run(Next, Rest).


% Logical acceptance (for testing)

accepts(Word) :-
    atom(Word),
    atom_chars(Word, Chars),
    start_state(Start),
    run(Start, Chars).