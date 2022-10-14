/* 
House Fire -- a very simple prolog demo by Zeke Barefoot. 

This code is heavily inspired by: https://gist.github.com/JosephLenton/3191695

See README.md for more information on this file and its use.
*/


:- dynamic at/2, i_am_in/1.  /* Needed by SWI-Prolog. */
:- retractall(at(_, _)), retractall(i_am_in(_)).

/* Starting location. */
i_am_in(bedroom).

/* Describe house layout. */

path(basement, up, bedroom).
path(bedroom, up, attic).

path(bedroom, down, basement) :- at(key, in_hand).
path(bedroom, down, basement) :-
    write('The door is locked.'), nl,
    !, fail.

path(attic, down, bedroom).

path(bedroom, out, outside) :- at(wariosniper, in_hand).
path(bedroom, out, outside) :-
    write('You can''t leave without your most precious possesion.'), nl,
    !, fail.

/* This rule prints out instructions and tells where you are. */

start :-
        instructions,
        look.

/* Define going somewhere & directions. */

up :- go(up).
down :- go(down).
out :- go(out).

go(Direction) :-
	i_am_in(Here),
	path(Here, Direction, There),
	retract(i_am_in(Here)),
	assert(i_am_in(There)),
	look, !.

go(_) :-
	write('You can''t go that way!'), nl.

/* This rule tells how to look about you. */

look :-
        i_am_in(Place),
        describe(Place),
        nl,
        notice_objects(Place),
        nl.

/* Describe all object in the room. */

notice_objects(Place) :-
        at(X, Place),
        write('You see the '), write(X), write(' out of the corner of your eye.'), nl,
        fail.

notice_objects(_).

/* Describe key location. */

at(key, attic).
at(wariosniper, basement).

/* Describe how to take an object */
take(X) :-
        at(X, in_hand),
        write('You''re already holding it! Keep it together!'),
        nl, !.

take(X) :-
        i_am_in(Place),
        at(X, Place),
        retract(at(X, Place)),
        assert(at(X, in_hand)),
        write('You hastily grab it.'),
        nl, !.

take(_) :-
        write('You don''t see that here!'),
        nl.

/* Describe how to pick up an object. */

drop(X) :-
        at(X, in_hand),
        i_am_in(Place),
        retract(at(X, in_hand)),
        assert(at(X, Place)),
        write('You hastily grab it.'),
        nl, !.

drop(_) :-
        write('You aren''t holding it!'),
        nl.


/* Game end state. */

finish :-
        nl,
        write('You escape out the front door, stray flames singeing'), nl,
        write('the tail of your nightrobe. Just in time! The house'), nl,
        write('collapses in a blazing pile of rubble, leaving you stranded.'), nl,
        write('But you will recover. After all, you still have your copy'), nl,
        write('of WARIOSNIPER: GOLDEN TOE EDITION, worth in excess of '), nl,
        write('eighty-thousand dollars. You would never sell it, though.'), nl, nl,
        write('The game is over. Please enter the   halt.   command.'), nl, !.

instructions :-
    nl,
    write('Enter commands using standard Prolog syntax.'), nl,
    write('You can:'), nl,
    write('start.                   -- to start the game.'), nl,
    write('up. down. out. 			-- to go in that direction.'), nl,
    write('take(object).			-- to pick up an object.'), nl,
    write('look.                    -- to look around you again.'), nl,
    write('instructions.            -- to see this message again.'), nl,
    write('halt.                    -- to end the game and quit.'), nl,
    nl,
    write('You have awoken in your bedroom during the night. There '), nl,
	write('are flames all around you! You must escape your burning house,'), nl,
	write('but not before retreiving the invaluable contents of your'), nl,
	write('basement, the key to which is in the attic. Hurry!'), nl, nl.

/* Describes the rooms. */

describe(outside) :-
	at(wariosniper, in_hand),
	finish, !.

describe(bedroom) :-
	write('You are in the bedoom. The whole first floor of your'), nl,
	write('house is enveloped in smoke, and the sound of crackling'), nl,
	write('electronics is emanating muffled through the basement door.'), nl.

describe(basement) :-
	at(key, in_hand),
	write('It is furiously hot in your basement man-cave. The roaring flames'), nl,
	write('have enveloped your 75-inch tv and all of your sweet gaming gear.'), nl,
	write('The smoke is so thick, you can barely see and each breath is labored.'), nl,
	write('But you are not too late. Your copy of WARIOSNIPER, the game of a'), nl,
	write('generation and famous collaboration between Nintendo Reggie and the'), nl,
	write('famed espionage novelist, Tom Clancy, lies miraculously unharmed'),nl,
	write('on your wool beanbag.'),nl.

describe(basement) :-
	write('The basement is in flames! It''s not a wise idea to stay here'),nl,
	write('for long.'),nl.

describe(attic) :-
	write('The attic appears relatively unscathed. A brief respite.'),nl.

