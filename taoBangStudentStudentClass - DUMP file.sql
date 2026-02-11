--
-- PostgreSQL database dump
--

-- Dumped from database version 17.3
-- Dumped by pg_dump version 17.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: test; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA test;


ALTER SCHEMA test OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    studentid character varying(10) NOT NULL,
    studentfirstname character varying(50),
    studentlastname character varying(50),
    studentaddress text,
    studentemail character varying(255),
    studentphone character varying(12),
    studentdob date,
    studentgender character varying(10)
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (studentid, studentfirstname, studentlastname, studentaddress, studentemail, studentphone, studentdob, studentgender) FROM stdin;
\.


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (studentid);


--
-- PostgreSQL database dump complete
--

