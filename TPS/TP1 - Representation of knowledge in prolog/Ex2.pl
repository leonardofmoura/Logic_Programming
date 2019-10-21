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

winteam(Team,Race):-winner(Race,Pilot),team(Pilot,Team).