% pex5.pl
% USAFA UFO Sightings 2024
%
% name: Kenneth Wang
%
% Documentation: None
%

% The query to get the answer(s) or that there is no answer
% ?- solve.

solve :-
    Solution = [
        sighting(Cadet1, tue, Object1),
        sighting(Cadet2, wed, Object2),
        sighting(Cadet3, thu, Object3),
        sighting(Cadet4, fri, Object4)
    ],
    permutation([smith, garcia, chen, jones], [Cadet1, Cadet2, Cadet3, Cadet4]),
    permutation([weather_balloon, kite, fighter_aircraft, cloud], [Object1, Object2, Object3, Object4]),
    member(sighting(smith, _, cloud), Solution),
    member(sighting(_, fri, fighter_aircraft), Solution),
    \+ member(sighting(garcia, _, kite), Solution),
    \+ member(sighting(_, tue, kite), Solution),
    \+ member(sighting(garcia, _, weather_balloon), Solution),
    \+ member(sighting(jones, _, weather_balloon), Solution),
    \+ member(sighting(jones, tue, _), Solution),
    \+ member(sighting(_, wed, weather_balloon), Solution),
    print_solution(Solution).

print_solution(Solution) :-
    print_sightings(Solution).

print_sightings([]).
print_sightings([sighting(Cadet, Day, Object)|Rest]) :-
    format('~w: C4C ~w saw ~w~n', [Day, Cadet, Object]),
    print_sightings(Rest).

% answer is : (ran in swish)
% tue: C4C smith saw cloud
% wed: C4C jones saw kite
% thu: C4C chen saw weather_balloon
% fri: C4C garcia saw fighter_aircraft
% 1true