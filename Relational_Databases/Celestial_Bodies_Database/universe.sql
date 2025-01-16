--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30),
    description text,
    magnitude_in_parsecs integer NOT NULL,
    age_in_million_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    mass_in_kgx1000 integer NOT NULL,
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    is_habitable boolean,
    no_of_moons integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    magnitude_in_parsecs numeric,
    distance_from_earth integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: theories_of_the_universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.theories_of_the_universe (
    theories_of_the_universe_id integer NOT NULL,
    name character varying(30),
    description text NOT NULL,
    author character varying(30)
);


ALTER TABLE public.theories_of_the_universe OWNER TO freecodecamp;

--
-- Name: theories_of_the_universe_theory_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.theories_of_the_universe_theory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.theories_of_the_universe_theory_id_seq OWNER TO freecodecamp;

--
-- Name: theories_of_the_universe_theory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.theories_of_the_universe_theory_id_seq OWNED BY public.theories_of_the_universe.theories_of_the_universe_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: theories_of_the_universe theories_of_the_universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.theories_of_the_universe ALTER COLUMN theories_of_the_universe_id SET DEFAULT nextval('public.theories_of_the_universe_theory_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andromeda', 'a barred spiral galaxy', 4, 3);
INSERT INTO public.galaxy VALUES (2, 'large magellanic cloud', 'a dwarf galaxy', 1, 30);
INSERT INTO public.galaxy VALUES (3, 'black eye', 'a relatively isolated spiral galaxy', 9, 17);
INSERT INTO public.galaxy VALUES (4, 'cartwheel', 'a lenticular ring galaxy', 15, 500);
INSERT INTO public.galaxy VALUES (5, 'cigar', 'a starburst galaxy', 8, 12);
INSERT INTO public.galaxy VALUES (6, 'milky way', 'galaxy that includes the Solar System', 4, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'dalsis', 34, true, 3);
INSERT INTO public.moon VALUES (2, 'jaxilar', 36, true, 4);
INSERT INTO public.moon VALUES (3, 'turan', 37, true, 4);
INSERT INTO public.moon VALUES (4, 'borim', 38, true, 4);
INSERT INTO public.moon VALUES (5, 'daramont', 39, true, 4);
INSERT INTO public.moon VALUES (6, 'yerp', 57, true, 5);
INSERT INTO public.moon VALUES (7, 'luna', 15, true, 8);
INSERT INTO public.moon VALUES (8, 'Phobos', 16, true, 9);
INSERT INTO public.moon VALUES (9, 'Deimos', 17, true, 9);
INSERT INTO public.moon VALUES (10, 'Titan', 18, true, 11);
INSERT INTO public.moon VALUES (11, 'miranda', 19, true, 12);
INSERT INTO public.moon VALUES (12, 'ariel', 20, true, 12);
INSERT INTO public.moon VALUES (13, 'umbriel', 21, true, 12);
INSERT INTO public.moon VALUES (14, 'titania', 22, true, 12);
INSERT INTO public.moon VALUES (15, 'oberon', 23, true, 12);
INSERT INTO public.moon VALUES (16, 'charon', 27, true, 14);
INSERT INTO public.moon VALUES (17, 'nix', 28, true, 14);
INSERT INTO public.moon VALUES (18, 'hydra', 29, true, 14);
INSERT INTO public.moon VALUES (19, 'kerberos', 30, true, 14);
INSERT INTO public.moon VALUES (20, 'styx', 31, true, 14);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'alpheratz A', false, 0, 1);
INSERT INTO public.planet VALUES (2, 'alpheratz B', false, 0, 1);
INSERT INTO public.planet VALUES (3, 'morel', false, 1, 1);
INSERT INTO public.planet VALUES (4, 'teldanai', false, 4, 1);
INSERT INTO public.planet VALUES (5, 'alanaya', false, 1, 1);
INSERT INTO public.planet VALUES (6, 'mercury', false, 0, 6);
INSERT INTO public.planet VALUES (7, 'venus', false, 0, 6);
INSERT INTO public.planet VALUES (8, 'earth', true, 1, 6);
INSERT INTO public.planet VALUES (9, 'mars', true, 2, 6);
INSERT INTO public.planet VALUES (10, 'jupiter', false, 95, 6);
INSERT INTO public.planet VALUES (11, 'saturn', false, 146, 6);
INSERT INTO public.planet VALUES (12, 'uranus', false, 5, 6);
INSERT INTO public.planet VALUES (13, 'neptune', false, 16, 6);
INSERT INTO public.planet VALUES (14, 'pluto', false, 5, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'alpheratz', 2, 97, 1);
INSERT INTO public.star VALUES (2, 'sanduleak', 5, 200, 2);
INSERT INTO public.star VALUES (3, 'diadem', 64, 600, 3);
INSERT INTO public.star VALUES (4, 'D25', 7, 35, 4);
INSERT INTO public.star VALUES (5, 'messier_82', 9, 19, 5);
INSERT INTO public.star VALUES (6, 'Sirius', 2, 4, 6);


--
-- Data for Name: theories_of_the_universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.theories_of_the_universe VALUES (1, 'big bang', 'universe began from a single, hot, and dense point.', 'Georges Lemaître');
INSERT INTO public.theories_of_the_universe VALUES (2, 'steady state', 'universe has always existed and is constantly expanding.', 'Hermann Bondi');
INSERT INTO public.theories_of_the_universe VALUES (3, 'multiverse', 'there are many universes, each with its own physical laws.', 'Nicolaus Copernicus');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: theories_of_the_universe_theory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.theories_of_the_universe_theory_id_seq', 3, true);


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
-- Name: theories_of_the_universe theories_of_the_universe_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.theories_of_the_universe
    ADD CONSTRAINT theories_of_the_universe_name_key UNIQUE (name);


--
-- Name: theories_of_the_universe theories_of_the_universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.theories_of_the_universe
    ADD CONSTRAINT theories_of_the_universe_pkey PRIMARY KEY (theories_of_the_universe_id);


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

