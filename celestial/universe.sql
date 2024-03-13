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
    name character varying(30) NOT NULL,
    type character varying(20) NOT NULL,
    age_in_billion numeric(4,1),
    distance_in_ly integer,
    size_in_ly integer,
    core integer,
    spherical boolean,
    has_pulsar boolean,
    trivia_id integer
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
-- Name: mobile_factory; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mobile_factory (
    mobile_factory_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    faction text,
    age_in_years integer,
    distance_in_km integer,
    size_in_m integer,
    child integer,
    is_production boolean,
    allow_repopulation boolean,
    trivia_id integer
);


ALTER TABLE public.mobile_factory OWNER TO freecodecamp;

--
-- Name: mobile_factory_mobile_factory_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.mobile_factory_mobile_factory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mobile_factory_mobile_factory_id_seq OWNER TO freecodecamp;

--
-- Name: mobile_factory_mobile_factory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.mobile_factory_mobile_factory_id_seq OWNED BY public.mobile_factory.mobile_factory_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    age_in_billion numeric(4,1),
    distance_in_ly integer,
    radius_in_km integer,
    siblings integer,
    spherical boolean,
    is_habitable boolean,
    planet_id integer NOT NULL,
    trivia_id integer
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
    type character varying(20) NOT NULL,
    category character varying(30),
    age_in_billion numeric(4,1),
    distance_in_ly integer,
    size_in_ly integer,
    radius integer,
    is_habitable boolean,
    star_id integer NOT NULL,
    trivia_id integer
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
    type character varying(20) NOT NULL,
    age_in_billion numeric(4,1),
    distance_in_ly integer,
    size_in_ly integer,
    temperature integer,
    is_binary boolean,
    galaxy_id integer NOT NULL,
    trivia_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: mobile_factory mobile_factory_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mobile_factory ALTER COLUMN mobile_factory_id SET DEFAULT nextval('public.mobile_factory_mobile_factory_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Ehdan', 'Elliptical', 12.5, 35000, 200000, 1, false, true, 1);
INSERT INTO public.galaxy VALUES (2, 'Jorei', 'Spiral', 9.3, 42000, 150000, 0, true, false, 2);
INSERT INTO public.galaxy VALUES (3, 'Klondike', 'Irregular', 10.2, 28000, 180000, 0, false, true, 3);
INSERT INTO public.galaxy VALUES (4, 'Panmaru', 'Spiral', 11.8, 38000, 160000, 1, true, true, 4);
INSERT INTO public.galaxy VALUES (5, 'Schetlezz', 'Elliptical', 13.7, 40000, 220000, 1, false, false, 5);
INSERT INTO public.galaxy VALUES (6, 'Zero-Point', 'Unknown', NULL, NULL, NULL, 0, false, false, 6);


--
-- Data for Name: mobile_factory; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mobile_factory VALUES (1, 'NovaTech Factory', 'Assembly Line', 'NovaTech Corporation', 5, 1000, 500, 0, true, false, 1);
INSERT INTO public.mobile_factory VALUES (2, 'IronForge Foundry', 'Forge', 'IronForge Industries', 10, 1500, 800, 2, true, true, 2);
INSERT INTO public.mobile_factory VALUES (3, 'EagleEye Electronics', 'Laboratory', 'EagleEye Research', 3, 800, 300, 1, true, true, 3);
INSERT INTO public.mobile_factory VALUES (4, 'Titanium Techworks', 'Manufacturing Plant', 'Titanium Corporation', 8, 1200, 700, 0, true, false, 4);
INSERT INTO public.mobile_factory VALUES (5, 'Quantum Creations', 'R&D Facility', 'Quantum Innovations', 6, 1100, 600, 1, true, true, 5);
INSERT INTO public.mobile_factory VALUES (6, 'Hyperion Robotics', 'Robotics Factory', 'Hyperion Enterprises', 4, 900, 400, 0, true, false, 6);
INSERT INTO public.mobile_factory VALUES (7, 'Starlight Semiconductors', 'Processing Plant', 'Starlight Technologies', 7, 1300, 750, 1, true, true, 7);
INSERT INTO public.mobile_factory VALUES (8, 'Omega Optics', 'Optical Workshop', 'Omega Corporation', 2, 700, 250, 0, true, false, 8);
INSERT INTO public.mobile_factory VALUES (9, 'Phoenix Plastics', 'Injection Molding Center', 'Phoenix Industries', 9, 1400, 850, 2, true, true, 9);
INSERT INTO public.mobile_factory VALUES (10, 'Apex Aerospace', 'Aerospace Facility', 'Apex Enterprises', 5, 1000, 500, 0, true, false, 10);
INSERT INTO public.mobile_factory VALUES (11, 'Xenon Xperimental', 'Experimental Lab', 'Xenon Research Institute', 3, 800, 300, 1, true, true, 11);
INSERT INTO public.mobile_factory VALUES (12, 'Vortex Vehicles', 'Vehicle Assembly Plant', 'Vortex Automotive', 8, 1200, 700, 0, true, false, 12);
INSERT INTO public.mobile_factory VALUES (13, 'Nebula Nanotech', 'Nanotechnology Lab', 'Nebula Technologies', 6, 1100, 600, 1, true, true, 13);
INSERT INTO public.mobile_factory VALUES (14, 'Galactic Generators', 'Power Plant', 'Galactic Energy Solutions', 4, 900, 400, 0, true, false, 14);
INSERT INTO public.mobile_factory VALUES (15, 'Cosmic Computers', 'Computer Manufacturing Facility', 'Cosmic Technologies', 7, 1300, 750, 1, true, true, 15);
INSERT INTO public.mobile_factory VALUES (16, 'Solar Solutions', 'Solar Panel Factory', 'Solar Systems Inc.', 2, 700, 250, 0, true, false, 16);
INSERT INTO public.mobile_factory VALUES (17, 'Lunar Labs', 'Research Facility', 'Lunar Science Institute', 9, 1400, 850, 2, true, true, 17);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon1', 'Rocky', 4.2, 1, 300, 0, true, false, 1, 1);
INSERT INTO public.moon VALUES (2, 'Moon2', 'Rocky', 4.0, 1, 250, 1, false, false, 1, 2);
INSERT INTO public.moon VALUES (3, 'Moon3', 'Rocky', 3.9, 1, 350, 2, false, false, 2, 3);
INSERT INTO public.moon VALUES (4, 'Moon4', 'Rocky', 4.1, 1, 280, 0, true, false, 2, 4);
INSERT INTO public.moon VALUES (5, 'Moon5', 'Rocky', 4.3, 1, 290, 1, true, false, 3, 5);
INSERT INTO public.moon VALUES (6, 'Moon6', 'Rocky', 3.8, 1, 320, 0, false, false, 3, 6);
INSERT INTO public.moon VALUES (7, 'Moon7', 'Rocky', 4.5, 1, 270, 2, true, false, 4, 7);
INSERT INTO public.moon VALUES (8, 'Moon8', 'Rocky', 4.4, 1, 310, 1, false, false, 4, 8);
INSERT INTO public.moon VALUES (9, 'Moon9', 'Rocky', 4.2, 1, 330, 0, true, false, 5, 9);
INSERT INTO public.moon VALUES (10, 'Moon10', 'Rocky', 4.1, 1, 260, 2, false, false, 6, 10);
INSERT INTO public.moon VALUES (11, 'Moon11', 'Rocky', 3.9, 1, 340, 1, true, false, 7, 11);
INSERT INTO public.moon VALUES (12, 'Moon12', 'Rocky', 4.0, 1, 290, 0, false, false, 7, 12);
INSERT INTO public.moon VALUES (13, 'Moon13', 'Rocky', 4.3, 1, 300, 2, false, false, 8, 13);
INSERT INTO public.moon VALUES (14, 'Moon14', 'Rocky', 4.2, 1, 270, 1, true, false, 9, 14);
INSERT INTO public.moon VALUES (15, 'Moon15', 'Rocky', 4.4, 1, 320, 0, true, false, 10, 15);
INSERT INTO public.moon VALUES (16, 'Moon16', 'Rocky', 4.1, 1, 280, 1, false, false, 11, 16);
INSERT INTO public.moon VALUES (17, 'Moon17', 'Rocky', 3.8, 1, 330, 2, true, false, 11, 17);
INSERT INTO public.moon VALUES (18, 'Moon18', 'Rocky', 4.5, 1, 290, 0, false, false, 12, 18);
INSERT INTO public.moon VALUES (19, 'Moon19', 'Rocky', 4.2, 1, 310, 1, true, false, 12, 19);
INSERT INTO public.moon VALUES (20, 'Moon20', 'Rocky', 4.3, 1, 300, 2, true, false, 13, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'XE-45-01', 'Terran', 'Rocky', 4.5, 0, 1, 6371, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Luther', 'Terran', 'Rocky', 4.6, 0, 1, 3389, false, 1, 2);
INSERT INTO public.planet VALUES (3, 'Synergy', 'Terran', 'Rocky', 4.5, 0, 0, 2439, false, 1, 3);
INSERT INTO public.planet VALUES (4, 'Vostozk', 'Terran', 'Rocky', 4.5, 0, 1, 6052, false, 1, 4);
INSERT INTO public.planet VALUES (5, 'Jahanna', 'Gas Giant', 'Jovian', 4.5, 0, 11, 69911, false, 1, 5);
INSERT INTO public.planet VALUES (6, 'Sureal', 'Gas Giant', 'Jovian', 4.5, 0, 9, 58232, false, 1, 6);
INSERT INTO public.planet VALUES (7, 'Rando', 'Ice Giant', 'Jovian', 4.5, 0, 4, 25362, false, 1, 7);
INSERT INTO public.planet VALUES (8, 'Clhotho', 'Ice Giant', 'Jovian', 4.5, 0, 4, 24622, false, 1, 8);
INSERT INTO public.planet VALUES (9, 'Holowo', 'Terran', 'Rocky', 0.0, 4, 1, 6000, true, 5, 9);
INSERT INTO public.planet VALUES (10, 'Deka-1A', 'Terran', 'Rocky', 0.0, 40, 1, 6371, true, 5, 10);
INSERT INTO public.planet VALUES (11, 'Deka-1B', 'Terran', 'Rocky', 0.0, 40, 1, 6031, true, 5, 11);
INSERT INTO public.planet VALUES (12, 'Syntha-111b', 'Terran', 'Rocky', 2.4, 1200, 1, 6927, true, 5, 12);
INSERT INTO public.planet VALUES (13, 'Syntha-112b', 'Terran', 'Rocky', 2.4, 1200, 1, 7919, true, 5, 13);
INSERT INTO public.planet VALUES (14, 'Syntha-152a', 'Terran', 'Rocky', 1.4, 1400, 2, 7874, true, 5, 14);
INSERT INTO public.planet VALUES (15, 'Syntha-164c', 'Terran', 'Rocky', 1.4, 1400, 2, 11220, true, 5, 15);
INSERT INTO public.planet VALUES (16, 'Veria-78', 'Terran', 'Rocky', 0.0, 15, 2, 7051, true, 6, 16);
INSERT INTO public.planet VALUES (17, 'Veria-88', 'Terran', 'Rocky', 0.0, 15, 2, 11978, true, 6, 17);
INSERT INTO public.planet VALUES (18, 'N-69', 'Gas Giant', 'Mini-Neptune', 6.1, 620, 2, 12441, false, 7, 18);
INSERT INTO public.planet VALUES (19, 'I-69', 'Gas Giant', 'Hot Jupiter', 0.6, 63, 1, 81000, false, 7, 19);
INSERT INTO public.planet VALUES (20, 'C-69', 'Gas Giant', 'Hot Jupiter', 0.0, 870, 2, 185330, false, 7, 20);
INSERT INTO public.planet VALUES (21, 'E-69', 'Terran', 'Rocky', 1.2, 470, 1, 6060, true, 7, 21);
INSERT INTO public.planet VALUES (22, 'DK 09188 54', 'Gas Giant', 'Hot Jupiter', 0.7, 153, 1, 71492, false, 8, 22);
INSERT INTO public.planet VALUES (23, 'Zeroth', 'Gas Giant', 'Hot Jupiter', 0.0, 700, 1, 12104, false, 9, 23);
INSERT INTO public.planet VALUES (24, 'Mega Void', 'Terran', 'Super-Earth', 7.1, 20, 2, 7730, true, 10, 24);
INSERT INTO public.planet VALUES (25, 'Child of Void', 'Terran', 'Rocky', 7.1, 20, 1, 5390, true, 10, 25);
INSERT INTO public.planet VALUES (26, 'Firespawn', 'Terran', 'Rocky', 1.1, 492, 1, 6371, true, 11, 26);
INSERT INTO public.planet VALUES (27, 'Stringge', 'Terran', 'Rocky', 0.0, 1200, 1, 7926, true, 12, 27);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Dorma', 'G-type', 4.6, 0, 1, 5778, false, 1, 1);
INSERT INTO public.star VALUES (2, 'Endegar', 'A-type', 0.3, 9, 2, 9940, false, 1, 2);
INSERT INTO public.star VALUES (3, 'Sria', 'G-type', 6.4, 4, 1, 5790, false, 1, 3);
INSERT INTO public.star VALUES (4, 'Johann', 'K-type', 6.4, 4, 1, 5260, false, 1, 4);
INSERT INTO public.star VALUES (5, 'Cyril', 'M-type', 0.0, 4, 0, 3042, true, 1, 5);
INSERT INTO public.star VALUES (6, 'Cyrilla', 'M-type', 8.6, 643, 950, 3600, false, 2, 6);
INSERT INTO public.star VALUES (7, 'Zeroth', 'B-type', 8.9, 860, 70, 12100, false, 2, 7);
INSERT INTO public.star VALUES (8, 'Hadd', 'A-type', 0.5, 25, 3, 9602, false, 3, 8);
INSERT INTO public.star VALUES (9, 'Rorokan', 'F-type', 0.1, 434, 45, 6000, false, 3, 9);
INSERT INTO public.star VALUES (10, 'Matamata', 'K-type', 6.7, 65, 62, 3910, false, 4, 10);
INSERT INTO public.star VALUES (11, 'Cyanin', 'M-type', 12.0, 550, 883, 3500, false, 4, 11);
INSERT INTO public.star VALUES (12, 'Oreo', 'K-type', 7.1, 37, 25, 4286, false, 4, 12);
INSERT INTO public.star VALUES (13, 'Dewan', 'A-type', 8.5, 2600, 200, 8500, false, 5, 13);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: mobile_factory_mobile_factory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.mobile_factory_mobile_factory_id_seq', 17, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 27, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_trivia_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_trivia_id_key UNIQUE (trivia_id);


--
-- Name: mobile_factory mobile_factory_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mobile_factory
    ADD CONSTRAINT mobile_factory_pkey PRIMARY KEY (mobile_factory_id);


--
-- Name: mobile_factory mobile_factory_trivia_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mobile_factory
    ADD CONSTRAINT mobile_factory_trivia_id_key UNIQUE (trivia_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_trivia_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_trivia_id_key UNIQUE (trivia_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_trivia_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_trivia_id_key UNIQUE (trivia_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_trivia_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_trivia_id_key UNIQUE (trivia_id);


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

