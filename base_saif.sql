SELECT *FROM appearances
where playerid ='gaedeed01'

select *from teams 
where teamid = 'SLA';

select *from schools where schoolid = 'vandy'
order by schoolname;

select count(*) from collegeplaying where schoolid = 'vandy'
order by playerid;

SELECT distinct namefirst,namelast FROM collegeplaying
INNER JOIN people
ON collegeplaying.playerid = people.playerid
where schoolid = 'vandy';

SELECT distinct namefirst,namelast FROM collegeplaying
INNER JOIN people
ON collegeplaying.playerid = people.playerid
where schoolid = 'vandy';

select *from salaries where salaries.playerid in (SELECT distinct p.playerid FROM collegeplaying
INNER JOIN people as p
ON collegeplaying.playerid = p.playerid
where schoolid = 'vandy')
order by salary desc;

SELECT distinct namefirst,namelast FROM people
where playerid = 'priceda01' 
select *from collegeplaying

Select *from fielding



SELECT yearid, SUM(po) AS tot_putouts,
	CASE 
		WHEN pos = 'OF' THEN 'Outfield'
		WHEN pos = 'SS' OR pos = '1B' OR pos = '2B' OR pos = '3B' THEN 'Infield'
		WHEN pos = 'P' OR pos = 'C' THEN 'Battery'
	END AS field_group
FROM fielding
WHERE yearid = 2016
GROUP BY yearid, field_group
ORDER BY tot_putouts DESC;

SELECT TRUNC(yearid, -1) AS decade, ROUND(AVG(so), 2) AS avg_strikeouts_per_game,
ROUND(AVG(hr), 2) AS avg_homers_per_game
FROM battingpost
WHERE TRUNC(yearid, -1) >= 1920
Group by decade
ORDER BY decade;

select *from battingpost




select *from batting

SELECT distinct namefirst,namelast FROM people
where playerid = 'owingch01'


SELECT yearid, franchid, MAX(w) AS wins , G AS games_played
FROM teams
WHERE yearid >= 1970 AND wswin = 'N'
GROUP BY yearid, franchid, G
ORDER BY wins DESC;

select *from teams;

SELECT yearid, franchid, MIN(w) AS wins , g AS games_played
FROM teams
WHERE yearid >= 1970 AND wswin = 'Y'
GROUP BY yearid, franchid,g 
ORDER BY wins;

SELECT yearid, franchid, MIN(w) AS wins , g AS games_played
FROM teams
WHERE yearid >= 1970 AND wswin = 'Y'
GROUP BY yearid, franchid, g
ORDER BY wins;

select *from teams
where franchid= 'LAD' ;


/*Using the attendance figures from the homegames table, find the teams and parks
which had the top 5 average attendance per game in 2016 (where average attendance is 
defined as total attendance divided by number of games). Only consider parks where there
were at least 10 games played. Report the park name, team name, and average attendance. 
Repeat for the lowest 5 average attendance.*/
select *from homegames;

SELECT team, park, attendance / games AS avg_attendance 
FROM homegames
WHERE year = 2016
AND games >= 10
ORDER BY avg_attendance DESC
LIMIT 5;

SELECT team, park, attendance / games AS avg_attendance 
FROM homegames
WHERE year = 2016
AND games >= 10
ORDER BY avg_attendance
LIMIT 5;



/*9. Which managers have won the TSN Manager of the Year award in both the 
National League (NL) and the American League (AL)? Give their full name and 
the teams that they were managing when they won the award.*/


SELECT p.namefirst, p.namelast, m.teamid, a.playerid, a.lgid
FROM awardsmanagers AS a
INNER JOIN people AS p
ON a.playerid = p.playerid
INNER JOIN managers AS m
ON m.playerid = a.playerid
WHERE awardid = 'TSN Manager of the Year'
AND a.lgid = 'AL' OR a.lgid = 'NL'
GROUP BY p.namefirst, p.namelast, a.playerid, a.lgid, m.teamid
ORDER BY a.playerid;

/* 10.Analyze all the colleges in the state of Tennessee. 
Which college has had the most success in the major leagues. 
Use whatever metric for success you like - number of players, number of games, salaries, world series wins, etc.*/

