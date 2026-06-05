% roots_dfa_tests.pl

:- consult(roots_dfa).

% ACCEPTED

test_accept_1 :- accepts(beneficial).
test_accept_2 :- accepts(benefactor).
test_accept_3 :- accepts(bene).
test_accept_4 :- accepts(descend).
test_accept_5 :- accepts(transcend).


% REJECTED

test_reject_1 :- \+ accepts(hello).
test_reject_2 :- \+ accepts(apple).
test_reject_3 :- \+ accepts(ben).
test_reject_4 :- \+ accepts(ascent).
test_reject_5 :- \+ accepts(science).



% RUNNER

run_all_tests :-
    write('--- ACCEPT TESTS ---'), nl,
    run_test(test_accept_1, beneficial),
    run_test(test_accept_2, benefactor),
    run_test(test_accept_3, bene),
    run_test(test_accept_4, descend),
    run_test(test_accept_5, transcend),

    write('--- REJECT TESTS ---'), nl,
    run_test(test_reject_1, hello),
    run_test(test_reject_2, apple),
    run_test(test_reject_3, ben),
    run_test(test_reject_4, ascent),
    run_test(test_reject_5, science),

    write('All tests executed.'), nl.


% TEST EXECUTION

run_test(Test, Word) :-
    (   call(Test)
    ->  format('~w -> PASSED~n', [Word])
    ;   format('~w -> FAILED~n', [Word])
    ).