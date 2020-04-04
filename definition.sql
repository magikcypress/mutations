--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.20
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

-- Started on 2020-04-04 20:56:07 CEST

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

DROP DATABASE "DVF-test";
--
-- TOC entry 3458 (class 1262 OID 40041)
-- Name: DVF-test; Type: DATABASE; Schema: -; Owner: qfp
--

CREATE DATABASE "DVF-test" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE "DVF-test" OWNER TO qfp;

\connect -reuse-previous=on "dbname='DVF-test'"

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

--
-- TOC entry 1 (class 3079 OID 13704)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 13742)
-- Name: pg_buffercache; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pg_buffercache WITH SCHEMA public;


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_buffercache; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_buffercache IS 'examine the shared buffer cache';


--
-- TOC entry 3 (class 3079 OID 13736)
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track execution statistics of all SQL statements executed';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 40135)
-- Name: mutations; Type: TABLE; Schema: public; Owner: qfp
--

CREATE TABLE public.mutations (
    mutation character varying(14) NOT NULL,
    date_mutation character varying(10),
    valeur_fonciere numeric(14,2),
    adresse_complete character varying(255),
    code_postal character varying(10),
    code_commune character varying(10),
    nom_commune character varying(100),
    code_departement character varying(2),
    id_parcelle character varying(20),
    lot1_numero character varying(8),
    lot1_surface_carrez numeric(8,2),
    nombre_lots integer,
    type_local character varying(20),
    surface_reelle_bati numeric(8,2),
    nombre_pieces_principales character varying(50),
    surface_terrain numeric(8,2),
    point_gps character varying(255),
    nom_region character varying(50),
    annee integer
);


ALTER TABLE public.mutations OWNER TO qfp;

--
-- TOC entry 3336 (class 1259 OID 40147)
-- Name: region_idx; Type: INDEX; Schema: public; Owner: qfp
--

CREATE INDEX region_idx ON public.mutations USING btree (nom_region);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 9
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: azure_superuser
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM azure_superuser;
GRANT ALL ON SCHEMA public TO azure_superuser;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2020-04-04 20:56:15 CEST

--
-- PostgreSQL database dump complete
--

