--Q1--
SELECT p.player_name, average_xg FROM public.players p
INNER JOIN public.playerstatistics ps ON p.player_id = ps.player_id
INNER JOIN public.matches m ON ps.match_id = m.match_id
WHERE m.season = '2020/2021' AND ps.average_xg > 0
ORDER BY ps.average_xg DESC;
	
--Q2--
SELECT p.player_name, ps.shots FROM public.players p
INNER JOIN public.playerstatistics ps ON p.player_id = ps.player_id
INNER JOIN public.matches m ON ps.match_id = m.match_id
WHERE m.season = '2020/2021' AND ps.shots > 0
ORDER BY ps.shots DESC;
	
--Q3--
SELECT p.player_name, SUM(ps.first_time_shots) AS total_first_time_shots FROM public.players p
INNER JOIN public.playerstatistics ps ON p.player_id = ps.player_id
INNER JOIN public.matches m ON ps.match_id = m.match_id
WHERE m.season IN ('2020/2021', '2019/2020', '2018/2019') AND ps.shots > 0
GROUP BY p.player_name
ORDER BY total_first_time_shots DESC;
	
--Q4--
SELECT t.team_name, passes FROM public.teams t
INNER JOIN public.teamstatistics ts ON t.team_id = ts.team_id
INNER JOIN public.matches m ON ts.match_id = m.match_id
WHERE m.season = '2020/2021' AND ts.passes > 0 
ORDER BY ts.passes DESC;
	
--Q5--
SELECT p.player_name, ps.intended_recipient_of_passes FROM public.players p
INNER JOIN public.playerstatistics ps ON p.player_id = ps.player_id
INNER JOIN public.matches m ON ps.match_id = m.match_id
WHERE m.season = '2003/2004' AND ps.intended_recipient_of_passes > 0
ORDER BY ps.intended_recipient_of_passes DESC;
	
--Q6--
SELECT t.team_name, ts.shots FROM public.teams t
INNER JOIN public.teamstatistics ts ON t.team_id = ts.team_id
INNER JOIN public.matches m ON ts.match_id = m.match_id
WHERE m.season = '2003/2004' AND ts.shots > 0
ORDER BY ts.shots DESC;
	
--Q7--
SELECT p.player_name, ps.through_balls FROM public.players p
INNER JOIN public.playerstatistics ps ON p.player_id = ps.player_id
INNER JOIN public.matches m ON ps.match_id = m.match_id
WHERE m.season = '2020/2021' AND ps.through_balls > 0
ORDER BY ps.through_balls DESC;
	
--Q8--
SELECT t.team_name, ts.through_balls FROM public.teams t
INNER JOIN public.teamstatistics ts ON t.team_id = ts.team_id
INNER JOIN public.matches m ON ts.match_id = m.match_id
WHERE m.season = '2020/2021' AND ts.through_balls > 0
ORDER BY ts.through_balls DESC;
	
--Q9--
SELECT p.player_name, SUM(ps.successful_dribbles) AS total_successful_dribbles FROM public.players p
INNER JOIN public.playerstatistics ps ON p.player_id = ps.player_id
INNER JOIN public.matches m ON ps.match_id = m.match_id
WHERE m.season IN ('2020/2021', '2019/2020', '2018/2019') AND ps.successful_dribbles > 0
GROUP BY p.player_name
ORDER BY total_successful_dribbles DESC;
	
--Q10--
SELECT p.player_name, ps.dribbled_past FROM public.players p
INNER JOIN public.playerstatistics ps ON p.player_id = ps.player_id
INNER JOIN public.matches m ON ps.match_id = m.match_id
WHERE m.season = '2020/2021' AND ps.dribbled_past > 0
ORDER BY ps.dribbled_past ASC;