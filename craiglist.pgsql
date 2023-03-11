DROP DATABASE IF EXISTS craigs_list;

CREATE DATABASE craigs_list;

\c craigs_list
CREATE TABLE region (
    id serial PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE users (
    id serial PRIMARY KEY,
    name text NOT NULL,
    email text NOT NULL UNIQUE,
    city text,
    state text,
    country text,
    postal_code text,
    preferred_region_id integer NOT NULL REFERENCES region (id),
    created_at timestamp with time zone DEFAULT now() NOT NULL
);

CREATE TABLE locations (
    id serial PRIMARY KEY,
    street text NOT NULL,
    city text NOT NULL,
    state text NOT NULL,
    country text NOT NULL,
    postal_code text NOT NULL
);

CREATE TABLE posts (
    id serial PRIMARY KEY,
    title text NOT NULL,
    description text NOT NULL,
    user_id integer NOT NULL REFERENCES users (id),
    location_id integer NOT NULL REFERENCES locations (id),
    region_id integer NOT NULL REFERENCES region (id)
);

CREATE TABLE categories (
    id serial PRIMARY KEY,
    name text NOT NULL UNIQUE
);

CREATE TABLE post_categories (
    post_id integer NOT NULL REFERENCES posts (id),
    category_id integer NOT NULL REFERENCES categories (id),
    PRIMARY KEY (post_id, category_id)
);

