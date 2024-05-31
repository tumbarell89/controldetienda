--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Postgres.app)
-- Dumped by pg_dump version 16.1

-- Started on 2024-05-30 23:07:47 EDT

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
-- TOC entry 3802 (class 0 OID 17488)
-- Dependencies: 221
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cache VALUES ('abel@comercio.com|127.0.0.1:timer', 'i:1715458499;', 1715458499);
INSERT INTO public.cache VALUES ('abel@comercio.com|127.0.0.1', 'i:3;', 1715458499);


--
-- TOC entry 3803 (class 0 OID 17495)
-- Dependencies: 222
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3820 (class 0 OID 17581)
-- Dependencies: 239
-- Data for Name: dalmaceninternos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3822 (class 0 OID 17598)
-- Dependencies: 241
-- Data for Name: dalmacenventas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3818 (class 0 OID 17572)
-- Dependencies: 237
-- Data for Name: dclienteproveedors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dclienteproveedors VALUES (1, 'Paco perico', 1, true, '234324234888', true, '2024-05-25 15:39:13', '2024-05-25 18:55:28');


--
-- TOC entry 3824 (class 0 OID 17615)
-- Dependencies: 243
-- Data for Name: dentradaalmacens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dentradaalmacens VALUES (1, 'jkj', 7, 2, 1, '2024-05-30 02:55:20', '2024-05-30 02:55:20');


--
-- TOC entry 3828 (class 0 OID 17654)
-- Dependencies: 247
-- Data for Name: dproductoentradas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3816 (class 0 OID 17558)
-- Dependencies: 235
-- Data for Name: dproductos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dproductos VALUES (3, 'pasta', 3, 'kljask', 'kljdklsj', 'u', 2, '2024-05-30 01:49:40', '2024-05-30 01:49:40');
INSERT INTO public.dproductos VALUES (4, 'sabana', 5, 'sdf', 'sddq', 'u', 4, '2024-05-30 01:50:27', '2024-05-30 01:50:27');
INSERT INTO public.dproductos VALUES (2, 'sfg ergdg', 7, 'wrewr', 'wrwrwffdd', 'ld', 4, '2024-05-26 19:15:02', '2024-05-30 01:50:40');


--
-- TOC entry 3830 (class 0 OID 17671)
-- Dependencies: 249
-- Data for Name: dproductosalidas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3826 (class 0 OID 17632)
-- Dependencies: 245
-- Data for Name: dsalidaalmacens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3834 (class 0 OID 17697)
-- Dependencies: 253
-- Data for Name: dventaproductos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3832 (class 0 OID 17688)
-- Dependencies: 251
-- Data for Name: dventas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3808 (class 0 OID 17520)
-- Dependencies: 227
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3806 (class 0 OID 17512)
-- Dependencies: 225
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3805 (class 0 OID 17503)
-- Dependencies: 224
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3797 (class 0 OID 16946)
-- Dependencies: 216
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.migrations VALUES (32, '0001_01_01_000000_create_users_table', 1);
INSERT INTO public.migrations VALUES (33, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO public.migrations VALUES (34, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO public.migrations VALUES (35, '2024_05_11_155711_create_ngiros_table', 1);
INSERT INTO public.migrations VALUES (36, '2024_05_11_155734_create_nalmacens_table', 1);
INSERT INTO public.migrations VALUES (37, '2024_05_11_160139_create_ntipogiros_table', 1);
INSERT INTO public.migrations VALUES (38, '2024_05_11_171629_create_dproductos_table', 1);
INSERT INTO public.migrations VALUES (39, '2024_05_11_171652_create_dclienteproveedors_table', 1);
INSERT INTO public.migrations VALUES (40, '2024_05_11_171731_create_dalmaceninternos_table', 1);
INSERT INTO public.migrations VALUES (41, '2024_05_11_171752_create_dalmacenventas_table', 1);
INSERT INTO public.migrations VALUES (42, '2024_05_11_171833_create_dentradaalmacens_table', 1);
INSERT INTO public.migrations VALUES (43, '2024_05_11_171842_create_dsalidaalmacens_table', 1);
INSERT INTO public.migrations VALUES (44, '2024_05_11_171933_create_dproductoentradas_table', 1);
INSERT INTO public.migrations VALUES (45, '2024_05_11_171948_create_dproductosalidas_table', 1);
INSERT INTO public.migrations VALUES (46, '2024_05_11_172015_create_dventas_table', 1);
INSERT INTO public.migrations VALUES (47, '2024_05_11_183453_create_dventaproductos_table', 1);


--
-- TOC entry 3812 (class 0 OID 17539)
-- Dependencies: 231
-- Data for Name: nalmacens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nalmacens VALUES (2, 'Almacen 2', true, '2024-05-24 00:00:00', '2024-05-24 00:00:00');
INSERT INTO public.nalmacens VALUES (1, 'Alamcen 1', true, '2024-05-24 00:00:00', '2024-05-24 00:00:00');


--
-- TOC entry 3810 (class 0 OID 17532)
-- Dependencies: 229
-- Data for Name: ngiros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ngiros VALUES (1, 'Canastilla', '2024-05-12 02:37:43', '2024-05-12 02:37:43');
INSERT INTO public.ngiros VALUES (3, 'biberon 44', '2024-05-22 23:50:05', '2024-05-23 00:20:18');
INSERT INTO public.ngiros VALUES (2, 'sfdssfs sdsds', '2024-05-20 03:57:57', '2024-05-23 03:17:51');


--
-- TOC entry 3814 (class 0 OID 17546)
-- Dependencies: 233
-- Data for Name: ntipogiros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ntipogiros VALUES (2, 'hh fff', '2024-05-26 04:35:06', '2024-05-26 16:24:12', 1);
INSERT INTO public.ntipogiros VALUES (4, 'gggg', '2024-05-26 21:56:43', '2024-05-26 21:56:43', 3);


--
-- TOC entry 3800 (class 0 OID 17472)
-- Dependencies: 219
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3801 (class 0 OID 17479)
-- Dependencies: 220
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sessions VALUES ('ES5dATVYis5lINuxfxLyNwM1dOG4dbzFMdqhr2Ze', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidVRvc2duRWZIUGJxMENjSG9YT1JTRll5Rm5OS2hlaHlzc3h1dk01TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kZW50cmFkYWFsbWFjZW5zL2NyZWF0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1716947354);
INSERT INTO public.sessions VALUES ('BLfLKoF8J1P6MuYPKBFrOxvrGTUy9ta9e9pRbpmf', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTNCdVVDVFpITGlqMWJ0MFZqVkVGT2hYTlV5b0pncWlHUUFMNXdFWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1717033939);
INSERT INTO public.sessions VALUES ('eR3o1cYhhwgu5rPMf4Hv8oG5DDLFlFGj68rCDSv1', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRU9abmRjQjNHRE5KQ3h1a0d2WlBrdDU4Zk1VNHRFQmg4MjgyNnYzaiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717033939);
INSERT INTO public.sessions VALUES ('o5OYLcec1F6TMkJZWCe90BXlIyRiPOL9ryW4cJX6', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYnhBRG1OYXFCaUlzaXAzWFZWRFRZeTQzVUNUR0w5QWdUOURJSGdzdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1717033939);
INSERT INTO public.sessions VALUES ('7rlxumcle3kKOoqj9TOfrZizVwVsGNVZ6w02FqSh', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidjZHQW9TOXBOMzU2MGFGRnhrbnp1TGNwTnViclowSTBjSUxEblE5QSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717123797);
INSERT INTO public.sessions VALUES ('OGrZGlmKQJdohUVm0owgJN97LjLT6o65PANPQ0jV', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVTJWN1djMWdBTXV6dWRCN3RjU1d6QXN4NmNPS0VFOUpjZGVvVDUzRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM4OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGVudHJhZGFhbG1hY2VucyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1716867442);
INSERT INTO public.sessions VALUES ('TStqh5laTkqKHHmSPeTMdMvOJv2FvWOAOjXA3c5J', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoid1JRQUt5cEJmTmk0VEM4QVBpSE9SUmZtNVpuS1ZSOEZqQWV1UFRnNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kZW50cmFkYWFsbWFjZW5zL2NyZWF0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1717040528);
INSERT INTO public.sessions VALUES ('5xP344ER5KOl1Vjeer5EGBZjGkeyGrnUnkF6oj29', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0VpcnF3SnlJQjVCQm92RnJQaXN5RTV1QUNoNmxCZ215T1FtV3FwTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1717123797);
INSERT INTO public.sessions VALUES ('1zK4PEHACjv4jfrPKivaTqYW2bW18fY78zpyF6zZ', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYnUzYWFKZWR0aEExNUNZRFc4amJVd3RiTEcyR1Q2VE1weE9oaGVROSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kZW50cmFkYWFsbWFjZW5zL2NyZWF0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1717124474);


--
-- TOC entry 3799 (class 0 OID 17462)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'comercio', 'comercio@comercio.app', NULL, '$2y$12$Fb5qSR2aMonz9/R1QZOB5.luWw40U9lbi3vGYYfge5.FqgSUCb1Fm', 'EatSfO25p0YdzcIns388pL2wmor5ms7xvGeEneoe90Q2guiwUeyg7upiChca', '2024-05-11 20:18:22', '2024-05-11 20:18:22');


--
-- TOC entry 3857 (class 0 OID 0)
-- Dependencies: 238
-- Name: dalmaceninternos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dalmaceninternos_id_seq', 1, false);


--
-- TOC entry 3858 (class 0 OID 0)
-- Dependencies: 240
-- Name: dalmacenventas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dalmacenventas_id_seq', 1, false);


--
-- TOC entry 3859 (class 0 OID 0)
-- Dependencies: 236
-- Name: dclienteproveedors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dclienteproveedors_id_seq', 2, true);


--
-- TOC entry 3860 (class 0 OID 0)
-- Dependencies: 242
-- Name: dentradaalmacens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dentradaalmacens_id_seq', 2, true);


--
-- TOC entry 3861 (class 0 OID 0)
-- Dependencies: 246
-- Name: dproductoentradas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dproductoentradas_id_seq', 1, false);


--
-- TOC entry 3862 (class 0 OID 0)
-- Dependencies: 234
-- Name: dproductos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dproductos_id_seq', 4, true);


--
-- TOC entry 3863 (class 0 OID 0)
-- Dependencies: 248
-- Name: dproductosalidas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dproductosalidas_id_seq', 1, false);


--
-- TOC entry 3864 (class 0 OID 0)
-- Dependencies: 244
-- Name: dsalidaalmacens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dsalidaalmacens_id_seq', 1, false);


--
-- TOC entry 3865 (class 0 OID 0)
-- Dependencies: 252
-- Name: dventaproductos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dventaproductos_id_seq', 1, false);


--
-- TOC entry 3866 (class 0 OID 0)
-- Dependencies: 250
-- Name: dventas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dventas_id_seq', 1, false);


--
-- TOC entry 3867 (class 0 OID 0)
-- Dependencies: 226
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3868 (class 0 OID 0)
-- Dependencies: 223
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 3869 (class 0 OID 0)
-- Dependencies: 215
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 47, true);


--
-- TOC entry 3870 (class 0 OID 0)
-- Dependencies: 230
-- Name: nalmacens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nalmacens_id_seq', 2, true);


--
-- TOC entry 3871 (class 0 OID 0)
-- Dependencies: 228
-- Name: ngiros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ngiros_id_seq', 5, true);


--
-- TOC entry 3872 (class 0 OID 0)
-- Dependencies: 232
-- Name: ntipogiros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ntipogiros_id_seq', 4, true);


--
-- TOC entry 3873 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


-- Completed on 2024-05-30 23:07:47 EDT

--
-- PostgreSQL database dump complete
--

