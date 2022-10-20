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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    name character varying(30) NOT NULL,
    distance_from_earth_in_au integer,
    description text,
    asteroid_id integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric,
    description text,
    galaxy_type text,
    galaxy_id integer NOT NULL,
    radius_in_light_years integer
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric,
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric,
    description text,
    has_life boolean,
    distance_from_earth_in_au numeric,
    star_id integer
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric,
    description text,
    star_type text,
    galaxy_id integer,
    distance_from_earth_in_light_years integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroids_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES ('433 Eros', 2, 'This is the first near-Earth asteroid we discovered', 1);
INSERT INTO public.asteroid VALUES ('4 Vesta', 2, 'This asteroid is the second most massive in the asteroid belt', 2);
INSERT INTO public.asteroid VALUES ('10 Hygiea', 4, 'This asteroid in the asteroid belt may potentially be a dwarf planet', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 13610, 'This spiral galaxy is home to our planet, the solar system, and billions of other stars', 'spiral', 1, 52850);
INSERT INTO public.galaxy VALUES ('Andromeda', 10010, 'This sister galaxy to the Milky Way is set to collide with our own in around 4.6 billion years', 'spiral', 2, 110000);
INSERT INTO public.galaxy VALUES ('Sombrero', 13250, 'This galaxy of the Virgo II group is named so after its sombrero-like shape', 'spiral', 3, 25000);
INSERT INTO public.galaxy VALUES ('Whirlpool', 400.3, 'This was the first galaxy to be classified as a spiral galaxy, and sits inside of the constellation Canes Venatici', 'spiral', 4, 30000);
INSERT INTO public.galaxy VALUES ('IOK-1', 12880, 'This is believed to be the oldest galaxy we have found in the universe', 'LAE', 5, NULL);
INSERT INTO public.galaxy VALUES ('Messier 74', 13120, 'This archetypal spiral galaxy is situated in the constellation of Pisces', 'spiral', 6, 47500);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4425, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 4503, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 4503, false, 2);
INSERT INTO public.moon VALUES (4, 'Europa', 4503, true, 5);
INSERT INTO public.moon VALUES (5, 'Io', 4503, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4503, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4503, true, 5);
INSERT INTO public.moon VALUES (8, 'Thebe', 4503, false, 5);
INSERT INTO public.moon VALUES (9, 'Lysithea', 4503, false, 5);
INSERT INTO public.moon VALUES (10, 'Titan', 4003, false, 6);
INSERT INTO public.moon VALUES (11, 'Hyperion', 4003, false, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 4003, true, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 4003, true, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 4003, true, 6);
INSERT INTO public.moon VALUES (15, 'Rhea', 4003, true, 6);
INSERT INTO public.moon VALUES (16, 'Miranda', NULL, true, 7);
INSERT INTO public.moon VALUES (17, 'Titania', NULL, true, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', NULL, true, 7);
INSERT INTO public.moon VALUES (19, 'Cordelia', NULL, false, 7);
INSERT INTO public.moon VALUES (20, 'Puck', NULL, true, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mars', 4603, 'The red planet, often thought to house extraterranial life', false, 0.682, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 4503, 'The Earth''s sister planet, named after the Roman goddess of love', false, 1.14, 1);
INSERT INTO public.planet VALUES (4, 'Mercury', 4503, 'The closest planet to the sun as well as the smallest', false, 1.24, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4603, 'The biggest planet in the solar system and the one with the most moons', false, 4.2, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 4503, 'This planet is known for its beautiful rings', false, 7, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 4503, 'This planet is often mispronounced, often purposefully', false, 18.21, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4503, 'This planet is the furthest from the sun in our solar system', false, 29, 1);
INSERT INTO public.planet VALUES (9, 'Saffar', NULL, 'This exoplanet orbits Upsilon Andromedae', false, 44, 6);
INSERT INTO public.planet VALUES (10, 'Samh', NULL, 'This exoplanet orbiting Upsilon Andromedae is named after astronomer Ibn al-Samh', false, 44, 6);
INSERT INTO public.planet VALUES (11, 'Majriti', NULL, 'This exoplanet orbiting Upsilon Andromedae is named after scientist Maslama al-Majriti', false, 44, 6);
INSERT INTO public.planet VALUES (12, 'Upsilon Andromedae e', NULL, 'This exoplanet orbiting Upsilon Andromedae might not even be real!', false, 44, 6);
INSERT INTO public.planet VALUES (1, 'Earth', 4503, 'Our home planet', true, 0, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4603, 'This is the Earth''s, home star, as well as the cause of all life on Earth', 'G2V', 1, 0);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4853, 'This is the closest star to the Earth', 'M5.5Ve', 1, 4);
INSERT INTO public.star VALUES (3, 'Kepler-32', NULL, 'This star houses a planetary system with two planets: Kepler-32a and Kepler-32b', 'M1V', 1, 1070);
INSERT INTO public.star VALUES (4, 'Alpheratz', 60, 'This star is the brightest in the Andromeda galaxy, and is often the one used to find it in the first place', 'A3V', 2, 97);
INSERT INTO public.star VALUES (5, 'Mirach', NULL, 'When Alpheratz isn''t the brightest, this star takes its place.', 'M0 III', 2, 199);
INSERT INTO public.star VALUES (6, 'Upsilon Andromedae', 3100, 'This star houses a planetary system of four planets, each roughly the size of Jupiter.', 'F8V', 2, 44);


--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroid_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroids_name_key UNIQUE (name);


--
-- Name: asteroid asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy uniquegxy_const; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uniquegxy_const UNIQUE (name);


--
-- Name: moon uniquemoon_const; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uniquemoon_const UNIQUE (name);


--
-- Name: planet uniqueplnt_const; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uniqueplnt_const UNIQUE (name);


--
-- Name: star uniquestr_const; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uniquestr_const UNIQUE (name);


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

