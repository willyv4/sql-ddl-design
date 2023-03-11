DROP DATABASE IF EXISTS sports_league;

CREATE DATABASE sports_league;

\c sports_league

CREATE TABLE teams (
    id serial PRIMARY KEY,
    name text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE players (
    id serial PRIMARY KEY,
    name text NOT NULL,
    team_id integer NOT NULL REFERENCES teams (id),
    created_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE matches (
    id serial PRIMARY KEY,
    home_team_id integer NOT NULL REFERENCES teams (id),
    away_team_id integer NOT NULL REFERENCES teams (id),
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE goals (
    id serial PRIMARY KEY,
    player_id integer NOT NULL REFERENCES players (id),
    match_id integer NOT NULL REFERENCES matches (id),
    goal_time timestamp with time zone NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE standings (
    id serial PRIMARY KEY,
    team_id integer NOT NULL REFERENCES teams (id),
    played integer DEFAULT 0 NOT NULL,
    won integer DEFAULT 0 NOT NULL,
    lost integer DEFAULT 0 NOT NULL,
    drawn integer DEFAULT 0 NOT NULL,
    goals_for integer DEFAULT 0 NOT NULL,
    goals_against integer DEFAULT 0 NOT NULL,
    points integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);

