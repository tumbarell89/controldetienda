--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Postgres.app)
-- Dumped by pg_dump version 16.1

-- Started on 2024-06-02 23:49:27 EDT

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
-- TOC entry 221 (class 1259 OID 17488)
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17495)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17581)
-- Name: dalmaceninternos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dalmaceninternos (
    id bigint NOT NULL,
    cantidad double precision NOT NULL,
    ialmacens_id bigint NOT NULL,
    dproductos_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.dalmaceninternos OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17580)
-- Name: dalmaceninternos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dalmaceninternos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dalmaceninternos_id_seq OWNER TO postgres;

--
-- TOC entry 3841 (class 0 OID 0)
-- Dependencies: 238
-- Name: dalmaceninternos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dalmaceninternos_id_seq OWNED BY public.dalmaceninternos.id;


--
-- TOC entry 241 (class 1259 OID 17598)
-- Name: dalmacenventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dalmacenventas (
    id bigint NOT NULL,
    cantidad double precision NOT NULL,
    valamcens_id bigint NOT NULL,
    dproductos_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.dalmacenventas OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 17597)
-- Name: dalmacenventas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dalmacenventas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dalmacenventas_id_seq OWNER TO postgres;

--
-- TOC entry 3842 (class 0 OID 0)
-- Dependencies: 240
-- Name: dalmacenventas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dalmacenventas_id_seq OWNED BY public.dalmacenventas.id;


--
-- TOC entry 237 (class 1259 OID 17572)
-- Name: dclienteproveedors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dclienteproveedors (
    id bigint NOT NULL,
    denominacion character varying(255) NOT NULL,
    tipocliente integer NOT NULL,
    esembarazada boolean,
    carnetidentidad character varying(255),
    activo boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.dclienteproveedors OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17571)
-- Name: dclienteproveedors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dclienteproveedors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dclienteproveedors_id_seq OWNER TO postgres;

--
-- TOC entry 3843 (class 0 OID 0)
-- Dependencies: 236
-- Name: dclienteproveedors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dclienteproveedors_id_seq OWNED BY public.dclienteproveedors.id;


--
-- TOC entry 243 (class 1259 OID 17615)
-- Name: dentradaalmacens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dentradaalmacens (
    id bigint NOT NULL,
    factura character varying(255) NOT NULL,
    total double precision NOT NULL,
    nalmacens_id bigint NOT NULL,
    dproveedor_origen_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.dentradaalmacens OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17614)
-- Name: dentradaalmacens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dentradaalmacens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dentradaalmacens_id_seq OWNER TO postgres;

--
-- TOC entry 3844 (class 0 OID 0)
-- Dependencies: 242
-- Name: dentradaalmacens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dentradaalmacens_id_seq OWNED BY public.dentradaalmacens.id;


--
-- TOC entry 247 (class 1259 OID 17654)
-- Name: dproductoentradas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dproductoentradas (
    id bigint NOT NULL,
    cantidad double precision NOT NULL,
    dproducto_id bigint NOT NULL,
    dentradaalmacen_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    precio numeric(19,2)
);


ALTER TABLE public.dproductoentradas OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 17653)
-- Name: dproductoentradas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dproductoentradas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dproductoentradas_id_seq OWNER TO postgres;

--
-- TOC entry 3845 (class 0 OID 0)
-- Dependencies: 246
-- Name: dproductoentradas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dproductoentradas_id_seq OWNED BY public.dproductoentradas.id;


--
-- TOC entry 235 (class 1259 OID 17558)
-- Name: dproductos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dproductos (
    id bigint NOT NULL,
    denominacion character varying(255) NOT NULL,
    preciocosto double precision NOT NULL,
    codigocup character varying(255) NOT NULL,
    codigoproducto character varying(255) NOT NULL,
    unidadmedida character varying(255) NOT NULL,
    dtipogiros_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.dproductos OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17557)
-- Name: dproductos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dproductos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dproductos_id_seq OWNER TO postgres;

--
-- TOC entry 3846 (class 0 OID 0)
-- Dependencies: 234
-- Name: dproductos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dproductos_id_seq OWNED BY public.dproductos.id;


--
-- TOC entry 249 (class 1259 OID 17671)
-- Name: dproductosalidas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dproductosalidas (
    id bigint NOT NULL,
    cantidad double precision NOT NULL,
    dproducto_id bigint NOT NULL,
    dsalidaalmacen_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    precio numeric(19,2) NOT NULL
);


ALTER TABLE public.dproductosalidas OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 17670)
-- Name: dproductosalidas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dproductosalidas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dproductosalidas_id_seq OWNER TO postgres;

--
-- TOC entry 3847 (class 0 OID 0)
-- Dependencies: 248
-- Name: dproductosalidas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dproductosalidas_id_seq OWNED BY public.dproductosalidas.id;


--
-- TOC entry 245 (class 1259 OID 17632)
-- Name: dsalidaalmacens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dsalidaalmacens (
    id bigint NOT NULL,
    factura character varying(255) NOT NULL,
    total double precision NOT NULL,
    esventa boolean NOT NULL,
    nalmacenes_origen_id bigint NOT NULL,
    nalmacenes_destino_id bigint,
    dproveedor_destino_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.dsalidaalmacens OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 17631)
-- Name: dsalidaalmacens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dsalidaalmacens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dsalidaalmacens_id_seq OWNER TO postgres;

--
-- TOC entry 3848 (class 0 OID 0)
-- Dependencies: 244
-- Name: dsalidaalmacens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dsalidaalmacens_id_seq OWNED BY public.dsalidaalmacens.id;


--
-- TOC entry 253 (class 1259 OID 17697)
-- Name: dventaproductos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dventaproductos (
    id bigint NOT NULL,
    cantidad double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    dventas_id bigint NOT NULL,
    dproductos_id bigint NOT NULL
);


ALTER TABLE public.dventaproductos OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 17696)
-- Name: dventaproductos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dventaproductos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dventaproductos_id_seq OWNER TO postgres;

--
-- TOC entry 3849 (class 0 OID 0)
-- Dependencies: 252
-- Name: dventaproductos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dventaproductos_id_seq OWNED BY public.dventaproductos.id;


--
-- TOC entry 251 (class 1259 OID 17688)
-- Name: dventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dventas (
    id bigint NOT NULL,
    codigoconcecutivo integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.dventas OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 17687)
-- Name: dventas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dventas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dventas_id_seq OWNER TO postgres;

--
-- TOC entry 3850 (class 0 OID 0)
-- Dependencies: 250
-- Name: dventas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dventas_id_seq OWNED BY public.dventas.id;


--
-- TOC entry 227 (class 1259 OID 17520)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17519)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 3851 (class 0 OID 0)
-- Dependencies: 226
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 225 (class 1259 OID 17512)
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17503)
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17502)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- TOC entry 3852 (class 0 OID 0)
-- Dependencies: 223
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 216 (class 1259 OID 16946)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16945)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3853 (class 0 OID 0)
-- Dependencies: 215
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 231 (class 1259 OID 17539)
-- Name: nalmacens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nalmacens (
    id bigint NOT NULL,
    denominacion character varying(100) NOT NULL,
    activo boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    tipo integer DEFAULT 1
);


ALTER TABLE public.nalmacens OWNER TO postgres;

--
-- TOC entry 3854 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN nalmacens.tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nalmacens.tipo IS 'solo alamacenara dos valores 1- Alamcen interno, 2 Almacen de ventas';


--
-- TOC entry 230 (class 1259 OID 17538)
-- Name: nalmacens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nalmacens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nalmacens_id_seq OWNER TO postgres;

--
-- TOC entry 3855 (class 0 OID 0)
-- Dependencies: 230
-- Name: nalmacens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nalmacens_id_seq OWNED BY public.nalmacens.id;


--
-- TOC entry 229 (class 1259 OID 17532)
-- Name: ngiros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ngiros (
    id bigint NOT NULL,
    denominacion character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.ngiros OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17531)
-- Name: ngiros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ngiros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ngiros_id_seq OWNER TO postgres;

--
-- TOC entry 3856 (class 0 OID 0)
-- Dependencies: 228
-- Name: ngiros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ngiros_id_seq OWNED BY public.ngiros.id;


--
-- TOC entry 233 (class 1259 OID 17546)
-- Name: ntipogiros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ntipogiros (
    id bigint NOT NULL,
    denominacion character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    ngiros_id bigint NOT NULL
);


ALTER TABLE public.ntipogiros OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17545)
-- Name: ntipogiros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ntipogiros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ntipogiros_id_seq OWNER TO postgres;

--
-- TOC entry 3857 (class 0 OID 0)
-- Dependencies: 232
-- Name: ntipogiros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ntipogiros_id_seq OWNED BY public.ntipogiros.id;


--
-- TOC entry 219 (class 1259 OID 17472)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17479)
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17462)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17461)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3858 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3576 (class 2604 OID 17584)
-- Name: dalmaceninternos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dalmaceninternos ALTER COLUMN id SET DEFAULT nextval('public.dalmaceninternos_id_seq'::regclass);


--
-- TOC entry 3577 (class 2604 OID 17601)
-- Name: dalmacenventas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dalmacenventas ALTER COLUMN id SET DEFAULT nextval('public.dalmacenventas_id_seq'::regclass);


--
-- TOC entry 3575 (class 2604 OID 17575)
-- Name: dclienteproveedors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dclienteproveedors ALTER COLUMN id SET DEFAULT nextval('public.dclienteproveedors_id_seq'::regclass);


--
-- TOC entry 3578 (class 2604 OID 17618)
-- Name: dentradaalmacens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dentradaalmacens ALTER COLUMN id SET DEFAULT nextval('public.dentradaalmacens_id_seq'::regclass);


--
-- TOC entry 3580 (class 2604 OID 17657)
-- Name: dproductoentradas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductoentradas ALTER COLUMN id SET DEFAULT nextval('public.dproductoentradas_id_seq'::regclass);


--
-- TOC entry 3574 (class 2604 OID 17561)
-- Name: dproductos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductos ALTER COLUMN id SET DEFAULT nextval('public.dproductos_id_seq'::regclass);


--
-- TOC entry 3581 (class 2604 OID 17674)
-- Name: dproductosalidas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductosalidas ALTER COLUMN id SET DEFAULT nextval('public.dproductosalidas_id_seq'::regclass);


--
-- TOC entry 3579 (class 2604 OID 17635)
-- Name: dsalidaalmacens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dsalidaalmacens ALTER COLUMN id SET DEFAULT nextval('public.dsalidaalmacens_id_seq'::regclass);


--
-- TOC entry 3583 (class 2604 OID 17700)
-- Name: dventaproductos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dventaproductos ALTER COLUMN id SET DEFAULT nextval('public.dventaproductos_id_seq'::regclass);


--
-- TOC entry 3582 (class 2604 OID 17691)
-- Name: dventas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dventas ALTER COLUMN id SET DEFAULT nextval('public.dventas_id_seq'::regclass);


--
-- TOC entry 3568 (class 2604 OID 17523)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3567 (class 2604 OID 17506)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 3565 (class 2604 OID 16949)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3571 (class 2604 OID 17542)
-- Name: nalmacens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nalmacens ALTER COLUMN id SET DEFAULT nextval('public.nalmacens_id_seq'::regclass);


--
-- TOC entry 3570 (class 2604 OID 17535)
-- Name: ngiros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ngiros ALTER COLUMN id SET DEFAULT nextval('public.ngiros_id_seq'::regclass);


--
-- TOC entry 3573 (class 2604 OID 17549)
-- Name: ntipogiros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ntipogiros ALTER COLUMN id SET DEFAULT nextval('public.ntipogiros_id_seq'::regclass);


--
-- TOC entry 3566 (class 2604 OID 17465)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


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


--
-- TOC entry 3599 (class 2606 OID 17501)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 3597 (class 2606 OID 17494)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 3620 (class 2606 OID 17586)
-- Name: dalmaceninternos dalmaceninternos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dalmaceninternos
    ADD CONSTRAINT dalmaceninternos_pkey PRIMARY KEY (id);


--
-- TOC entry 3622 (class 2606 OID 17603)
-- Name: dalmacenventas dalmacenventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dalmacenventas
    ADD CONSTRAINT dalmacenventas_pkey PRIMARY KEY (id);


--
-- TOC entry 3618 (class 2606 OID 17579)
-- Name: dclienteproveedors dclienteproveedors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dclienteproveedors
    ADD CONSTRAINT dclienteproveedors_pkey PRIMARY KEY (id);


--
-- TOC entry 3624 (class 2606 OID 17620)
-- Name: dentradaalmacens dentradaalmacens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dentradaalmacens
    ADD CONSTRAINT dentradaalmacens_pkey PRIMARY KEY (id);


--
-- TOC entry 3628 (class 2606 OID 17659)
-- Name: dproductoentradas dproductoentradas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductoentradas
    ADD CONSTRAINT dproductoentradas_pkey PRIMARY KEY (id);


--
-- TOC entry 3616 (class 2606 OID 17565)
-- Name: dproductos dproductos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductos
    ADD CONSTRAINT dproductos_pkey PRIMARY KEY (id);


--
-- TOC entry 3630 (class 2606 OID 17676)
-- Name: dproductosalidas dproductosalidas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductosalidas
    ADD CONSTRAINT dproductosalidas_pkey PRIMARY KEY (id);


--
-- TOC entry 3626 (class 2606 OID 17637)
-- Name: dsalidaalmacens dsalidaalmacens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dsalidaalmacens
    ADD CONSTRAINT dsalidaalmacens_pkey PRIMARY KEY (id);


--
-- TOC entry 3636 (class 2606 OID 17702)
-- Name: dventaproductos dventaproductos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dventaproductos
    ADD CONSTRAINT dventaproductos_pkey PRIMARY KEY (id);


--
-- TOC entry 3632 (class 2606 OID 17695)
-- Name: dventas dventas_codigoconcecutivo_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dventas
    ADD CONSTRAINT dventas_codigoconcecutivo_unique UNIQUE (codigoconcecutivo);


--
-- TOC entry 3634 (class 2606 OID 17693)
-- Name: dventas dventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dventas
    ADD CONSTRAINT dventas_pkey PRIMARY KEY (id);


--
-- TOC entry 3606 (class 2606 OID 17528)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3608 (class 2606 OID 17530)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 3604 (class 2606 OID 17518)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 3601 (class 2606 OID 17510)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3585 (class 2606 OID 16951)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3612 (class 2606 OID 17544)
-- Name: nalmacens nalmacens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nalmacens
    ADD CONSTRAINT nalmacens_pkey PRIMARY KEY (id);


--
-- TOC entry 3610 (class 2606 OID 17537)
-- Name: ngiros ngiros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ngiros
    ADD CONSTRAINT ngiros_pkey PRIMARY KEY (id);


--
-- TOC entry 3614 (class 2606 OID 17551)
-- Name: ntipogiros ntipogiros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ntipogiros
    ADD CONSTRAINT ntipogiros_pkey PRIMARY KEY (id);


--
-- TOC entry 3591 (class 2606 OID 17478)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 3594 (class 2606 OID 17485)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3587 (class 2606 OID 17471)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3589 (class 2606 OID 17469)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3602 (class 1259 OID 17511)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 3592 (class 1259 OID 17487)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 3595 (class 1259 OID 17486)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 3639 (class 2606 OID 17592)
-- Name: dalmaceninternos dalmaceninternos_dproductos_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dalmaceninternos
    ADD CONSTRAINT dalmaceninternos_dproductos_id_foreign FOREIGN KEY (dproductos_id) REFERENCES public.dproductos(id);


--
-- TOC entry 3640 (class 2606 OID 17587)
-- Name: dalmaceninternos dalmaceninternos_ialmacens_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dalmaceninternos
    ADD CONSTRAINT dalmaceninternos_ialmacens_id_foreign FOREIGN KEY (ialmacens_id) REFERENCES public.nalmacens(id);


--
-- TOC entry 3641 (class 2606 OID 17609)
-- Name: dalmacenventas dalmacenventas_dproductos_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dalmacenventas
    ADD CONSTRAINT dalmacenventas_dproductos_id_foreign FOREIGN KEY (dproductos_id) REFERENCES public.dproductos(id);


--
-- TOC entry 3642 (class 2606 OID 17604)
-- Name: dalmacenventas dalmacenventas_valamcens_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dalmacenventas
    ADD CONSTRAINT dalmacenventas_valamcens_id_foreign FOREIGN KEY (valamcens_id) REFERENCES public.nalmacens(id);


--
-- TOC entry 3643 (class 2606 OID 17626)
-- Name: dentradaalmacens dentradaalmacens_dproveedor_origen_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dentradaalmacens
    ADD CONSTRAINT dentradaalmacens_dproveedor_origen_id_foreign FOREIGN KEY (dproveedor_origen_id) REFERENCES public.dclienteproveedors(id);


--
-- TOC entry 3644 (class 2606 OID 17621)
-- Name: dentradaalmacens dentradaalmacens_nalmacens_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dentradaalmacens
    ADD CONSTRAINT dentradaalmacens_nalmacens_id_foreign FOREIGN KEY (nalmacens_id) REFERENCES public.nalmacens(id);


--
-- TOC entry 3648 (class 2606 OID 17665)
-- Name: dproductoentradas dproductoentradas_dentradaalmacen_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductoentradas
    ADD CONSTRAINT dproductoentradas_dentradaalmacen_id_foreign FOREIGN KEY (dentradaalmacen_id) REFERENCES public.dentradaalmacens(id);


--
-- TOC entry 3649 (class 2606 OID 17660)
-- Name: dproductoentradas dproductoentradas_dproducto_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductoentradas
    ADD CONSTRAINT dproductoentradas_dproducto_id_foreign FOREIGN KEY (dproducto_id) REFERENCES public.dproductos(id);


--
-- TOC entry 3638 (class 2606 OID 17566)
-- Name: dproductos dproductos_dtipogiros_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductos
    ADD CONSTRAINT dproductos_dtipogiros_id_foreign FOREIGN KEY (dtipogiros_id) REFERENCES public.ntipogiros(id);


--
-- TOC entry 3650 (class 2606 OID 17677)
-- Name: dproductosalidas dproductosalidas_dproducto_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductosalidas
    ADD CONSTRAINT dproductosalidas_dproducto_id_foreign FOREIGN KEY (dproducto_id) REFERENCES public.dproductos(id);


--
-- TOC entry 3651 (class 2606 OID 17682)
-- Name: dproductosalidas dproductosalidas_dsalidaalmacen_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductosalidas
    ADD CONSTRAINT dproductosalidas_dsalidaalmacen_id_foreign FOREIGN KEY (dsalidaalmacen_id) REFERENCES public.dsalidaalmacens(id);


--
-- TOC entry 3645 (class 2606 OID 17648)
-- Name: dsalidaalmacens dsalidaalmacens_dproveedor_destino_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dsalidaalmacens
    ADD CONSTRAINT dsalidaalmacens_dproveedor_destino_id_foreign FOREIGN KEY (dproveedor_destino_id) REFERENCES public.dclienteproveedors(id);


--
-- TOC entry 3646 (class 2606 OID 17643)
-- Name: dsalidaalmacens dsalidaalmacens_nalmacenes_destino_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dsalidaalmacens
    ADD CONSTRAINT dsalidaalmacens_nalmacenes_destino_id_foreign FOREIGN KEY (nalmacenes_destino_id) REFERENCES public.nalmacens(id);


--
-- TOC entry 3647 (class 2606 OID 17638)
-- Name: dsalidaalmacens dsalidaalmacens_nalmacenes_origen_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dsalidaalmacens
    ADD CONSTRAINT dsalidaalmacens_nalmacenes_origen_id_foreign FOREIGN KEY (nalmacenes_origen_id) REFERENCES public.nalmacens(id);


--
-- TOC entry 3652 (class 2606 OID 17708)
-- Name: dventaproductos dventaproductos_dproductos_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dventaproductos
    ADD CONSTRAINT dventaproductos_dproductos_id_foreign FOREIGN KEY (dproductos_id) REFERENCES public.dproductos(id);


--
-- TOC entry 3653 (class 2606 OID 17703)
-- Name: dventaproductos dventaproductos_dventas_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dventaproductos
    ADD CONSTRAINT dventaproductos_dventas_id_foreign FOREIGN KEY (dventas_id) REFERENCES public.dventas(id);


--
-- TOC entry 3637 (class 2606 OID 17552)
-- Name: ntipogiros ntipogiros_ngiros_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ntipogiros
    ADD CONSTRAINT ntipogiros_ngiros_id_foreign FOREIGN KEY (ngiros_id) REFERENCES public.ngiros(id);


-- Completed on 2024-06-02 23:49:27 EDT

--
-- PostgreSQL database dump complete
--

