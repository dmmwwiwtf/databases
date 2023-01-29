--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    is_spherical boolean,
    description character varying(50),
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_life boolean,
    galaxy_types integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    is_spherical boolean,
    has_life boolean,
    description character varying(50),
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    is_spherical boolean,
    has_life boolean,
    description character varying(50),
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    name character varying(20) NOT NULL,
    planet_types_id integer NOT NULL,
    distance_from_earth numeric,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(50),
    columis_spherical boolean,
    has_life boolean,
    age_in_millions_of_years integer,
    age_distance_from_earth numeric,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('galaxy1', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('galaxy2', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('galaxy3', 3, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('galaxy4', 4, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('galaxy5', 5, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('galaxy6', 6, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('galaxy7', 7, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (2, 'moon2', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (3, 'moon3', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (4, 'moon4', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (5, 'moon5', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, 'moon6', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (7, 'moon7', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (8, 'moon8', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (9, 'moon9', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (10, 'moon10', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (11, 'moon11', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (12, 'moon12', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (13, 'moon13', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (14, 'moon14', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (15, 'moon15', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (16, 'moon16', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (17, 'moon17', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (18, 'moon18', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (19, 'moon19', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.moon VALUES (20, 'moon20', NULL, NULL, NULL, NULL, NULL, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Sun', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (3, 'Mercury', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (4, 'Venus', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (5, 'Earth', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (6, 'Apophis', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (7, 'OSIRIS-REx', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (8, 'Bennu', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (9, 'Eros', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (10, 'Didymos', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (11, 'Lucy', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (12, 'Mars', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (13, 'Ceres', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (14, 'Vesta', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (15, 'Jupiter', NULL, NULL, NULL, NULL, NULL, 2);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES ('spheric', 1, NULL, NULL);
INSERT INTO public.planet_types VALUES ('non-spheric', 2, NULL, NULL);
INSERT INTO public.planet_types VALUES ('other', 3, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Lynx', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (4, 'Leo', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (5, 'Eridanus', NULL, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.star VALUES (6, 'Cassiopeia', NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES (7, 'Scorpius', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.star VALUES (8, 'Crux', NULL, NULL, NULL, NULL, NULL, 6);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 15, true);


--
-- Name: planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_types_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_types_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_types_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_types_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_types_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_types_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

