--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Postgres.app)
-- Dumped by pg_dump version 16.1

-- Started on 2024-05-19 18:14:42 EDT

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
-- TOC entry 3692 (class 0 OID 17462)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (1, 'comercio', 'comercio@comercio.app', NULL, '$2y$12$Fb5qSR2aMonz9/R1QZOB5.luWw40U9lbi3vGYYfge5.FqgSUCb1Fm', NULL, '2024-05-11 20:18:22', '2024-05-11 20:18:22');


--
-- TOC entry 3699 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


-- Completed on 2024-05-19 18:14:43 EDT

--
-- PostgreSQL database dump complete
--

