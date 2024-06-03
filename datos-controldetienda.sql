--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Postgres.app)
-- Dumped by pg_dump version 16.1

-- Started on 2024-06-02 23:48:14 EDT

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
-- TOC entry 3803 (class 0 OID 17488)
-- Dependencies: 221
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cache VALUES ('abel@comercio.com|127.0.0.1:timer', 'i:1715458499;', 1715458499);
INSERT INTO public.cache VALUES ('abel@comercio.com|127.0.0.1', 'i:3;', 1715458499);


--
-- TOC entry 3804 (class 0 OID 17495)
-- Dependencies: 222
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3821 (class 0 OID 17581)
-- Dependencies: 239
-- Data for Name: dalmaceninternos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3823 (class 0 OID 17598)
-- Dependencies: 241
-- Data for Name: dalmacenventas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3819 (class 0 OID 17572)
-- Dependencies: 237
-- Data for Name: dclienteproveedors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dclienteproveedors VALUES (1, 'Paco perico', 1, true, '234324234888', true, '2024-05-25 15:39:13', '2024-05-25 18:55:28');
INSERT INTO public.dclienteproveedors VALUES (3, 'Alma mater', 1, false, NULL, true, '2024-06-01 15:47:15', '2024-06-01 15:47:15');
INSERT INTO public.dclienteproveedors VALUES (4, 'Clara pErez', 2, false, '234324234', true, '2024-06-01 15:47:31', '2024-06-01 15:47:31');


--
-- TOC entry 3825 (class 0 OID 17615)
-- Dependencies: 243
-- Data for Name: dentradaalmacens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dentradaalmacens VALUES (17, 'jkmkm', 13.02, 1, 1, '2024-06-02 12:55:48', '2024-06-02 12:55:48');
INSERT INTO public.dentradaalmacens VALUES (18, 'dfff', 40.33, 1, 1, '2024-06-02 12:57:52', '2024-06-02 14:07:57');


--
-- TOC entry 3829 (class 0 OID 17654)
-- Dependencies: 247
-- Data for Name: dproductoentradas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dproductoentradas VALUES (5, 2, 4, 17, '2024-06-02 12:55:48', '2024-06-02 12:55:48', 5.01);
INSERT INTO public.dproductoentradas VALUES (6, 1, 3, 17, '2024-06-02 12:55:48', '2024-06-02 12:55:48', 3.00);
INSERT INTO public.dproductoentradas VALUES (7, 2, 2, 18, '2024-06-02 12:57:52', '2024-06-02 14:07:57', 8.00);
INSERT INTO public.dproductoentradas VALUES (8, 3, 4, 18, '2024-06-02 12:57:52', '2024-06-02 14:07:57', 5.04);
INSERT INTO public.dproductoentradas VALUES (9, 3, 3, 18, '2024-06-02 14:07:45', '2024-06-02 14:07:57', 3.07);


--
-- TOC entry 3817 (class 0 OID 17558)
-- Dependencies: 235
-- Data for Name: dproductos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dproductos VALUES (3, 'pasta', 3, 'kljask', 'kljdklsj', 'u', 2, '2024-05-30 01:49:40', '2024-05-30 01:49:40');
INSERT INTO public.dproductos VALUES (4, 'sabana', 5, 'sdf', 'sddq', 'u', 4, '2024-05-30 01:50:27', '2024-05-30 01:50:27');
INSERT INTO public.dproductos VALUES (2, 'sfg ergdg', 7, 'wrewr', 'wrwrwffdd', 'ld', 4, '2024-05-26 19:15:02', '2024-05-30 01:50:40');


--
-- TOC entry 3831 (class 0 OID 17671)
-- Dependencies: 249
-- Data for Name: dproductosalidas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dproductosalidas VALUES (1, 1, 4, 3, '2024-06-03 03:44:05', '2024-06-03 03:44:05', 5.00);
INSERT INTO public.dproductosalidas VALUES (2, 1, 2, 3, '2024-06-03 03:44:05', '2024-06-03 03:44:05', 7.00);


--
-- TOC entry 3827 (class 0 OID 17632)
-- Dependencies: 245
-- Data for Name: dsalidaalmacens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dsalidaalmacens VALUES (2, 'sdfdsfds', 8, false, 2, 2, 1, '2024-06-03 03:18:06', '2024-06-03 03:18:06');
INSERT INTO public.dsalidaalmacens VALUES (3, 'khjhj', 12, true, 1, 2, NULL, '2024-06-03 03:44:05', '2024-06-03 03:44:05');


--
-- TOC entry 3835 (class 0 OID 17697)
-- Dependencies: 253
-- Data for Name: dventaproductos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3833 (class 0 OID 17688)
-- Dependencies: 251
-- Data for Name: dventas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3809 (class 0 OID 17520)
-- Dependencies: 227
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3807 (class 0 OID 17512)
-- Dependencies: 225
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3806 (class 0 OID 17503)
-- Dependencies: 224
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3798 (class 0 OID 16946)
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
-- TOC entry 3813 (class 0 OID 17539)
-- Dependencies: 231
-- Data for Name: nalmacens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nalmacens VALUES (1, 'Alamcen 1', true, '2024-05-24 00:00:00', '2024-05-24 00:00:00', 1);
INSERT INTO public.nalmacens VALUES (2, 'Almacen 2', true, '2024-05-24 00:00:00', '2024-05-24 00:00:00', 2);


--
-- TOC entry 3811 (class 0 OID 17532)
-- Dependencies: 229
-- Data for Name: ngiros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ngiros VALUES (1, 'Canastilla', '2024-05-12 02:37:43', '2024-05-12 02:37:43');
INSERT INTO public.ngiros VALUES (3, 'biberon 44', '2024-05-22 23:50:05', '2024-05-23 00:20:18');
INSERT INTO public.ngiros VALUES (2, 'sfdssfs sdsds', '2024-05-20 03:57:57', '2024-05-23 03:17:51');


--
-- TOC entry 3815 (class 0 OID 17546)
-- Dependencies: 233
-- Data for Name: ntipogiros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ntipogiros VALUES (2, 'hh fff', '2024-05-26 04:35:06', '2024-05-26 16:24:12', 1);
INSERT INTO public.ntipogiros VALUES (4, 'gggg', '2024-05-26 21:56:43', '2024-05-26 21:56:43', 3);


--
-- TOC entry 3801 (class 0 OID 17472)
-- Dependencies: 219
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3802 (class 0 OID 17479)
-- Dependencies: 220
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sessions VALUES ('KJca5aiPji7leWzIRyopbKz5WAdeISsjyaMK3enR', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnJ0aGlOMEVaOTdRbVphRWg0YW02ZENwSGdCR2FVamJWRUR4QnpuOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1717307417);
INSERT INTO public.sessions VALUES ('fJmctlpZTZJydXgq2EaoK4v8TTsNuESGHJo3HiGm', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicjVtWEQxR0VWdHJPeU11ZHMwU2V0UnB2ZE1vdDBqVXRBVk9UNkF5eSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozODoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2RlbnRyYWRhYWxtYWNlbnMiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozODoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2RlbnRyYWRhYWxtYWNlbnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1717280240);
INSERT INTO public.sessions VALUES ('XPfuNe3a1mQefGqUklNZsNQOdprIfjUJbWTN0b9a', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZGN5WU5weVdlSnpveFRieGlUc1l5RDkxczZrUWthczRRbkVmaFMyeSI7czozOiJ1cmwiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kc2FsaWRhYWxtYWNlbnMvMy9lZGl0Ijt9fQ==', 1717386266);
INSERT INTO public.sessions VALUES ('ujVwVeum4NoXelArB9Z4tzQvc0WlEumf0XvtJf7T', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiV1N2YzFBQkdxejZNVWlCWHlYZTdaN0t4SmVMQWg2TWFGMTB2YmZ1MiI7czozOiJ1cmwiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kZW50cmFkYWFsbWFjZW5zLzE3Ijt9fQ==', 1717337606);
INSERT INTO public.sessions VALUES ('11i9jLiGPl2puuTvkq51eOOPavUdFyYESDZn63Yu', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidFlwajNrZ1JEdEhYamhzMVhQbjV4d3drMWl5UjhpbkprR04wWEYydyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0NjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2RlbnRyYWRhYWxtYWNlbnMvMTYvZWRpdCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ2OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGVudHJhZGFhbG1hY2Vucy8xNi9lZGl0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1717307417);
INSERT INTO public.sessions VALUES ('MCaaA3rfCSmFzcWSonvYlbK49ngmbsPbsNkWhOrA', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQkdrT2sxNldkTjYyR0tjZG1mOXdLUjAxN3hBU055SjJobzdZV052byI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ1OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGVudHJhZGFhbG1hY2Vucy9jcmVhdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1717308988);
INSERT INTO public.sessions VALUES ('JtZKvqCx8J9BaMOUnAFtTfk4DA2HbDuHml1GzRJ0', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidUhqQTVodTBtcUxvdjJ6SXF0VmVCM21qVnVUYTV3dU40dHd6RGxJNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1717280240);
INSERT INTO public.sessions VALUES ('ns2tXtQIC3bCIBrKqtkAa5GalGm9zOUclXaPdtaG', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZUNtV3lUc2JQbWtRcm5uVUJ5RzdrbHNVVnFkTTZ1NElkcnQ2Y1VOQiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM4OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGVudHJhZGFhbG1hY2VucyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1717280827);
INSERT INTO public.sessions VALUES ('DJhiJn3EzVh4irAysDPYDeEeM2r4izMFDK6LIsrn', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiS3ZQdGhKWEtOZjQ3aTY2UUpKck5MRWtRY21JckNqN0pTbVBSMHJYRSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM4OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGVudHJhZGFhbG1hY2VucyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1717362863);


--
-- TOC entry 3800 (class 0 OID 17462)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'comercio', 'comercio@comercio.app', NULL, '$2y$12$Fb5qSR2aMonz9/R1QZOB5.luWw40U9lbi3vGYYfge5.FqgSUCb1Fm', 'EatSfO25p0YdzcIns388pL2wmor5ms7xvGeEneoe90Q2guiwUeyg7upiChca', '2024-05-11 20:18:22', '2024-05-11 20:18:22');


--
-- TOC entry 3859 (class 0 OID 0)
-- Dependencies: 238
-- Name: dalmaceninternos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dalmaceninternos_id_seq', 1, false);


--
-- TOC entry 3860 (class 0 OID 0)
-- Dependencies: 240
-- Name: dalmacenventas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dalmacenventas_id_seq', 1, false);


--
-- TOC entry 3861 (class 0 OID 0)
-- Dependencies: 236
-- Name: dclienteproveedors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dclienteproveedors_id_seq', 4, true);


--
-- TOC entry 3862 (class 0 OID 0)
-- Dependencies: 242
-- Name: dentradaalmacens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dentradaalmacens_id_seq', 18, true);


--
-- TOC entry 3863 (class 0 OID 0)
-- Dependencies: 246
-- Name: dproductoentradas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dproductoentradas_id_seq', 9, true);


--
-- TOC entry 3864 (class 0 OID 0)
-- Dependencies: 234
-- Name: dproductos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dproductos_id_seq', 4, true);


--
-- TOC entry 3865 (class 0 OID 0)
-- Dependencies: 248
-- Name: dproductosalidas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dproductosalidas_id_seq', 2, true);


--
-- TOC entry 3866 (class 0 OID 0)
-- Dependencies: 244
-- Name: dsalidaalmacens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dsalidaalmacens_id_seq', 3, true);


--
-- TOC entry 3867 (class 0 OID 0)
-- Dependencies: 252
-- Name: dventaproductos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dventaproductos_id_seq', 1, false);


--
-- TOC entry 3868 (class 0 OID 0)
-- Dependencies: 250
-- Name: dventas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dventas_id_seq', 1, false);


--
-- TOC entry 3869 (class 0 OID 0)
-- Dependencies: 226
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3870 (class 0 OID 0)
-- Dependencies: 223
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 3871 (class 0 OID 0)
-- Dependencies: 215
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 47, true);


--
-- TOC entry 3872 (class 0 OID 0)
-- Dependencies: 230
-- Name: nalmacens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nalmacens_id_seq', 2, true);


--
-- TOC entry 3873 (class 0 OID 0)
-- Dependencies: 228
-- Name: ngiros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ngiros_id_seq', 5, true);


--
-- TOC entry 3874 (class 0 OID 0)
-- Dependencies: 232
-- Name: ntipogiros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ntipogiros_id_seq', 4, true);


--
-- TOC entry 3875 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


-- Completed on 2024-06-02 23:48:15 EDT

--
-- PostgreSQL database dump complete
--

