% Fact representation
pilot(lamb).
pilot(besenyei).
pilot(chambliss).
pilot(maclean).
pilot(mangold).
pilot(jones).
pilot(bonhomme).

team(lamb,breitling).
team(besenyei,redbull).
team(chambliss,redbull).
team(maclean,mediterranean).
team(mangold,cobra).
team(jones,matador).
team(bonhomme,matador).

plane(lamb,mx2).
plane(besenyei,edge540).
plane(chambliss,edge540).
plane(maclean,edge540).
plane(mangold,edge540).
plane(jones,edge540).
plane(bonhomme,edge540).

circuit(istambul).
circuit(budapeste).
circuit(porto).

winner(porto,jones).
winner(budapeste,mangold).
winner(istambul,mangold).

gates(istambul,9).
gates(budapeste,6).
gates(porto,5).

/* Winning team in a certain race */
winteam(Team,Race):-winner(Race,Pilot),team(Pilot,Team).

/* Player won at least two races */
wonMany(Player) :-  
    winner(Cirquit1,Player),
    winner(Cirquit2,Player),
    Cirquit1 \= Cirquit2.

/* Circuit has more than 8 gates */
moreThan8(Circuit) :-
    gates(Circuit,Num),
    Num > 8.

/* Pilot does not pilot Plane */
doesNotPilot(Pilot,Plane) :-
    plane(Pilot,P),
    P \= Plane.