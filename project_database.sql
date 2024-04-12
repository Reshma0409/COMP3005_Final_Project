-- Create the competition table
CREATE TABLE IF NOT EXISTS competitions (
    competition_id INT,
    season_id INT,
    country_name VARCHAR(255),
    competition_name VARCHAR(255),
    competition_gender VARCHAR(10),
    competition_youth BOOLEAN,
    competition_international BOOLEAN,
    season_name VARCHAR(255),
    match_updated TIMESTAMP,
    match_updated_360 TIMESTAMP,
    match_available_360 TIMESTAMP,
    match_available TIMESTAMP
);

CREATE TABLE IF NOT EXISTS matches (
    match_id INTEGER,
    match_date DATE,
    kick_off TIME,
    competition_id INTEGER,
    competition_country_name VARCHAR(100),
    competition_name VARCHAR(100),
	season_id INTEGER
);

-- Create the lineups table
CREATE TABLE IF NOT EXISTS lineups (
    team_id INTEGER,
    team_name VARCHAR(255),
    lineup JSONB
);

-- Create the events table
CREATE TABLE IF NOT EXISTS events (
    id UUID,
    index INT,
    period INT,
    timestamp TIME,
    minute INT,
    second INT,
    type_id INT,
    possession INT,
    possession_team_id INT
);