use atp;

-- Cleaning process using temporary tables
INSERT INTO tournaments (name)
select DISTINCT(Name) from temptournaments;

insert into season 
(tournament, start, end, ground, prize, location)
select tournament, 
replace(start, ".", "-"), 
replace(end, ".", "-"), 
ground, prize, location 
from tempseason;

insert into tempGame2 
(player1, player2, tournament, start, end, prize, gameround, rankplayer1, rankplayer2, score, released, winner, Location)
select player1, player2, tournament, 
replace(start, ".", "-"), 
replace(end, ".", "-"), 
prize, gameround, rankplayer1, rankplayer2, score, released, winner, location
from tempGame;

INSERT INTO game 
(player1, player2, id_season, gameround, rankplayer1, rankplayer2, score, winner, released)
SELECT 
    (SELECT id FROM player WHERE name = tg.player1 LIMIT 1) AS player1,
    (SELECT id FROM player WHERE name = tg.player2 LIMIT 1) AS player2,
    (SELECT id_season FROM season 
        WHERE tournament = tg.tournament 
        AND start = tg.start 
        AND end = tg.end 
        AND prize = tg.prize 
        LIMIT 1) AS id_season,
    tg.gameround,
    tg.rankplayer1,
    tg.rankplayer2,
    tg.score,
    (SELECT id FROM player WHERE name = tg.winner LIMIT 1) AS winner,
    tg.released
FROM tempgame2 tg;


-- dropping temporary tables
drop table tempgame;
drop table tempgame2;
drop table tempseason;
drop table temptournaments;
