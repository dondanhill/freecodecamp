
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
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    speed_in_miles_per_hour integer,
    age_in_millions_of_years integer,
    "exists" boolean DEFAULT false
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
    name character varying(50) NOT NULL,
    is_spherical boolean,
    planet_id integer,
    description text,
    age_in_millions_of_years numeric(4,1)
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
    name character varying(50) NOT NULL,
    is_spherical boolean,
    star_id integer,
    description text,
    age_in_millions_of_years numeric(4,1),
    temperature_in_degrees_c integer
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
    planet_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(50)
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    description text,
    age_in_millions_of_years numeric(4,1)
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

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'a galaxy far, far away', 700000, 7000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'a galaxy far, far away', 700000, 7000, true);
INSERT INTO public.galaxy VALUES (3, 'Cygnus A', 'a galaxy far, far away', 700000, 7000, true);
INSERT INTO public.galaxy VALUES (4, 'Virgo A', 'a galaxy far, far away', 700000, 7000, true);
INSERT INTO public.galaxy VALUES (5, 'Maffei I', 'a galaxy far, far away', 700000, 7000, true);
INSERT INTO public.galaxy VALUES (6, 'Maffei II', 'a galaxy far, far away', 700000, 7000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', NULL, NULL, 'it''s a moon, that''s not a moon', 2.0);
INSERT INTO public.moon VALUES (2, 'moon2', true, 12, 'it''s a moon, that''s not a moon', 4.0);
INSERT INTO public.moon VALUES (3, 'moon3', true, 12, 'it''s a moon, that''s not a moon', 6.0);
INSERT INTO public.moon VALUES (4, 'moon4', true, 12, 'it''s a moon, that''s not a moon', 8.0);
INSERT INTO public.moon VALUES (5, 'moon5', true, 12, 'it''s a moon, that''s not a moon', 10.0);
INSERT INTO public.moon VALUES (6, 'moon6', true, 12, 'it''s a moon, that''s not a moon', 12.0);
INSERT INTO public.moon VALUES (7, 'moon7', true, 12, 'it''s a moon, that''s not a moon', 14.0);
INSERT INTO public.moon VALUES (8, 'moon8', true, 12, 'it''s a moon, that''s not a moon', 16.0);
INSERT INTO public.moon VALUES (9, 'moon9', true, 12, 'it''s a moon, that''s not a moon', 18.0);
INSERT INTO public.moon VALUES (10, 'moon10', true, 12, 'it''s a moon, that''s not a moon', 20.0);
INSERT INTO public.moon VALUES (11, 'moon11', true, 12, 'it''s a moon, that''s not a moon', 22.0);
INSERT INTO public.moon VALUES (12, 'moon12', true, 12, 'it''s a moon, that''s not a moon', 24.0);
INSERT INTO public.moon VALUES (13, 'moon13', true, 12, 'it''s a moon, that''s not a moon', 26.0);
INSERT INTO public.moon VALUES (14, 'moon14', true, 12, 'it''s a moon, that''s not a moon', 28.0);
INSERT INTO public.moon VALUES (15, 'moon15', true, 12, 'it''s a moon, that''s not a moon', 30.0);
INSERT INTO public.moon VALUES (16, 'moon16', true, 12, 'it''s a moon, that''s not a moon', 32.0);
INSERT INTO public.moon VALUES (17, 'moon17', true, 12, 'it''s a moon, that''s not a moon', 34.0);
INSERT INTO public.moon VALUES (18, 'moon18', true, 12, 'it''s a moon, that''s not a moon', 36.0);
INSERT INTO public.moon VALUES (19, 'moon19', true, 12, 'it''s a moon, that''s not a moon', 38.0);
INSERT INTO public.moon VALUES (20, 'moon20', true, 12, 'it''s a moon, that''s not a moon', 40.0);
INSERT INTO public.moon VALUES (21, 'moon21', true, 12, 'it''s a moon, that''s not a moon', 42.0);
INSERT INTO public.moon VALUES (22, 'moon22', true, 12, 'it''s a moon, that''s not a moon', 44.0);
INSERT INTO public.moon VALUES (23, 'moon23', true, 12, 'it''s a moon, that''s not a moon', 46.0);
INSERT INTO public.moon VALUES (24, 'moon24', true, 12, 'it''s a moon, that''s not a moon', 48.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'planet2', true, 1, 'closest plane to sun.', 2.0, 40);
INSERT INTO public.planet VALUES (3, 'planet3', true, 1, 'closest plane to sun.', 3.0, 60);
INSERT INTO public.planet VALUES (4, 'planet4', true, 1, 'closest plane to sun.', 4.0, 80);
INSERT INTO public.planet VALUES (5, 'planet5', true, 1, 'closest plane to sun.', 5.0, 100);
INSERT INTO public.planet VALUES (6, 'planet6', true, 1, 'closest plane to sun.', 6.0, 120);
INSERT INTO public.planet VALUES (7, 'planet7', true, 1, 'closest plane to sun.', 7.0, 140);
INSERT INTO public.planet VALUES (8, 'planet8', true, 1, 'closest plane to sun.', 8.0, 160);
INSERT INTO public.planet VALUES (9, 'planet9', true, 1, 'closest plane to sun.', 9.0, 180);
INSERT INTO public.planet VALUES (10, 'planet10', true, 1, 'closest plane to sun.', 10.0, 200);
INSERT INTO public.planet VALUES (11, 'planet11', true, 1, 'closest plane to sun.', 11.0, 220);
INSERT INTO public.planet VALUES (12, 'planet12', true, 1, 'closest plane to sun.', 12.0, 240);
INSERT INTO public.planet VALUES (13, 'planet13', true, 1, 'closest plane to sun.', 13.0, 260);
INSERT INTO public.planet VALUES (14, 'planet14', true, 1, 'closest plane to sun.', 14.0, 280);
INSERT INTO public.planet VALUES (15, 'planet15', true, 1, 'closest plane to sun.', 15.0, 300);
INSERT INTO public.planet VALUES (16, 'planet16', true, 1, 'closest plane to sun.', 16.0, 320);
INSERT INTO public.planet VALUES (17, 'planet17', true, 1, 'closest plane to sun.', 17.0, 340);
INSERT INTO public.planet VALUES (18, 'planet18', true, 1, 'closest plane to sun.', 18.0, 360);
INSERT INTO public.planet VALUES (19, 'planet19', true, 1, 'closest plane to sun.', 19.0, 380);
INSERT INTO public.planet VALUES (20, 'planet20', true, 1, 'closest plane to sun.', 20.0, 400);
INSERT INTO public.planet VALUES (21, 'planet21', true, 1, 'closest plane to sun.', 21.0, 420);
INSERT INTO public.planet VALUES (22, 'planet22', true, 1, 'closest plane to sun.', 22.0, 440);
INSERT INTO public.planet VALUES (23, 'planet23', true, 1, 'closest plane to sun.', 23.0, 460);
INSERT INTO public.planet VALUES (24, 'planet24', true, 1, 'closest plane to sun.', 24.0, 480);
INSERT INTO public.planet VALUES (25, 'planet25', true, 1, 'closest plane to sun.', 25.0, 500);
INSERT INTO public.planet VALUES (26, 'planet26', true, 1, 'closest plane to sun.', 26.0, 520);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'gas', NULL);
INSERT INTO public.planet_types VALUES (2, 'liquid', NULL);
INSERT INTO public.planet_types VALUES (3, 'solid', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'The sun', 20.0);
INSERT INTO public.star VALUES (2, 'Acamar', 2, 'The sun', 20.0);
INSERT INTO public.star VALUES (3, 'Achird', 3, 'The sun', 20.0);
INSERT INTO public.star VALUES (4, 'Ain', 4, 'The sun', 20.0);
INSERT INTO public.star VALUES (5, 'Alcor', 5, 'The sun', 20.0);
INSERT INTO public.star VALUES (6, 'Alcyone', 6, 'The sun', 20.0);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 24, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 26, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_name_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_uniq UNIQUE (name);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id PRIMARY KEY (moon_id);


--
-- Name: moon moon_name_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_uniq UNIQUE (name);


--
-- Name: planet name_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_uniq UNIQUE (name);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_type_name_uniq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_type_name_uniq UNIQUE (name);


--
-- Name: planet_types planet_types_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_id PRIMARY KEY (planet_types_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id PRIMARY KEY (star_id);


--
-- Name: star star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

