--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md53175bce1d3201d16594cebf9d7eb3f9d';






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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
-- Name: blogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blogs (
    id integer NOT NULL,
    title text,
    content text
);


ALTER TABLE public.blogs OWNER TO postgres;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 100
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO postgres;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: fruits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fruits (
    id integer NOT NULL,
    name text NOT NULL,
    price real NOT NULL
);


ALTER TABLE public.fruits OWNER TO postgres;

--
-- Name: blogs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blogs (id, title, content) FROM stdin;
38	sdddd	aaaa
\.


--
-- Data for Name: fruits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fruits (id, name, price) FROM stdin;
1	apple	12
\.


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blogs_id_seq', 38, true);


--
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: fruits fruits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruits
    ADD CONSTRAINT fruits_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "spiker" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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
-- Name: spiker; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE spiker WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE spiker OWNER TO postgres;

\connect spiker

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
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: administrator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administrator (
    id integer NOT NULL,
    login_id text NOT NULL,
    password text NOT NULL,
    token_version text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.administrator OWNER TO postgres;

--
-- Name: administrator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.administrator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administrator_id_seq OWNER TO postgres;

--
-- Name: administrator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.administrator_id_seq OWNED BY public.administrator.id;


--
-- Name: annotated_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annotated_event (
    id integer NOT NULL,
    measurement_id integer NOT NULL,
    annotator_id integer,
    risk integer,
    memo text NOT NULL,
    range_from timestamp with time zone NOT NULL,
    range_until timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    computed_event_id integer,
    is_closed boolean DEFAULT false NOT NULL,
    closing_memo text,
    closed_at timestamp with time zone,
    closing_reason text
);


ALTER TABLE public.annotated_event OWNER TO postgres;

--
-- Name: annotated_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.annotated_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotated_event_id_seq OWNER TO postgres;

--
-- Name: annotated_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.annotated_event_id_seq OWNED BY public.annotated_event.id;


--
-- Name: annotator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annotator (
    id integer NOT NULL,
    login_id text NOT NULL,
    password text NOT NULL,
    token_version text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.annotator OWNER TO postgres;

--
-- Name: annotator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.annotator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotator_id_seq OWNER TO postgres;

--
-- Name: annotator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.annotator_id_seq OWNED BY public.annotator.id;


--
-- Name: antenatal_patient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.antenatal_patient (
    patient_id integer NOT NULL,
    gestation integer,
    parturition integer,
    medical_disorder text,
    birth_year integer,
    c_section_history integer,
    is_twin boolean,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.antenatal_patient OWNER TO postgres;

--
-- Name: computed_diagnosis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.computed_diagnosis (
    diagnosis_id integer NOT NULL,
    algorithm_id integer NOT NULL
);


ALTER TABLE public.computed_diagnosis OWNER TO postgres;

--
-- Name: computed_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.computed_event (
    id integer NOT NULL,
    measurement_id integer NOT NULL,
    risk integer,
    memo text NOT NULL,
    range_from timestamp with time zone NOT NULL,
    range_until timestamp with time zone NOT NULL,
    parameters jsonb NOT NULL,
    is_hidden boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    is_suspended boolean DEFAULT false NOT NULL,
    is_closed boolean DEFAULT false NOT NULL,
    closing_memo text,
    closed_at timestamp with time zone,
    category text NOT NULL,
    baseline text,
    baseline_bpm integer,
    variability text,
    variability_bpm integer,
    deceleration text,
    closing_reason text
);


ALTER TABLE public.computed_event OWNER TO postgres;

--
-- Name: computed_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.computed_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computed_event_id_seq OWNER TO postgres;

--
-- Name: computed_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.computed_event_id_seq OWNED BY public.computed_event.id;


--
-- Name: ctg_authentication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ctg_authentication (
    id integer NOT NULL,
    hospital_id integer NOT NULL,
    api_key text NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.ctg_authentication OWNER TO postgres;

--
-- Name: ctg_authentication_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ctg_authentication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ctg_authentication_id_seq OWNER TO postgres;

--
-- Name: ctg_authentication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ctg_authentication_id_seq OWNED BY public.ctg_authentication.id;


--
-- Name: diagnosis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diagnosis (
    id integer NOT NULL,
    measurement_id integer NOT NULL,
    baseline_bpm integer,
    maximum_risk integer,
    memo text NOT NULL,
    range_from timestamp with time zone NOT NULL,
    range_until timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.diagnosis OWNER TO postgres;

--
-- Name: diagnosis_algorithm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diagnosis_algorithm (
    id integer NOT NULL,
    name text NOT NULL,
    version text NOT NULL,
    memo text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.diagnosis_algorithm OWNER TO postgres;

--
-- Name: diagnosis_algorithm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diagnosis_algorithm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diagnosis_algorithm_id_seq OWNER TO postgres;

--
-- Name: diagnosis_algorithm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diagnosis_algorithm_id_seq OWNED BY public.diagnosis_algorithm.id;


--
-- Name: diagnosis_authentication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diagnosis_authentication (
    id integer NOT NULL,
    api_key text NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.diagnosis_authentication OWNER TO postgres;

--
-- Name: diagnosis_authentication_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diagnosis_authentication_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diagnosis_authentication_id_seq OWNER TO postgres;

--
-- Name: diagnosis_authentication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diagnosis_authentication_id_seq OWNED BY public.diagnosis_authentication.id;


--
-- Name: diagnosis_content; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diagnosis_content (
    id integer NOT NULL,
    diagnosis_id integer NOT NULL,
    range_from timestamp with time zone NOT NULL,
    range_until timestamp with time zone NOT NULL,
    parameters jsonb NOT NULL,
    risk integer,
    category text NOT NULL,
    baseline text,
    baseline_bpm integer,
    variability text,
    variability_bpm integer,
    deceleration text
);


ALTER TABLE public.diagnosis_content OWNER TO postgres;

--
-- Name: diagnosis_content_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diagnosis_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diagnosis_content_id_seq OWNER TO postgres;

--
-- Name: diagnosis_content_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diagnosis_content_id_seq OWNED BY public.diagnosis_content.id;


--
-- Name: diagnosis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.diagnosis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diagnosis_id_seq OWNER TO postgres;

--
-- Name: diagnosis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.diagnosis_id_seq OWNED BY public.diagnosis.id;


--
-- Name: doctor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor (
    id integer NOT NULL,
    hospital_id integer NOT NULL,
    login_id text NOT NULL,
    password text NOT NULL,
    token_version text NOT NULL,
    topic text NOT NULL,
    name text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.doctor OWNER TO postgres;

--
-- Name: doctor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_id_seq OWNER TO postgres;

--
-- Name: doctor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctor_id_seq OWNED BY public.doctor.id;


--
-- Name: event_alert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_alert (
    computed_event_id integer NOT NULL,
    annotator_id integer,
    risk integer NOT NULL,
    memo text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.event_alert OWNER TO postgres;

--
-- Name: event_annotation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_annotation (
    id integer NOT NULL,
    computed_event_id integer NOT NULL,
    annotator_id integer,
    risk integer NOT NULL,
    memo text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.event_annotation OWNER TO postgres;

--
-- Name: event_annotation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_annotation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_annotation_id_seq OWNER TO postgres;

--
-- Name: event_annotation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_annotation_id_seq OWNED BY public.event_annotation.id;


--
-- Name: hospital; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hospital (
    id integer NOT NULL,
    uuid text NOT NULL,
    topic text NOT NULL,
    name text NOT NULL,
    memo text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.hospital OWNER TO postgres;

--
-- Name: hospital_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hospital_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hospital_id_seq OWNER TO postgres;

--
-- Name: hospital_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hospital_id_seq OWNED BY public.hospital.id;


--
-- Name: labor_condition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.labor_condition (
    id integer NOT NULL,
    measurement_id integer NOT NULL,
    annotator_id integer,
    temperature real,
    blood_pressure integer,
    maternal_heart_rate integer,
    cervical_dilatation real,
    head_descent integer,
    molding integer,
    contractions_10_min integer,
    memo text NOT NULL,
    observed_at timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.labor_condition OWNER TO postgres;

--
-- Name: labor_condition_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.labor_condition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.labor_condition_id_seq OWNER TO postgres;

--
-- Name: labor_condition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.labor_condition_id_seq OWNED BY public.labor_condition.id;


--
-- Name: measurement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.measurement (
    id integer NOT NULL,
    code text NOT NULL,
    patient_id integer NOT NULL,
    terminal_id integer NOT NULL,
    first_time timestamp with time zone,
    last_time timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    is_closed boolean DEFAULT false NOT NULL,
    closing_memo text,
    closed_at timestamp with time zone,
    maternal_outcome text
);


ALTER TABLE public.measurement OWNER TO postgres;

--
-- Name: COLUMN measurement.maternal_outcome; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.measurement.maternal_outcome IS '母体の転帰。';


--
-- Name: measurement_alert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.measurement_alert (
    measurement_id integer NOT NULL,
    silent_from timestamp with time zone NOT NULL,
    silent_until timestamp with time zone NOT NULL,
    memo text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.measurement_alert OWNER TO postgres;

--
-- Name: measurement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.measurement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.measurement_id_seq OWNER TO postgres;

--
-- Name: measurement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.measurement_id_seq OWNED BY public.measurement.id;


--
-- Name: measurement_terminal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.measurement_terminal (
    id integer NOT NULL,
    hospital_id integer NOT NULL,
    code text NOT NULL,
    display_order integer NOT NULL,
    memo text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.measurement_terminal OWNER TO postgres;

--
-- Name: measurement_terminal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.measurement_terminal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.measurement_terminal_id_seq OWNER TO postgres;

--
-- Name: measurement_terminal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.measurement_terminal_id_seq OWNED BY public.measurement_terminal.id;


--
-- Name: medical_event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medical_event (
    id integer NOT NULL,
    measurement_id integer NOT NULL,
    doctor_id integer,
    is_intervention boolean NOT NULL,
    intervention_kind text,
    uterus_ostium integer,
    memo text NOT NULL,
    range_from timestamp with time zone NOT NULL,
    range_until timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.medical_event OWNER TO postgres;

--
-- Name: medical_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medical_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medical_event_id_seq OWNER TO postgres;

--
-- Name: medical_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medical_event_id_seq OWNED BY public.medical_event.id;


--
-- Name: patient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patient (
    id integer NOT NULL,
    hospital_id integer NOT NULL,
    name text,
    age integer,
    num_children integer,
    cesarean_scar boolean,
    delivery_time integer,
    blood_loss integer,
    birth_weight integer,
    birth_datetime timestamp with time zone,
    gestational_days integer,
    apgar_score_1_min integer,
    apgar_score_5_min integer,
    umbilical_blood integer,
    emergency_cesarean boolean,
    instrumental_labor boolean,
    memo text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.patient OWNER TO postgres;

--
-- Name: patient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patient_id_seq OWNER TO postgres;

--
-- Name: patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patient_id_seq OWNED BY public.patient.id;


--
-- Name: patient_of_doctor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patient_of_doctor (
    doctor_id integer NOT NULL,
    patient_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.patient_of_doctor OWNER TO postgres;

--
-- Name: postnatal_patient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.postnatal_patient (
    patient_id integer NOT NULL,
    partus_kind text,
    gestational_days integer,
    birth_weight integer,
    apgar_score_1_min integer,
    apgar_score_5_min integer,
    cord_blood real,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL
);


ALTER TABLE public.postnatal_patient OWNER TO postgres;

--
-- Name: administrator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator ALTER COLUMN id SET DEFAULT nextval('public.administrator_id_seq'::regclass);


--
-- Name: annotated_event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotated_event ALTER COLUMN id SET DEFAULT nextval('public.annotated_event_id_seq'::regclass);


--
-- Name: annotator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotator ALTER COLUMN id SET DEFAULT nextval('public.annotator_id_seq'::regclass);


--
-- Name: computed_event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.computed_event ALTER COLUMN id SET DEFAULT nextval('public.computed_event_id_seq'::regclass);


--
-- Name: ctg_authentication id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ctg_authentication ALTER COLUMN id SET DEFAULT nextval('public.ctg_authentication_id_seq'::regclass);


--
-- Name: diagnosis id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diagnosis ALTER COLUMN id SET DEFAULT nextval('public.diagnosis_id_seq'::regclass);


--
-- Name: diagnosis_algorithm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diagnosis_algorithm ALTER COLUMN id SET DEFAULT nextval('public.diagnosis_algorithm_id_seq'::regclass);


--
-- Name: diagnosis_authentication id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diagnosis_authentication ALTER COLUMN id SET DEFAULT nextval('public.diagnosis_authentication_id_seq'::regclass);


--
-- Name: diagnosis_content id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diagnosis_content ALTER COLUMN id SET DEFAULT nextval('public.diagnosis_content_id_seq'::regclass);


--
-- Name: doctor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor ALTER COLUMN id SET DEFAULT nextval('public.doctor_id_seq'::regclass);


--
-- Name: event_annotation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_annotation ALTER COLUMN id SET DEFAULT nextval('public.event_annotation_id_seq'::regclass);


--
-- Name: hospital id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital ALTER COLUMN id SET DEFAULT nextval('public.hospital_id_seq'::regclass);


--
-- Name: labor_condition id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.labor_condition ALTER COLUMN id SET DEFAULT nextval('public.labor_condition_id_seq'::regclass);


--
-- Name: measurement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurement ALTER COLUMN id SET DEFAULT nextval('public.measurement_id_seq'::regclass);


--
-- Name: measurement_terminal id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurement_terminal ALTER COLUMN id SET DEFAULT nextval('public.measurement_terminal_id_seq'::regclass);


--
-- Name: medical_event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_event ALTER COLUMN id SET DEFAULT nextval('public.medical_event_id_seq'::regclass);


--
-- Name: patient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient ALTER COLUMN id SET DEFAULT nextval('public.patient_id_seq'::regclass);


--
-- Data for Name: administrator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administrator (id, login_id, password, token_version, created_at, modified_at) FROM stdin;
2	administrator	5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8		2023-10-21 06:07:37.808564-07	2023-10-21 06:07:37.808564-07
\.


--
-- Data for Name: annotated_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.annotated_event (id, measurement_id, annotator_id, risk, memo, range_from, range_until, created_at, modified_at, computed_event_id, is_closed, closing_memo, closed_at, closing_reason) FROM stdin;
\.


--
-- Data for Name: annotator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.annotator (id, login_id, password, token_version, created_at, modified_at) FROM stdin;
\.


--
-- Data for Name: antenatal_patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.antenatal_patient (patient_id, gestation, parturition, medical_disorder, birth_year, c_section_history, is_twin, created_at, modified_at) FROM stdin;
\.


--
-- Data for Name: computed_diagnosis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.computed_diagnosis (diagnosis_id, algorithm_id) FROM stdin;
61	3
62	3
63	3
64	3
65	3
66	3
67	1
68	1
69	1
70	1
71	1
72	1
73	1
74	1
75	1
76	1
77	1
78	1
79	1
80	1
81	1
82	1
83	1
84	1
85	1
86	1
87	1
88	1
89	1
90	1
91	1
92	1
93	1
94	1
95	1
96	1
97	1
98	1
99	1
100	1
101	1
102	1
103	1
104	1
105	1
106	1
107	1
108	1
109	1
110	1
111	1
112	1
113	1
114	1
115	1
116	1
117	1
118	1
119	1
120	1
121	1
122	1
123	1
124	1
125	1
126	1
127	1
128	1
129	1
130	1
131	1
132	1
133	1
134	1
135	1
136	1
137	1
138	1
139	1
140	1
141	1
142	1
143	1
144	1
145	1
146	1
147	1
148	1
149	1
150	1
151	1
152	1
153	1
154	1
155	1
156	1
157	1
158	1
159	1
160	1
161	1
162	1
163	1
164	1
165	1
166	1
167	1
168	1
169	1
170	1
171	1
172	1
173	1
174	1
175	1
176	1
177	1
178	1
179	1
180	1
181	1
182	1
183	1
184	1
185	1
186	1
187	1
188	1
189	1
190	1
191	1
192	1
193	1
194	1
195	1
196	1
197	1
198	1
199	1
200	1
201	1
202	1
203	1
204	1
205	1
206	1
207	1
208	1
209	1
210	1
211	1
212	1
213	1
214	1
215	1
216	1
217	1
218	1
219	1
220	1
221	1
222	1
223	1
224	1
225	1
226	1
227	1
228	1
229	1
230	1
231	1
232	1
233	1
234	1
235	1
236	1
237	1
238	1
239	1
240	1
241	1
242	1
243	1
244	1
245	1
246	1
247	1
248	1
249	1
250	1
251	1
252	1
253	1
254	1
255	1
256	1
257	1
258	1
259	1
260	1
261	1
262	1
263	1
264	1
265	1
266	1
267	1
268	1
269	1
270	1
271	1
272	1
273	1
274	1
275	1
276	1
277	1
278	1
279	1
280	1
281	1
282	1
283	1
284	1
285	1
286	1
287	1
288	1
289	1
290	1
291	1
292	1
293	1
294	1
295	1
296	1
297	1
298	1
299	1
300	1
301	1
302	1
303	1
304	1
305	1
306	1
307	1
308	1
309	1
310	1
311	1
312	1
313	1
314	1
315	1
316	1
317	1
318	1
319	1
320	1
321	1
322	1
323	1
324	1
325	1
326	1
327	1
328	1
329	1
330	1
331	1
332	1
333	1
334	1
335	1
336	1
337	1
338	1
339	1
340	1
341	1
342	1
343	1
344	1
345	1
346	1
347	1
348	1
349	1
350	1
351	1
352	1
353	1
354	1
355	1
356	1
357	1
358	1
359	1
360	1
361	1
362	1
363	1
364	1
365	1
366	1
367	1
368	1
369	1
370	1
371	1
372	1
373	1
374	1
375	1
376	1
377	1
378	1
379	1
380	1
381	1
382	1
383	1
384	1
385	1
386	1
387	1
388	1
389	1
390	1
391	1
392	1
393	1
394	1
395	1
396	1
397	1
398	1
399	1
400	1
401	1
402	1
403	1
404	1
405	1
406	1
407	1
408	1
409	1
410	1
411	1
412	1
413	1
414	1
415	1
416	1
417	1
418	1
419	1
420	1
421	1
422	1
423	1
424	1
425	1
426	1
427	1
428	1
429	1
430	1
431	1
432	1
433	1
434	1
435	1
436	1
437	1
438	1
439	1
440	1
441	1
442	1
443	1
444	1
445	1
446	1
447	1
448	1
449	1
450	1
451	1
452	1
453	1
454	1
455	1
456	1
457	1
458	1
459	1
460	1
461	1
462	1
463	1
464	1
465	1
466	1
467	1
468	1
469	1
470	1
471	1
472	1
473	1
474	1
475	1
476	1
477	1
478	1
479	1
480	1
481	1
482	1
483	1
484	1
485	1
486	1
487	1
488	1
489	1
490	1
491	1
492	1
493	1
494	1
495	1
496	1
497	1
498	1
499	1
500	1
501	1
502	1
503	1
504	1
505	1
506	1
507	1
508	1
509	1
510	1
511	1
512	1
513	1
514	1
515	1
516	1
517	1
518	1
519	1
520	1
521	1
522	1
523	1
524	1
525	1
526	1
527	1
528	1
529	1
530	1
531	1
532	1
533	1
534	1
535	1
536	1
537	1
538	1
539	1
540	1
541	1
542	1
543	1
544	1
545	1
546	1
547	1
548	1
549	1
550	1
551	1
552	1
553	1
554	1
555	1
556	1
557	1
558	1
559	1
560	1
561	1
562	1
563	1
564	1
565	1
566	1
567	1
568	1
569	1
570	1
571	1
572	1
573	1
574	1
575	1
576	1
577	1
578	1
579	1
580	1
581	1
582	1
583	1
584	1
585	1
586	1
587	1
588	1
589	1
590	1
591	1
592	1
593	1
594	1
595	1
596	1
597	1
598	1
599	1
600	1
601	1
602	1
603	1
604	1
605	1
606	1
607	1
608	1
609	1
610	1
611	1
612	1
613	1
614	1
615	1
616	1
617	1
618	1
619	1
620	1
621	1
622	1
623	1
624	1
625	1
626	1
627	1
628	1
629	1
630	1
631	1
632	1
633	1
634	1
635	1
636	1
637	1
638	1
639	1
640	1
641	1
642	1
643	1
644	1
645	1
646	1
647	1
648	1
649	1
650	1
651	1
652	1
653	1
654	1
655	1
656	1
657	1
658	1
659	1
660	1
661	1
662	1
663	1
664	1
665	1
666	1
667	1
668	1
669	1
670	1
671	1
672	1
673	1
674	1
675	1
676	1
677	1
678	1
679	1
680	1
681	1
682	1
683	1
684	1
685	1
686	1
687	1
688	1
689	1
690	1
691	1
692	1
693	1
694	1
695	1
696	1
697	1
698	1
699	1
700	1
701	1
702	1
703	1
704	1
705	1
706	1
707	1
708	1
709	1
710	1
711	1
712	1
713	1
714	1
715	1
716	1
717	1
718	1
719	1
720	1
721	1
722	1
723	1
724	1
725	1
726	1
727	1
728	1
729	1
730	1
731	1
732	1
733	1
734	1
735	1
736	1
737	1
738	1
739	1
740	1
741	1
742	1
743	1
744	1
745	1
746	1
747	1
748	1
749	1
750	1
751	1
752	1
753	1
754	1
755	1
756	1
757	1
758	1
759	1
760	1
761	1
762	1
763	1
764	1
765	1
766	1
767	1
768	1
769	1
770	1
771	1
772	1
773	1
774	1
775	1
776	1
777	1
778	1
779	1
780	1
781	1
782	1
783	1
784	1
785	1
786	1
787	1
788	1
789	1
790	1
791	1
792	1
793	1
794	1
795	1
796	1
797	1
798	1
799	1
800	1
801	1
802	1
803	1
804	1
805	1
806	1
807	1
808	1
809	1
810	1
811	1
812	1
813	1
814	1
815	1
816	1
817	1
818	1
819	1
820	1
821	1
822	1
823	1
824	1
825	1
826	1
827	1
828	1
829	1
830	1
831	1
832	1
833	1
834	1
835	1
836	1
837	1
838	1
839	1
840	1
841	1
842	1
843	1
844	1
845	1
846	1
847	1
848	1
849	1
850	1
851	1
852	1
853	1
854	1
855	1
856	1
857	1
858	1
859	1
860	1
861	1
862	1
863	1
864	1
865	1
866	1
867	1
868	1
869	1
870	1
871	1
872	1
873	1
874	1
875	1
876	1
877	1
878	1
879	1
880	1
881	1
882	1
883	1
884	1
885	1
886	1
887	1
888	1
889	1
890	1
891	1
892	1
893	1
894	1
895	1
896	1
897	1
898	1
899	1
900	1
901	1
902	1
903	1
904	1
905	1
906	1
907	1
908	1
909	1
910	1
911	1
912	1
913	1
914	1
915	1
916	1
917	1
918	1
919	1
920	1
921	1
922	1
923	1
924	1
925	1
926	1
927	1
928	1
929	1
930	1
931	1
932	1
933	1
934	1
935	1
936	1
937	1
938	1
939	1
940	1
941	1
942	1
943	1
944	1
945	1
946	1
947	1
948	1
949	1
950	1
951	1
952	1
953	1
954	1
955	1
956	1
957	1
958	1
959	1
960	1
961	1
962	1
963	1
964	1
965	1
966	1
967	1
968	1
969	1
970	1
971	1
972	1
973	1
974	1
975	1
976	1
977	1
978	1
979	1
980	1
981	1
982	1
983	1
984	1
985	1
986	1
987	1
988	1
989	1
990	1
991	1
992	1
993	1
994	1
995	1
996	1
997	1
998	1
999	1
1000	1
1001	1
1002	1
1003	1
1004	1
1005	1
1006	1
1007	1
1008	1
1009	1
1010	1
1011	1
1012	1
1013	1
1014	1
1015	1
1016	1
1017	1
1018	1
1019	1
1020	1
1021	1
1022	1
1023	1
1024	1
1025	1
1026	1
1027	1
1028	1
1029	1
1030	1
1031	1
1032	1
1033	1
1034	1
1035	1
1036	1
1037	1
1038	1
1039	1
1040	1
1041	1
1042	1
1043	1
1044	1
1045	1
1046	1
\.


--
-- Data for Name: computed_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.computed_event (id, measurement_id, risk, memo, range_from, range_until, parameters, is_hidden, created_at, modified_at, is_suspended, is_closed, closing_memo, closed_at, category, baseline, baseline_bpm, variability, variability_bpm, deceleration, closing_reason) FROM stdin;
731	85	\N		2023-11-09 13:14:57.448-08	2023-11-09 13:16:13.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
732	85	1		2023-11-09 13:23:57.448-08	2023-11-09 13:24:49.448-08	{"Risk": 1, "Baseline-ACCELERATION": 152, "BaselineVariability-SINUSOIDAL": 14}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
733	85	3		2023-11-09 13:35:57.448-08	2023-11-09 13:37:00.448-08	{"Risk": 3, "Deceleration-HI_VD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
734	85	2		2023-11-09 13:48:57.448-08	2023-11-09 13:50:45.448-08	{"Risk": 2, "Deceleration-LOW_VD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
735	85	1		2023-11-09 13:56:57.448-08	2023-11-09 13:58:27.448-08	{"Risk": 1, "Baseline-HiDECELERATION": 161, "BaselineVariability-SINUSOIDAL": 25}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
736	85	\N		2023-11-09 14:10:57.448-08	2023-11-09 14:11:47.448-08	{"Baseline-HiDECELERATION": 130, "BaselineVariability-NORMAL": 21}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
737	85	\N		2023-11-09 14:18:57.448-08	2023-11-09 14:19:33.448-08	{"Baseline-HiDECELERATION": 159, "BaselineVariability-LOST": 6}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
738	85	\N		2023-11-09 14:31:57.448-08	2023-11-09 14:32:52.448-08	{"Baseline-DECELERATION": 159, "BaselineVariability-LOST": 21}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
739	85	2		2023-11-09 14:41:57.448-08	2023-11-09 14:42:42.448-08	{"Risk": 2, "Baseline-NORMAL": 165, "BaselineVariability-SINUSOIDAL": 28}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
740	85	\N		2023-11-09 14:55:57.448-08	2023-11-09 14:57:43.448-08	{"Baseline-DECELERATION": 143, "BaselineVariability-INCREASE": 20}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
741	85	\N		2023-11-09 15:06:57.448-08	2023-11-09 15:07:41.448-08	{"Baseline-DECELERATION": 161, "BaselineVariability-INCREASE": 22}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
742	86	\N		2023-11-09 12:53:57.448-08	2023-11-09 12:55:01.448-08	{"Baseline-HiDECELERATION": 162, "BaselineVariability-NORMAL": 2}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
743	86	\N		2023-11-09 13:01:57.448-08	2023-11-09 13:03:47.448-08	{"Baseline-NORMAL": 133, "BaselineVariability-DECREASE": 25}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
744	86	3		2023-11-09 13:15:57.448-08	2023-11-09 13:17:12.448-08	{"Risk": 3, "Deceleration-LOW_LD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
745	86	2		2023-11-09 13:29:57.448-08	2023-11-09 13:31:30.448-08	{"Risk": 2, "Baseline-NORMAL": 147, "BaselineVariability-SINUSOIDAL": 26}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
746	86	\N		2023-11-09 13:36:57.448-08	2023-11-09 13:38:41.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
747	86	5		2023-11-09 13:46:57.448-08	2023-11-09 13:48:27.448-08	{"Risk": 5, "Baseline-HiDECELERATION": 155, "BaselineVariability-SINUSOIDAL": 11}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
748	86	4		2023-11-09 13:59:57.448-08	2023-11-09 14:01:13.448-08	{"Risk": 4, "Deceleration-ED": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
749	86	\N		2023-11-09 14:04:57.448-08	2023-11-09 14:05:51.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
750	86	3		2023-11-09 14:11:57.448-08	2023-11-09 14:13:34.448-08	{"Risk": 3, "Deceleration-HI_VD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
751	86	\N		2023-11-09 14:21:57.448-08	2023-11-09 14:22:28.448-08	{"Baseline-ACCELERATION": 144, "BaselineVariability-DECREASE": 4}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
752	86	\N		2023-11-09 14:28:57.448-08	2023-11-09 14:30:19.448-08	{"Deceleration-HI_PD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
753	86	4		2023-11-09 14:42:57.448-08	2023-11-09 14:44:52.448-08	{"Risk": 4, "Deceleration-ED": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
754	87	1		2023-11-09 12:35:57.448-08	2023-11-09 12:36:45.448-08	{"Risk": 1, "Baseline-HiDECELERATION": 139, "BaselineVariability-INCREASE": 26}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
755	87	3		2023-11-09 12:41:57.448-08	2023-11-09 12:43:06.448-08	{"Risk": 3, "Deceleration-HI_VD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
756	87	\N		2023-11-09 12:53:57.448-08	2023-11-09 12:54:56.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
757	87	5		2023-11-09 13:01:57.448-08	2023-11-09 13:03:33.448-08	{"Risk": 5, "Deceleration-LOW_PD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
758	87	\N		2023-11-09 13:13:57.448-08	2023-11-09 13:15:02.448-08	{"Baseline-ACCELERATION": 166, "BaselineVariability-INCREASE": 15}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
759	87	4		2023-11-09 13:18:57.448-08	2023-11-09 13:20:47.448-08	{"Risk": 4, "Baseline-HiDECELERATION": 125, "BaselineVariability-INCREASE": 4}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
760	87	3		2023-11-09 13:27:57.448-08	2023-11-09 13:28:46.448-08	{"Risk": 3, "Deceleration-None": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
761	87	2		2023-11-09 13:32:57.448-08	2023-11-09 13:34:36.448-08	{"Risk": 2, "Deceleration-LOW_PD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
762	87	\N		2023-11-09 13:42:57.448-08	2023-11-09 13:43:37.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
763	87	3		2023-11-09 13:54:57.448-08	2023-11-09 13:56:36.448-08	{"Risk": 3, "Deceleration-HI_LD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
764	87	\N		2023-11-09 14:00:57.448-08	2023-11-09 14:02:26.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
765	87	2		2023-11-09 14:09:57.448-08	2023-11-09 14:11:40.448-08	{"Risk": 2, "Deceleration-HI_LD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
766	87	5		2023-11-09 14:16:57.448-08	2023-11-09 14:18:17.448-08	{"Risk": 5, "Deceleration-HI_LD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
767	87	\N		2023-11-09 14:23:57.448-08	2023-11-09 14:25:30.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
768	82	\N		2023-11-09 13:30:57.448-08	2023-11-09 13:31:50.448-08	{"Baseline-ACCELERATION": 125, "BaselineVariability-LOST": 15}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
769	82	1		2023-11-09 13:39:57.448-08	2023-11-09 13:41:16.448-08	{"Risk": 1, "Deceleration-LOW_PD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
770	82	2		2023-11-09 13:48:57.448-08	2023-11-09 13:50:45.448-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-NORMAL": 11}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
771	82	1		2023-11-09 13:53:57.448-08	2023-11-09 13:54:49.448-08	{"Risk": 1, "Baseline-DECELERATION": 140, "BaselineVariability-INCREASE": 2}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
772	82	\N		2023-11-09 14:05:57.448-08	2023-11-09 14:07:41.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
773	82	\N		2023-11-09 14:19:57.448-08	2023-11-09 14:20:54.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
774	82	\N		2023-11-09 14:33:57.448-08	2023-11-09 14:34:33.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
775	82	\N		2023-11-09 14:46:57.448-08	2023-11-09 14:47:57.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
776	82	3		2023-11-09 14:59:57.448-08	2023-11-09 15:00:58.448-08	{"Risk": 3, "Baseline-NORMAL": 158, "BaselineVariability-INCREASE": 13}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
777	82	\N		2023-11-09 15:12:57.448-08	2023-11-09 15:14:46.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
778	83	\N		2023-11-09 13:10:57.448-08	2023-11-09 13:11:28.448-08	{"Deceleration-HI_PD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
779	83	1		2023-11-09 13:23:57.448-08	2023-11-09 13:24:47.448-08	{"Risk": 1, "Deceleration-LOW_PD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
780	83	\N		2023-11-09 13:28:57.448-08	2023-11-09 13:29:47.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
781	83	2		2023-11-09 13:34:57.448-08	2023-11-09 13:36:04.448-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-INCREASE": 2}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
782	83	\N		2023-11-09 13:43:57.448-08	2023-11-09 13:45:13.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
783	83	5		2023-11-09 13:57:57.448-08	2023-11-09 13:59:17.448-08	{"Risk": 5, "Deceleration-HI_PD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
784	83	1		2023-11-09 14:11:57.448-08	2023-11-09 14:13:22.448-08	{"Risk": 1, "Deceleration-LOW_PD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
785	83	1		2023-11-09 14:20:57.448-08	2023-11-09 14:21:36.448-08	{"Risk": 1, "Deceleration-HI_VD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
786	83	\N		2023-11-09 14:25:57.448-08	2023-11-09 14:27:30.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
787	83	\N		2023-11-09 14:32:57.448-08	2023-11-09 14:34:19.448-08	{"Deceleration-HI_VD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
788	83	3		2023-11-09 14:37:57.448-08	2023-11-09 14:39:16.448-08	{"Risk": 3, "Baseline-DECELERATION": 158, "BaselineVariability-LOST": 0}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
789	83	\N		2023-11-09 14:44:57.448-08	2023-11-09 14:46:28.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
790	83	\N		2023-11-09 14:53:57.448-08	2023-11-09 14:55:21.448-08	{"Baseline-NORMAL": 154, "BaselineVariability-LOST": 2}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
791	83	\N		2023-11-09 15:02:57.448-08	2023-11-09 15:04:04.448-08	{"Baseline-NORMAL": 137, "BaselineVariability-NORMAL": 6}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
792	84	4		2023-11-09 12:48:57.448-08	2023-11-09 12:50:25.448-08	{"Risk": 4, "Deceleration-LOW_LD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
793	84	\N		2023-11-09 12:57:57.448-08	2023-11-09 12:59:47.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
794	84	\N		2023-11-09 13:08:57.448-08	2023-11-09 13:09:28.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
795	84	2		2023-11-09 13:13:57.448-08	2023-11-09 13:15:43.448-08	{"Risk": 2, "Baseline-ACCELERATION": 132, "BaselineVariability-SINUSOIDAL": 1}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
796	84	\N		2023-11-09 13:26:57.448-08	2023-11-09 13:28:12.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
797	84	2		2023-11-09 13:38:57.448-08	2023-11-09 13:40:14.448-08	{"Risk": 2, "Baseline-HiDECELERATION": 122, "BaselineVariability-SINUSOIDAL": 14}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
798	84	5		2023-11-09 13:46:57.448-08	2023-11-09 13:47:44.448-08	{"Risk": 5, "Deceleration-LOW_LD": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
799	84	\N		2023-11-09 13:57:57.448-08	2023-11-09 13:58:33.448-08	{"Baseline-HiDECELERATION": 161, "BaselineVariability-SINUSOIDAL": 13}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
800	84	\N		2023-11-09 14:03:57.448-08	2023-11-09 14:05:13.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
801	84	2		2023-11-09 14:14:57.448-08	2023-11-09 14:16:10.448-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-NORMAL": 22}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
802	84	2		2023-11-09 14:22:57.448-08	2023-11-09 14:24:46.448-08	{"Risk": 2, "Baseline-DECELERATION": 138, "BaselineVariability-INCREASE": 19}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
803	84	\N		2023-11-09 14:34:57.448-08	2023-11-09 14:36:29.448-08	{"Acceleration": null}	f	2023-11-09 15:00:03.618907-08	2023-11-09 15:00:03.618907-08	f	f	\N	\N		\N	\N	\N	\N	\N	\N
804	69	\N		2023-11-09 16:58:57.089-08	2023-11-09 16:59:51.373-08	{"Acceleration": null}	f	2023-11-09 17:14:41.40565-08	2023-11-09 17:14:41.40565-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
805	69	1		2023-11-09 17:00:00.659-08	2023-11-09 17:01:55.869-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	f	2023-11-09 17:14:41.40565-08	2023-11-09 17:14:41.40565-08	f	f	\N	\N	baseline	normal	140	normal	20	\N	\N
806	69	2		2023-11-09 17:02:22.211-08	2023-11-09 17:02:40.751-08	{"Risk": 2, "Deceleration-LOW_VD": null}	f	2023-11-09 17:14:41.40565-08	2023-11-09 17:14:41.40565-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
807	69	\N		2023-11-09 18:17:37.459-08	2023-11-09 18:18:14.646-08	{"Acceleration": null}	f	2023-11-09 18:32:58.522152-08	2023-11-09 18:32:58.522152-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
808	69	\N		2023-11-09 18:20:04.711-08	2023-11-09 18:21:35.677-08	{"Acceleration": null}	f	2023-11-09 18:32:58.522152-08	2023-11-09 18:32:58.522152-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
809	69	\N		2023-11-09 18:22:21.643-08	2023-11-09 18:22:52.558-08	{"Acceleration": null}	f	2023-11-09 18:32:58.522152-08	2023-11-09 18:32:58.522152-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
810	69	\N		2023-11-09 18:26:18.111-08	2023-11-09 18:26:46.454-08	{"Acceleration": null}	f	2023-11-09 18:32:58.522152-08	2023-11-09 18:32:58.522152-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
811	69	\N		2023-11-09 18:40:24.095-08	2023-11-09 18:41:28.638-08	{"Acceleration": null}	f	2023-11-09 18:56:13.380293-08	2023-11-09 18:56:13.380293-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
812	69	1		2023-11-09 18:43:53.621-08	2023-11-09 18:47:32.139-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	f	2023-11-09 18:56:13.380293-08	2023-11-09 18:56:13.380293-08	f	f	\N	\N	baseline	normal	140	normal	25	\N	\N
813	69	\N		2023-11-09 18:51:41.843-08	2023-11-09 18:53:06.672-08	{"Deceleration-LOW_VD": null}	f	2023-11-09 18:57:48.629204-08	2023-11-09 19:05:11.555685-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
814	69	\N		2023-11-09 18:53:10.445-08	2023-11-09 18:53:59.056-08	{"Deceleration-LOW_VD": null}	f	2023-11-09 19:05:11.555685-08	2023-11-09 19:05:11.555685-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
815	69	\N		2023-11-09 18:54:11.612-08	2023-11-09 18:54:50.26-08	{"Acceleration": null}	f	2023-11-09 19:05:11.555685-08	2023-11-09 19:05:11.555685-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
816	69	\N		2023-11-09 18:56:37.209-08	2023-11-09 18:57:18.868-08	{"Deceleration-LOW_VD": null}	f	2023-11-09 19:05:11.555685-08	2023-11-09 19:05:11.555685-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
817	69	\N		2023-11-09 18:58:17.099-08	2023-11-09 18:58:45.2-08	{"Deceleration-LOW_VD": null}	f	2023-11-09 19:05:11.555685-08	2023-11-09 19:05:11.555685-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
818	69	\N		2023-11-09 20:02:19.689-08	2023-11-09 20:02:44.052-08	{"Acceleration": null}	f	2023-11-09 20:14:58.671041-08	2023-11-09 20:14:58.671041-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
819	69	\N		2023-11-09 20:04:10.485-08	2023-11-09 20:04:43.158-08	{"Acceleration": null}	f	2023-11-09 20:14:58.671041-08	2023-11-09 20:14:58.671041-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
820	69	\N		2023-11-09 20:06:58.322-08	2023-11-09 20:07:39.25-08	{"Acceleration": null}	f	2023-11-09 20:14:58.671041-08	2023-11-09 20:14:58.671041-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
821	88	4		2023-11-09 23:10:10.714-08	2023-11-09 23:14:22.004-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	f	2023-11-09 23:20:24.36481-08	2023-11-09 23:20:24.36481-08	f	f	\N	\N	baseline	deceleration	105	decrease	5	\N	\N
822	92	4		2023-11-10 04:34:46.672-08	2023-11-10 04:35:11.793-08	{"Risk": 4, "Deceleration-LOW_VD": null}	f	2023-11-10 04:49:02.786597-08	2023-11-10 04:49:02.786597-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
823	92	4		2023-11-10 04:36:46.097-08	2023-11-10 04:38:45.888-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	f	2023-11-10 04:49:02.786597-08	2023-11-10 04:49:02.786597-08	f	f	\N	\N	baseline	deceleration	110	decrease	5	\N	\N
825	94	5		2023-11-10 06:35:22.451-08	2023-11-10 06:38:23.735-08	{"Risk": 5, "Deceleration-HI_PD": null}	f	2023-11-10 06:50:17.143604-08	2023-11-10 06:50:17.143604-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	high_pd	\N
824	92	4		2023-11-10 04:42:34.531-08	2023-11-10 04:46:47.945-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 10}	f	2023-11-10 04:49:02.786597-08	2023-11-10 04:52:30.081045-08	f	f	\N	\N	baseline	deceleration	110	decrease	10	\N	\N
826	94	3		2023-11-10 06:39:13.538-08	2023-11-10 06:40:50.186-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-10 06:50:17.143604-08	2023-11-10 06:50:17.143604-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
827	94	3		2023-11-10 06:41:36.89-08	2023-11-10 06:42:07.974-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-10 06:50:17.143604-08	2023-11-10 06:50:17.143604-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
828	94	2		2023-11-10 06:43:15.264-08	2023-11-10 06:53:34.151-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 20}	f	2023-11-10 06:50:17.143604-08	2023-11-10 07:00:31.209504-08	f	f	\N	\N	baseline	normal	135	decrease	20	\N	\N
829	94	\N		2023-11-10 06:54:32.095-08	2023-11-10 06:55:38.376-08	{"Acceleration": null}	f	2023-11-10 07:04:37.528384-08	2023-11-10 07:04:37.528384-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
830	94	3		2023-11-10 06:58:54.847-08	2023-11-10 06:59:43.491-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-10 07:05:36.179738-08	2023-11-10 07:05:36.179738-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
831	95	3		2023-11-10 07:55:38.237-08	2023-11-10 07:56:18.163-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-10 08:08:50.854403-08	2023-11-10 08:08:50.854403-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
832	95	\N		2023-11-10 07:57:03.245-08	2023-11-10 07:58:51.316-08	{"Acceleration": null}	f	2023-11-10 08:08:50.854403-08	2023-11-10 08:08:50.854403-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
833	95	\N		2023-11-10 07:59:51.051-08	2023-11-10 08:00:19.888-08	{"Acceleration": null}	f	2023-11-10 08:08:50.854403-08	2023-11-10 08:08:50.854403-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
855	98	2		2023-11-12 17:51:03.783-08	2023-11-12 17:56:24.864-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	f	2023-11-12 18:02:02.759093-08	2023-11-12 18:03:03.192495-08	f	f	\N	\N	baseline	normal	130	decrease	15	\N	\N
834	95	2		2023-11-10 08:00:34.701-08	2023-11-10 08:04:40.175-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	f	2023-11-10 08:08:50.854403-08	2023-11-10 08:11:53.592451-08	f	f	\N	\N	baseline	normal	135	decrease	10	\N	\N
835	95	5		2023-11-10 08:05:28.557-08	2023-11-10 08:07:40.766-08	{"Risk": 5, "Deceleration-HI_PD": null}	f	2023-11-10 08:13:50.09499-08	2023-11-10 08:16:50.147197-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	high_pd	\N
836	95	2		2023-11-10 08:07:42.517-08	2023-11-10 08:11:59.355-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	f	2023-11-10 08:16:50.147197-08	2023-11-10 08:19:49.379855-08	f	f	\N	\N	baseline	normal	135	decrease	5	\N	\N
837	95	3		2023-11-10 08:12:36.76-08	2023-11-10 08:12:58.362-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-10 08:19:49.379855-08	2023-11-10 08:19:49.379855-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
838	96	\N		2023-11-12 16:45:57.741-08	2023-11-12 16:47:05.172-08	{"Acceleration": null}	f	2023-11-12 16:59:07.084879-08	2023-11-12 16:59:07.084879-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
839	96	2		2023-11-12 16:47:05.422-08	2023-11-12 16:49:57.494-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	f	2023-11-12 16:59:07.084879-08	2023-11-12 16:59:07.084879-08	f	f	\N	\N	baseline	normal	160	decrease	10	\N	\N
871	98	2		2023-11-12 18:29:13.309-08	2023-11-12 18:31:24.529-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	f	2023-11-12 18:36:03.3489-08	2023-11-12 18:42:07.487137-08	f	f	\N	\N	baseline	normal	150	decrease	15	\N	\N
856	98	\N		2023-11-12 17:56:24.864-08	2023-11-12 17:56:54.8-08	{"Acceleration": null}	f	2023-11-12 18:03:03.192495-08	2023-11-12 18:05:04.448189-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
840	96	2		2023-11-12 16:50:45.522-08	2023-11-12 16:56:24.17-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	f	2023-11-12 16:59:07.084879-08	2023-11-12 17:02:05.700924-08	f	f	\N	\N	baseline	normal	155	decrease	10	\N	\N
857	98	1		2023-11-12 17:57:00.32-08	2023-11-12 17:59:15.362-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	f	2023-11-12 18:05:04.448189-08	2023-11-12 18:05:04.448189-08	f	f	\N	\N	baseline	normal	140	normal	25	\N	\N
868	98	\N		2023-11-12 18:20:53.881-08	2023-11-12 18:22:01.74-08	{"Acceleration": null}	f	2023-11-12 18:28:03.573495-08	2023-11-12 18:31:04.279513-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
841	96	2		2023-11-12 16:56:24.42-08	2023-11-12 17:01:42.981-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	f	2023-11-12 17:04:03.524388-08	2023-11-12 17:10:07.229691-08	f	f	\N	\N	baseline	normal	155	decrease	10	\N	\N
842	96	2		2023-11-12 17:01:43.238-08	2023-11-12 17:04:14.054-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	f	2023-11-12 17:10:07.229691-08	2023-11-12 17:10:07.229691-08	f	f	\N	\N	baseline	normal	160	decrease	10	\N	\N
843	96	\N		2023-11-12 17:04:49.478-08	2023-11-12 17:05:37.381-08	{"Acceleration": null}	f	2023-11-12 17:12:10.990341-08	2023-11-12 17:13:10.522226-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
844	96	3		2023-11-12 17:08:06.758-08	2023-11-12 17:08:29.654-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-12 17:15:12.584448-08	2023-11-12 17:15:12.584448-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
845	96	\N		2023-11-12 17:09:01.813-08	2023-11-12 17:09:55.301-08	{"Acceleration": null}	f	2023-11-12 17:15:12.584448-08	2023-11-12 17:17:07.96672-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
846	96	\N		2023-11-12 17:10:32.979-08	2023-11-12 17:11:08.81-08	{"Acceleration": null}	f	2023-11-12 17:17:07.96672-08	2023-11-12 17:17:07.96672-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
847	97	\N		2023-11-12 17:23:18.392-08	2023-11-12 17:24:32.892-08	{"Acceleration": null}	f	2023-11-12 17:35:04.797883-08	2023-11-12 17:35:04.797883-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
848	97	\N		2023-11-12 17:27:43.133-08	2023-11-12 17:28:18.125-08	{"Acceleration": null}	f	2023-11-12 17:35:04.797883-08	2023-11-12 17:35:04.797883-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
849	97	\N		2023-11-12 17:30:52.158-08	2023-11-12 17:32:29.289-08	{"Acceleration": null}	f	2023-11-12 17:38:04.991855-08	2023-11-12 17:40:06.164879-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
850	97	\N		2023-11-12 17:32:29.289-08	2023-11-12 17:33:48.431-08	{"Acceleration": null}	f	2023-11-12 17:40:06.164879-08	2023-11-12 17:44:11.468876-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
858	98	2		2023-11-12 17:59:54.456-08	2023-11-12 18:04:05.245-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	f	2023-11-12 18:09:07.789327-08	2023-11-12 18:12:04.615936-08	f	f	\N	\N	baseline	normal	135	decrease	15	\N	\N
851	97	\N		2023-11-12 17:36:41.551-08	2023-11-12 17:37:52.48-08	{"Acceleration": null}	f	2023-11-12 17:44:11.468876-08	2023-11-12 17:47:09.945683-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
852	97	2		2023-11-12 17:37:52.73-08	2023-11-12 17:40:23.466-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	f	2023-11-12 17:47:09.945683-08	2023-11-12 17:47:09.945683-08	f	f	\N	\N	baseline	normal	155	decrease	5	\N	\N
853	98	\N		2023-11-12 17:47:48.932-08	2023-11-12 17:49:01.766-08	{"Acceleration": null}	f	2023-11-12 18:02:02.759093-08	2023-11-12 18:02:02.759093-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
854	98	2		2023-11-12 17:49:02.016-08	2023-11-12 17:51:03.533-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	f	2023-11-12 18:02:02.759093-08	2023-11-12 18:02:02.759093-08	f	f	\N	\N	baseline	normal	140	decrease	5	\N	\N
859	98	\N		2023-11-12 18:04:05.245-08	2023-11-12 18:05:08.001-08	{"Acceleration": null}	f	2023-11-12 18:12:04.615936-08	2023-11-12 18:12:04.615936-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
860	98	\N		2023-11-12 18:05:30.842-08	2023-11-12 18:06:27.329-08	{"Acceleration": null}	f	2023-11-12 18:12:04.615936-08	2023-11-12 18:12:04.615936-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
861	98	\N		2023-11-12 18:06:57.092-08	2023-11-12 18:07:40.858-08	{"Acceleration": null}	f	2023-11-12 18:14:03.905057-08	2023-11-12 18:17:03.180052-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
862	98	\N		2023-11-12 18:09:46.157-08	2023-11-12 18:10:24.081-08	{"Acceleration": null}	f	2023-11-12 18:17:03.180052-08	2023-11-12 18:17:03.180052-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
863	98	\N		2023-11-12 18:11:28.395-08	2023-11-12 18:12:23.638-08	{"Acceleration": null}	f	2023-11-12 18:18:04.115355-08	2023-11-12 18:18:04.115355-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
864	98	\N		2023-11-12 18:12:54.259-08	2023-11-12 18:13:53.764-08	{"Acceleration": null}	f	2023-11-12 18:20:02.952893-08	2023-11-12 18:20:02.952893-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
865	98	\N		2023-11-12 18:14:33.939-08	2023-11-12 18:15:19.289-08	{"Acceleration": null}	f	2023-11-12 18:21:03.170422-08	2023-11-12 18:23:03.222298-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
866	98	\N		2023-11-12 18:17:04.831-08	2023-11-12 18:17:41.009-08	{"Acceleration": null}	f	2023-11-12 18:24:03.819517-08	2023-11-12 18:26:04.252222-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
867	98	\N		2023-11-12 18:19:40.824-08	2023-11-12 18:20:17.72-08	{"Acceleration": null}	f	2023-11-12 18:26:04.252222-08	2023-11-12 18:26:04.252222-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
869	98	\N		2023-11-12 18:23:04.778-08	2023-11-12 18:24:40.775-08	{"Acceleration": null}	f	2023-11-12 18:31:04.279513-08	2023-11-12 18:34:03.123399-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
870	98	\N		2023-11-12 18:28:02.263-08	2023-11-12 18:29:13.309-08	{"Acceleration": null}	f	2023-11-12 18:36:03.3489-08	2023-11-12 18:36:03.3489-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
873	98	2		2023-11-12 18:37:33.507-08	2023-11-12 18:43:22.815-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 20}	f	2023-11-12 18:47:04.782563-08	2023-11-12 18:50:05.344107-08	f	f	\N	\N	baseline	normal	145	decrease	20	\N	\N
872	98	2		2023-11-12 18:35:11.2-08	2023-11-12 18:37:15.681-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	f	2023-11-12 18:43:04.416537-08	2023-11-12 18:47:04.782563-08	f	f	\N	\N	baseline	normal	145	decrease	10	\N	\N
874	98	\N		2023-11-12 18:45:46.513-08	2023-11-12 18:46:15.879-08	{"Acceleration": null}	f	2023-11-12 18:53:06.4924-08	2023-11-12 18:54:07.201416-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
875	98	2		2023-11-12 18:47:11.111-08	2023-11-12 18:53:37.258-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	f	2023-11-12 18:56:03.830415-08	2023-11-12 19:01:04.561317-08	f	t	Emergency, very risky.	2023-11-12 18:57:05.151249-08	baseline	normal	135	decrease	10	\N	\N
876	98	2		2023-11-12 18:53:55.951-08	2023-11-12 18:56:35.998-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	f	2023-11-12 19:02:02.60647-08	2023-11-12 19:03:05.004706-08	f	f	\N	\N	baseline	normal	140	decrease	15	\N	\N
877	98	\N		2023-11-12 18:57:12.09-08	2023-11-12 18:57:47.746-08	{"Acceleration": null}	f	2023-11-12 19:05:03.829286-08	2023-11-12 19:07:04.235025-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1112	109	\N		2023-11-14 00:30:21.352-08	2023-11-14 00:31:06.559-08	{"Acceleration": null}	f	2023-11-14 00:37:19.992917-08	2023-11-14 00:37:19.992917-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
878	98	2		2023-11-12 18:57:47.996-08	2023-11-12 19:00:54.32-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	f	2023-11-12 19:07:04.235025-08	2023-11-12 19:07:04.235025-08	f	f	\N	\N	baseline	normal	135	decrease	15	\N	\N
879	98	2		2023-11-12 19:01:57.601-08	2023-11-12 19:04:05.745-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	f	2023-11-12 19:10:04.692461-08	2023-11-12 19:12:06.550898-08	f	f	\N	\N	baseline	normal	140	decrease	15	\N	\N
880	98	\N		2023-11-12 19:05:08.256-08	2023-11-12 19:06:21.179-08	{"Acceleration": null}	f	2023-11-12 19:12:06.550898-08	2023-11-12 19:15:10.363476-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
899	98	\N		2023-11-12 19:51:41.373-08	2023-11-12 19:52:34.846-08	{"Acceleration": null}	f	2023-11-12 19:59:05.024068-08	2023-11-12 20:01:07.424774-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
881	98	1		2023-11-12 19:07:08.133-08	2023-11-12 19:11:08.607-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	f	2023-11-12 19:15:10.363476-08	2023-11-12 19:19:04.878408-08	f	f	\N	\N	baseline	normal	145	normal	20	\N	\N
882	98	\N		2023-11-12 19:11:08.607-08	2023-11-12 19:12:02.109-08	{"Acceleration": null}	f	2023-11-12 19:19:04.878408-08	2023-11-12 19:19:04.878408-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
883	98	\N		2023-11-12 19:13:10.992-08	2023-11-12 19:14:07.183-08	{"Acceleration": null}	f	2023-11-12 19:20:04.786935-08	2023-11-12 19:22:03.671044-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
884	98	2		2023-11-12 19:14:18.98-08	2023-11-12 19:16:28.277-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	f	2023-11-12 19:22:03.671044-08	2023-11-12 19:22:03.671044-08	f	f	\N	\N	baseline	normal	150	decrease	10	\N	\N
885	98	2		2023-11-12 19:18:47.57-08	2023-11-12 19:20:39.576-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	f	2023-11-12 19:27:04.207346-08	2023-11-12 19:28:04.972085-08	f	f	\N	\N	baseline	normal	140	decrease	5	\N	\N
886	98	2		2023-11-12 19:21:40.088-08	2023-11-12 19:23:56.228-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 15}	f	2023-11-12 19:28:04.972085-08	2023-11-12 19:31:04.967126-08	f	f	\N	\N	baseline	normal	155	decrease	15	\N	\N
887	98	\N		2023-11-12 19:23:56.228-08	2023-11-12 19:24:37.288-08	{"Acceleration": null}	f	2023-11-12 19:31:04.967126-08	2023-11-12 19:33:03.645708-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
913	98	3		2023-11-12 20:46:59.243-08	2023-11-12 20:47:24.717-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-12 20:54:03.087209-08	2023-11-12 20:55:03.553879-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
888	98	\N		2023-11-12 19:26:11.186-08	2023-11-12 19:26:46.911-08	{"Acceleration": null}	f	2023-11-12 19:33:03.645708-08	2023-11-12 19:38:02.705078-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
889	98	4		2023-11-12 19:27:44.919-08	2023-11-12 19:30:54.491-08	{"Risk": 4, "Deceleration-LOW_PD": null}	f	2023-11-12 19:38:02.705078-08	2023-11-12 19:38:02.705078-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_pd	\N
890	98	\N		2023-11-12 19:31:00.013-08	2023-11-12 19:31:21.206-08	{"Deceleration-LOW_VD": null}	f	2023-11-12 19:38:02.705078-08	2023-11-12 19:40:03.552663-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
891	98	\N		2023-11-12 19:32:49.309-08	2023-11-12 19:33:15.601-08	{"Acceleration": null}	f	2023-11-12 19:40:03.552663-08	2023-11-12 19:40:03.552663-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
892	98	\N		2023-11-12 19:33:15.601-08	2023-11-12 19:33:44.898-08	{"Acceleration": null}	f	2023-11-12 19:40:03.552663-08	2023-11-12 19:40:03.552663-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
893	98	\N		2023-11-12 19:33:52.898-08	2023-11-12 19:34:24.97-08	{"Acceleration": null}	f	2023-11-12 19:40:03.552663-08	2023-11-12 19:40:03.552663-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
894	98	2		2023-11-12 19:34:30-08	2023-11-12 19:36:26.505-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	f	2023-11-12 19:43:04.917768-08	2023-11-12 19:44:05.038448-08	f	f	\N	\N	baseline	normal	140	decrease	10	\N	\N
895	98	\N		2023-11-12 19:38:19.492-08	2023-11-12 19:39:07.93-08	{"Acceleration": null}	f	2023-11-12 19:46:05.08795-08	2023-11-12 19:46:05.08795-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
896	98	\N		2023-11-12 19:39:07.93-08	2023-11-12 19:40:11.296-08	{"Acceleration": null}	f	2023-11-12 19:46:05.08795-08	2023-11-12 19:49:06.134004-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
897	98	2		2023-11-12 19:41:51.251-08	2023-11-12 19:45:08.98-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	f	2023-11-12 19:51:04.300386-08	2023-11-12 19:52:04.204444-08	f	f	\N	\N	baseline	normal	140	decrease	15	\N	\N
900	98	\N		2023-11-12 19:52:44.38-08	2023-11-12 19:55:57.623-08	{"Acceleration": null}	f	2023-11-12 20:01:07.424774-08	2023-11-12 20:11:04.51814-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
901	98	\N		2023-11-12 20:03:23.539-08	2023-11-12 20:04:18.72-08	{"Deceleration-LOW_VD": null}	f	2023-11-12 20:11:04.51814-08	2023-11-12 20:11:04.51814-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
898	98	2		2023-11-12 19:45:55.158-08	2023-11-12 19:50:35.622-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	f	2023-11-12 19:54:03.618493-08	2023-11-12 19:58:03.381644-08	f	f	\N	\N	baseline	normal	130	decrease	15	\N	\N
902	98	\N		2023-11-12 20:04:34.538-08	2023-11-12 20:05:08.619-08	{"Acceleration": null}	f	2023-11-12 20:11:04.51814-08	2023-11-12 20:13:06.754463-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
903	98	\N		2023-11-12 20:05:08.619-08	2023-11-12 20:05:33.271-08	{"Acceleration": null}	f	2023-11-12 20:13:06.754463-08	2023-11-12 20:15:09.182967-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
904	98	2		2023-11-12 20:05:33.526-08	2023-11-12 20:07:52.375-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	f	2023-11-12 20:15:09.182967-08	2023-11-12 20:15:09.182967-08	f	f	\N	\N	baseline	normal	145	decrease	10	\N	\N
905	98	2		2023-11-12 20:08:20.034-08	2023-11-12 20:10:35.669-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	f	2023-11-12 20:17:04.184311-08	2023-11-12 20:23:08.015897-08	f	f	\N	\N	baseline	normal	140	decrease	5	\N	\N
906	98	\N		2023-11-12 20:27:54.605-08	2023-11-12 20:28:32.278-08	{"Acceleration": null}	f	2023-11-12 20:35:02.054707-08	2023-11-12 20:35:02.054707-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
907	98	2		2023-11-12 20:29:39.292-08	2023-11-12 20:31:50.836-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	f	2023-11-12 20:39:03.663988-08	2023-11-12 20:39:03.663988-08	f	f	\N	\N	baseline	normal	135	decrease	15	\N	\N
908	98	\N		2023-11-12 20:31:50.836-08	2023-11-12 20:32:40.027-08	{"Acceleration": null}	f	2023-11-12 20:39:03.663988-08	2023-11-12 20:39:03.663988-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
909	98	\N		2023-11-12 20:34:50.538-08	2023-11-12 20:36:02.068-08	{"Acceleration": null}	f	2023-11-12 20:42:03.705197-08	2023-11-12 20:42:03.705197-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
910	98	2		2023-11-12 20:36:02.318-08	2023-11-12 20:37:57.856-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	f	2023-11-12 20:44:03.851645-08	2023-11-12 20:46:03.367348-08	f	f	\N	\N	baseline	normal	140	decrease	10	\N	\N
916	98	\N		2023-11-12 20:55:16.717-08	2023-11-12 20:56:39.268-08	{"Acceleration": null}	f	2023-11-12 21:03:06.167106-08	2023-11-12 21:09:04.35936-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
911	98	2		2023-11-12 20:38:02.13-08	2023-11-12 20:43:19.627-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	f	2023-11-12 20:46:03.367348-08	2023-11-12 20:52:03.37783-08	f	f	\N	\N	baseline	normal	140	decrease	10	\N	\N
912	98	2		2023-11-12 20:43:40.46-08	2023-11-12 20:46:48.199-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	f	2023-11-12 20:52:03.37783-08	2023-11-12 20:54:03.087209-08	f	f	\N	\N	baseline	normal	135	decrease	10	\N	\N
914	98	2		2023-11-12 20:47:31.051-08	2023-11-12 20:52:55.342-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	f	2023-11-12 20:57:06.558232-08	2023-11-12 20:59:08.740962-08	f	f	\N	\N	baseline	normal	135	decrease	10	\N	\N
915	98	2		2023-11-12 20:53:46.622-08	2023-11-12 20:55:16.717-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	f	2023-11-12 21:03:06.167106-08	2023-11-12 21:03:06.167106-08	f	f	\N	\N	baseline	normal	135	decrease	15	\N	\N
917	98	3		2023-11-12 20:58:52.801-08	2023-11-12 20:59:26.149-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-12 21:09:04.35936-08	2023-11-12 21:09:04.35936-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
918	98	2		2023-11-12 20:59:43.967-08	2023-11-12 21:02:37.921-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	f	2023-11-12 21:09:04.35936-08	2023-11-12 21:09:04.35936-08	f	f	\N	\N	baseline	normal	125	decrease	20	\N	\N
919	98	\N		2023-11-12 22:59:14.301-08	2023-11-12 22:59:45.188-08	{"Acceleration": null}	f	2023-11-12 23:14:59.086868-08	2023-11-12 23:14:59.086868-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
920	98	\N		2023-11-12 23:03:08.406-08	2023-11-12 23:03:36.499-08	{"Acceleration": null}	f	2023-11-12 23:16:01.368948-08	2023-11-12 23:16:01.368948-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
921	98	\N		2023-11-12 23:07:54.853-08	2023-11-12 23:08:40.585-08	{"Acceleration": null}	f	2023-11-12 23:16:01.368948-08	2023-11-12 23:16:01.368948-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
922	98	\N		2023-11-12 23:11:07.124-08	2023-11-12 23:12:41.135-08	{"Acceleration": null}	f	2023-11-12 23:17:58.426385-08	2023-11-12 23:18:58.026289-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
923	98	\N		2023-11-12 23:12:51.177-08	2023-11-12 23:13:36.684-08	{"Acceleration": null}	f	2023-11-12 23:19:57.767434-08	2023-11-12 23:21:58.721488-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
924	98	\N		2023-11-12 23:17:06.908-08	2023-11-12 23:18:10.697-08	{"Acceleration": null}	f	2023-11-12 23:24:57.108303-08	2023-11-12 23:24:57.108303-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
958	98	\N		2023-11-13 01:17:12.351-08	2023-11-13 01:18:14.906-08	{"Acceleration": null}	f	2023-11-13 01:23:58.780547-08	2023-11-13 01:25:58.287471-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
949	98	2		2023-11-13 00:48:47.379-08	2023-11-13 00:52:51.63-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	f	2023-11-13 00:56:58.268231-08	2023-11-13 01:00:59.307257-08	f	f	\N	\N	baseline	normal	125	decrease	10	\N	\N
925	98	1		2023-11-12 23:20:33.991-08	2023-11-12 23:24:10.698-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	f	2023-11-12 23:28:57.178562-08	2023-11-12 23:35:01.035061-08	f	f	\N	\N	baseline	normal	140	normal	25	\N	\N
926	98	\N		2023-11-12 23:30:02.166-08	2023-11-12 23:30:28.006-08	{"Acceleration": null}	f	2023-11-12 23:37:00.714021-08	2023-11-12 23:37:00.714021-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
927	98	2		2023-11-12 23:30:45.087-08	2023-11-12 23:32:47.359-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariavility-INCREASE": 55}	f	2023-11-12 23:37:00.714021-08	2023-11-12 23:39:00.301061-08	f	f	\N	\N	baseline	normal	135	\N	\N	\N	\N
928	98	\N		2023-11-12 23:33:48.11-08	2023-11-12 23:34:12.667-08	{"Acceleration": null}	f	2023-11-12 23:41:00.177328-08	2023-11-12 23:41:00.177328-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
929	98	\N		2023-11-12 23:34:02.887-08	2023-11-12 23:34:50.509-08	{"Acceleration": null}	f	2023-11-12 23:41:00.177328-08	2023-11-12 23:45:00.915212-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
930	98	\N		2023-11-12 23:36:21.394-08	2023-11-12 23:36:41.32-08	{"Acceleration": null}	f	2023-11-12 23:45:00.915212-08	2023-11-12 23:45:59.126503-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
931	98	2		2023-11-12 23:37:32.277-08	2023-11-12 23:40:56.768-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	f	2023-11-12 23:45:59.126503-08	2023-11-12 23:51:03.85046-08	f	f	\N	\N	baseline	normal	145	decrease	10	\N	\N
932	98	3		2023-11-12 23:43:18.849-08	2023-11-12 23:43:48.975-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-12 23:51:03.85046-08	2023-11-12 23:51:03.85046-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
933	98	\N		2023-11-12 23:43:59.774-08	2023-11-12 23:44:38.932-08	{"Acceleration": null}	f	2023-11-12 23:51:03.85046-08	2023-11-12 23:51:03.85046-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
934	98	3		2023-11-12 23:45:48.691-08	2023-11-12 23:46:24.587-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-12 23:52:03.328787-08	2023-11-12 23:52:03.328787-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
935	98	\N		2023-11-12 23:48:24.396-08	2023-11-12 23:48:57.793-08	{"Acceleration": null}	f	2023-11-12 23:56:02.059614-08	2023-11-12 23:56:02.059614-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
936	98	2		2023-11-12 23:50:03.93-08	2023-11-12 23:52:37.877-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	f	2023-11-12 23:58:59.098033-08	2023-11-12 23:59:59.215879-08	f	f	\N	\N	baseline	normal	150	decrease	10	\N	\N
937	98	\N		2023-11-12 23:55:02.004-08	2023-11-12 23:55:45.433-08	{"Acceleration": null}	f	2023-11-13 00:01:59.541975-08	2023-11-13 00:01:59.541975-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
938	98	\N		2023-11-13 00:01:16.479-08	2023-11-13 00:02:53.046-08	{"Acceleration": null}	f	2023-11-13 00:09:59.321418-08	2023-11-13 00:10:59.296621-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
939	98	\N		2023-11-13 00:06:35.046-08	2023-11-13 00:07:40.839-08	{"Acceleration": null}	f	2023-11-13 00:13:58.52141-08	2023-11-13 00:15:58.35683-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
940	98	2		2023-11-13 00:09:22.524-08	2023-11-13 00:11:00.692-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	f	2023-11-13 00:16:58.703587-08	2023-11-13 00:16:58.703587-08	f	f	\N	\N	baseline	normal	140	decrease	15	\N	\N
941	98	\N		2023-11-13 00:11:29.352-08	2023-11-13 00:12:35.385-08	{"Acceleration": null}	f	2023-11-13 00:18:58.540221-08	2023-11-13 00:18:58.540221-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
942	98	\N		2023-11-13 00:13:29.624-08	2023-11-13 00:13:54.242-08	{"Acceleration": null}	f	2023-11-13 00:19:59.152465-08	2023-11-13 00:21:59.131433-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
943	98	\N		2023-11-13 00:15:19.329-08	2023-11-13 00:15:51.792-08	{"Acceleration": null}	f	2023-11-13 00:21:59.131433-08	2023-11-13 00:23:59.016929-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
944	98	\N		2023-11-13 00:18:05.812-08	2023-11-13 00:18:45.743-08	{"Acceleration": null}	f	2023-11-13 00:25:58.958863-08	2023-11-13 00:25:58.958863-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
950	98	2		2023-11-13 00:52:51.88-08	2023-11-13 00:55:08.646-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	f	2023-11-13 01:00:59.307257-08	2023-11-13 01:04:05.020878-08	f	f	\N	\N	baseline	normal	125	decrease	10	\N	\N
945	98	2		2023-11-13 00:20:46.093-08	2023-11-13 00:26:03.995-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	f	2023-11-13 00:29:58.625261-08	2023-11-13 00:37:02.436126-08	f	f	\N	\N	baseline	normal	135	decrease	15	\N	\N
951	98	2		2023-11-13 00:56:40.511-08	2023-11-13 01:01:32.291-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	f	2023-11-13 01:05:05.126661-08	2023-11-13 01:09:07.670522-08	f	f	\N	\N	baseline	normal	130	decrease	15	\N	\N
946	98	\N		2023-11-13 00:28:52.957-08	2023-11-13 00:29:41.812-08	{"Acceleration": null}	f	2023-11-13 00:37:02.436126-08	2023-11-13 00:41:01.373255-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
947	98	\N		2023-11-13 00:32:28.237-08	2023-11-13 00:33:01.631-08	{"Acceleration": null}	f	2023-11-13 00:49:04.408889-08	2023-11-13 00:49:04.408889-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
948	98	\N		2023-11-13 00:44:07.07-08	2023-11-13 00:45:50.422-08	{"Acceleration": null}	f	2023-11-13 00:52:59.030277-08	2023-11-13 00:52:59.030277-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
952	98	\N		2023-11-13 01:01:32.291-08	2023-11-13 01:02:01.88-08	{"Acceleration": null}	f	2023-11-13 01:09:07.670522-08	2023-11-13 01:09:07.670522-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
953	98	\N		2023-11-13 01:02:01.88-08	2023-11-13 01:02:53.875-08	{"Acceleration": null}	f	2023-11-13 01:09:07.670522-08	2023-11-13 01:12:28.570088-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
954	98	\N		2023-11-13 01:06:14.16-08	2023-11-13 01:06:45.565-08	{"Acceleration": null}	f	2023-11-13 01:13:27.035477-08	2023-11-13 01:15:12.312943-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
961	98	2		2023-11-13 01:26:35.601-08	2023-11-13 01:29:12.441-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	f	2023-11-13 01:35:58.325911-08	2023-11-13 01:37:59.219173-08	f	f	\N	\N	baseline	normal	125	decrease	15	\N	\N
955	98	\N		2023-11-13 01:09:55.575-08	2023-11-13 01:10:45.793-08	{"Acceleration": null}	f	2023-11-13 01:17:05.228614-08	2023-11-13 01:19:59.736987-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
956	98	2		2023-11-13 01:11:03.365-08	2023-11-13 01:12:45.774-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	f	2023-11-13 01:19:59.736987-08	2023-11-13 01:19:59.736987-08	f	f	\N	\N	baseline	normal	125	decrease	15	\N	\N
957	98	2		2023-11-13 01:13:49.731-08	2023-11-13 01:16:16.354-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	f	2023-11-13 01:22:58.456876-08	2023-11-13 01:23:58.780547-08	f	f	\N	\N	baseline	normal	120	decrease	15	\N	\N
959	98	1		2023-11-13 01:18:15.162-08	2023-11-13 01:23:18.029-08	{"Risk": 1, "Baseline-NORMAL": 125, "BaselineVariability-NORMAL": 20}	f	2023-11-13 01:25:58.287471-08	2023-11-13 01:29:57.965288-08	f	f	\N	\N	baseline	normal	125	normal	20	\N	\N
966	98	\N		2023-11-13 01:39:15.151-08	2023-11-13 01:40:09.981-08	{"Acceleration": null}	f	2023-11-13 01:45:57.98923-08	2023-11-13 01:47:59.758986-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
960	98	\N		2023-11-13 01:23:18.029-08	2023-11-13 01:24:04.77-08	{"Acceleration": null}	f	2023-11-13 01:29:57.965288-08	2023-11-13 01:32:59.450447-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
965	98	2		2023-11-13 01:36:14.605-08	2023-11-13 01:39:15.151-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	f	2023-11-13 01:42:58.139092-08	2023-11-13 01:45:57.98923-08	f	f	\N	\N	baseline	normal	130	decrease	15	\N	\N
962	98	\N		2023-11-13 01:29:44.839-08	2023-11-13 01:32:54.244-08	{"Acceleration": null}	f	2023-11-13 01:37:59.219173-08	2023-11-13 01:41:58.108547-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
963	98	3		2023-11-13 01:33:03.494-08	2023-11-13 01:33:47.764-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 01:41:58.108547-08	2023-11-13 01:41:58.108547-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
964	98	3		2023-11-13 01:34:27.939-08	2023-11-13 01:35:04.848-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 01:41:58.108547-08	2023-11-13 01:41:58.108547-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
967	98	1		2023-11-13 01:40:24.543-08	2023-11-13 01:42:58.236-08	{"Risk": 1, "Baseline-NORMAL": 120, "BaselineVariability-NORMAL": 20}	f	2023-11-13 01:47:59.758986-08	2023-11-13 01:55:01.030154-08	f	f	\N	\N	baseline	normal	120	normal	20	\N	\N
971	98	3		2023-11-13 01:52:48.117-08	2023-11-13 01:53:28.254-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 01:59:58.973891-08	2023-11-13 02:01:00.712197-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
968	98	2		2023-11-13 01:42:58.486-08	2023-11-13 01:44:50.207-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	f	2023-11-13 01:55:01.030154-08	2023-11-13 01:55:01.030154-08	f	f	\N	\N	baseline	normal	125	decrease	20	\N	\N
969	98	2		2023-11-13 01:46:29.972-08	2023-11-13 01:50:54.016-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	f	2023-11-13 01:55:01.030154-08	2023-11-13 01:59:58.973891-08	f	f	\N	\N	baseline	normal	120	decrease	15	\N	\N
970	98	\N		2023-11-13 01:52:09.08-08	2023-11-13 01:52:57.655-08	{"Acceleration": null}	f	2023-11-13 01:59:58.973891-08	2023-11-13 01:59:58.973891-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
972	98	2		2023-11-13 01:53:28.504-08	2023-11-13 01:56:00.491-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	f	2023-11-13 02:03:00.605727-08	2023-11-13 02:05:00.314963-08	f	f	\N	\N	baseline	normal	125	decrease	10	\N	\N
997	98	\N		2023-11-13 03:03:56.68-08	2023-11-13 03:05:01.98-08	{"Acceleration": null}	f	2023-11-13 03:12:00.074671-08	2023-11-13 03:14:05.803414-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
973	98	2		2023-11-13 01:57:13.072-08	2023-11-13 01:59:05.487-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 10}	f	2023-11-13 02:05:00.314963-08	2023-11-13 02:06:59.428164-08	f	f	\N	\N	baseline	normal	120	decrease	10	\N	\N
974	98	3		2023-11-13 02:00:38.9-08	2023-11-13 02:01:08.019-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 02:06:59.428164-08	2023-11-13 02:06:59.428164-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
975	98	2		2023-11-13 02:01:37.815-08	2023-11-13 02:03:50.61-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 5}	f	2023-11-13 02:10:00.972444-08	2023-11-13 02:12:00.713913-08	f	f	\N	\N	baseline	normal	120	decrease	5	\N	\N
976	98	2		2023-11-13 02:05:04.533-08	2023-11-13 02:07:29.177-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	f	2023-11-13 02:14:01.549233-08	2023-11-13 02:14:01.549233-08	f	f	\N	\N	baseline	normal	125	decrease	15	\N	\N
977	98	\N		2023-11-13 02:09:04.562-08	2023-11-13 02:10:22.451-08	{"Acceleration": null}	f	2023-11-13 02:16:59.973696-08	2023-11-13 02:19:02.007707-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
978	98	\N		2023-11-13 02:11:46.304-08	2023-11-13 02:12:22.492-08	{"Acceleration": null}	f	2023-11-13 02:19:02.007707-08	2023-11-13 02:21:01.140144-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
979	98	\N		2023-11-13 02:13:51.421-08	2023-11-13 02:14:33.385-08	{"Acceleration": null}	f	2023-11-13 02:21:01.140144-08	2023-11-13 02:23:01.927753-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
980	98	\N		2023-11-13 02:16:49.134-08	2023-11-13 02:18:23.529-08	{"Acceleration": null}	f	2023-11-13 02:25:59.547682-08	2023-11-13 02:25:59.547682-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
998	98	\N		2023-11-13 03:08:26.878-08	2023-11-13 03:09:22.655-08	{"Acceleration": null}	f	2023-11-13 03:16:05.057694-08	2023-11-13 03:17:05.48305-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
981	98	\N		2023-11-13 02:19:06.929-08	2023-11-13 02:19:32.445-08	{"Acceleration": null}	f	2023-11-13 02:25:59.547682-08	2023-11-13 02:30:03.203459-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
982	98	\N		2023-11-13 02:22:17.184-08	2023-11-13 02:22:46.819-08	{"Acceleration": null}	f	2023-11-13 02:30:03.203459-08	2023-11-13 02:30:03.203459-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
983	98	2		2023-11-13 02:23:41.553-08	2023-11-13 02:25:34.561-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 20}	f	2023-11-13 02:32:58.959047-08	2023-11-13 02:32:58.959047-08	f	f	\N	\N	baseline	normal	135	decrease	20	\N	\N
984	98	\N		2023-11-13 02:25:34.561-08	2023-11-13 02:26:39.69-08	{"Acceleration": null}	f	2023-11-13 02:32:58.959047-08	2023-11-13 02:35:59.273156-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
985	98	\N		2023-11-13 02:41:01.679-08	2023-11-13 02:41:53.249-08	{"Acceleration": null}	f	2023-11-13 02:48:57.284401-08	2023-11-13 02:48:57.284401-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
986	98	\N		2023-11-13 02:41:56.768-08	2023-11-13 02:42:38.211-08	{"Acceleration": null}	f	2023-11-13 02:48:57.284401-08	2023-11-13 02:48:57.284401-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
987	98	\N		2023-11-13 02:44:09.379-08	2023-11-13 02:44:50.318-08	{"Acceleration": null}	f	2023-11-13 02:50:58.160644-08	2023-11-13 02:50:58.160644-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
988	98	2		2023-11-13 02:44:50.568-08	2023-11-13 02:47:21.542-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	f	2023-11-13 02:52:57.917747-08	2023-11-13 02:52:57.917747-08	f	f	\N	\N	baseline	normal	125	decrease	15	\N	\N
989	98	\N		2023-11-13 02:48:24.074-08	2023-11-13 02:49:38.939-08	{"Acceleration": null}	f	2023-11-13 02:57:07.056276-08	2023-11-13 02:57:07.056276-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
990	98	3		2023-11-13 02:51:24.059-08	2023-11-13 02:52:11.166-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 02:59:07.895-08	2023-11-13 02:59:07.895-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
991	98	3		2023-11-13 02:52:14.925-08	2023-11-13 02:52:38.295-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 02:59:07.895-08	2023-11-13 02:59:07.895-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
992	98	2		2023-11-13 02:52:27.737-08	2023-11-13 02:54:49.182-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	f	2023-11-13 02:59:07.895-08	2023-11-13 03:01:04.383678-08	f	f	\N	\N	baseline	normal	130	decrease	15	\N	\N
993	98	3		2023-11-13 02:55:06.047-08	2023-11-13 02:55:45.886-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 03:02:03.283193-08	2023-11-13 03:04:00.009868-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
994	98	2		2023-11-13 02:55:46.39-08	2023-11-13 02:57:46.271-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	f	2023-11-13 03:04:00.009868-08	2023-11-13 03:04:58.906763-08	f	f	\N	\N	baseline	normal	125	decrease	20	\N	\N
999	98	\N		2023-11-13 03:10:25.15-08	2023-11-13 03:11:13.107-08	{"Acceleration": null}	f	2023-11-13 03:17:05.48305-08	2023-11-13 03:21:12.782658-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
995	98	1		2023-11-13 02:57:56.81-08	2023-11-13 03:01:17.214-08	{"Risk": 1, "Baseline-NORMAL": 130, "BaselineVariability-NORMAL": 25}	f	2023-11-13 03:04:58.906763-08	2023-11-13 03:08:57.359366-08	f	f	\N	\N	baseline	normal	130	normal	25	\N	\N
996	98	3		2023-11-13 03:01:43.322-08	2023-11-13 03:02:23.017-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 03:08:57.359366-08	2023-11-13 03:12:00.074671-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1000	98	2		2023-11-13 03:13:31.404-08	2023-11-13 03:16:49.268-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	f	2023-11-13 03:23:05.241542-08	2023-11-13 03:24:57.707584-08	f	f	\N	\N	baseline	normal	120	decrease	15	\N	\N
1001	98	3		2023-11-13 03:17:07.852-08	2023-11-13 03:17:45.109-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 03:24:57.707584-08	2023-11-13 03:32:24.167189-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1002	98	2		2023-11-13 03:19:38.066-08	2023-11-13 03:20:56.247-08	{"Risk": 2, "Baseline-NORMAL": 115, "BaselineVariability-DECREASE": 5}	f	2023-11-13 03:32:24.167189-08	2023-11-13 03:32:59.049264-08	f	f	\N	\N	baseline	normal	115	decrease	5	\N	\N
1003	98	4		2023-11-13 03:22:13.83-08	2023-11-13 03:25:29.106-08	{"Risk": 4, "Deceleration-LOW_PD": null}	f	2023-11-13 03:32:59.049264-08	2023-11-13 03:32:59.049264-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_pd	\N
1004	98	\N		2023-11-13 03:26:31.343-08	2023-11-13 03:27:19.272-08	{"Acceleration": null}	f	2023-11-13 03:35:16.592975-08	2023-11-13 03:35:16.592975-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1005	98	\N		2023-11-13 03:27:33.82-08	2023-11-13 03:28:29.824-08	{"Acceleration": null}	f	2023-11-13 03:35:16.592975-08	2023-11-13 03:37:06.189612-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1006	98	\N		2023-11-13 03:29:10.273-08	2023-11-13 03:29:53.898-08	{"Acceleration": null}	f	2023-11-13 03:37:06.189612-08	2023-11-13 03:39:58.37142-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1011	103	2		2023-11-13 16:59:42.052-08	2023-11-13 17:00:40.19-08	{"Risk": 2, "Baseline-DECELERATION": 110, "BaselineVariavility-INCREASE": 25}	f	2023-11-13 17:08:51.442286-08	2023-11-13 17:10:48.098139-08	f	f	\N	\N	baseline	deceleration	110	\N	\N	\N	\N
1007	98	\N		2023-11-13 03:33:50.23-08	2023-11-13 03:39:07.208-08	{"Acceleration": null}	f	2023-11-13 03:43:00.688035-08	2023-11-13 03:45:59.633752-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1012	103	3		2023-11-13 17:01:07.279-08	2023-11-13 17:01:48.081-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 17:10:48.098139-08	2023-11-13 17:10:48.098139-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1008	98	\N		2023-11-13 03:39:31.56-08	2023-11-13 03:40:06.507-08	{"Acceleration": null}	f	2023-11-13 03:45:59.633752-08	2023-11-13 03:49:00.270834-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1009	98	\N		2023-11-13 03:41:19.801-08	2023-11-13 03:42:16.759-08	{"Acceleration": null}	f	2023-11-13 03:49:00.270834-08	2023-11-13 03:49:00.270834-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1010	103	4		2023-11-13 16:55:57.93-08	2023-11-13 16:59:24.185-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 10}	f	2023-11-13 17:08:51.442286-08	2023-11-13 17:08:51.442286-08	f	f	\N	\N	baseline	deceleration	110	decrease	10	\N	\N
1013	103	4		2023-11-13 17:01:48.331-08	2023-11-13 17:03:41.09-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	f	2023-11-13 17:10:48.098139-08	2023-11-13 17:10:48.098139-08	f	f	\N	\N	baseline	deceleration	105	decrease	5	\N	\N
1014	103	4		2023-11-13 17:03:59.462-08	2023-11-13 17:04:27.334-08	{"Risk": 4, "Deceleration-LOW_VD": null}	f	2023-11-13 17:10:48.098139-08	2023-11-13 17:10:48.098139-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1016	105	\N		2023-11-13 18:32:36.537-08	2023-11-13 18:33:50.345-08	{"Acceleration": null}	f	2023-11-13 18:41:16.145886-08	2023-11-13 18:41:16.145886-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1015	103	4		2023-11-13 17:07:32.439-08	2023-11-13 17:12:41.122-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 15}	f	2023-11-13 17:13:49.402105-08	2023-11-13 17:18:49.661294-08	f	f	\N	\N	baseline	deceleration	105	decrease	15	\N	\N
1017	105	\N		2023-11-13 18:34:27.753-08	2023-11-13 18:35:15.467-08	{"Acceleration": null}	f	2023-11-13 18:41:16.145886-08	2023-11-13 18:44:01.567825-08	f	t	rrr	2023-11-13 18:42:05.66165-08	acceleration	\N	\N	\N	\N	\N	\N
1111	109	\N		2023-11-14 00:29:29.496-08	2023-11-14 00:30:11.177-08	{"Acceleration": null}	f	2023-11-14 00:36:21.195301-08	2023-11-14 00:36:21.195301-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1036	107	2		2023-11-13 20:12:43.874-08	2023-11-13 20:15:12.998-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	f	2023-11-13 20:20:54.937264-08	2023-11-13 20:22:52.918608-08	f	f	\N	\N	baseline	normal	155	decrease	10	\N	\N
1039	107	\N		2023-11-13 20:15:48.149-08	2023-11-13 20:16:35.338-08	{"Acceleration": null}	f	2023-11-13 20:22:52.918608-08	2023-11-13 20:22:52.918608-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1040	107	3		2023-11-13 20:19:02.955-08	2023-11-13 20:19:40.86-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 20:25:54.424013-08	2023-11-13 20:26:51.868765-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1018	105	2		2023-11-13 18:36:04.194-08	2023-11-13 18:46:17.447-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	f	2023-11-13 18:44:01.567825-08	2023-11-13 18:59:21.52174-08	f	t	dddd	2023-11-13 18:59:21.52174-08	baseline	normal	135	decrease	15	\N	\N
1019	105	3		2023-11-13 18:51:35.065-08	2023-11-13 18:52:23.44-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 18:59:27.118376-08	2023-11-13 19:00:35.189945-08	f	t	treasure	2023-11-13 19:00:35.189945-08	deceleration	\N	\N	\N	\N	low_vd	\N
1020	106	3		2023-11-13 18:56:54.526-08	2023-11-13 18:57:33.667-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 19:10:02.239327-08	2023-11-13 19:10:02.239327-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1021	106	\N		2023-11-13 18:58:18.256-08	2023-11-13 19:00:05.579-08	{"Acceleration": null}	f	2023-11-13 19:10:02.239327-08	2023-11-13 19:10:02.239327-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1022	106	\N		2023-11-13 19:01:04.852-08	2023-11-13 19:01:33.188-08	{"Acceleration": null}	f	2023-11-13 19:10:02.239327-08	2023-11-13 19:10:02.239327-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1041	107	\N		2023-11-13 20:19:58.661-08	2023-11-13 20:20:25.014-08	{"Acceleration": null}	f	2023-11-13 20:26:51.868765-08	2023-11-13 20:26:51.868765-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1023	106	2		2023-11-13 19:01:47.743-08	2023-11-13 19:05:51.395-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	f	2023-11-13 19:10:02.239327-08	2023-11-13 19:15:05.944088-08	f	f	\N	\N	baseline	normal	135	decrease	10	\N	\N
1024	106	5		2023-11-13 19:07:33.057-08	2023-11-13 19:08:50.252-08	{"Risk": 5, "Deceleration-HI_PD": null}	f	2023-11-13 19:15:05.944088-08	2023-11-13 19:17:01.13761-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	high_pd	\N
1042	109	\N		2023-11-13 20:25:36.921-08	2023-11-13 20:26:49.78-08	{"Acceleration": null}	f	2023-11-13 20:39:43.594133-08	2023-11-13 20:39:43.594133-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1025	106	2		2023-11-13 19:08:52.259-08	2023-11-13 19:13:06.351-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	f	2023-11-13 19:17:01.13761-08	2023-11-13 19:20:00.708334-08	f	f	\N	\N	baseline	normal	135	decrease	5	\N	\N
1026	106	3		2023-11-13 19:13:43.501-08	2023-11-13 19:14:07.1-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 19:20:00.708334-08	2023-11-13 19:20:00.708334-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1027	107	\N		2023-11-13 19:57:10.968-08	2023-11-13 19:58:17.513-08	{"Acceleration": null}	f	2023-11-13 20:10:46.313906-08	2023-11-13 20:10:46.313906-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1028	107	2		2023-11-13 19:58:17.763-08	2023-11-13 20:01:07.46-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	f	2023-11-13 20:10:46.313906-08	2023-11-13 20:10:46.313906-08	f	f	\N	\N	baseline	normal	160	decrease	10	\N	\N
1030	108	\N		2023-11-13 19:59:03.378-08	2023-11-13 20:00:17.715-08	{"Acceleration": null}	f	2023-11-13 20:10:46.313906-08	2023-11-13 20:12:47.113439-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1031	108	\N		2023-11-13 20:03:27.243-08	2023-11-13 20:04:02.137-08	{"Acceleration": null}	f	2023-11-13 20:12:47.113439-08	2023-11-13 20:12:47.113439-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1043	109	2		2023-11-13 20:26:50.03-08	2023-11-13 20:28:51.329-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	f	2023-11-13 20:39:43.594133-08	2023-11-13 20:39:43.594133-08	f	f	\N	\N	baseline	normal	140	decrease	5	\N	\N
1032	108	\N		2023-11-13 20:04:38.079-08	2023-11-13 20:05:17.754-08	{"Acceleration": null}	f	2023-11-13 20:14:50.713337-08	2023-11-13 20:14:50.713337-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1033	108	\N		2023-11-13 20:06:35.093-08	2023-11-13 20:08:12.724-08	{"Acceleration": null}	f	2023-11-13 20:14:50.713337-08	2023-11-13 20:14:50.713337-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1029	107	2		2023-11-13 20:01:55.149-08	2023-11-13 20:07:29.363-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	f	2023-11-13 20:10:46.313906-08	2023-11-13 20:15:47.60855-08	f	f	\N	\N	baseline	normal	155	decrease	10	\N	\N
1044	109	2		2023-11-13 20:28:51.579-08	2023-11-13 20:34:12.758-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	f	2023-11-13 20:39:43.594133-08	2023-11-13 20:41:46.75765-08	f	f	\N	\N	baseline	normal	130	decrease	15	\N	\N
1035	107	2		2023-11-13 20:07:29.613-08	2023-11-13 20:12:43.624-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	f	2023-11-13 20:15:47.60855-08	2023-11-13 20:18:53.244469-08	f	f	\N	\N	baseline	normal	155	decrease	10	\N	\N
1034	108	\N		2023-11-13 20:08:12.724-08	2023-11-13 20:09:31.721-08	{"Acceleration": null}	f	2023-11-13 20:14:50.713337-08	2023-11-13 20:18:53.244469-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1037	108	\N		2023-11-13 20:12:24.417-08	2023-11-13 20:13:35.139-08	{"Acceleration": null}	f	2023-11-13 20:20:54.937264-08	2023-11-13 20:22:52.918608-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1038	108	2		2023-11-13 20:13:35.389-08	2023-11-13 20:16:37.123-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	f	2023-11-13 20:22:52.918608-08	2023-11-13 20:22:52.918608-08	f	f	\N	\N	baseline	normal	155	decrease	5	\N	\N
1045	109	\N		2023-11-13 20:34:12.758-08	2023-11-13 20:34:42.381-08	{"Acceleration": null}	f	2023-11-13 20:41:46.75765-08	2023-11-13 20:41:46.75765-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1046	109	1		2023-11-13 20:34:47.907-08	2023-11-13 20:37:02.983-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	f	2023-11-13 20:42:43.716173-08	2023-11-13 20:42:43.716173-08	f	f	\N	\N	baseline	normal	140	normal	25	\N	\N
1052	109	\N		2023-11-13 20:50:41.552-08	2023-11-13 20:51:41.356-08	{"Acceleration": null}	f	2023-11-13 20:57:42.666456-08	2023-11-13 20:58:42.623011-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1047	109	\N		2023-11-13 20:37:42.229-08	2023-11-13 20:42:55.435-08	{"Acceleration": null}	f	2023-11-13 20:45:48.519168-08	2023-11-13 20:50:43.024038-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1048	109	\N		2023-11-13 20:43:18.294-08	2023-11-13 20:44:14.849-08	{"Acceleration": null}	f	2023-11-13 20:50:43.024038-08	2023-11-13 20:52:42.698938-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1049	109	\N		2023-11-13 20:44:44.725-08	2023-11-13 20:45:28.455-08	{"Acceleration": null}	f	2023-11-13 20:52:42.698938-08	2023-11-13 20:55:42.945654-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1050	109	\N		2023-11-13 20:47:33.754-08	2023-11-13 20:48:11.414-08	{"Acceleration": null}	f	2023-11-13 20:55:42.945654-08	2023-11-13 20:55:42.945654-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1051	109	\N		2023-11-13 20:49:15.695-08	2023-11-13 20:50:10.932-08	{"Acceleration": null}	f	2023-11-13 20:55:42.945654-08	2023-11-13 20:55:42.945654-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1053	109	\N		2023-11-13 20:52:21.278-08	2023-11-13 20:53:06.491-08	{"Acceleration": null}	f	2023-11-13 20:58:42.623011-08	2023-11-13 21:00:42.897322-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1054	109	\N		2023-11-13 20:54:51.941-08	2023-11-13 20:55:28.588-08	{"Acceleration": null}	f	2023-11-13 21:01:43.29158-08	2023-11-13 21:01:43.29158-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1055	109	\N		2023-11-13 20:57:27.951-08	2023-11-13 20:58:04.609-08	{"Acceleration": null}	f	2023-11-13 21:04:43.353153-08	2023-11-13 21:04:43.353153-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1056	109	\N		2023-11-13 20:58:40.774-08	2023-11-13 20:59:48.559-08	{"Acceleration": null}	f	2023-11-13 21:06:44.195022-08	2023-11-13 21:06:44.195022-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1059	109	2		2023-11-13 21:07:09.266-08	2023-11-13 21:11:06.333-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 15}	f	2023-11-13 21:14:44.232541-08	2023-11-13 21:19:42.861699-08	f	f	\N	\N	baseline	normal	145	decrease	15	\N	\N
1057	109	\N		2023-11-13 21:00:51.815-08	2023-11-13 21:02:27.5-08	{"Acceleration": null}	f	2023-11-13 21:08:43.588703-08	2023-11-13 21:12:43.048158-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1058	109	\N		2023-11-13 21:05:49.544-08	2023-11-13 21:07:09.009-08	{"Acceleration": null}	f	2023-11-13 21:14:44.232541-08	2023-11-13 21:14:44.232541-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1060	109	2		2023-11-13 21:12:58.805-08	2023-11-13 21:15:03.064-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	f	2023-11-13 21:20:43.388214-08	2023-11-13 21:20:43.388214-08	f	f	\N	\N	baseline	normal	145	decrease	10	\N	\N
1061	109	2		2023-11-13 21:15:21.301-08	2023-11-13 21:21:09.949-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	f	2023-11-13 21:24:43.373318-08	2023-11-13 21:28:45.183303-08	f	f	\N	\N	baseline	normal	145	decrease	10	\N	\N
1062	109	\N		2023-11-13 21:23:34.324-08	2023-11-13 21:23:57.887-08	{"Acceleration": null}	f	2023-11-13 21:31:45.89322-08	2023-11-13 21:31:45.89322-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1063	109	\N		2023-11-13 21:59:40.495-08	2023-11-13 22:00:15.899-08	{"Acceleration": null}	f	2023-11-13 22:14:25.446739-08	2023-11-13 22:14:25.446739-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1064	109	2		2023-11-13 22:00:16.149-08	2023-11-13 22:03:22.264-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	f	2023-11-13 22:14:25.446739-08	2023-11-13 22:14:25.446739-08	f	f	\N	\N	baseline	normal	135	decrease	15	\N	\N
1065	109	2		2023-11-13 22:04:25.533-08	2023-11-13 22:06:33.63-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	f	2023-11-13 22:14:25.446739-08	2023-11-13 22:16:27.921247-08	f	f	\N	\N	baseline	normal	140	decrease	15	\N	\N
1066	109	\N		2023-11-13 22:07:36.17-08	2023-11-13 22:08:49.35-08	{"Acceleration": null}	f	2023-11-13 22:16:27.921247-08	2023-11-13 22:18:25.099516-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1067	109	1		2023-11-13 22:09:36.077-08	2023-11-13 22:13:36.445-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	f	2023-11-13 22:18:25.099516-08	2023-11-13 22:20:22.476615-08	f	f	\N	\N	baseline	normal	145	normal	20	\N	\N
1068	109	\N		2023-11-13 22:13:36.445-08	2023-11-13 22:14:29.962-08	{"Acceleration": null}	f	2023-11-13 22:20:22.476615-08	2023-11-13 22:23:20.558727-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1069	109	\N		2023-11-13 22:15:38.994-08	2023-11-13 22:16:35.341-08	{"Acceleration": null}	f	2023-11-13 22:23:20.558727-08	2023-11-13 22:23:20.558727-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1070	109	2		2023-11-13 22:16:47.196-08	2023-11-13 22:18:16.6-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	f	2023-11-13 22:24:20.225013-08	2023-11-13 22:24:20.225013-08	f	f	\N	\N	baseline	normal	150	decrease	10	\N	\N
1097	109	2		2023-11-13 23:42:50.424-08	2023-11-13 23:45:47.301-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	f	2023-11-13 23:50:18.955848-08	2023-11-13 23:54:19.632409-08	f	f	\N	\N	baseline	normal	140	decrease	10	\N	\N
1071	109	2		2023-11-13 22:21:15.524-08	2023-11-13 22:23:07.549-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	f	2023-11-13 22:29:21.721449-08	2023-11-13 22:32:21.936384-08	f	f	\N	\N	baseline	normal	140	decrease	5	\N	\N
1072	109	3		2023-11-13 22:24:08.304-08	2023-11-13 22:24:24.642-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 22:32:21.936384-08	2023-11-13 22:32:21.936384-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1073	109	2		2023-11-13 22:24:29.161-08	2023-11-13 22:26:24.162-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 20}	f	2023-11-13 22:32:21.936384-08	2023-11-13 22:34:19.624615-08	f	f	\N	\N	baseline	normal	155	decrease	20	\N	\N
1074	109	\N		2023-11-13 22:26:24.162-08	2023-11-13 22:27:05.096-08	{"Acceleration": null}	f	2023-11-13 22:34:19.624615-08	2023-11-13 22:34:19.624615-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1075	109	3		2023-11-13 22:27:14.138-08	2023-11-13 22:27:50.29-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 22:34:19.624615-08	2023-11-13 22:34:19.624615-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1076	109	\N		2023-11-13 22:28:39.253-08	2023-11-13 22:29:14.906-08	{"Acceleration": null}	f	2023-11-13 22:35:20.018378-08	2023-11-13 22:35:20.018378-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1077	109	3		2023-11-13 22:33:27.73-08	2023-11-13 22:33:48.868-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 22:40:19.739582-08	2023-11-13 22:41:18.57407-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1078	109	\N		2023-11-13 22:35:18.958-08	2023-11-13 22:35:42.99-08	{"Acceleration": null}	f	2023-11-13 22:43:19.860079-08	2023-11-13 22:43:19.860079-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1079	109	\N		2023-11-13 22:35:42.99-08	2023-11-13 22:36:30.771-08	{"Acceleration": null}	f	2023-11-13 22:43:19.860079-08	2023-11-13 22:43:19.860079-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1080	109	2		2023-11-13 22:36:31.021-08	2023-11-13 22:38:53.889-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	f	2023-11-13 22:45:21.209147-08	2023-11-13 22:45:21.209147-08	f	f	\N	\N	baseline	normal	140	decrease	10	\N	\N
1089	109	2		2023-11-13 23:07:44.21-08	2023-11-13 23:10:19.548-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	f	2023-11-13 23:15:23.585693-08	2023-11-13 23:19:23.011829-08	f	f	\N	\N	baseline	normal	145	decrease	10	\N	\N
1081	109	\N		2023-11-13 22:40:46.904-08	2023-11-13 22:42:38.467-08	{"Acceleration": null}	f	2023-11-13 22:47:21.366816-08	2023-11-13 22:53:20.464475-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1082	109	2		2023-11-13 22:44:18.615-08	2023-11-13 22:47:35.978-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	f	2023-11-13 22:53:20.464475-08	2023-11-13 22:53:20.464475-08	f	f	\N	\N	baseline	normal	140	decrease	15	\N	\N
1090	109	2		2023-11-13 23:10:47.423-08	2023-11-13 23:13:02.816-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	f	2023-11-13 23:19:23.011829-08	2023-11-13 23:21:22.689856-08	f	f	\N	\N	baseline	normal	140	decrease	5	\N	\N
1091	109	\N		2023-11-13 23:30:22.852-08	2023-11-13 23:30:59.763-08	{"Acceleration": null}	f	2023-11-13 23:37:18.092252-08	2023-11-13 23:37:18.092252-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1083	109	2		2023-11-13 22:48:22.151-08	2023-11-13 22:53:03.001-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	f	2023-11-13 22:56:20.233882-08	2023-11-13 23:01:19.917184-08	f	f	\N	\N	baseline	normal	130	decrease	15	\N	\N
1092	109	2		2023-11-13 23:32:07.056-08	2023-11-13 23:34:18.631-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	f	2023-11-13 23:40:18.59775-08	2023-11-13 23:40:18.59775-08	f	f	\N	\N	baseline	normal	135	decrease	15	\N	\N
1084	109	\N		2023-11-13 22:54:08.535-08	2023-11-13 22:55:02.288-08	{"Acceleration": null}	f	2023-11-13 23:01:19.917184-08	2023-11-13 23:03:23.441442-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1085	109	1		2023-11-13 22:55:11.824-08	2023-11-13 22:57:06.279-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	f	2023-11-13 23:03:23.441442-08	2023-11-13 23:07:28.679356-08	f	f	\N	\N	baseline	normal	145	normal	20	\N	\N
1086	109	2		2023-11-13 22:57:31.871-08	2023-11-13 22:57:50.419-08	{"Risk": 2, "Deceleration-LOW_VD": null}	f	2023-11-13 23:11:22.117793-08	2023-11-13 23:11:22.117793-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1087	109	\N		2023-11-13 23:05:48.064-08	2023-11-13 23:07:01.787-08	{"Acceleration": null}	f	2023-11-13 23:12:21.530272-08	2023-11-13 23:14:22.663811-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1088	109	\N		2023-11-13 23:07:01.787-08	2023-11-13 23:07:34.914-08	{"Acceleration": null}	f	2023-11-13 23:14:22.663811-08	2023-11-13 23:14:22.663811-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1093	109	\N		2023-11-13 23:34:18.631-08	2023-11-13 23:35:07.837-08	{"Acceleration": null}	f	2023-11-13 23:41:19.322495-08	2023-11-13 23:41:19.322495-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1094	109	\N		2023-11-13 23:37:18.386-08	2023-11-13 23:38:29.925-08	{"Acceleration": null}	f	2023-11-13 23:44:19.621761-08	2023-11-13 23:44:19.621761-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1095	109	2		2023-11-13 23:38:30.179-08	2023-11-13 23:40:25.493-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	f	2023-11-13 23:46:19.984636-08	2023-11-13 23:48:19.654528-08	f	f	\N	\N	baseline	normal	135	decrease	10	\N	\N
1096	109	2		2023-11-13 23:40:29.758-08	2023-11-13 23:42:50.174-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	f	2023-11-13 23:48:19.654528-08	2023-11-13 23:50:18.955848-08	f	f	\N	\N	baseline	normal	135	decrease	5	\N	\N
1102	109	\N		2023-11-13 23:57:44.511-08	2023-11-13 23:59:06.853-08	{"Acceleration": null}	f	2023-11-14 00:05:23.659855-08	2023-11-14 00:07:21.149646-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1098	109	2		2023-11-13 23:46:07.627-08	2023-11-13 23:48:14.22-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	f	2023-11-13 23:54:19.632409-08	2023-11-13 23:56:19.091357-08	f	f	\N	\N	baseline	normal	135	decrease	10	\N	\N
1099	109	3		2023-11-13 23:49:26.519-08	2023-11-13 23:49:52.125-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-13 23:56:19.091357-08	2023-11-13 23:57:19.778401-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1100	109	2		2023-11-13 23:49:58.401-08	2023-11-13 23:55:22.898-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	f	2023-11-13 23:59:20.591375-08	2023-11-14 00:05:23.659855-08	f	f	\N	\N	baseline	normal	135	decrease	10	\N	\N
1101	109	2		2023-11-13 23:56:14.365-08	2023-11-13 23:57:44.511-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	f	2023-11-14 00:05:23.659855-08	2023-11-14 00:05:23.659855-08	f	f	\N	\N	baseline	normal	135	decrease	15	\N	\N
1103	109	2		2023-11-14 00:02:11.931-08	2023-11-14 00:05:04.475-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	f	2023-11-14 00:10:20.057829-08	2023-11-14 00:15:22.042127-08	f	f	\N	\N	baseline	normal	125	decrease	20	\N	\N
1104	109	\N		2023-11-14 00:10:43.511-08	2023-11-14 00:12:02.1-08	{"Acceleration": null}	f	2023-11-14 00:19:24.223953-08	2023-11-14 00:19:24.223953-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1105	109	\N		2023-11-14 00:12:02.1-08	2023-11-14 00:12:38.766-08	{"Acceleration": null}	f	2023-11-14 00:19:24.223953-08	2023-11-14 00:19:24.223953-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1106	109	\N		2023-11-14 00:14:27.75-08	2023-11-14 00:15:57.67-08	{"Acceleration": null}	f	2023-11-14 00:22:21.015053-08	2023-11-14 00:23:20.74086-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1107	109	\N		2023-11-14 00:16:43.112-08	2023-11-14 00:17:14.009-08	{"Acceleration": null}	f	2023-11-14 00:23:20.74086-08	2023-11-14 00:23:20.74086-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1109	109	\N		2023-11-14 00:23:38.583-08	2023-11-14 00:25:24.981-08	{"Acceleration": null}	f	2023-11-14 00:34:21.144265-08	2023-11-14 00:34:21.144265-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1108	109	\N		2023-11-14 00:20:37.37-08	2023-11-14 00:21:21.296-08	{"Acceleration": null}	f	2023-11-14 00:28:19.634703-08	2023-11-14 00:33:21.165736-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1110	109	\N		2023-11-14 00:28:40.299-08	2023-11-14 00:29:29.496-08	{"Acceleration": null}	f	2023-11-14 00:36:21.195301-08	2023-11-14 00:36:21.195301-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1113	109	\N		2023-11-14 00:34:36.703-08	2023-11-14 00:35:40.641-08	{"Acceleration": null}	f	2023-11-14 00:41:19.635338-08	2023-11-14 00:45:20.125271-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1145	109	2		2023-11-14 02:34:33.204-08	2023-11-14 02:36:15.688-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	f	2023-11-14 02:43:20.546743-08	2023-11-14 02:43:20.546743-08	f	f	\N	\N	baseline	normal	125	decrease	15	\N	\N
1146	109	2		2023-11-14 02:37:19.746-08	2023-11-14 02:39:46.158-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	f	2023-11-14 02:46:19.360869-08	2023-11-14 02:46:19.360869-08	f	f	\N	\N	baseline	normal	120	decrease	15	\N	\N
1136	109	2		2023-11-14 01:44:13.91-08	2023-11-14 01:49:34-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	f	2023-11-14 01:52:19.841042-08	2023-11-14 01:58:23.945407-08	f	f	\N	\N	baseline	normal	135	decrease	15	\N	\N
1114	109	1		2023-11-14 00:38:04.095-08	2023-11-14 00:41:40.741-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	f	2023-11-14 00:47:19.909496-08	2023-11-14 00:53:21.792642-08	f	f	\N	\N	baseline	normal	140	normal	25	\N	\N
1115	109	2		2023-11-14 00:45:48.325-08	2023-11-14 00:47:10.927-08	{"Risk": 2, "Deceleration-LOW_VD": null}	f	2023-11-14 00:53:21.792642-08	2023-11-14 00:53:21.792642-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1116	109	2		2023-11-14 00:47:14.436-08	2023-11-14 00:48:10.377-08	{"Risk": 2, "Deceleration-LOW_VD": null}	f	2023-11-14 00:53:21.792642-08	2023-11-14 00:54:21.744775-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1117	109	\N		2023-11-14 00:48:16.659-08	2023-11-14 00:48:55.043-08	{"Acceleration": null}	f	2023-11-14 00:55:22.340654-08	2023-11-14 00:55:22.340654-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1118	109	\N		2023-11-14 00:50:46.852-08	2023-11-14 00:51:49.498-08	{"Acceleration": null}	f	2023-11-14 00:57:19.698635-08	2023-11-14 00:59:19.938232-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1119	109	\N		2023-11-14 00:53:13.348-08	2023-11-14 00:54:04.418-08	{"Acceleration": null}	f	2023-11-14 01:01:19.487214-08	2023-11-14 01:02:20.164646-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1120	109	\N		2023-11-14 00:55:14.005-08	2023-11-14 00:56:13.393-08	{"Acceleration": null}	f	2023-11-14 01:02:20.164646-08	2023-11-14 01:04:20.288739-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1121	109	\N		2023-11-14 00:57:10.128-08	2023-11-14 00:57:36.184-08	{"Acceleration": null}	f	2023-11-14 01:04:20.288739-08	2023-11-14 01:04:20.288739-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1122	109	\N		2023-11-14 00:57:43.952-08	2023-11-14 00:58:19.142-08	{"Acceleration": null}	f	2023-11-14 01:04:20.288739-08	2023-11-14 01:09:20.318264-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1123	109	2		2023-11-14 01:01:01.635-08	2023-11-14 01:04:25.416-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	f	2023-11-14 01:09:20.318264-08	2023-11-14 01:13:24.705847-08	f	f	\N	\N	baseline	normal	145	decrease	10	\N	\N
1124	109	3		2023-11-14 01:06:47.778-08	2023-11-14 01:07:17.914-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-14 01:13:24.705847-08	2023-11-14 01:13:24.705847-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1125	109	\N		2023-11-14 01:07:28.654-08	2023-11-14 01:08:07.942-08	{"Acceleration": null}	f	2023-11-14 01:14:25.267836-08	2023-11-14 01:16:23.278128-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1126	109	\N		2023-11-14 01:09:20.506-08	2023-11-14 01:10:17.793-08	{"Acceleration": null}	f	2023-11-14 01:16:23.278128-08	2023-11-14 01:20:21.794506-08	f	t	ddd	2023-11-14 01:17:12.723246-08	acceleration	\N	\N	\N	\N	\N	\N
1127	109	\N		2023-11-14 01:11:05.513-08	2023-11-14 01:11:46.665-08	{"Acceleration": null}	f	2023-11-14 01:20:21.794506-08	2023-11-14 01:22:19.97415-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1128	109	2		2023-11-14 01:13:33.089-08	2023-11-14 01:16:06.86-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	f	2023-11-14 01:22:19.97415-08	2023-11-14 01:24:20.241776-08	f	f	\N	\N	baseline	normal	150	decrease	10	\N	\N
1137	109	\N		2023-11-14 01:52:23.294-08	2023-11-14 01:53:11.918-08	{"Acceleration": null}	f	2023-11-14 01:59:24.57588-08	2023-11-14 02:02:25.163148-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1129	109	\N		2023-11-14 01:18:31.344-08	2023-11-14 01:19:14.83-08	{"Acceleration": null}	f	2023-11-14 01:26:20.107145-08	2023-11-14 01:29:20.481819-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1130	109	\N		2023-11-14 01:24:46.258-08	2023-11-14 01:26:22.977-08	{"Acceleration": null}	f	2023-11-14 01:32:20.130642-08	2023-11-14 01:34:19.892444-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1131	109	\N		2023-11-14 01:30:04.655-08	2023-11-14 01:31:10.714-08	{"Acceleration": null}	f	2023-11-14 01:37:19.889882-08	2023-11-14 01:37:19.889882-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1132	109	2		2023-11-14 01:32:52.656-08	2023-11-14 01:34:59.165-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariavility-INCREASE": 25}	f	2023-11-14 01:43:19.567423-08	2023-11-14 01:43:19.567423-08	f	f	\N	\N	baseline	normal	140	\N	\N	\N	\N
1133	109	\N		2023-11-14 01:36:59.694-08	2023-11-14 01:37:24.116-08	{"Acceleration": null}	f	2023-11-14 01:43:19.567423-08	2023-11-14 01:44:20.286096-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1134	109	\N		2023-11-14 01:38:49.245-08	2023-11-14 01:39:21.641-08	{"Acceleration": null}	f	2023-11-14 01:46:19.778589-08	2023-11-14 01:46:19.778589-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1135	109	\N		2023-11-14 01:41:35.296-08	2023-11-14 01:42:15.708-08	{"Acceleration": null}	f	2023-11-14 01:48:20.250274-08	2023-11-14 01:52:19.841042-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1138	109	\N		2023-11-14 02:07:37.296-08	2023-11-14 02:09:20.642-08	{"Acceleration": null}	f	2023-11-14 02:17:18.808847-08	2023-11-14 02:17:18.808847-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1147	109	\N		2023-11-14 02:40:42.522-08	2023-11-14 02:41:45.068-08	{"Acceleration": null}	f	2023-11-14 02:48:19.044076-08	2023-11-14 02:50:19.144963-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1139	109	2		2023-11-14 02:12:17.442-08	2023-11-14 02:16:21.8-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	f	2023-11-14 02:20:19.911006-08	2023-11-14 02:23:23.585962-08	f	f	\N	\N	baseline	normal	125	decrease	10	\N	\N
1140	109	2		2023-11-14 02:16:22.04-08	2023-11-14 02:18:38.915-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	f	2023-11-14 02:24:19.727177-08	2023-11-14 02:24:19.727177-08	f	f	\N	\N	baseline	normal	125	decrease	10	\N	\N
1141	109	2		2023-11-14 02:20:10.792-08	2023-11-14 02:25:02.737-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	f	2023-11-14 02:28:26.246008-08	2023-11-14 02:31:22.639313-08	f	f	\N	\N	baseline	normal	130	decrease	15	\N	\N
1152	109	\N		2023-11-14 02:55:15.04-08	2023-11-14 02:56:22.294-08	{"Acceleration": null}	f	2023-11-14 03:03:19.266441-08	2023-11-14 03:03:19.266441-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1142	109	\N		2023-11-14 02:25:02.737-08	2023-11-14 02:26:23.414-08	{"Acceleration": null}	f	2023-11-14 02:31:22.639313-08	2023-11-14 02:36:44.900201-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1143	109	\N		2023-11-14 02:29:43.346-08	2023-11-14 02:30:15.261-08	{"Acceleration": null}	f	2023-11-14 02:36:44.900201-08	2023-11-14 02:38:37.356296-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1144	109	\N		2023-11-14 02:33:25.4-08	2023-11-14 02:34:15.381-08	{"Acceleration": null}	f	2023-11-14 02:41:23.532071-08	2023-11-14 02:41:23.532071-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1148	109	1		2023-11-14 02:41:45.324-08	2023-11-14 02:46:47.368-08	{"Risk": 1, "Baseline-NORMAL": 125, "BaselineVariability-NORMAL": 20}	f	2023-11-14 02:50:19.144963-08	2023-11-14 02:53:18.781063-08	f	f	\N	\N	baseline	normal	125	normal	20	\N	\N
1153	109	3		2023-11-14 02:56:31.544-08	2023-11-14 02:57:38.659-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-14 03:03:19.266441-08	2023-11-14 03:03:19.266441-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1149	109	\N		2023-11-14 02:46:47.368-08	2023-11-14 02:47:34.166-08	{"Acceleration": null}	f	2023-11-14 02:53:18.781063-08	2023-11-14 02:57:20.02126-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1150	109	2		2023-11-14 02:50:04.936-08	2023-11-14 02:52:43.906-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	f	2023-11-14 02:59:19.121057-08	2023-11-14 03:02:19.31206-08	f	f	\N	\N	baseline	normal	125	decrease	15	\N	\N
1151	109	2		2023-11-14 02:53:16.283-08	2023-11-14 02:55:15.04-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	f	2023-11-14 03:02:19.31206-08	2023-11-14 03:02:19.31206-08	f	f	\N	\N	baseline	normal	120	decrease	15	\N	\N
1154	109	3		2023-11-14 02:57:56.198-08	2023-11-14 02:58:32.847-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-14 03:04:19.966481-08	2023-11-14 03:04:19.966481-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1155	109	2		2023-11-14 02:59:42.642-08	2023-11-14 03:02:43.816-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	f	2023-11-14 03:06:19.061132-08	2023-11-14 03:08:19.428046-08	f	f	\N	\N	baseline	normal	125	decrease	15	\N	\N
1156	111	4		2023-11-17 06:44:57.591-08	2023-11-17 06:45:48.763-08	{"Risk": 4, "Deceleration-HI_LD": null}	f	2023-11-17 06:58:17.938442-08	2023-11-17 06:58:17.938442-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	high_ld	\N
1157	111	4		2023-11-17 06:47:00.501-08	2023-11-17 06:52:02.32-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	f	2023-11-17 06:58:17.938442-08	2023-11-17 06:58:30.408145-08	f	t	s	2023-11-17 06:58:30.408145-08	baseline	deceleration	110	decrease	5	\N	\N
1158	111	4		2023-11-17 06:52:03.437-08	2023-11-17 06:52:18.488-08	{"Risk": 4, "Deceleration-LOW_VD": null}	f	2023-11-17 07:00:13.798295-08	2023-11-17 07:00:13.798295-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1199	124	\N		2023-11-20 04:36:11.361-08	2023-11-20 04:36:58.142-08	{"Acceleration": null}	f	2023-11-20 04:43:23.331347-08	2023-11-20 04:43:23.331347-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1249	130	\N		2023-11-21 04:45:07.945-08	2023-11-21 04:46:43.854-08	{"Acceleration": null}	f	2023-11-21 04:58:50.066506-08	2023-11-21 04:58:50.066506-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1183	122	5		2023-11-20 02:23:19.54-08	2023-11-20 02:26:19.325-08	{"Risk": 5, "Deceleration-HI_PD": null}	f	2023-11-20 02:36:06.791381-08	2023-11-20 02:36:06.791381-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	high_pd	\N
1184	122	3		2023-11-20 02:27:08.645-08	2023-11-20 02:28:43.57-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-20 02:36:06.791381-08	2023-11-20 02:36:06.791381-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1168	112	4		2023-11-17 08:16:02.196-08	2023-11-17 08:29:24.408-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 10}	f	2023-11-17 08:24:14.380704-08	2023-11-17 08:35:17.171583-08	f	t	fff	2023-11-17 08:24:26.817592-08	baseline	deceleration	105	decrease	10	\N	\N
1169	120	4		2023-11-20 01:05:32.545-08	2023-11-20 01:08:54.959-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 10}	f	2023-11-20 01:18:10.843476-08	2023-11-20 01:18:10.843476-08	f	f	\N	\N	baseline	deceleration	110	decrease	10	\N	\N
1170	120	4		2023-11-20 01:09:12.544-08	2023-11-20 01:09:37.618-08	{"Risk": 4, "Deceleration-LOW_VD": null}	f	2023-11-20 01:18:10.843476-08	2023-11-20 01:18:10.843476-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1159	111	4		2023-11-17 06:52:40.794-08	2023-11-17 07:04:12.232-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	f	2023-11-17 07:00:13.798295-08	2023-11-17 07:11:15.694051-08	f	t	me	2023-11-17 07:02:40.240014-08	baseline	deceleration	105	decrease	5	\N	\N
1171	120	4		2023-11-20 01:10:29.129-08	2023-11-20 01:11:18.201-08	{"Risk": 4, "Deceleration-HI_LD": null}	f	2023-11-20 01:20:06.73949-08	2023-11-20 01:20:06.73949-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	high_ld	\N
1172	120	4		2023-11-20 01:11:18.451-08	2023-11-20 01:13:11.228-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	f	2023-11-20 01:20:06.73949-08	2023-11-20 01:20:06.73949-08	f	f	\N	\N	baseline	deceleration	105	decrease	5	\N	\N
1160	111	4		2023-11-17 07:04:12.232-08	2023-11-17 07:10:01.263-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 10}	f	2023-11-17 07:11:15.694051-08	2023-11-17 07:17:20.787726-08	f	t	\\	2023-11-17 07:13:31.267499-08	baseline	deceleration	105	decrease	10	\N	\N
1161	111	4		2023-11-17 07:11:17.559-08	2023-11-17 07:14:39.059-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	f	2023-11-17 07:20:19.635121-08	2023-11-17 07:20:38.4948-08	f	t	aa	2023-11-17 07:20:38.4948-08	baseline	deceleration	105	decrease	5	\N	\N
1162	112	3		2023-11-17 07:58:04.491-08	2023-11-17 07:58:19.539-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-17 08:13:19.335657-08	2023-11-17 08:13:19.335657-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1163	112	4		2023-11-17 07:59:46.419-08	2023-11-17 08:00:37.486-08	{"Risk": 4, "Deceleration-HI_LD": null}	f	2023-11-17 08:13:19.335657-08	2023-11-17 08:13:19.335657-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	high_ld	\N
1164	112	4		2023-11-17 08:01:48.316-08	2023-11-17 08:06:50.079-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	f	2023-11-17 08:13:19.335657-08	2023-11-17 08:15:14.026913-08	f	t	sss	2023-11-17 08:13:29.1741-08	baseline	deceleration	110	decrease	5	\N	\N
1165	112	5		2023-11-17 08:07:02.883-08	2023-11-17 08:07:46.697-08	{"Risk": 5, "Deceleration-HI_LD": null}	f	2023-11-17 08:15:14.026913-08	2023-11-17 08:15:23.975602-08	f	t	aa	2023-11-17 08:15:23.975602-08	deceleration	\N	\N	\N	\N	high_ld	\N
1173	120	4		2023-11-20 01:13:29.555-08	2023-11-20 01:13:57.152-08	{"Risk": 4, "Deceleration-LOW_VD": null}	f	2023-11-20 01:20:06.73949-08	2023-11-20 01:22:06.811397-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1166	112	4		2023-11-17 08:08:28.275-08	2023-11-17 08:12:19.77-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	f	2023-11-17 08:16:20.207742-08	2023-11-17 08:18:19.02402-08	f	t	dfdd	2023-11-17 08:16:28.347332-08	baseline	deceleration	105	decrease	5	\N	\N
1174	120	4		2023-11-20 01:13:58.909-08	2023-11-20 01:16:27.906-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	f	2023-11-20 01:22:06.811397-08	2023-11-20 01:23:10.762488-08	f	f	\N	\N	baseline	deceleration	110	decrease	5	\N	\N
1167	112	4		2023-11-17 08:12:20.01-08	2023-11-17 08:16:01.946-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	f	2023-11-17 08:20:15.217546-08	2023-11-17 08:24:14.380704-08	f	t	aaa	2023-11-17 08:20:40.524619-08	baseline	deceleration	105	decrease	5	\N	\N
1175	120	4		2023-11-20 01:17:01.744-08	2023-11-20 01:17:30.044-08	{"Risk": 4, "Deceleration-LOW_VD": null}	f	2023-11-20 01:25:09.066097-08	2023-11-20 01:25:09.066097-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1187	123	\N		2023-11-20 03:50:17.956-08	2023-11-20 03:51:59.279-08	{"Acceleration": null}	f	2023-11-20 04:03:22.544553-08	2023-11-20 04:03:22.544553-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1176	120	4		2023-11-20 01:17:30.544-08	2023-11-20 01:21:34.133-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 10}	f	2023-11-20 01:25:09.066097-08	2023-11-20 01:29:09.642866-08	f	f	\N	\N	baseline	deceleration	110	decrease	10	\N	\N
1177	121	3		2023-11-20 01:42:34.824-08	2023-11-20 01:43:13.785-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-20 01:50:06.668229-08	2023-11-20 01:51:07.351311-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1178	121	5		2023-11-20 01:46:54.623-08	2023-11-20 01:49:06.827-08	{"Risk": 5, "Deceleration-HI_PD": null}	f	2023-11-20 01:54:07.506919-08	2023-11-20 01:56:07.279896-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	high_pd	\N
1179	121	\N		2023-11-20 01:49:32.637-08	2023-11-20 01:50:08.463-08	{"Acceleration": null}	f	2023-11-20 01:56:07.279896-08	2023-11-20 01:56:07.279896-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1180	121	\N		2023-11-20 01:50:09.538-08	2023-11-20 01:50:38.954-08	{"Acceleration": null}	f	2023-11-20 01:57:08.078714-08	2023-11-20 01:57:08.078714-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1181	121	\N		2023-11-20 01:52:34.58-08	2023-11-20 01:54:26.093-08	{"Acceleration": null}	f	2023-11-20 02:00:12.460945-08	2023-11-20 02:02:12.275504-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1185	122	\N		2023-11-20 02:29:29.776-08	2023-11-20 02:30:17.194-08	{"Acceleration": null}	f	2023-11-20 02:36:06.791381-08	2023-11-20 02:41:07.825145-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1182	121	2		2023-11-20 01:54:26.343-08	2023-11-20 01:59:40.642-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	f	2023-11-20 02:02:12.275504-08	2023-11-20 02:07:10.277905-08	f	f	\N	\N	baseline	normal	140	decrease	10	\N	\N
1188	123	\N		2023-11-20 03:52:20.529-08	2023-11-20 03:53:10.201-08	{"Acceleration": null}	f	2023-11-20 04:03:22.544553-08	2023-11-20 04:03:22.544553-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1189	123	\N		2023-11-20 03:53:32.306-08	2023-11-20 03:54:00.393-08	{"Acceleration": null}	f	2023-11-20 04:03:22.544553-08	2023-11-20 04:03:22.544553-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1192	123	2		2023-11-20 04:01:19.495-08	2023-11-20 04:05:34.101-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	f	2023-11-20 04:09:14.363005-08	2023-11-20 04:13:13.951039-08	f	f	\N	\N	baseline	normal	135	decrease	5	\N	\N
1190	123	2		2023-11-20 03:54:15.211-08	2023-11-20 03:58:18.492-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	f	2023-11-20 04:03:22.544553-08	2023-11-20 04:07:20.151163-08	f	f	\N	\N	baseline	normal	135	decrease	10	\N	\N
1191	123	5		2023-11-20 03:59:06.469-08	2023-11-20 04:01:17.481-08	{"Risk": 5, "Deceleration-HI_PD": null}	f	2023-11-20 04:09:14.363005-08	2023-11-20 04:09:14.363005-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	high_pd	\N
1186	122	2		2023-11-20 02:32:00.304-08	2023-11-20 02:42:35.275-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	f	2023-11-20 02:41:07.825145-08	2023-11-20 02:54:21.701735-08	f	f	\N	\N	baseline	normal	140	decrease	10	\N	\N
1196	124	2		2023-11-20 04:22:16.59-08	2023-11-20 04:27:50.73-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	f	2023-11-20 04:31:17.292091-08	2023-11-20 04:35:27.272852-08	f	f	\N	\N	baseline	normal	155	decrease	10	\N	\N
1193	123	3		2023-11-20 04:06:11.008-08	2023-11-20 04:06:32.612-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-20 04:13:13.951039-08	2023-11-20 04:13:24.558698-08	f	t	77	2023-11-20 04:13:24.558698-08	deceleration	\N	\N	\N	\N	low_vd	\N
1194	124	\N		2023-11-20 04:17:32.057-08	2023-11-20 04:18:38.61-08	{"Acceleration": null}	f	2023-11-20 04:31:17.292091-08	2023-11-20 04:31:17.292091-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1195	124	2		2023-11-20 04:18:38.86-08	2023-11-20 04:21:28.635-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	f	2023-11-20 04:31:17.292091-08	2023-11-20 04:31:17.292091-08	f	f	\N	\N	baseline	normal	160	decrease	10	\N	\N
1197	124	2		2023-11-20 04:27:50.97-08	2023-11-20 04:33:05.422-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	f	2023-11-20 04:36:18.128781-08	2023-11-20 04:41:29.623581-08	f	f	\N	\N	baseline	normal	155	decrease	10	\N	\N
1198	124	2		2023-11-20 04:33:05.672-08	2023-11-20 04:35:35.422-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	f	2023-11-20 04:41:29.623581-08	2023-11-20 04:43:23.331347-08	f	f	\N	\N	baseline	normal	160	decrease	10	\N	\N
1200	124	4		2023-11-20 04:39:26.459-08	2023-11-20 04:40:08.764-08	{"Risk": 4, "Deceleration-LOW_VD": null}	f	2023-11-20 04:46:19.920739-08	2023-11-20 04:48:19.263631-08	f	t	sss	2023-11-20 04:46:30.339776-08	deceleration	\N	\N	\N	\N	low_vd	\N
1201	124	\N		2023-11-20 04:40:10.271-08	2023-11-20 04:40:47.867-08	{"Acceleration": null}	f	2023-11-20 04:48:19.263631-08	2023-11-20 04:48:19.263631-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1202	125	\N		2023-11-20 18:38:08.518-08	2023-11-20 18:39:15.896-08	{"Acceleration": null}	f	2023-11-20 18:51:31.677236-08	2023-11-20 18:51:31.677236-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1203	125	2		2023-11-20 18:39:16.146-08	2023-11-20 18:42:08.014-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	f	2023-11-20 18:51:31.677236-08	2023-11-20 18:51:31.677236-08	f	f	\N	\N	baseline	normal	160	decrease	10	\N	\N
1224	127	\N		2023-11-20 22:59:27.693-08	2023-11-20 23:01:04.669-08	{"Acceleration": null}	f	2023-11-20 23:07:25.155128-08	2023-11-20 23:09:27.745438-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1204	125	2		2023-11-20 18:42:55.804-08	2023-11-20 18:48:38.463-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	f	2023-11-20 18:51:31.677236-08	2023-11-20 18:56:28.475836-08	f	f	\N	\N	baseline	normal	155	decrease	10	\N	\N
1225	127	\N		2023-11-20 23:01:04.669-08	2023-11-20 23:02:24.111-08	{"Acceleration": null}	f	2023-11-20 23:09:27.745438-08	2023-11-20 23:10:31.482622-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1205	125	2		2023-11-20 18:48:38.713-08	2023-11-20 18:53:56.919-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	f	2023-11-20 18:56:28.475836-08	2023-11-20 19:01:27.05396-08	f	f	\N	\N	baseline	normal	155	decrease	10	\N	\N
1206	125	2		2023-11-20 18:53:57.136-08	2023-11-20 18:56:27.978-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	f	2023-11-20 19:03:36.972886-08	2023-11-20 19:03:36.972886-08	f	f	\N	\N	baseline	normal	160	decrease	10	\N	\N
1207	125	\N		2023-11-20 18:57:04.415-08	2023-11-20 18:57:51.417-08	{"Acceleration": null}	f	2023-11-20 19:03:36.972886-08	2023-11-20 19:03:36.972886-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1208	125	\N		2023-11-20 18:58:46.843-08	2023-11-20 18:59:43.891-08	{"Acceleration": null}	f	2023-11-20 19:08:30.466193-08	2023-11-20 19:08:30.466193-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1209	125	3		2023-11-20 19:00:20.579-08	2023-11-20 19:01:05.552-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-20 19:08:30.466193-08	2023-11-20 19:08:30.466193-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1210	125	\N		2023-11-20 19:01:13.552-08	2023-11-20 19:02:09.797-08	{"Acceleration": null}	f	2023-11-20 19:08:30.466193-08	2023-11-20 19:08:30.466193-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1211	126	\N		2023-11-20 19:19:17.498-08	2023-11-20 19:20:24.189-08	{"Acceleration": null}	f	2023-11-20 19:32:31.714083-08	2023-11-20 19:32:31.714083-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1212	126	2		2023-11-20 19:20:24.439-08	2023-11-20 19:23:15.099-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	f	2023-11-20 19:32:31.714083-08	2023-11-20 19:32:31.714083-08	f	f	\N	\N	baseline	normal	160	decrease	10	\N	\N
1226	127	2		2023-11-20 23:05:16.791-08	2023-11-20 23:08:58.478-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	f	2023-11-20 23:13:33.372894-08	2023-11-20 23:15:33.002173-08	f	f	\N	\N	baseline	normal	155	decrease	5	\N	\N
1213	126	2		2023-11-20 19:24:02.659-08	2023-11-20 19:29:38.945-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	f	2023-11-20 19:32:31.714083-08	2023-11-20 19:37:29.309853-08	f	f	\N	\N	baseline	normal	155	decrease	10	\N	\N
1227	128	\N		2023-11-20 23:48:27.838-08	2023-11-20 23:49:42.439-08	{"Acceleration": null}	f	2023-11-21 00:00:26.547149-08	2023-11-21 00:00:26.547149-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1214	126	2		2023-11-20 19:29:39.195-08	2023-11-20 19:34:54.687-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	f	2023-11-20 19:37:29.309853-08	2023-11-20 19:42:34.139274-08	f	f	\N	\N	baseline	normal	155	decrease	10	\N	\N
1215	126	2		2023-11-20 19:34:54.937-08	2023-11-20 19:37:24.66-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	f	2023-11-20 19:42:34.139274-08	2023-11-20 19:44:36.76881-08	f	f	\N	\N	baseline	normal	160	decrease	10	\N	\N
1216	126	\N		2023-11-20 19:38:00.61-08	2023-11-20 19:38:47.293-08	{"Acceleration": null}	f	2023-11-20 19:44:36.76881-08	2023-11-20 19:47:36.726899-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1217	126	\N		2023-11-20 19:39:42.297-08	2023-11-20 19:40:39.193-08	{"Acceleration": null}	f	2023-11-20 19:49:29.862831-08	2023-11-20 19:49:29.862831-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1218	126	3		2023-11-20 19:41:15.443-08	2023-11-20 19:41:59.978-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-20 19:49:29.862831-08	2023-11-20 19:49:29.862831-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1219	126	\N		2023-11-20 19:42:07.728-08	2023-11-20 19:43:03.789-08	{"Acceleration": null}	f	2023-11-20 19:49:29.862831-08	2023-11-20 19:50:28.959427-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1220	126	\N		2023-11-20 19:43:42.785-08	2023-11-20 19:44:13.867-08	{"Acceleration": null}	f	2023-11-20 19:50:28.959427-08	2023-11-20 19:50:28.959427-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1221	127	\N		2023-11-20 22:51:54.587-08	2023-11-20 22:53:08.947-08	{"Acceleration": null}	f	2023-11-20 23:04:24.694293-08	2023-11-20 23:04:24.694293-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1222	127	\N		2023-11-20 22:56:18.665-08	2023-11-20 22:56:53.589-08	{"Acceleration": null}	f	2023-11-20 23:04:24.694293-08	2023-11-20 23:04:24.694293-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1223	127	\N		2023-11-20 22:57:29.774-08	2023-11-20 22:58:09.679-08	{"Acceleration": null}	f	2023-11-20 23:06:24.967737-08	2023-11-20 23:06:24.967737-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1228	128	\N		2023-11-20 23:52:52.555-08	2023-11-20 23:53:27.233-08	{"Acceleration": null}	f	2023-11-21 00:00:26.547149-08	2023-11-21 00:02:26.575621-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1236	129	2		2023-11-21 00:27:54.491-08	2023-11-21 00:31:36.408-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	f	2023-11-21 00:35:32.527177-08	2023-11-21 00:37:33.756432-08	f	f	\N	\N	baseline	normal	155	decrease	5	\N	\N
1237	130	\N		2023-11-21 02:10:14.778-08	2023-11-21 02:11:27.545-08	{"Acceleration": null}	f	2023-11-21 02:24:22.413835-08	2023-11-21 02:24:22.413835-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1229	128	\N		2023-11-20 23:55:59.94-08	2023-11-20 23:58:56.869-08	{"Acceleration": null}	f	2023-11-21 00:04:26.555555-08	2023-11-21 00:10:34.93161-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1230	128	\N		2023-11-21 00:01:49.609-08	2023-11-21 00:03:00.171-08	{"Acceleration": null}	f	2023-11-21 00:10:34.93161-08	2023-11-21 00:12:30.521904-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1231	128	2		2023-11-21 00:03:00.421-08	2023-11-21 00:06:02.463-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	f	2023-11-21 00:12:30.521904-08	2023-11-21 00:12:30.521904-08	f	f	\N	\N	baseline	normal	155	decrease	5	\N	\N
1232	129	\N		2023-11-21 00:14:32.91-08	2023-11-21 00:15:47.299-08	{"Acceleration": null}	f	2023-11-21 00:26:26.984855-08	2023-11-21 00:28:26.635552-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1233	129	\N		2023-11-21 00:18:57.44-08	2023-11-21 00:19:30.563-08	{"Acceleration": null}	f	2023-11-21 00:28:26.635552-08	2023-11-21 00:28:26.635552-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1234	129	\N		2023-11-21 00:22:05.862-08	2023-11-21 00:22:40.741-08	{"Acceleration": null}	f	2023-11-21 00:28:26.635552-08	2023-11-21 00:30:26.860079-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1235	129	\N		2023-11-21 00:23:42.765-08	2023-11-21 00:25:01.892-08	{"Acceleration": null}	f	2023-11-21 00:30:26.860079-08	2023-11-21 00:33:33.279254-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1238	130	2		2023-11-21 02:11:27.795-08	2023-11-21 02:13:28.999-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	f	2023-11-21 02:24:22.413835-08	2023-11-21 02:24:22.413835-08	f	f	\N	\N	baseline	normal	140	decrease	5	\N	\N
1239	130	2		2023-11-21 02:13:29.249-08	2023-11-21 02:18:50.076-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	f	2023-11-21 02:24:22.413835-08	2023-11-21 02:26:25.246866-08	f	f	\N	\N	baseline	normal	130	decrease	15	\N	\N
1240	130	\N		2023-11-21 02:18:50.076-08	2023-11-21 02:19:19.716-08	{"Acceleration": null}	f	2023-11-21 02:26:25.246866-08	2023-11-21 02:27:22.782333-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1241	130	1		2023-11-21 02:19:24.988-08	2023-11-21 02:21:41.014-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	f	2023-11-21 02:27:22.782333-08	2023-11-21 02:27:22.782333-08	f	f	\N	\N	baseline	normal	140	normal	25	\N	\N
1242	130	2		2023-11-21 02:22:20.164-08	2023-11-21 02:26:31.654-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	f	2023-11-21 02:31:26.499248-08	2023-11-21 02:35:22.544518-08	f	f	\N	\N	baseline	normal	135	decrease	15	\N	\N
1243	130	\N		2023-11-21 02:26:31.654-08	2023-11-21 02:27:34.641-08	{"Acceleration": null}	f	2023-11-21 02:35:22.544518-08	2023-11-21 02:35:22.544518-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1244	130	\N		2023-11-21 02:27:57.981-08	2023-11-21 02:28:54.448-08	{"Acceleration": null}	f	2023-11-21 02:35:22.544518-08	2023-11-21 02:35:22.544518-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1245	130	\N		2023-11-21 02:29:24.329-08	2023-11-21 02:30:07.999-08	{"Acceleration": null}	f	2023-11-21 02:37:22.403655-08	2023-11-21 02:39:23.437027-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1246	130	\N		2023-11-21 02:32:13.23-08	2023-11-21 02:32:51.121-08	{"Acceleration": null}	f	2023-11-21 02:39:23.437027-08	2023-11-21 02:39:23.437027-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1247	130	\N		2023-11-21 02:33:53.36-08	2023-11-21 02:34:50.833-08	{"Acceleration": null}	f	2023-11-21 02:41:22.154179-08	2023-11-21 02:41:22.154179-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1248	130	\N		2023-11-21 04:42:56.871-08	2023-11-21 04:44:04.884-08	{"Acceleration": null}	f	2023-11-21 04:58:50.066506-08	2023-11-21 04:58:50.066506-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1250	130	\N		2023-11-21 04:50:05.402-08	2023-11-21 04:52:13.151-08	{"Acceleration": null}	f	2023-11-21 04:58:50.066506-08	2023-11-21 04:59:53.012347-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1251	130	2		2023-11-21 04:52:13.401-08	2023-11-21 04:53:27.475-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	f	2023-11-21 04:59:53.012347-08	2023-11-21 04:59:53.012347-08	f	f	\N	\N	baseline	normal	150	decrease	15	\N	\N
1252	130	2		2023-11-21 04:57:14.144-08	2023-11-21 04:59:18.447-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	f	2023-11-21 05:04:51.297617-08	2023-11-21 05:06:51.244455-08	f	f	\N	\N	baseline	normal	145	decrease	10	\N	\N
1284	130	\N		2023-11-21 06:26:39.288-08	2023-11-21 06:27:13.174-08	{"Acceleration": null}	f	2023-11-21 06:33:53.366964-08	2023-11-21 06:34:55.668553-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1253	130	3		2023-11-21 04:59:37.979-08	2023-11-21 05:00:36.789-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-21 05:07:52.049468-08	2023-11-21 05:10:51.610174-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1267	130	2		2023-11-21 05:36:22.708-08	2023-11-21 05:38:31.66-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	f	2023-11-21 05:44:53.119308-08	2023-11-21 05:48:52.210704-08	f	f	\N	\N	baseline	normal	150	decrease	10	\N	\N
1254	130	2		2023-11-21 05:01:59.789-08	2023-11-21 05:05:26.108-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	f	2023-11-21 05:10:51.610174-08	2023-11-21 05:14:54.176408-08	f	f	\N	\N	baseline	normal	145	decrease	10	\N	\N
1255	130	\N		2023-11-21 05:07:49.962-08	2023-11-21 05:08:22.3-08	{"Acceleration": null}	f	2023-11-21 05:14:54.176408-08	2023-11-21 05:14:54.176408-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1256	130	3		2023-11-21 05:08:12.3-08	2023-11-21 05:08:41.126-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-21 05:14:54.176408-08	2023-11-21 05:14:54.176408-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1257	130	2		2023-11-21 05:09:13.533-08	2023-11-21 05:12:10.618-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	f	2023-11-21 05:16:54.576273-08	2023-11-21 05:19:54.27631-08	f	f	\N	\N	baseline	normal	145	decrease	10	\N	\N
1268	130	2		2023-11-21 05:40:51.286-08	2023-11-21 05:42:43.11-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	f	2023-11-21 05:48:52.210704-08	2023-11-21 05:50:52.539422-08	f	f	\N	\N	baseline	normal	140	decrease	5	\N	\N
1258	130	2		2023-11-21 05:12:10.872-08	2023-11-21 05:15:41.466-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	f	2023-11-21 05:19:54.27631-08	2023-11-21 05:24:50.869075-08	f	f	\N	\N	baseline	normal	135	decrease	10	\N	\N
1259	130	2		2023-11-21 05:16:00.546-08	2023-11-21 05:18:39.375-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	f	2023-11-21 05:24:50.869075-08	2023-11-21 05:26:51.252278-08	f	f	\N	\N	baseline	normal	140	decrease	15	\N	\N
1260	130	\N		2023-11-21 05:19:15.538-08	2023-11-21 05:19:51.24-08	{"Acceleration": null}	f	2023-11-21 05:26:51.252278-08	2023-11-21 05:27:51.572769-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1269	130	3		2023-11-21 05:43:43.891-08	2023-11-21 05:44:00.281-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-21 05:50:52.539422-08	2023-11-21 05:52:52.296667-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1261	130	2		2023-11-21 05:19:51.49-08	2023-11-21 05:22:58.464-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	f	2023-11-21 05:27:51.572769-08	2023-11-21 05:32:52.586406-08	f	f	\N	\N	baseline	normal	135	decrease	15	\N	\N
1262	130	2		2023-11-21 05:24:00.725-08	2023-11-21 05:26:08.808-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	f	2023-11-21 05:32:52.586406-08	2023-11-21 05:33:56.326163-08	f	f	\N	\N	baseline	normal	140	decrease	15	\N	\N
1263	130	\N		2023-11-21 05:27:11.619-08	2023-11-21 05:28:24.468-08	{"Acceleration": null}	f	2023-11-21 05:34:59.211228-08	2023-11-21 05:34:59.211228-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1270	130	2		2023-11-21 05:44:04.804-08	2023-11-21 05:45:59.826-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 15}	f	2023-11-21 05:52:52.296667-08	2023-11-21 05:52:52.296667-08	f	f	\N	\N	baseline	normal	155	decrease	15	\N	\N
1264	130	1		2023-11-21 05:29:11.255-08	2023-11-21 05:33:11.683-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	f	2023-11-21 05:36:58.981721-08	2023-11-21 05:39:54.067029-08	f	f	\N	\N	baseline	normal	145	normal	20	\N	\N
1265	130	\N		2023-11-21 05:33:11.683-08	2023-11-21 05:34:05.181-08	{"Acceleration": null}	f	2023-11-21 05:39:54.067029-08	2023-11-21 05:41:53.115767-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1266	130	\N		2023-11-21 05:35:14.24-08	2023-11-21 05:36:10.618-08	{"Acceleration": null}	f	2023-11-21 05:41:53.115767-08	2023-11-21 05:43:52.769548-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1271	130	\N		2023-11-21 05:45:59.826-08	2023-11-21 05:46:40.756-08	{"Acceleration": null}	f	2023-11-21 05:52:52.296667-08	2023-11-21 05:52:52.296667-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1272	130	3		2023-11-21 05:46:50.284-08	2023-11-21 05:47:26.22-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-21 05:54:51.649046-08	2023-11-21 05:54:51.649046-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1273	130	\N		2023-11-21 05:48:15.156-08	2023-11-21 05:48:50.858-08	{"Acceleration": null}	f	2023-11-21 05:54:51.649046-08	2023-11-21 06:00:51.216748-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1274	130	3		2023-11-21 05:53:03.94-08	2023-11-21 05:53:25.033-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-21 06:00:51.216748-08	2023-11-21 06:00:51.216748-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1275	130	\N		2023-11-21 05:54:55.178-08	2023-11-21 05:55:19.21-08	{"Acceleration": null}	f	2023-11-21 06:01:51.125593-08	2023-11-21 06:01:51.125593-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1279	130	2		2023-11-21 06:03:55.541-08	2023-11-21 06:07:12.59-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	f	2023-11-21 06:11:54.43611-08	2023-11-21 06:16:50.512657-08	f	f	\N	\N	baseline	normal	140	decrease	15	\N	\N
1280	130	2		2023-11-21 06:07:59.058-08	2023-11-21 06:12:39.907-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	f	2023-11-21 06:16:50.512657-08	2023-11-21 06:18:50.546898-08	f	f	\N	\N	baseline	normal	130	decrease	15	\N	\N
1276	130	2		2023-11-21 05:55:19.21-08	2023-11-21 05:58:30.223-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	f	2023-11-21 06:01:51.125593-08	2023-11-21 06:07:51.771589-08	f	f	\N	\N	baseline	normal	140	decrease	5	\N	\N
1277	130	\N		2023-11-21 06:00:20.167-08	2023-11-21 06:01:12.162-08	{"Acceleration": null}	f	2023-11-21 06:07:51.771589-08	2023-11-21 06:07:51.771589-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1278	130	\N		2023-11-21 06:01:12.846-08	2023-11-21 06:02:15.52-08	{"Acceleration": null}	f	2023-11-21 06:08:53.18834-08	2023-11-21 06:08:53.18834-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1281	130	\N		2023-11-21 06:13:45.447-08	2023-11-21 06:14:39.018-08	{"Acceleration": null}	f	2023-11-21 06:20:51.474202-08	2023-11-21 06:22:51.153216-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1282	130	2		2023-11-21 06:14:48.566-08	2023-11-21 06:17:27.577-08	{"Risk": 2, "Deceleration-LOW_VD": null}	f	2023-11-21 06:22:51.153216-08	2023-11-21 06:25:56.292169-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1283	130	\N		2023-11-21 06:25:49.588-08	2023-11-21 06:26:39.288-08	{"Acceleration": null}	f	2023-11-21 06:33:53.366964-08	2023-11-21 06:33:53.366964-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1288	130	2		2023-11-21 06:51:45.106-08	2023-11-21 06:53:56.672-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	f	2023-11-21 07:00:50.928034-08	2023-11-21 07:00:50.928034-08	f	f	\N	\N	baseline	normal	135	decrease	15	\N	\N
1285	130	2		2023-11-21 06:27:13.174-08	2023-11-21 06:29:57.118-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	f	2023-11-21 06:34:55.668553-08	2023-11-21 06:38:54.818544-08	f	f	\N	\N	baseline	normal	145	decrease	10	\N	\N
1286	130	2		2023-11-21 06:30:25.243-08	2023-11-21 06:32:40.374-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	f	2023-11-21 06:38:54.818544-08	2023-11-21 06:38:54.818544-08	f	f	\N	\N	baseline	normal	140	decrease	5	\N	\N
1287	130	\N		2023-11-21 06:50:00.903-08	2023-11-21 06:50:38.074-08	{"Acceleration": null}	f	2023-11-21 06:56:50.040846-08	2023-11-21 06:56:50.040846-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1289	130	\N		2023-11-21 06:53:56.672-08	2023-11-21 06:54:46.143-08	{"Acceleration": null}	f	2023-11-21 07:00:50.928034-08	2023-11-21 07:00:50.928034-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1290	130	\N		2023-11-21 06:56:56.727-08	2023-11-21 06:58:08.304-08	{"Acceleration": null}	f	2023-11-21 07:03:51.260639-08	2023-11-21 07:03:51.260639-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1291	130	2		2023-11-21 06:58:08.557-08	2023-11-21 07:00:04.093-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	f	2023-11-21 07:05:51.480533-08	2023-11-21 07:07:51.190778-08	f	f	\N	\N	baseline	normal	135	decrease	10	\N	\N
1292	130	2		2023-11-21 07:00:10.626-08	2023-11-21 07:02:29.359-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	f	2023-11-21 07:07:51.190778-08	2023-11-21 07:09:51.298955-08	f	f	\N	\N	baseline	normal	135	decrease	5	\N	\N
1293	130	2		2023-11-21 07:02:29.399-08	2023-11-21 07:05:26.424-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	f	2023-11-21 07:11:51.991875-08	2023-11-21 07:14:52.170212-08	f	f	\N	\N	baseline	normal	140	decrease	10	\N	\N
1294	130	2		2023-11-21 07:05:46.753-08	2023-11-21 07:08:55.008-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	f	2023-11-21 07:14:52.170212-08	2023-11-21 07:14:52.170212-08	f	f	\N	\N	baseline	normal	135	decrease	10	\N	\N
1295	130	3		2023-11-21 07:09:06.144-08	2023-11-21 07:09:31.788-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-21 07:16:51.667716-08	2023-11-21 07:17:52.944836-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1335	130	2		2023-11-21 09:32:04.319-08	2023-11-21 09:36:08.934-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	f	2023-11-21 09:40:51.907197-08	2023-11-21 09:41:51.87395-08	f	f	\N	\N	baseline	normal	125	decrease	10	\N	\N
1296	130	2		2023-11-21 07:09:38.072-08	2023-11-21 07:15:03.447-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	f	2023-11-21 07:17:52.944836-08	2023-11-21 07:20:53.117083-08	f	f	\N	\N	baseline	normal	135	decrease	10	\N	\N
1297	130	2		2023-11-21 07:15:55.533-08	2023-11-21 07:17:25.211-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	f	2023-11-21 07:23:57.045878-08	2023-11-21 07:23:57.045878-08	f	f	\N	\N	baseline	normal	135	decrease	15	\N	\N
1298	130	\N		2023-11-21 07:17:25.211-08	2023-11-21 07:18:47.829-08	{"Acceleration": null}	f	2023-11-21 07:25:54.185815-08	2023-11-21 07:25:54.185815-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1299	130	2		2023-11-21 07:21:52.968-08	2023-11-21 07:24:45.532-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	f	2023-11-21 07:30:51.722731-08	2023-11-21 07:32:54.767362-08	f	f	\N	\N	baseline	normal	125	decrease	20	\N	\N
1319	130	\N		2023-11-21 08:27:10.162-08	2023-11-21 08:27:49.393-08	{"Acceleration": null}	f	2023-11-21 08:33:58.443318-08	2023-11-21 08:36:56.195463-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1300	130	\N		2023-11-21 07:30:24.968-08	2023-11-21 07:32:20.255-08	{"Acceleration": null}	f	2023-11-21 07:37:54.106827-08	2023-11-21 07:40:53.365844-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1301	130	\N		2023-11-21 07:34:09.299-08	2023-11-21 07:35:39.227-08	{"Acceleration": null}	f	2023-11-21 07:42:52.663775-08	2023-11-21 07:42:52.663775-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1302	130	\N		2023-11-21 07:36:24.673-08	2023-11-21 07:36:55.644-08	{"Acceleration": null}	f	2023-11-21 07:42:52.663775-08	2023-11-21 07:47:51.634631-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1303	130	\N		2023-11-21 07:40:18.795-08	2023-11-21 07:40:45.63-08	{"Acceleration": null}	f	2023-11-21 07:47:51.634631-08	2023-11-21 07:47:51.634631-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1304	130	\N		2023-11-21 07:45:05.299-08	2023-11-21 07:45:50.991-08	{"Acceleration": null}	f	2023-11-21 07:51:59.087143-08	2023-11-21 07:51:59.087143-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1305	130	\N		2023-11-21 07:48:24.176-08	2023-11-21 07:49:51.827-08	{"Acceleration": null}	f	2023-11-21 07:54:51.842541-08	2023-11-21 07:55:52.369296-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1320	130	3		2023-11-21 08:28:58.953-08	2023-11-21 08:29:31.916-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-21 08:36:56.195463-08	2023-11-21 08:37:56.085262-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1306	130	\N		2023-11-21 07:50:01.99-08	2023-11-21 07:50:47.285-08	{"Acceleration": null}	f	2023-11-21 07:57:52.935106-08	2023-11-21 08:01:51.264189-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1307	130	\N		2023-11-21 07:54:17.693-08	2023-11-21 07:55:21.555-08	{"Acceleration": null}	f	2023-11-21 08:01:51.264189-08	2023-11-21 08:03:51.913707-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1308	130	1		2023-11-21 07:57:44.929-08	2023-11-21 08:01:21.761-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	f	2023-11-21 08:05:52.035247-08	2023-11-21 08:07:52.474359-08	f	f	\N	\N	baseline	normal	140	normal	25	\N	\N
1309	130	2		2023-11-21 08:05:28.745-08	2023-11-21 08:06:52.991-08	{"Risk": 2, "Deceleration-LOW_VD": null}	f	2023-11-21 08:11:53.628371-08	2023-11-21 08:13:54.262509-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1310	130	2		2023-11-21 08:06:57.263-08	2023-11-21 08:07:48.422-08	{"Risk": 2, "Deceleration-LOW_VD": null}	f	2023-11-21 08:13:54.262509-08	2023-11-21 08:13:54.262509-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1311	130	\N		2023-11-21 08:07:57.259-08	2023-11-21 08:08:23.865-08	{"Acceleration": null}	f	2023-11-21 08:15:52.942142-08	2023-11-21 08:15:52.942142-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1312	130	\N		2023-11-21 08:08:26.212-08	2023-11-21 08:08:55.818-08	{"Acceleration": null}	f	2023-11-21 08:17:52.866004-08	2023-11-21 08:17:52.866004-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1313	130	\N		2023-11-21 08:10:45.085-08	2023-11-21 08:11:30.26-08	{"Acceleration": null}	f	2023-11-21 08:19:51.43095-08	2023-11-21 08:19:51.43095-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1314	130	\N		2023-11-21 08:12:53.857-08	2023-11-21 08:13:45.685-08	{"Acceleration": null}	f	2023-11-21 08:19:51.43095-08	2023-11-21 08:21:51.963274-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1315	130	\N		2023-11-21 08:14:54.997-08	2023-11-21 08:15:54.282-08	{"Acceleration": null}	f	2023-11-21 08:21:51.963274-08	2023-11-21 08:23:51.503662-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1321	130	\N		2023-11-21 08:30:47.272-08	2023-11-21 08:31:28.2-08	{"Acceleration": null}	f	2023-11-21 08:37:56.085262-08	2023-11-21 08:37:56.085262-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1316	130	\N		2023-11-21 08:17:08.561-08	2023-11-21 08:18:00.411-08	{"Acceleration": null}	f	2023-11-21 08:23:51.503662-08	2023-11-21 08:29:52.400715-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1317	130	2		2023-11-21 08:20:42.885-08	2023-11-21 08:24:07.066-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	f	2023-11-21 08:29:52.400715-08	2023-11-21 08:29:52.400715-08	f	f	\N	\N	baseline	normal	145	decrease	10	\N	\N
1318	130	3		2023-11-21 08:26:29.224-08	2023-11-21 08:26:59.359-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-21 08:33:58.443318-08	2023-11-21 08:33:58.443318-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1330	130	\N		2023-11-21 09:01:16.679-08	2023-11-21 09:01:57.586-08	{"Acceleration": null}	f	2023-11-21 09:07:51.575435-08	2023-11-21 09:10:50.911004-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1322	130	2		2023-11-21 08:33:14.72-08	2023-11-21 08:35:48.62-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	f	2023-11-21 08:40:53.132021-08	2023-11-21 08:45:52.140003-08	f	f	\N	\N	baseline	normal	150	decrease	10	\N	\N
1323	130	\N		2023-11-21 08:38:12.33-08	2023-11-21 08:38:56.519-08	{"Acceleration": null}	f	2023-11-21 08:45:52.140003-08	2023-11-21 08:48:52.17396-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1324	130	\N		2023-11-21 08:44:27.393-08	2023-11-21 08:46:04.297-08	{"Acceleration": null}	f	2023-11-21 08:51:51.736919-08	2023-11-21 08:51:51.736919-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1325	130	\N		2023-11-21 08:49:46.034-08	2023-11-21 08:50:52.662-08	{"Acceleration": null}	f	2023-11-21 08:57:51.815305-08	2023-11-21 08:59:50.964393-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1326	130	2		2023-11-21 08:52:34.639-08	2023-11-21 08:54:41.178-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariavility-INCREASE": 25}	f	2023-11-21 09:01:51.222919-08	2023-11-21 09:01:51.222919-08	f	f	\N	\N	baseline	normal	140	\N	\N	\N	\N
1327	130	\N		2023-11-21 08:54:41.248-08	2023-11-21 08:55:47.265-08	{"Acceleration": null}	f	2023-11-21 09:03:51.53309-08	2023-11-21 09:03:51.53309-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1328	130	\N		2023-11-21 08:56:41.756-08	2023-11-21 08:57:05.774-08	{"Acceleration": null}	f	2023-11-21 09:03:51.53309-08	2023-11-21 09:05:51.620248-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1329	130	\N		2023-11-21 08:58:31.104-08	2023-11-21 08:59:03.637-08	{"Acceleration": null}	f	2023-11-21 09:05:51.620248-08	2023-11-21 09:07:51.575435-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1331	130	2		2023-11-21 09:02:01.856-08	2023-11-21 09:06:09.575-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	f	2023-11-21 09:10:50.911004-08	2023-11-21 09:11:51.87544-08	f	f	\N	\N	baseline	normal	140	decrease	15	\N	\N
1332	130	2		2023-11-21 09:06:13.158-08	2023-11-21 09:09:15.871-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	f	2023-11-21 09:14:51.444323-08	2023-11-21 09:18:55.386748-08	f	f	\N	\N	baseline	normal	135	decrease	15	\N	\N
1333	130	\N		2023-11-21 09:12:04.872-08	2023-11-21 09:12:53.811-08	{"Acceleration": null}	f	2023-11-21 09:18:55.386748-08	2023-11-21 09:23:54.898796-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1334	130	\N		2023-11-21 09:27:23.529-08	2023-11-21 09:28:06.091-08	{"Acceleration": null}	f	2023-11-21 09:37:50.662586-08	2023-11-21 09:37:50.662586-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1336	130	2		2023-11-21 09:36:08.984-08	2023-11-21 09:38:26.083-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	f	2023-11-21 09:44:57.226529-08	2023-11-21 09:48:56.972249-08	f	f	\N	\N	baseline	normal	125	decrease	10	\N	\N
1337	130	\N		2023-11-21 09:39:58.238-08	2023-11-21 09:46:11.174-08	{"Acceleration": null}	f	2023-11-21 09:48:56.972249-08	2023-11-21 09:56:20.158184-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1339	133	3		2023-11-22 17:58:28.169-08	2023-11-22 17:58:43.704-08	{"Risk": 3, "Deceleration-LOW_VD": null}	f	2023-11-22 18:13:39.155845-08	2023-11-22 18:13:39.155845-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1338	130	\N		2023-11-21 09:49:31.353-08	2023-11-21 09:50:03.001-08	{"Acceleration": null}	f	2023-11-21 09:56:20.158184-08	2023-11-21 09:56:20.158184-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1340	133	\N		2023-11-22 18:00:22.376-08	2023-11-22 18:00:56.653-08	{"Acceleration": null}	f	2023-11-22 18:13:39.155845-08	2023-11-22 18:13:39.155845-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1341	133	4		2023-11-22 18:02:12.467-08	2023-11-22 18:07:14.153-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	f	2023-11-22 18:13:39.155845-08	2023-11-22 18:17:32.286359-08	f	t	www	2023-11-22 18:17:04.92815-08	baseline	deceleration	110	decrease	5	\N	\N
1342	133	5		2023-11-22 18:07:26.711-08	2023-11-22 18:08:10.764-08	{"Risk": 5, "Deceleration-HI_LD": null}	f	2023-11-22 18:17:32.286359-08	2023-11-22 18:17:32.286359-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	high_ld	\N
1343	133	4		2023-11-22 18:08:52.202-08	2023-11-22 18:16:21.841-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	f	2023-11-22 18:17:32.286359-08	2023-11-22 18:24:37.920115-08	f	t	rr	2023-11-22 18:18:43.964542-08	baseline	deceleration	105	decrease	5	\N	\N
1344	133	4		2023-11-22 18:16:22.091-08	2023-11-22 18:29:47.691-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	f	2023-11-22 18:24:37.920115-08	2023-11-22 18:36:38.031429-08	f	t	 ttt	2023-11-22 18:25:05.450652-08	baseline	deceleration	105	decrease	5	\N	\N
1345	136	2		2023-12-23 17:59:08.261-08	2023-12-23 18:03:45.362-08	{"Risk": 2, "Baseline-DECELERATION": 110, "BaselineVariavility-INCREASE": 30}	f	2023-12-23 18:11:14.286419-08	2023-12-23 18:11:14.286419-08	f	f	\N	\N	baseline	deceleration	110	\N	\N	\N	\N
1346	136	\N		2023-12-23 18:03:45.362-08	2023-12-23 18:04:15.916-08	{"Acceleration": null}	f	2023-12-23 18:11:14.286419-08	2023-12-23 18:11:14.286419-08	f	f	\N	\N	acceleration	\N	\N	\N	\N	\N	\N
1347	136	4		2023-12-23 18:04:19.701-08	2023-12-23 18:06:55.779-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	f	2023-12-23 18:11:14.286419-08	2023-12-23 18:14:13.640235-08	f	f	\N	\N	baseline	deceleration	105	decrease	5	\N	\N
1348	136	4		2023-12-23 18:07:14.102-08	2023-12-23 18:07:41.975-08	{"Risk": 4, "Deceleration-LOW_VD": null}	f	2023-12-23 18:15:10.50144-08	2023-12-23 18:15:10.50144-08	f	f	\N	\N	deceleration	\N	\N	\N	\N	low_vd	\N
1349	136	4		2023-12-23 18:07:43.869-08	2023-12-23 18:10:14.517-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	f	2023-12-23 18:16:11.248385-08	2023-12-23 18:16:11.248385-08	f	f	\N	\N	baseline	deceleration	110	decrease	5	\N	\N
1350	136	4		2023-12-23 18:10:38.47-08	2023-12-23 18:15:59.695-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 15}	f	2023-12-23 18:17:09.988205-08	2023-12-23 18:22:11.645368-08	f	f	\N	\N	baseline	deceleration	105	decrease	15	\N	\N
\.


--
-- Data for Name: ctg_authentication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ctg_authentication (id, hospital_id, api_key, created_at) FROM stdin;
1	1	14aeec59-ab00-456a-83ed-bad1be2f8de3	2021-10-01 05:00:00-07
2	2	230d4a21-339e-4237-83ef-bad2e61f367a	2021-10-01 05:00:00-07
3	3	0b606c44-4e98-4953-b2b1-a7469cfd3e6c	2021-10-01 05:00:00-07
\.


--
-- Data for Name: diagnosis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diagnosis (id, measurement_id, baseline_bpm, maximum_risk, memo, range_from, range_until, created_at, modified_at) FROM stdin;
61	85	165	3		2023-11-09 13:09:57.448-08	2023-11-09 15:09:57.198-08	2023-11-09 15:00:03.617466-08	2023-11-09 15:00:03.617466-08
62	86	162	5		2023-11-09 12:49:57.448-08	2023-11-09 14:49:57.198-08	2023-11-09 15:00:03.617794-08	2023-11-09 15:00:03.617794-08
63	87	166	5		2023-11-09 12:29:57.448-08	2023-11-09 14:29:57.198-08	2023-11-09 15:00:03.618076-08	2023-11-09 15:00:03.618076-08
64	82	158	3		2023-11-09 13:24:57.448-08	2023-11-09 15:24:57.198-08	2023-11-09 15:00:03.618355-08	2023-11-09 15:00:03.618355-08
65	83	158	5		2023-11-09 13:04:57.448-08	2023-11-09 15:04:57.198-08	2023-11-09 15:00:03.618608-08	2023-11-09 15:00:03.618608-08
66	84	161	5		2023-11-09 12:44:57.448-08	2023-11-09 14:44:57.198-08	2023-11-09 15:00:03.618882-08	2023-11-09 15:00:03.618882-08
67	69	140	2		2023-11-09 16:57:35.950086-08	2023-11-09 17:09:35.950086-08	2023-11-09 17:14:41.405138-08	2023-11-09 17:14:41.405138-08
68	69	\N	\N		2023-11-09 18:15:55.569643-08	2023-11-09 18:27:55.569643-08	2023-11-09 18:32:58.52167-08	2023-11-09 18:32:58.52167-08
69	69	\N	\N		2023-11-09 18:18:16.333436-08	2023-11-09 18:30:16.333436-08	2023-11-09 18:35:18.923096-08	2023-11-09 18:35:18.923096-08
70	69	140	1		2023-11-09 18:39:09.404884-08	2023-11-09 18:51:09.404884-08	2023-11-09 18:56:13.379828-08	2023-11-09 18:56:13.379828-08
71	69	140	2		2023-11-09 18:40:44.433397-08	2023-11-09 18:52:44.433397-08	2023-11-09 18:57:48.628168-08	2023-11-09 18:57:48.628168-08
72	69	\N	\N		2023-11-09 18:48:09.463329-08	2023-11-09 19:00:09.463329-08	2023-11-09 19:05:11.555205-08	2023-11-09 19:05:11.555205-08
73	69	\N	\N		2023-11-09 19:57:55.295944-08	2023-11-09 20:09:55.295944-08	2023-11-09 20:14:58.67043-08	2023-11-09 20:14:58.67043-08
74	88	\N	4		2023-11-09 23:03:16.976899-08	2023-11-09 23:15:16.976899-08	2023-11-09 23:20:24.364301-08	2023-11-09 23:20:24.364301-08
75	92	\N	4		2023-11-10 04:32:00.52522-08	2023-11-10 04:44:00.52522-08	2023-11-10 04:49:02.786227-08	2023-11-10 04:49:02.786227-08
76	92	\N	4		2023-11-10 04:33:50.753401-08	2023-11-10 04:45:50.753401-08	2023-11-10 04:50:52.163537-08	2023-11-10 04:50:52.163537-08
77	92	\N	4		2023-11-10 04:35:28.079663-08	2023-11-10 04:47:28.079663-08	2023-11-10 04:52:30.080114-08	2023-11-10 04:52:30.080114-08
78	94	\N	\N		2023-11-10 06:31:15.97092-08	2023-11-10 06:43:15.97092-08	2023-11-10 06:48:17.003965-08	2023-11-10 06:48:17.003965-08
79	94	\N	5		2023-11-10 06:33:15.971856-08	2023-11-10 06:45:15.971856-08	2023-11-10 06:50:17.143112-08	2023-11-10 06:50:17.143112-08
80	94	135	2		2023-11-10 06:35:15.933885-08	2023-11-10 06:47:15.933885-08	2023-11-10 06:52:18.949037-08	2023-11-10 06:52:18.949037-08
81	94	\N	\N		2023-11-10 06:36:15.962605-08	2023-11-10 06:48:15.962605-08	2023-11-10 06:53:16.737552-08	2023-11-10 06:53:16.737552-08
82	94	135	2		2023-11-10 06:38:15.951596-08	2023-11-10 06:50:15.951596-08	2023-11-10 06:55:17.520255-08	2023-11-10 06:55:17.520255-08
83	94	135	2		2023-11-10 06:40:15.930315-08	2023-11-10 06:52:15.930315-08	2023-11-10 06:57:19.291245-08	2023-11-10 06:57:19.291245-08
84	94	135	2		2023-11-10 06:41:15.954786-08	2023-11-10 06:53:15.954786-08	2023-11-10 06:58:19.900042-08	2023-11-10 06:58:19.900042-08
85	94	135	2		2023-11-10 06:43:16.033811-08	2023-11-10 06:55:16.033811-08	2023-11-10 07:00:31.209035-08	2023-11-10 07:00:31.209035-08
86	94	\N	\N		2023-11-10 06:44:16.042195-08	2023-11-10 06:56:16.042195-08	2023-11-10 07:01:33.564898-08	2023-11-10 07:01:33.564898-08
87	94	\N	\N		2023-11-10 06:45:16.064814-08	2023-11-10 06:57:16.064814-08	2023-11-10 07:03:00.248171-08	2023-11-10 07:03:00.248171-08
88	94	135	2		2023-11-10 06:47:16.032916-08	2023-11-10 06:59:16.032916-08	2023-11-10 07:04:37.527933-08	2023-11-10 07:04:37.527933-08
89	94	140	3		2023-11-10 06:48:16.070226-08	2023-11-10 07:00:16.070226-08	2023-11-10 07:05:36.179146-08	2023-11-10 07:05:36.179146-08
90	95	140	3		2023-11-10 07:51:48.301532-08	2023-11-10 08:03:48.301532-08	2023-11-10 08:08:50.853864-08	2023-11-10 08:08:50.853864-08
91	95	135	3		2023-11-10 07:53:48.275359-08	2023-11-10 08:05:48.275359-08	2023-11-10 08:10:52.530439-08	2023-11-10 08:10:52.530439-08
92	95	135	2		2023-11-10 07:54:48.277437-08	2023-11-10 08:06:48.277437-08	2023-11-10 08:11:53.591859-08	2023-11-10 08:11:53.591859-08
93	95	135	2		2023-11-10 07:55:48.287229-08	2023-11-10 08:07:48.287229-08	2023-11-10 08:12:53.73538-08	2023-11-10 08:12:53.73538-08
94	95	135	5		2023-11-10 07:56:48.63625-08	2023-11-10 08:08:48.63625-08	2023-11-10 08:13:50.094654-08	2023-11-10 08:13:50.094654-08
95	95	135	4		2023-11-10 07:57:48.697246-08	2023-11-10 08:09:48.697246-08	2023-11-10 08:14:51.057748-08	2023-11-10 08:14:51.057748-08
96	95	135	5		2023-11-10 07:59:48.401051-08	2023-11-10 08:11:48.401051-08	2023-11-10 08:16:50.14677-08	2023-11-10 08:16:50.14677-08
97	95	135	5		2023-11-10 08:00:48.771349-08	2023-11-10 08:12:48.771349-08	2023-11-10 08:17:51.96714-08	2023-11-10 08:17:51.96714-08
98	95	135	5		2023-11-10 08:02:48.399903-08	2023-11-10 08:14:48.399903-08	2023-11-10 08:19:49.379556-08	2023-11-10 08:19:49.379556-08
99	96	155	2		2023-11-12 16:42:01.03076-08	2023-11-12 16:54:01.03076-08	2023-11-12 16:59:07.08379-08	2023-11-12 16:59:07.08379-08
100	96	155	3		2023-11-12 16:43:01.032757-08	2023-11-12 16:55:01.032757-08	2023-11-12 17:00:04.557266-08	2023-11-12 17:00:04.557266-08
101	96	155	3		2023-11-12 16:44:01.034881-08	2023-11-12 16:56:01.034881-08	2023-11-12 17:01:04.992271-08	2023-11-12 17:01:04.992271-08
102	96	155	2		2023-11-12 16:45:01.118125-08	2023-11-12 16:57:01.118125-08	2023-11-12 17:02:05.700529-08	2023-11-12 17:02:05.700529-08
103	96	150	2		2023-11-12 16:47:01.078114-08	2023-11-12 16:59:01.078114-08	2023-11-12 17:04:03.523966-08	2023-11-12 17:04:03.523966-08
104	96	150	2		2023-11-12 16:48:01.249139-08	2023-11-12 17:00:01.249139-08	2023-11-12 17:05:04.142441-08	2023-11-12 17:05:04.142441-08
105	96	155	2		2023-11-12 16:50:01.018943-08	2023-11-12 17:02:01.018943-08	2023-11-12 17:07:03.391578-08	2023-11-12 17:07:03.391578-08
106	96	155	2		2023-11-12 16:51:01.078295-08	2023-11-12 17:03:01.078295-08	2023-11-12 17:08:07.670325-08	2023-11-12 17:08:07.670325-08
107	96	160	2		2023-11-12 16:53:01.096365-08	2023-11-12 17:05:01.096365-08	2023-11-12 17:10:07.229238-08	2023-11-12 17:10:07.229238-08
108	96	155	2		2023-11-12 16:55:01.139603-08	2023-11-12 17:07:01.139603-08	2023-11-12 17:12:10.989857-08	2023-11-12 17:12:10.989857-08
109	96	\N	3		2023-11-12 16:56:01.208684-08	2023-11-12 17:08:01.208684-08	2023-11-12 17:13:10.521864-08	2023-11-12 17:13:10.521864-08
110	96	155	3		2023-11-12 16:58:01.094951-08	2023-11-12 17:10:01.094951-08	2023-11-12 17:15:12.584068-08	2023-11-12 17:15:12.584068-08
111	96	160	3		2023-11-12 16:59:01.095951-08	2023-11-12 17:11:01.095951-08	2023-11-12 17:16:05.748544-08	2023-11-12 17:16:05.748544-08
112	96	160	3		2023-11-12 17:00:01.199509-08	2023-11-12 17:12:01.199509-08	2023-11-12 17:17:07.966047-08	2023-11-12 17:17:07.966047-08
113	97	\N	\N		2023-11-12 17:18:01.111039-08	2023-11-12 17:30:01.111039-08	2023-11-12 17:35:04.797307-08	2023-11-12 17:35:04.797307-08
114	97	\N	\N		2023-11-12 17:19:01.137291-08	2023-11-12 17:31:01.137291-08	2023-11-12 17:36:04.29855-08	2023-11-12 17:36:04.29855-08
115	97	\N	\N		2023-11-12 17:21:01.198884-08	2023-11-12 17:33:01.198884-08	2023-11-12 17:38:04.991326-08	2023-11-12 17:38:04.991326-08
116	97	\N	\N		2023-11-12 17:23:01.120299-08	2023-11-12 17:35:01.120299-08	2023-11-12 17:40:06.164567-08	2023-11-12 17:40:06.164567-08
117	97	\N	\N		2023-11-12 17:25:01.266959-08	2023-11-12 17:37:01.266959-08	2023-11-12 17:42:12.358718-08	2023-11-12 17:42:12.358718-08
118	97	\N	\N		2023-11-12 17:27:01.230349-08	2023-11-12 17:39:01.230349-08	2023-11-12 17:44:11.468439-08	2023-11-12 17:44:11.468439-08
119	97	\N	\N		2023-11-12 17:28:01.267204-08	2023-11-12 17:40:01.267204-08	2023-11-12 17:45:13.51136-08	2023-11-12 17:45:13.51136-08
120	97	155	2		2023-11-12 17:30:01.153928-08	2023-11-12 17:42:01.153928-08	2023-11-12 17:47:09.945302-08	2023-11-12 17:47:09.945302-08
121	98	130	2		2023-11-12 17:45:01.128634-08	2023-11-12 17:57:01.128634-08	2023-11-12 18:02:02.758614-08	2023-11-12 18:02:02.758614-08
122	98	130	2		2023-11-12 17:46:01.217251-08	2023-11-12 17:58:01.217251-08	2023-11-12 18:03:03.192243-08	2023-11-12 18:03:03.192243-08
123	98	130	2		2023-11-12 17:47:01.243391-08	2023-11-12 17:59:01.243391-08	2023-11-12 18:04:06.362794-08	2023-11-12 18:04:06.362794-08
124	98	140	2		2023-11-12 17:48:01.244955-08	2023-11-12 18:00:01.244955-08	2023-11-12 18:05:04.447766-08	2023-11-12 18:05:04.447766-08
125	98	140	2		2023-11-12 17:50:01.216318-08	2023-11-12 18:02:01.216318-08	2023-11-12 18:07:16.181643-08	2023-11-12 18:07:16.181643-08
126	98	140	2		2023-11-12 17:52:01.306515-08	2023-11-12 18:04:01.306515-08	2023-11-12 18:09:07.788979-08	2023-11-12 18:09:07.788979-08
127	98	135	2		2023-11-12 17:54:01.202486-08	2023-11-12 18:06:01.202486-08	2023-11-12 18:11:07.141117-08	2023-11-12 18:11:07.141117-08
128	98	135	2		2023-11-12 17:55:01.276039-08	2023-11-12 18:07:01.276039-08	2023-11-12 18:12:04.61557-08	2023-11-12 18:12:04.61557-08
129	98	135	2		2023-11-12 17:57:01.147724-08	2023-11-12 18:09:01.147724-08	2023-11-12 18:14:03.904627-08	2023-11-12 18:14:03.904627-08
130	98	135	2		2023-11-12 17:58:01.42614-08	2023-11-12 18:10:01.42614-08	2023-11-12 18:15:03.239224-08	2023-11-12 18:15:03.239224-08
131	98	\N	\N		2023-11-12 18:00:01.286241-08	2023-11-12 18:12:01.286241-08	2023-11-12 18:17:03.179638-08	2023-11-12 18:17:03.179638-08
132	98	\N	\N		2023-11-12 18:01:01.64659-08	2023-11-12 18:13:01.64659-08	2023-11-12 18:18:04.115035-08	2023-11-12 18:18:04.115035-08
133	98	\N	\N		2023-11-12 18:03:01.267475-08	2023-11-12 18:15:01.267475-08	2023-11-12 18:20:02.952503-08	2023-11-12 18:20:02.952503-08
134	98	\N	\N		2023-11-12 18:04:01.388117-08	2023-11-12 18:16:01.388117-08	2023-11-12 18:21:03.170003-08	2023-11-12 18:21:03.170003-08
135	98	\N	\N		2023-11-12 18:06:01.225435-08	2023-11-12 18:18:01.225435-08	2023-11-12 18:23:03.221978-08	2023-11-12 18:23:03.221978-08
136	98	\N	\N		2023-11-12 18:07:01.244722-08	2023-11-12 18:19:01.244722-08	2023-11-12 18:24:03.819179-08	2023-11-12 18:24:03.819179-08
137	98	\N	\N		2023-11-12 18:09:01.388401-08	2023-11-12 18:21:01.388401-08	2023-11-12 18:26:04.25162-08	2023-11-12 18:26:04.25162-08
138	98	\N	\N		2023-11-12 18:11:01.220607-08	2023-11-12 18:23:01.220607-08	2023-11-12 18:28:03.573111-08	2023-11-12 18:28:03.573111-08
139	98	\N	\N		2023-11-12 18:13:01.223139-08	2023-11-12 18:25:01.223139-08	2023-11-12 18:30:03.832949-08	2023-11-12 18:30:03.832949-08
140	98	\N	\N		2023-11-12 18:14:01.351744-08	2023-11-12 18:26:01.351744-08	2023-11-12 18:31:04.279104-08	2023-11-12 18:31:04.279104-08
141	98	\N	\N		2023-11-12 18:16:01.142183-08	2023-11-12 18:28:01.142183-08	2023-11-12 18:33:03.193642-08	2023-11-12 18:33:03.193642-08
142	98	\N	\N		2023-11-12 18:17:01.203082-08	2023-11-12 18:29:01.203082-08	2023-11-12 18:34:03.123074-08	2023-11-12 18:34:03.123074-08
143	98	\N	\N		2023-11-12 18:19:01.171354-08	2023-11-12 18:31:01.171354-08	2023-11-12 18:36:03.348458-08	2023-11-12 18:36:03.348458-08
144	98	150	2		2023-11-12 18:20:01.272902-08	2023-11-12 18:32:01.272902-08	2023-11-12 18:37:03.235287-08	2023-11-12 18:37:03.235287-08
145	98	150	2		2023-11-12 18:22:01.223771-08	2023-11-12 18:34:01.223771-08	2023-11-12 18:39:03.54293-08	2023-11-12 18:39:03.54293-08
146	98	150	2		2023-11-12 18:24:01.13198-08	2023-11-12 18:36:01.13198-08	2023-11-12 18:41:04.095086-08	2023-11-12 18:41:04.095086-08
147	98	150	2		2023-11-12 18:25:01.165347-08	2023-11-12 18:37:01.165347-08	2023-11-12 18:42:07.486817-08	2023-11-12 18:42:07.486817-08
148	98	145	2		2023-11-12 18:26:01.430043-08	2023-11-12 18:38:01.430043-08	2023-11-12 18:43:04.416025-08	2023-11-12 18:43:04.416025-08
149	98	145	2		2023-11-12 18:28:01.177606-08	2023-11-12 18:40:01.177606-08	2023-11-12 18:45:03.306205-08	2023-11-12 18:45:03.306205-08
150	98	145	3		2023-11-12 18:30:01.224133-08	2023-11-12 18:42:01.224133-08	2023-11-12 18:47:04.782297-08	2023-11-12 18:47:04.782297-08
151	98	145	5		2023-11-12 18:31:01.258805-08	2023-11-12 18:43:01.258805-08	2023-11-12 18:48:04.748521-08	2023-11-12 18:48:04.748521-08
152	98	145	5		2023-11-12 18:33:01.193325-08	2023-11-12 18:45:01.193325-08	2023-11-12 18:50:05.343667-08	2023-11-12 18:50:05.343667-08
153	98	145	5		2023-11-12 18:35:01.169619-08	2023-11-12 18:47:01.169619-08	2023-11-12 18:52:05.066788-08	2023-11-12 18:52:05.066788-08
154	98	145	5		2023-11-12 18:36:01.202141-08	2023-11-12 18:48:01.202141-08	2023-11-12 18:53:06.492032-08	2023-11-12 18:53:06.492032-08
155	98	145	2		2023-11-12 18:37:01.311441-08	2023-11-12 18:49:01.311441-08	2023-11-12 18:54:07.201007-08	2023-11-12 18:54:07.201007-08
156	98	145	2		2023-11-12 18:39:01.230966-08	2023-11-12 18:51:01.230966-08	2023-11-12 18:56:03.829979-08	2023-11-12 18:56:03.829979-08
157	98	145	2		2023-11-12 18:40:01.290909-08	2023-11-12 18:52:01.290909-08	2023-11-12 18:57:03.253874-08	2023-11-12 18:57:03.253874-08
158	98	135	2		2023-11-12 18:42:01.319731-08	2023-11-12 18:54:01.319731-08	2023-11-12 18:59:03.657244-08	2023-11-12 18:59:03.657244-08
159	98	135	2		2023-11-12 18:44:01.111007-08	2023-11-12 18:56:01.111007-08	2023-11-12 19:01:04.561031-08	2023-11-12 19:01:04.561031-08
160	98	135	2		2023-11-12 18:45:01.118422-08	2023-11-12 18:57:01.118422-08	2023-11-12 19:02:02.606038-08	2023-11-12 19:02:02.606038-08
161	98	140	2		2023-11-12 18:46:01.185902-08	2023-11-12 18:58:01.185902-08	2023-11-12 19:03:05.004229-08	2023-11-12 19:03:05.004229-08
162	98	140	2		2023-11-12 18:48:01.20709-08	2023-11-12 19:00:01.20709-08	2023-11-12 19:05:03.828874-08	2023-11-12 19:05:03.828874-08
163	98	135	2		2023-11-12 18:50:01.201098-08	2023-11-12 19:02:01.201098-08	2023-11-12 19:07:04.234753-08	2023-11-12 19:07:04.234753-08
164	98	135	2		2023-11-12 18:51:01.227961-08	2023-11-12 19:03:01.227961-08	2023-11-12 19:08:04.565572-08	2023-11-12 19:08:04.565572-08
165	98	140	2		2023-11-12 18:53:01.287382-08	2023-11-12 19:05:01.287382-08	2023-11-12 19:10:04.692044-08	2023-11-12 19:10:04.692044-08
166	98	140	2		2023-11-12 18:55:01.181456-08	2023-11-12 19:07:01.181456-08	2023-11-12 19:12:06.55055-08	2023-11-12 19:12:06.55055-08
167	98	140	2		2023-11-12 18:56:01.31643-08	2023-11-12 19:08:01.31643-08	2023-11-12 19:13:12.149935-08	2023-11-12 19:13:12.149935-08
168	98	145	2		2023-11-12 18:58:01.174658-08	2023-11-12 19:10:01.174658-08	2023-11-12 19:15:10.363202-08	2023-11-12 19:15:10.363202-08
169	98	145	2		2023-11-12 19:00:01.264693-08	2023-11-12 19:12:01.264693-08	2023-11-12 19:17:09.228694-08	2023-11-12 19:17:09.228694-08
170	98	145	1		2023-11-12 19:02:01.130738-08	2023-11-12 19:14:01.130738-08	2023-11-12 19:19:04.878126-08	2023-11-12 19:19:04.878126-08
171	98	145	1		2023-11-12 19:03:01.2466-08	2023-11-12 19:15:01.2466-08	2023-11-12 19:20:04.786557-08	2023-11-12 19:20:04.786557-08
172	98	150	2		2023-11-12 19:05:01.186549-08	2023-11-12 19:17:01.186549-08	2023-11-12 19:22:03.670535-08	2023-11-12 19:22:03.670535-08
173	98	150	2		2023-11-12 19:07:01.241751-08	2023-11-12 19:19:01.241751-08	2023-11-12 19:24:05.021026-08	2023-11-12 19:24:05.021026-08
174	98	150	2		2023-11-12 19:08:01.344912-08	2023-11-12 19:20:01.344912-08	2023-11-12 19:25:05.388802-08	2023-11-12 19:25:05.388802-08
175	98	140	3		2023-11-12 19:10:01.18277-08	2023-11-12 19:22:01.18277-08	2023-11-12 19:27:04.206948-08	2023-11-12 19:27:04.206948-08
176	98	140	3		2023-11-12 19:11:01.228979-08	2023-11-12 19:23:01.228979-08	2023-11-12 19:28:04.971713-08	2023-11-12 19:28:04.971713-08
177	98	155	3		2023-11-12 19:13:01.164321-08	2023-11-12 19:25:01.164321-08	2023-11-12 19:30:09.264871-08	2023-11-12 19:30:09.264871-08
178	98	155	3		2023-11-12 19:14:01.323875-08	2023-11-12 19:26:01.323875-08	2023-11-12 19:31:04.966854-08	2023-11-12 19:31:04.966854-08
179	98	155	3		2023-11-12 19:16:01.156176-08	2023-11-12 19:28:01.156176-08	2023-11-12 19:33:03.645208-08	2023-11-12 19:33:03.645208-08
180	98	155	3		2023-11-12 19:18:01.090153-08	2023-11-12 19:30:01.090153-08	2023-11-12 19:35:03.529954-08	2023-11-12 19:35:03.529954-08
181	98	155	3		2023-11-12 19:19:01.191494-08	2023-11-12 19:31:01.191494-08	2023-11-12 19:36:03.736121-08	2023-11-12 19:36:03.736121-08
182	98	155	4		2023-11-12 19:21:01.158411-08	2023-11-12 19:33:01.158411-08	2023-11-12 19:38:02.70471-08	2023-11-12 19:38:02.70471-08
183	98	\N	\N		2023-11-12 19:23:01.12554-08	2023-11-12 19:35:01.12554-08	2023-11-12 19:40:03.552244-08	2023-11-12 19:40:03.552244-08
184	98	\N	\N		2023-11-12 19:24:01.162683-08	2023-11-12 19:36:01.162683-08	2023-11-12 19:41:03.588149-08	2023-11-12 19:41:03.588149-08
185	98	140	2		2023-11-12 19:26:01.14341-08	2023-11-12 19:38:01.14341-08	2023-11-12 19:43:04.917332-08	2023-11-12 19:43:04.917332-08
186	98	140	2		2023-11-12 19:27:01.145331-08	2023-11-12 19:39:01.145331-08	2023-11-12 19:44:05.038098-08	2023-11-12 19:44:05.038098-08
187	98	140	2		2023-11-12 19:29:01.188553-08	2023-11-12 19:41:01.188553-08	2023-11-12 19:46:05.087511-08	2023-11-12 19:46:05.087511-08
188	98	140	2		2023-11-12 19:31:01.10637-08	2023-11-12 19:43:01.10637-08	2023-11-12 19:48:04.565876-08	2023-11-12 19:48:04.565876-08
189	98	140	3		2023-11-12 19:32:01.132478-08	2023-11-12 19:44:01.132478-08	2023-11-12 19:49:06.133624-08	2023-11-12 19:49:06.133624-08
190	98	140	3		2023-11-12 19:34:01.153955-08	2023-11-12 19:46:01.153955-08	2023-11-12 19:51:04.300059-08	2023-11-12 19:51:04.300059-08
191	98	140	3		2023-11-12 19:35:01.158945-08	2023-11-12 19:47:01.158945-08	2023-11-12 19:52:04.20404-08	2023-11-12 19:52:04.20404-08
192	98	135	2		2023-11-12 19:37:01.140369-08	2023-11-12 19:49:01.140369-08	2023-11-12 19:54:03.617968-08	2023-11-12 19:54:03.617968-08
193	98	135	2		2023-11-12 19:38:01.16315-08	2023-11-12 19:50:01.16315-08	2023-11-12 19:55:02.561588-08	2023-11-12 19:55:02.561588-08
194	98	130	2		2023-11-12 19:40:01.111784-08	2023-11-12 19:52:01.111784-08	2023-11-12 19:57:02.906435-08	2023-11-12 19:57:02.906435-08
195	98	130	2		2023-11-12 19:41:01.222775-08	2023-11-12 19:53:01.222775-08	2023-11-12 19:58:03.381343-08	2023-11-12 19:58:03.381343-08
196	98	130	2		2023-11-12 19:42:01.336332-08	2023-11-12 19:54:01.336332-08	2023-11-12 19:59:05.023439-08	2023-11-12 19:59:05.023439-08
197	98	140	2		2023-11-12 19:44:01.259184-08	2023-11-12 19:56:01.259184-08	2023-11-12 20:01:07.424247-08	2023-11-12 20:01:07.424247-08
198	98	140	1		2023-11-12 19:46:01.139372-08	2023-11-12 19:58:01.139372-08	2023-11-12 20:03:09.035571-08	2023-11-12 20:03:09.035571-08
199	98	140	2		2023-11-12 19:47:01.211381-08	2023-11-12 19:59:01.211381-08	2023-11-12 20:04:08.36143-08	2023-11-12 20:04:08.36143-08
200	98	140	2		2023-11-12 19:49:01.21742-08	2023-11-12 20:01:01.21742-08	2023-11-12 20:06:08.031497-08	2023-11-12 20:06:08.031497-08
201	98	140	2		2023-11-12 19:51:01.194294-08	2023-11-12 20:03:01.194294-08	2023-11-12 20:08:07.078246-08	2023-11-12 20:08:07.078246-08
202	98	140	1		2023-11-12 19:52:01.260321-08	2023-11-12 20:04:01.260321-08	2023-11-12 20:09:06.029019-08	2023-11-12 20:09:06.029019-08
203	98	\N	\N		2023-11-12 19:54:01.160612-08	2023-11-12 20:06:01.160612-08	2023-11-12 20:11:04.517696-08	2023-11-12 20:11:04.517696-08
204	98	\N	\N		2023-11-12 19:55:01.209692-08	2023-11-12 20:07:01.209692-08	2023-11-12 20:12:05.501451-08	2023-11-12 20:12:05.501451-08
205	98	\N	\N		2023-11-12 19:56:01.24863-08	2023-11-12 20:08:01.24863-08	2023-11-12 20:13:06.753997-08	2023-11-12 20:13:06.753997-08
206	98	145	2		2023-11-12 19:58:01.160922-08	2023-11-12 20:10:01.160922-08	2023-11-12 20:15:09.182493-08	2023-11-12 20:15:09.182493-08
207	98	145	2		2023-11-12 19:59:01.182509-08	2023-11-12 20:11:01.182509-08	2023-11-12 20:16:04.955929-08	2023-11-12 20:16:04.955929-08
208	98	140	2		2023-11-12 20:00:01.341082-08	2023-11-12 20:12:01.341082-08	2023-11-12 20:17:04.18387-08	2023-11-12 20:17:04.18387-08
209	98	140	2		2023-11-12 20:02:01.13798-08	2023-11-12 20:14:01.13798-08	2023-11-12 20:19:07.010011-08	2023-11-12 20:19:07.010011-08
210	98	140	2		2023-11-12 20:03:01.170399-08	2023-11-12 20:15:01.170399-08	2023-11-12 20:20:07.672224-08	2023-11-12 20:20:07.672224-08
211	98	140	2		2023-11-12 20:05:01.472165-08	2023-11-12 20:17:01.472165-08	2023-11-12 20:22:08.29337-08	2023-11-12 20:22:08.29337-08
212	98	140	2		2023-11-12 20:06:01.493641-08	2023-11-12 20:18:01.493641-08	2023-11-12 20:23:08.015379-08	2023-11-12 20:23:08.015379-08
213	98	\N	\N		2023-11-12 20:08:01.41918-08	2023-11-12 20:20:01.41918-08	2023-11-12 20:25:07.305864-08	2023-11-12 20:25:07.305864-08
214	98	\N	\N		2023-11-12 20:10:01.389604-08	2023-11-12 20:22:01.389604-08	2023-11-12 20:27:05.402573-08	2023-11-12 20:27:05.402573-08
215	98	\N	\N		2023-11-12 20:12:01.135052-08	2023-11-12 20:24:01.135052-08	2023-11-12 20:29:02.180821-08	2023-11-12 20:29:02.180821-08
216	98	\N	\N		2023-11-12 20:13:01.146609-08	2023-11-12 20:25:01.146609-08	2023-11-12 20:30:01.785066-08	2023-11-12 20:30:01.785066-08
217	98	\N	\N		2023-11-12 20:14:01.183149-08	2023-11-12 20:26:01.183149-08	2023-11-12 20:31:01.70172-08	2023-11-12 20:31:01.70172-08
218	98	\N	\N		2023-11-12 20:16:01.162864-08	2023-11-12 20:28:01.162864-08	2023-11-12 20:33:01.697967-08	2023-11-12 20:33:01.697967-08
219	98	\N	\N		2023-11-12 20:18:01.210705-08	2023-11-12 20:30:01.210705-08	2023-11-12 20:35:02.054392-08	2023-11-12 20:35:02.054392-08
220	98	\N	\N		2023-11-12 20:20:01.311818-08	2023-11-12 20:32:01.311818-08	2023-11-12 20:37:02.926768-08	2023-11-12 20:37:02.926768-08
221	98	135	2		2023-11-12 20:22:01.260719-08	2023-11-12 20:34:01.260719-08	2023-11-12 20:39:03.663466-08	2023-11-12 20:39:03.663466-08
222	98	135	2		2023-11-12 20:24:01.161129-08	2023-11-12 20:36:01.161129-08	2023-11-12 20:41:03.804762-08	2023-11-12 20:41:03.804762-08
223	98	135	2		2023-11-12 20:25:01.279667-08	2023-11-12 20:37:01.279667-08	2023-11-12 20:42:03.704856-08	2023-11-12 20:42:03.704856-08
224	98	140	2		2023-11-12 20:27:01.178003-08	2023-11-12 20:39:01.178003-08	2023-11-12 20:44:03.851186-08	2023-11-12 20:44:03.851186-08
225	98	135	2		2023-11-12 20:29:01.120101-08	2023-11-12 20:41:01.120101-08	2023-11-12 20:46:03.366929-08	2023-11-12 20:46:03.366929-08
226	98	135	2		2023-11-12 20:30:01.131406-08	2023-11-12 20:42:01.131406-08	2023-11-12 20:47:03.190353-08	2023-11-12 20:47:03.190353-08
227	98	135	2		2023-11-12 20:31:01.137489-08	2023-11-12 20:43:01.137489-08	2023-11-12 20:48:02.903567-08	2023-11-12 20:48:02.903567-08
228	98	140	2		2023-11-12 20:32:01.148768-08	2023-11-12 20:44:01.148768-08	2023-11-12 20:49:02.898359-08	2023-11-12 20:49:02.898359-08
229	98	140	2		2023-11-12 20:33:01.162225-08	2023-11-12 20:45:01.162225-08	2023-11-12 20:50:04.025876-08	2023-11-12 20:50:04.025876-08
230	98	135	2		2023-11-12 20:35:01.133254-08	2023-11-12 20:47:01.133254-08	2023-11-12 20:52:03.377374-08	2023-11-12 20:52:03.377374-08
231	98	135	3		2023-11-12 20:37:01.144043-08	2023-11-12 20:49:01.144043-08	2023-11-12 20:54:03.086835-08	2023-11-12 20:54:03.086835-08
232	98	135	3		2023-11-12 20:38:01.169515-08	2023-11-12 20:50:01.169515-08	2023-11-12 20:55:03.553429-08	2023-11-12 20:55:03.553429-08
233	98	135	3		2023-11-12 20:40:01.121597-08	2023-11-12 20:52:01.121597-08	2023-11-12 20:57:06.557854-08	2023-11-12 20:57:06.557854-08
234	98	135	3		2023-11-12 20:41:01.121755-08	2023-11-12 20:53:01.121755-08	2023-11-12 20:58:06.224786-08	2023-11-12 20:58:06.224786-08
235	98	135	3		2023-11-12 20:42:01.162826-08	2023-11-12 20:54:01.162826-08	2023-11-12 20:59:08.740534-08	2023-11-12 20:59:08.740534-08
236	98	135	3		2023-11-12 20:44:01.155912-08	2023-11-12 20:56:01.155912-08	2023-11-12 21:01:08.37201-08	2023-11-12 21:01:08.37201-08
237	98	135	2		2023-11-12 20:46:01.138962-08	2023-11-12 20:58:01.138962-08	2023-11-12 21:03:06.166758-08	2023-11-12 21:03:06.166758-08
238	98	135	2		2023-11-12 20:48:01.155409-08	2023-11-12 21:00:01.155409-08	2023-11-12 21:05:05.076778-08	2023-11-12 21:05:05.076778-08
239	98	135	2		2023-11-12 20:50:01.174044-08	2023-11-12 21:02:01.174044-08	2023-11-12 21:07:03.955383-08	2023-11-12 21:07:03.955383-08
240	98	125	3		2023-11-12 20:52:01.185757-08	2023-11-12 21:04:01.185757-08	2023-11-12 21:09:04.358931-08	2023-11-12 21:09:04.358931-08
241	98	125	3		2023-11-12 20:54:01.111555-08	2023-11-12 21:06:01.111555-08	2023-11-12 21:11:05.407311-08	2023-11-12 21:11:05.407311-08
242	98	125	2		2023-11-12 20:55:01.16771-08	2023-11-12 21:07:01.16771-08	2023-11-12 21:12:05.789569-08	2023-11-12 21:12:05.789569-08
243	98	\N	\N		2023-11-12 22:57:54.717693-08	2023-11-12 23:09:54.717693-08	2023-11-12 23:14:59.086431-08	2023-11-12 23:14:59.086431-08
244	98	\N	\N		2023-11-12 22:58:54.795105-08	2023-11-12 23:10:54.795105-08	2023-11-12 23:16:01.368526-08	2023-11-12 23:16:01.368526-08
245	98	\N	\N		2023-11-12 23:00:54.696535-08	2023-11-12 23:12:54.696535-08	2023-11-12 23:17:58.42611-08	2023-11-12 23:17:58.42611-08
246	98	\N	\N		2023-11-12 23:01:54.786868-08	2023-11-12 23:13:54.786868-08	2023-11-12 23:18:58.025831-08	2023-11-12 23:18:58.025831-08
247	98	\N	\N		2023-11-12 23:02:54.787547-08	2023-11-12 23:14:54.787547-08	2023-11-12 23:19:57.766967-08	2023-11-12 23:19:57.766967-08
248	98	\N	\N		2023-11-12 23:04:54.797088-08	2023-11-12 23:16:54.797088-08	2023-11-12 23:21:58.721221-08	2023-11-12 23:21:58.721221-08
249	98	\N	\N		2023-11-12 23:05:54.82483-08	2023-11-12 23:17:54.82483-08	2023-11-12 23:22:57.076999-08	2023-11-12 23:22:57.076999-08
250	98	\N	\N		2023-11-12 23:07:54.723357-08	2023-11-12 23:19:54.723357-08	2023-11-12 23:24:57.107731-08	2023-11-12 23:24:57.107731-08
251	98	\N	\N		2023-11-12 23:09:54.782948-08	2023-11-12 23:21:54.782948-08	2023-11-12 23:26:57.526103-08	2023-11-12 23:26:57.526103-08
252	98	140	1		2023-11-12 23:11:54.72196-08	2023-11-12 23:23:54.72196-08	2023-11-12 23:28:57.178064-08	2023-11-12 23:28:57.178064-08
253	98	140	1		2023-11-12 23:12:54.743984-08	2023-11-12 23:24:54.743984-08	2023-11-12 23:29:57.670661-08	2023-11-12 23:29:57.670661-08
254	98	140	1		2023-11-12 23:14:54.739407-08	2023-11-12 23:26:54.739407-08	2023-11-12 23:31:58.932549-08	2023-11-12 23:31:58.932549-08
255	98	140	1		2023-11-12 23:15:54.761572-08	2023-11-12 23:27:54.761572-08	2023-11-12 23:32:59.415628-08	2023-11-12 23:32:59.415628-08
256	98	140	1		2023-11-12 23:16:56.411246-08	2023-11-12 23:28:56.411246-08	2023-11-12 23:34:00.850389-08	2023-11-12 23:34:00.850389-08
257	98	140	1		2023-11-12 23:17:56.485409-08	2023-11-12 23:29:56.485409-08	2023-11-12 23:35:01.034625-08	2023-11-12 23:35:01.034625-08
258	98	140	1		2023-11-12 23:19:56.364885-08	2023-11-12 23:31:56.364885-08	2023-11-12 23:37:00.713586-08	2023-11-12 23:37:00.713586-08
259	98	135	2		2023-11-12 23:21:56.487619-08	2023-11-12 23:33:56.487619-08	2023-11-12 23:39:00.300743-08	2023-11-12 23:39:00.300743-08
260	98	\N	\N		2023-11-12 23:23:56.338581-08	2023-11-12 23:35:56.338581-08	2023-11-12 23:41:00.176928-08	2023-11-12 23:41:00.176928-08
261	98	135	2		2023-11-12 23:24:56.352629-08	2023-11-12 23:36:56.352629-08	2023-11-12 23:41:59.613562-08	2023-11-12 23:41:59.613562-08
262	98	\N	\N		2023-11-12 23:25:56.361858-08	2023-11-12 23:37:56.361858-08	2023-11-12 23:43:02.062058-08	2023-11-12 23:43:02.062058-08
263	98	140	2		2023-11-12 23:26:56.363467-08	2023-11-12 23:38:56.363467-08	2023-11-12 23:44:00.134618-08	2023-11-12 23:44:00.134618-08
264	98	135	2		2023-11-12 23:27:56.380609-08	2023-11-12 23:39:56.380609-08	2023-11-12 23:45:00.914825-08	2023-11-12 23:45:00.914825-08
265	98	145	2		2023-11-12 23:28:56.47266-08	2023-11-12 23:40:56.47266-08	2023-11-12 23:45:59.125977-08	2023-11-12 23:45:59.125977-08
266	98	145	2		2023-11-12 23:30:56.347437-08	2023-11-12 23:42:56.347437-08	2023-11-12 23:47:59.728797-08	2023-11-12 23:47:59.728797-08
267	98	145	2		2023-11-12 23:31:56.377069-08	2023-11-12 23:43:56.377069-08	2023-11-12 23:49:02.573193-08	2023-11-12 23:49:02.573193-08
268	98	145	3		2023-11-12 23:33:56.370814-08	2023-11-12 23:45:56.370814-08	2023-11-12 23:51:03.8502-08	2023-11-12 23:51:03.8502-08
269	98	145	3		2023-11-12 23:34:56.498625-08	2023-11-12 23:46:56.498625-08	2023-11-12 23:52:03.328449-08	2023-11-12 23:52:03.328449-08
270	98	145	3		2023-11-12 23:36:56.37238-08	2023-11-12 23:48:56.37238-08	2023-11-12 23:54:04.556766-08	2023-11-12 23:54:04.556766-08
271	98	\N	3		2023-11-12 23:38:56.311434-08	2023-11-12 23:50:56.311434-08	2023-11-12 23:56:02.059215-08	2023-11-12 23:56:02.059215-08
272	98	\N	\N		2023-11-12 23:39:56.357622-08	2023-11-12 23:51:56.357622-08	2023-11-12 23:57:00.442082-08	2023-11-12 23:57:00.442082-08
273	98	150	2		2023-11-12 23:41:56.386881-08	2023-11-12 23:53:56.386881-08	2023-11-12 23:58:59.097617-08	2023-11-12 23:58:59.097617-08
274	98	150	2		2023-11-12 23:42:56.46017-08	2023-11-12 23:54:56.46017-08	2023-11-12 23:59:59.215462-08	2023-11-12 23:59:59.215462-08
275	98	150	2		2023-11-12 23:44:56.344298-08	2023-11-12 23:56:56.344298-08	2023-11-13 00:01:59.541538-08	2023-11-13 00:01:59.541538-08
276	98	150	2		2023-11-12 23:45:56.361592-08	2023-11-12 23:57:56.361592-08	2023-11-13 00:02:58.92518-08	2023-11-13 00:02:58.92518-08
277	98	150	2		2023-11-12 23:46:56.399636-08	2023-11-12 23:58:56.399636-08	2023-11-13 00:03:58.851355-08	2023-11-13 00:03:58.851355-08
278	98	150	2		2023-11-12 23:48:56.382192-08	2023-11-13 00:00:56.382192-08	2023-11-13 00:05:59.203587-08	2023-11-13 00:05:59.203587-08
279	98	\N	\N		2023-11-12 23:50:56.463768-08	2023-11-13 00:02:56.463768-08	2023-11-13 00:07:59.795561-08	2023-11-13 00:07:59.795561-08
280	98	\N	\N		2023-11-12 23:52:56.370782-08	2023-11-13 00:04:56.370782-08	2023-11-13 00:09:59.320992-08	2023-11-13 00:09:59.320992-08
281	98	\N	\N		2023-11-12 23:53:56.372882-08	2023-11-13 00:05:56.372882-08	2023-11-13 00:10:59.296237-08	2023-11-13 00:10:59.296237-08
282	98	\N	\N		2023-11-12 23:54:56.405716-08	2023-11-13 00:06:56.405716-08	2023-11-13 00:11:58.876616-08	2023-11-13 00:11:58.876616-08
283	98	\N	\N		2023-11-12 23:56:56.344513-08	2023-11-13 00:08:56.344513-08	2023-11-13 00:13:58.521137-08	2023-11-13 00:13:58.521137-08
284	98	\N	\N		2023-11-12 23:58:56.384566-08	2023-11-13 00:10:56.384566-08	2023-11-13 00:15:58.356481-08	2023-11-13 00:15:58.356481-08
285	98	140	2		2023-11-12 23:59:56.594561-08	2023-11-13 00:11:56.594561-08	2023-11-13 00:16:58.703092-08	2023-11-13 00:16:58.703092-08
286	98	\N	\N		2023-11-13 00:01:56.419173-08	2023-11-13 00:13:56.419173-08	2023-11-13 00:18:58.539951-08	2023-11-13 00:18:58.539951-08
287	98	\N	\N		2023-11-13 00:02:56.62778-08	2023-11-13 00:14:56.62778-08	2023-11-13 00:19:59.151862-08	2023-11-13 00:19:59.151862-08
288	98	140	2		2023-11-13 00:04:56.454491-08	2023-11-13 00:16:56.454491-08	2023-11-13 00:21:59.130985-08	2023-11-13 00:21:59.130985-08
289	98	140	2		2023-11-13 00:06:56.400588-08	2023-11-13 00:18:56.400588-08	2023-11-13 00:23:59.016539-08	2023-11-13 00:23:59.016539-08
290	98	\N	\N		2023-11-13 00:08:56.371452-08	2023-11-13 00:20:56.371452-08	2023-11-13 00:25:58.958413-08	2023-11-13 00:25:58.958413-08
291	98	\N	\N		2023-11-13 00:10:56.407196-08	2023-11-13 00:22:56.407196-08	2023-11-13 00:27:59.08386-08	2023-11-13 00:27:59.08386-08
292	98	135	2		2023-11-13 00:12:56.390669-08	2023-11-13 00:24:56.390669-08	2023-11-13 00:29:58.624911-08	2023-11-13 00:29:58.624911-08
293	98	140	2		2023-11-13 00:13:56.469199-08	2023-11-13 00:25:56.469199-08	2023-11-13 00:30:58.764131-08	2023-11-13 00:30:58.764131-08
294	98	140	1		2023-11-13 00:15:56.417036-08	2023-11-13 00:27:56.417036-08	2023-11-13 00:33:00.503635-08	2023-11-13 00:33:00.503635-08
295	98	140	1		2023-11-13 00:17:56.409599-08	2023-11-13 00:29:56.409599-08	2023-11-13 00:35:03.4986-08	2023-11-13 00:35:03.4986-08
296	98	135	2		2023-11-13 00:19:56.35367-08	2023-11-13 00:31:56.35367-08	2023-11-13 00:37:02.435758-08	2023-11-13 00:37:02.435758-08
297	98	\N	\N		2023-11-13 00:20:56.3642-08	2023-11-13 00:32:56.3642-08	2023-11-13 00:38:03.508541-08	2023-11-13 00:38:03.508541-08
298	98	135	2		2023-11-13 00:21:56.385222-08	2023-11-13 00:33:56.385222-08	2023-11-13 00:39:02.88734-08	2023-11-13 00:39:02.88734-08
299	98	\N	\N		2023-11-13 00:22:56.419451-08	2023-11-13 00:34:56.419451-08	2023-11-13 00:40:02.252778-08	2023-11-13 00:40:02.252778-08
300	98	\N	\N		2023-11-13 00:23:56.427823-08	2023-11-13 00:35:56.427823-08	2023-11-13 00:41:01.372793-08	2023-11-13 00:41:01.372793-08
301	98	\N	\N		2023-11-13 00:24:56.545582-08	2023-11-13 00:36:56.545582-08	2023-11-13 00:42:00.600344-08	2023-11-13 00:42:00.600344-08
302	98	\N	\N		2023-11-13 00:25:56.669569-08	2023-11-13 00:37:56.669569-08	2023-11-13 00:42:59.676429-08	2023-11-13 00:42:59.676429-08
303	98	\N	\N		2023-11-13 00:27:56.403665-08	2023-11-13 00:39:56.403665-08	2023-11-13 00:44:58.490683-08	2023-11-13 00:44:58.490683-08
304	98	\N	\N		2023-11-13 00:29:56.365047-08	2023-11-13 00:41:56.365047-08	2023-11-13 00:46:58.337634-08	2023-11-13 00:46:58.337634-08
305	98	\N	\N		2023-11-13 00:31:56.306839-08	2023-11-13 00:43:56.306839-08	2023-11-13 00:49:04.408602-08	2023-11-13 00:49:04.408602-08
306	98	\N	\N		2023-11-13 00:32:56.380923-08	2023-11-13 00:44:56.380923-08	2023-11-13 00:50:02.877319-08	2023-11-13 00:50:02.877319-08
307	98	\N	\N		2023-11-13 00:34:56.345117-08	2023-11-13 00:46:56.345117-08	2023-11-13 00:51:59.16619-08	2023-11-13 00:51:59.16619-08
308	98	\N	\N		2023-11-13 00:35:56.410218-08	2023-11-13 00:47:56.410218-08	2023-11-13 00:52:59.029977-08	2023-11-13 00:52:59.029977-08
309	98	\N	\N		2023-11-13 00:37:56.316923-08	2023-11-13 00:49:56.316923-08	2023-11-13 00:54:58.206263-08	2023-11-13 00:54:58.206263-08
310	98	\N	\N		2023-11-13 00:38:56.350439-08	2023-11-13 00:50:56.350439-08	2023-11-13 00:55:58.719879-08	2023-11-13 00:55:58.719879-08
311	98	125	2		2023-11-13 00:39:56.39132-08	2023-11-13 00:51:56.39132-08	2023-11-13 00:56:58.267812-08	2023-11-13 00:56:58.267812-08
312	98	125	2		2023-11-13 00:41:56.404366-08	2023-11-13 00:53:56.404366-08	2023-11-13 00:59:00.112469-08	2023-11-13 00:59:00.112469-08
313	98	125	2		2023-11-13 00:43:56.316908-08	2023-11-13 00:55:56.316908-08	2023-11-13 01:00:59.306976-08	2023-11-13 01:00:59.306976-08
314	98	125	2		2023-11-13 00:44:56.381918-08	2023-11-13 00:56:56.381918-08	2023-11-13 01:02:04.732702-08	2023-11-13 01:02:04.732702-08
315	98	125	2		2023-11-13 00:46:56.344874-08	2023-11-13 00:58:56.344874-08	2023-11-13 01:04:05.020331-08	2023-11-13 01:04:05.020331-08
316	98	125	2		2023-11-13 00:47:56.382192-08	2023-11-13 00:59:56.382192-08	2023-11-13 01:05:05.12631-08	2023-11-13 01:05:05.12631-08
317	98	125	2		2023-11-13 00:49:56.390504-08	2023-11-13 01:01:56.390504-08	2023-11-13 01:07:02.18035-08	2023-11-13 01:07:02.18035-08
318	98	130	2		2023-11-13 00:51:56.362719-08	2023-11-13 01:03:56.362719-08	2023-11-13 01:09:07.670125-08	2023-11-13 01:09:07.670125-08
319	98	130	2		2023-11-13 00:53:56.297643-08	2023-11-13 01:05:56.297643-08	2023-11-13 01:11:35.724686-08	2023-11-13 01:11:35.724686-08
320	98	130	2		2023-11-13 00:54:56.373177-08	2023-11-13 01:06:56.373177-08	2023-11-13 01:12:28.569855-08	2023-11-13 01:12:28.569855-08
321	98	130	2		2023-11-13 00:55:56.392-08	2023-11-13 01:07:56.392-08	2023-11-13 01:13:27.035175-08	2023-11-13 01:13:27.035175-08
322	98	130	2		2023-11-13 00:57:56.330737-08	2023-11-13 01:09:56.330737-08	2023-11-13 01:15:12.31259-08	2023-11-13 01:15:12.31259-08
323	98	\N	\N		2023-11-13 00:58:56.407352-08	2023-11-13 01:10:56.407352-08	2023-11-13 01:16:08.359032-08	2023-11-13 01:16:08.359032-08
324	98	\N	\N		2023-11-13 00:59:56.53222-08	2023-11-13 01:11:56.53222-08	2023-11-13 01:17:05.228356-08	2023-11-13 01:17:05.228356-08
325	98	\N	\N		2023-11-13 01:00:56.875128-08	2023-11-13 01:12:56.875128-08	2023-11-13 01:18:03.638083-08	2023-11-13 01:18:03.638083-08
326	98	125	2		2023-11-13 01:02:56.401827-08	2023-11-13 01:14:56.401827-08	2023-11-13 01:19:59.736599-08	2023-11-13 01:19:59.736599-08
327	98	125	2		2023-11-13 01:03:56.504552-08	2023-11-13 01:15:56.504552-08	2023-11-13 01:20:59.818784-08	2023-11-13 01:20:59.818784-08
328	98	120	2		2023-11-13 01:05:56.365415-08	2023-11-13 01:17:56.365415-08	2023-11-13 01:22:58.456516-08	2023-11-13 01:22:58.456516-08
329	98	120	2		2023-11-13 01:06:56.438708-08	2023-11-13 01:18:56.438708-08	2023-11-13 01:23:58.780204-08	2023-11-13 01:23:58.780204-08
330	98	125	2		2023-11-13 01:08:56.452983-08	2023-11-13 01:20:56.452983-08	2023-11-13 01:25:58.287033-08	2023-11-13 01:25:58.287033-08
331	98	125	2		2023-11-13 01:09:56.458793-08	2023-11-13 01:21:56.458793-08	2023-11-13 01:26:58.180736-08	2023-11-13 01:26:58.180736-08
332	98	125	2		2023-11-13 01:10:56.516838-08	2023-11-13 01:22:56.516838-08	2023-11-13 01:27:58.181135-08	2023-11-13 01:27:58.181135-08
333	98	125	2		2023-11-13 01:12:56.425572-08	2023-11-13 01:24:56.425572-08	2023-11-13 01:29:57.964844-08	2023-11-13 01:29:57.964844-08
334	98	125	1		2023-11-13 01:14:56.583004-08	2023-11-13 01:26:56.583004-08	2023-11-13 01:31:59.385257-08	2023-11-13 01:31:59.385257-08
335	98	125	1		2023-11-13 01:15:56.632101-08	2023-11-13 01:27:56.632101-08	2023-11-13 01:32:59.450015-08	2023-11-13 01:32:59.450015-08
336	98	125	1		2023-11-13 01:16:57.141067-08	2023-11-13 01:28:57.141067-08	2023-11-13 01:34:00.905755-08	2023-11-13 01:34:00.905755-08
337	98	125	2		2023-11-13 01:18:56.417014-08	2023-11-13 01:30:56.417014-08	2023-11-13 01:35:58.325609-08	2023-11-13 01:35:58.325609-08
338	98	125	2		2023-11-13 01:19:56.482283-08	2023-11-13 01:31:56.482283-08	2023-11-13 01:36:58.765674-08	2023-11-13 01:36:58.765674-08
339	98	120	2		2023-11-13 01:20:56.563839-08	2023-11-13 01:32:56.563839-08	2023-11-13 01:37:59.218671-08	2023-11-13 01:37:59.218671-08
340	98	120	2		2023-11-13 01:22:56.419274-08	2023-11-13 01:34:56.419274-08	2023-11-13 01:39:58.582765-08	2023-11-13 01:39:58.582765-08
341	98	120	3		2023-11-13 01:24:56.374509-08	2023-11-13 01:36:56.374509-08	2023-11-13 01:41:58.108121-08	2023-11-13 01:41:58.108121-08
342	98	120	3		2023-11-13 01:25:56.406298-08	2023-11-13 01:37:56.406298-08	2023-11-13 01:42:58.13862-08	2023-11-13 01:42:58.13862-08
343	98	125	3		2023-11-13 01:26:56.470981-08	2023-11-13 01:38:56.470981-08	2023-11-13 01:43:58.341511-08	2023-11-13 01:43:58.341511-08
344	98	130	3		2023-11-13 01:28:56.378096-08	2023-11-13 01:40:56.378096-08	2023-11-13 01:45:57.988913-08	2023-11-13 01:45:57.988913-08
345	98	125	3		2023-11-13 01:29:56.384577-08	2023-11-13 01:41:56.384577-08	2023-11-13 01:46:58.162172-08	2023-11-13 01:46:58.162172-08
346	98	125	1		2023-11-13 01:30:56.466609-08	2023-11-13 01:42:56.466609-08	2023-11-13 01:47:59.758457-08	2023-11-13 01:47:59.758457-08
347	98	120	2		2023-11-13 01:32:56.369126-08	2023-11-13 01:44:56.369126-08	2023-11-13 01:49:59.170304-08	2023-11-13 01:49:59.170304-08
348	98	120	2		2023-11-13 01:33:56.400685-08	2023-11-13 01:45:56.400685-08	2023-11-13 01:51:00.299676-08	2023-11-13 01:51:00.299676-08
349	98	120	1		2023-11-13 01:35:56.430388-08	2023-11-13 01:47:56.430388-08	2023-11-13 01:53:00.842768-08	2023-11-13 01:53:00.842768-08
350	98	125	2		2023-11-13 01:37:56.412652-08	2023-11-13 01:49:56.412652-08	2023-11-13 01:55:01.029816-08	2023-11-13 01:55:01.029816-08
351	98	120	2		2023-11-13 01:39:56.476856-08	2023-11-13 01:51:56.476856-08	2023-11-13 01:56:59.772511-08	2023-11-13 01:56:59.772511-08
352	98	120	2		2023-11-13 01:41:56.369489-08	2023-11-13 01:53:56.369489-08	2023-11-13 01:59:03.462819-08	2023-11-13 01:59:03.462819-08
353	98	120	3		2023-11-13 01:42:56.413585-08	2023-11-13 01:54:56.413585-08	2023-11-13 01:59:58.973454-08	2023-11-13 01:59:58.973454-08
354	98	120	3		2023-11-13 01:43:56.676838-08	2023-11-13 01:55:56.676838-08	2023-11-13 02:01:00.711631-08	2023-11-13 02:01:00.711631-08
355	98	125	3		2023-11-13 01:45:56.789869-08	2023-11-13 01:57:56.789869-08	2023-11-13 02:03:00.605438-08	2023-11-13 02:03:00.605438-08
356	98	120	3		2023-11-13 01:47:56.412303-08	2023-11-13 01:59:56.412303-08	2023-11-13 02:05:00.314505-08	2023-11-13 02:05:00.314505-08
357	98	120	3		2023-11-13 01:48:56.442042-08	2023-11-13 02:00:56.442042-08	2023-11-13 02:05:58.88297-08	2023-11-13 02:05:58.88297-08
358	98	120	3		2023-11-13 01:49:56.476518-08	2023-11-13 02:01:56.476518-08	2023-11-13 02:06:59.427634-08	2023-11-13 02:06:59.427634-08
359	98	120	2		2023-11-13 01:50:56.478635-08	2023-11-13 02:02:56.478635-08	2023-11-13 02:08:01.206305-08	2023-11-13 02:08:01.206305-08
360	98	120	2		2023-11-13 01:52:56.604432-08	2023-11-13 02:04:56.604432-08	2023-11-13 02:10:00.972041-08	2023-11-13 02:10:00.972041-08
361	98	120	3		2023-11-13 01:54:56.599151-08	2023-11-13 02:06:56.599151-08	2023-11-13 02:12:00.713589-08	2023-11-13 02:12:00.713589-08
362	98	125	2		2023-11-13 01:56:56.498258-08	2023-11-13 02:08:56.498258-08	2023-11-13 02:14:01.548764-08	2023-11-13 02:14:01.548764-08
363	98	125	3		2023-11-13 01:57:56.57348-08	2023-11-13 02:09:56.57348-08	2023-11-13 02:15:00.162586-08	2023-11-13 02:15:00.162586-08
364	98	125	2		2023-11-13 01:59:56.395285-08	2023-11-13 02:11:56.395285-08	2023-11-13 02:16:59.973184-08	2023-11-13 02:16:59.973184-08
365	98	125	2		2023-11-13 02:01:56.486978-08	2023-11-13 02:13:56.486978-08	2023-11-13 02:19:02.007069-08	2023-11-13 02:19:02.007069-08
366	98	125	2		2023-11-13 02:03:56.396361-08	2023-11-13 02:15:56.396361-08	2023-11-13 02:21:01.139618-08	2023-11-13 02:21:01.139618-08
367	98	\N	\N		2023-11-13 02:04:56.460315-08	2023-11-13 02:16:56.460315-08	2023-11-13 02:22:01.097064-08	2023-11-13 02:22:01.097064-08
368	98	\N	\N		2023-11-13 02:05:56.47698-08	2023-11-13 02:17:56.47698-08	2023-11-13 02:23:01.927276-08	2023-11-13 02:23:01.927276-08
369	98	\N	\N		2023-11-13 02:06:56.705317-08	2023-11-13 02:18:56.705317-08	2023-11-13 02:24:07.940717-08	2023-11-13 02:24:07.940717-08
370	98	\N	\N		2023-11-13 02:08:56.405312-08	2023-11-13 02:20:56.405312-08	2023-11-13 02:25:59.547172-08	2023-11-13 02:25:59.547172-08
371	98	\N	\N		2023-11-13 02:09:56.414886-08	2023-11-13 02:21:56.414886-08	2023-11-13 02:26:59.677188-08	2023-11-13 02:26:59.677188-08
372	98	\N	\N		2023-11-13 02:10:56.647202-08	2023-11-13 02:22:56.647202-08	2023-11-13 02:28:02.803433-08	2023-11-13 02:28:02.803433-08
373	98	\N	\N		2023-11-13 02:12:56.473724-08	2023-11-13 02:24:56.473724-08	2023-11-13 02:30:03.203109-08	2023-11-13 02:30:03.203109-08
374	98	\N	\N		2023-11-13 02:13:56.495118-08	2023-11-13 02:25:56.495118-08	2023-11-13 02:31:00.016625-08	2023-11-13 02:31:00.016625-08
375	98	135	2		2023-11-13 02:15:56.568541-08	2023-11-13 02:27:56.568541-08	2023-11-13 02:32:58.958636-08	2023-11-13 02:32:58.958636-08
376	98	135	2		2023-11-13 02:17:56.349059-08	2023-11-13 02:29:56.349059-08	2023-11-13 02:34:58.760149-08	2023-11-13 02:34:58.760149-08
377	98	135	2		2023-11-13 02:18:56.525363-08	2023-11-13 02:30:56.525363-08	2023-11-13 02:35:59.27273-08	2023-11-13 02:35:59.27273-08
378	98	130	2		2023-11-13 02:20:56.490813-08	2023-11-13 02:32:56.490813-08	2023-11-13 02:37:58.094352-08	2023-11-13 02:37:58.094352-08
379	98	130	2		2023-11-13 02:22:56.525264-08	2023-11-13 02:34:56.525264-08	2023-11-13 02:39:57.608195-08	2023-11-13 02:39:57.608195-08
380	98	\N	\N		2023-11-13 02:23:56.563638-08	2023-11-13 02:35:56.563638-08	2023-11-13 02:40:57.381941-08	2023-11-13 02:40:57.381941-08
381	98	\N	\N		2023-11-13 02:25:56.40899-08	2023-11-13 02:37:56.40899-08	2023-11-13 02:42:57.002807-08	2023-11-13 02:42:57.002807-08
382	98	\N	\N		2023-11-13 02:26:56.459247-08	2023-11-13 02:38:56.459247-08	2023-11-13 02:43:57.128416-08	2023-11-13 02:43:57.128416-08
383	98	\N	\N		2023-11-13 02:27:56.502138-08	2023-11-13 02:39:56.502138-08	2023-11-13 02:44:58.568252-08	2023-11-13 02:44:58.568252-08
384	98	\N	\N		2023-11-13 02:29:56.615271-08	2023-11-13 02:41:56.615271-08	2023-11-13 02:46:57.282497-08	2023-11-13 02:46:57.282497-08
385	98	\N	\N		2023-11-13 02:31:56.48803-08	2023-11-13 02:43:56.48803-08	2023-11-13 02:48:57.284122-08	2023-11-13 02:48:57.284122-08
386	98	\N	\N		2023-11-13 02:33:56.576689-08	2023-11-13 02:45:56.576689-08	2023-11-13 02:50:58.160133-08	2023-11-13 02:50:58.160133-08
387	98	125	2		2023-11-13 02:35:56.438911-08	2023-11-13 02:47:56.438911-08	2023-11-13 02:52:57.917332-08	2023-11-13 02:52:57.917332-08
388	98	125	2		2023-11-13 02:37:56.34898-08	2023-11-13 02:49:56.34898-08	2023-11-13 02:55:01.208549-08	2023-11-13 02:55:01.208549-08
389	98	125	2		2023-11-13 02:39:56.351665-08	2023-11-13 02:51:56.351665-08	2023-11-13 02:57:07.05583-08	2023-11-13 02:57:07.05583-08
390	98	125	3		2023-11-13 02:41:56.358923-08	2023-11-13 02:53:56.358923-08	2023-11-13 02:59:07.894669-08	2023-11-13 02:59:07.894669-08
391	98	130	3		2023-11-13 02:43:56.365021-08	2023-11-13 02:55:56.365021-08	2023-11-13 03:01:04.383274-08	2023-11-13 03:01:04.383274-08
392	98	\N	3		2023-11-13 02:44:56.400571-08	2023-11-13 02:56:56.400571-08	2023-11-13 03:02:03.282735-08	2023-11-13 03:02:03.282735-08
393	98	125	3		2023-11-13 02:46:56.323616-08	2023-11-13 02:58:56.323616-08	2023-11-13 03:04:00.009555-08	2023-11-13 03:04:00.009555-08
394	98	125	4		2023-11-13 02:47:56.365451-08	2023-11-13 02:59:56.365451-08	2023-11-13 03:04:58.906352-08	2023-11-13 03:04:58.906352-08
395	98	130	3		2023-11-13 02:49:56.355376-08	2023-11-13 03:01:56.355376-08	2023-11-13 03:06:57.697827-08	2023-11-13 03:06:57.697827-08
396	98	130	3		2023-11-13 02:51:56.311993-08	2023-11-13 03:03:56.311993-08	2023-11-13 03:08:57.359082-08	2023-11-13 03:08:57.359082-08
397	98	130	3		2023-11-13 02:52:56.358577-08	2023-11-13 03:04:56.358577-08	2023-11-13 03:09:57.461346-08	2023-11-13 03:09:57.461346-08
398	98	130	4		2023-11-13 02:54:56.324987-08	2023-11-13 03:06:56.324987-08	2023-11-13 03:12:00.074218-08	2023-11-13 03:12:00.074218-08
399	98	130	2		2023-11-13 02:55:56.35084-08	2023-11-13 03:07:56.35084-08	2023-11-13 03:13:03.621024-08	2023-11-13 03:13:03.621024-08
400	98	130	3		2023-11-13 02:56:56.594096-08	2023-11-13 03:08:56.594096-08	2023-11-13 03:14:05.803095-08	2023-11-13 03:14:05.803095-08
401	98	\N	3		2023-11-13 02:58:56.389169-08	2023-11-13 03:10:56.389169-08	2023-11-13 03:16:05.057254-08	2023-11-13 03:16:05.057254-08
402	98	\N	3		2023-11-13 02:59:56.451925-08	2023-11-13 03:11:56.451925-08	2023-11-13 03:17:05.482746-08	2023-11-13 03:17:05.482746-08
403	98	\N	\N		2023-11-13 03:01:56.338771-08	2023-11-13 03:13:56.338771-08	2023-11-13 03:19:07.071846-08	2023-11-13 03:19:07.071846-08
404	98	\N	\N		2023-11-13 03:02:56.391104-08	2023-11-13 03:14:56.391104-08	2023-11-13 03:20:07.942766-08	2023-11-13 03:20:07.942766-08
405	98	\N	\N		2023-11-13 03:03:56.414858-08	2023-11-13 03:15:56.414858-08	2023-11-13 03:21:12.782184-08	2023-11-13 03:21:12.782184-08
406	98	120	2		2023-11-13 03:05:56.369782-08	2023-11-13 03:17:56.369782-08	2023-11-13 03:23:05.241003-08	2023-11-13 03:23:05.241003-08
407	98	120	3		2023-11-13 03:07:56.37233-08	2023-11-13 03:19:56.37233-08	2023-11-13 03:24:57.707026-08	2023-11-13 03:24:57.707026-08
408	98	120	3		2023-11-13 03:08:56.419768-08	2023-11-13 03:20:56.419768-08	2023-11-13 03:25:58.396521-08	2023-11-13 03:25:58.396521-08
409	98	120	3		2023-11-13 03:10:56.394362-08	2023-11-13 03:22:56.394362-08	2023-11-13 03:27:59.831024-08	2023-11-13 03:27:59.831024-08
410	98	120	3		2023-11-13 03:12:56.408756-08	2023-11-13 03:24:56.408756-08	2023-11-13 03:29:58.725306-08	2023-11-13 03:29:58.725306-08
411	98	130	3		2023-11-13 03:14:56.350162-08	2023-11-13 03:26:56.350162-08	2023-11-13 03:32:24.166826-08	2023-11-13 03:32:24.166826-08
412	98	115	4		2023-11-13 03:15:56.403558-08	2023-11-13 03:27:56.403558-08	2023-11-13 03:32:59.048916-08	2023-11-13 03:32:59.048916-08
413	98	125	2		2023-11-13 03:17:56.445203-08	2023-11-13 03:29:56.445203-08	2023-11-13 03:35:16.592526-08	2023-11-13 03:35:16.592526-08
414	98	\N	\N		2023-11-13 03:19:56.425268-08	2023-11-13 03:31:56.425268-08	2023-11-13 03:37:06.189168-08	2023-11-13 03:37:06.189168-08
415	98	\N	\N		2023-11-13 03:21:56.370075-08	2023-11-13 03:33:56.370075-08	2023-11-13 03:38:59.325883-08	2023-11-13 03:38:59.325883-08
416	98	\N	\N		2023-11-13 03:22:56.40649-08	2023-11-13 03:34:56.40649-08	2023-11-13 03:39:58.371174-08	2023-11-13 03:39:58.371174-08
417	98	\N	\N		2023-11-13 03:23:56.627786-08	2023-11-13 03:35:56.627786-08	2023-11-13 03:40:59.96597-08	2023-11-13 03:40:59.96597-08
418	98	125	2		2023-11-13 03:25:56.539718-08	2023-11-13 03:37:56.539718-08	2023-11-13 03:43:00.687459-08	2023-11-13 03:43:00.687459-08
419	98	125	2		2023-11-13 03:26:56.915839-08	2023-11-13 03:38:56.915839-08	2023-11-13 03:43:59.53825-08	2023-11-13 03:43:59.53825-08
420	98	125	2		2023-11-13 03:28:56.420309-08	2023-11-13 03:40:56.420309-08	2023-11-13 03:45:59.633286-08	2023-11-13 03:45:59.633286-08
421	98	125	2		2023-11-13 03:30:56.360382-08	2023-11-13 03:42:56.360382-08	2023-11-13 03:47:59.746494-08	2023-11-13 03:47:59.746494-08
422	98	125	2		2023-11-13 03:31:56.401578-08	2023-11-13 03:43:56.401578-08	2023-11-13 03:49:00.270331-08	2023-11-13 03:49:00.270331-08
423	103	\N	4		2023-11-13 16:51:46.837264-08	2023-11-13 17:03:46.837264-08	2023-11-13 17:08:51.441735-08	2023-11-13 17:08:51.441735-08
424	103	\N	4		2023-11-13 16:53:46.628568-08	2023-11-13 17:05:46.628568-08	2023-11-13 17:10:48.097626-08	2023-11-13 17:10:48.097626-08
425	103	\N	4		2023-11-13 16:54:46.795581-08	2023-11-13 17:06:46.795581-08	2023-11-13 17:11:52.503989-08	2023-11-13 17:11:52.503989-08
426	103	\N	4		2023-11-13 16:56:46.773879-08	2023-11-13 17:08:46.773879-08	2023-11-13 17:13:49.401678-08	2023-11-13 17:13:49.401678-08
427	103	\N	4		2023-11-13 16:58:46.632376-08	2023-11-13 17:10:46.632376-08	2023-11-13 17:15:47.788484-08	2023-11-13 17:15:47.788484-08
428	103	\N	5		2023-11-13 16:59:46.755616-08	2023-11-13 17:11:46.755616-08	2023-11-13 17:16:49.980019-08	2023-11-13 17:16:49.980019-08
429	103	\N	4		2023-11-13 17:01:46.829145-08	2023-11-13 17:13:46.829145-08	2023-11-13 17:18:49.660913-08	2023-11-13 17:18:49.660913-08
430	105	\N	3		2023-11-13 18:23:59.390688-08	2023-11-13 18:35:59.390688-08	2023-11-13 18:41:16.145492-08	2023-11-13 18:41:16.145492-08
431	105	\N	5		2023-11-13 18:24:59.406002-08	2023-11-13 18:36:59.406002-08	2023-11-13 18:42:01.099543-08	2023-11-13 18:42:01.099543-08
432	105	\N	\N		2023-11-13 18:26:59.373907-08	2023-11-13 18:38:59.373907-08	2023-11-13 18:44:01.567407-08	2023-11-13 18:44:01.567407-08
433	105	135	2		2023-11-13 18:27:59.449516-08	2023-11-13 18:39:59.449516-08	2023-11-13 18:45:01.843811-08	2023-11-13 18:45:01.843811-08
434	105	135	2		2023-11-13 18:29:59.441209-08	2023-11-13 18:41:59.441209-08	2023-11-13 18:47:01.562847-08	2023-11-13 18:47:01.562847-08
435	105	135	2		2023-11-13 18:31:59.369362-08	2023-11-13 18:43:59.369362-08	2023-11-13 18:49:03.550468-08	2023-11-13 18:49:03.550468-08
436	105	135	2		2023-11-13 18:32:59.395644-08	2023-11-13 18:44:59.395644-08	2023-11-13 18:50:03.412361-08	2023-11-13 18:50:03.412361-08
437	105	135	2		2023-11-13 18:34:59.433673-08	2023-11-13 18:46:59.433673-08	2023-11-13 18:52:03.154062-08	2023-11-13 18:52:03.154062-08
438	105	\N	\N		2023-11-13 18:36:59.389648-08	2023-11-13 18:48:59.389648-08	2023-11-13 18:54:17.894104-08	2023-11-13 18:54:17.894104-08
439	105	\N	\N		2023-11-13 18:37:59.453349-08	2023-11-13 18:49:59.453349-08	2023-11-13 18:55:33.289925-08	2023-11-13 18:55:33.289925-08
440	105	\N	\N		2023-11-13 18:39:59.40861-08	2023-11-13 18:51:59.40861-08	2023-11-13 18:57:42.924236-08	2023-11-13 18:57:42.924236-08
441	105	\N	3		2023-11-13 18:41:59.496781-08	2023-11-13 18:53:59.496781-08	2023-11-13 18:59:27.118094-08	2023-11-13 18:59:27.118094-08
442	106	140	3		2023-11-13 18:52:59.328149-08	2023-11-13 19:04:59.328149-08	2023-11-13 19:10:02.238857-08	2023-11-13 19:10:02.238857-08
443	106	135	4		2023-11-13 18:53:59.378487-08	2023-11-13 19:05:59.378487-08	2023-11-13 19:11:05.760816-08	2023-11-13 19:11:05.760816-08
444	106	135	2		2023-11-13 18:55:59.398523-08	2023-11-13 19:07:59.398523-08	2023-11-13 19:13:07.304195-08	2023-11-13 19:13:07.304195-08
445	106	135	2		2023-11-13 18:57:59.320048-08	2023-11-13 19:09:59.320048-08	2023-11-13 19:15:05.943612-08	2023-11-13 19:15:05.943612-08
446	106	135	4		2023-11-13 18:58:59.339554-08	2023-11-13 19:10:59.339554-08	2023-11-13 19:16:01.520869-08	2023-11-13 19:16:01.520869-08
447	106	135	5		2023-11-13 18:59:59.352025-08	2023-11-13 19:11:59.352025-08	2023-11-13 19:17:01.137218-08	2023-11-13 19:17:01.137218-08
448	106	135	5		2023-11-13 19:01:59.315109-08	2023-11-13 19:13:59.315109-08	2023-11-13 19:19:02.206739-08	2023-11-13 19:19:02.206739-08
449	106	135	5		2023-11-13 19:02:59.349282-08	2023-11-13 19:14:59.349282-08	2023-11-13 19:20:00.70806-08	2023-11-13 19:20:00.70806-08
450	106	135	3		2023-11-13 19:03:59.388422-08	2023-11-13 19:15:59.388422-08	2023-11-13 19:21:02.169015-08	2023-11-13 19:21:02.169015-08
451	107	155	2		2023-11-13 19:53:41.241483-08	2023-11-13 20:05:41.241483-08	2023-11-13 20:10:46.262155-08	2023-11-13 20:10:46.262155-08
452	108	\N	\N		2023-11-13 19:53:41.241483-08	2023-11-13 20:05:41.241483-08	2023-11-13 20:10:46.313589-08	2023-11-13 20:10:46.313589-08
453	108	\N	\N		2023-11-13 19:55:41.169872-08	2023-11-13 20:07:41.169872-08	2023-11-13 20:12:45.897439-08	2023-11-13 20:12:45.897439-08
454	107	155	2		2023-11-13 19:55:41.169872-08	2023-11-13 20:07:41.169872-08	2023-11-13 20:12:47.112916-08	2023-11-13 20:12:47.112916-08
455	108	\N	\N		2023-11-13 19:57:41.077688-08	2023-11-13 20:09:41.077688-08	2023-11-13 20:14:45.492117-08	2023-11-13 20:14:45.492117-08
456	107	155	2		2023-11-13 19:57:41.077688-08	2023-11-13 20:09:41.077688-08	2023-11-13 20:14:50.712996-08	2023-11-13 20:14:50.712996-08
457	107	150	2		2023-11-13 19:58:41.100638-08	2023-11-13 20:10:41.100638-08	2023-11-13 20:15:43.901522-08	2023-11-13 20:15:43.901522-08
458	108	\N	\N		2023-11-13 19:58:41.100638-08	2023-11-13 20:10:41.100638-08	2023-11-13 20:15:47.608018-08	2023-11-13 20:15:47.608018-08
459	107	155	2		2023-11-13 20:00:41.328532-08	2023-11-13 20:12:41.328532-08	2023-11-13 20:17:43.379662-08	2023-11-13 20:17:43.379662-08
460	108	\N	\N		2023-11-13 20:00:41.328532-08	2023-11-13 20:12:41.328532-08	2023-11-13 20:17:52.244669-08	2023-11-13 20:17:52.244669-08
461	107	155	2		2023-11-13 20:01:41.800893-08	2023-11-13 20:13:41.800893-08	2023-11-13 20:18:46.569182-08	2023-11-13 20:18:46.569182-08
462	108	\N	\N		2023-11-13 20:01:41.800893-08	2023-11-13 20:13:41.800893-08	2023-11-13 20:18:53.243686-08	2023-11-13 20:18:53.243686-08
463	107	155	2		2023-11-13 20:03:41.201002-08	2023-11-13 20:15:41.201002-08	2023-11-13 20:20:49.34155-08	2023-11-13 20:20:49.34155-08
464	108	\N	\N		2023-11-13 20:03:41.201002-08	2023-11-13 20:15:41.201002-08	2023-11-13 20:20:54.937007-08	2023-11-13 20:20:54.937007-08
465	108	155	2		2023-11-13 20:05:41.034465-08	2023-11-13 20:17:41.034465-08	2023-11-13 20:22:50.82158-08	2023-11-13 20:22:50.82158-08
466	107	155	2		2023-11-13 20:05:41.034465-08	2023-11-13 20:17:41.034465-08	2023-11-13 20:22:52.918315-08	2023-11-13 20:22:52.918315-08
467	107	155	2		2023-11-13 20:06:41.054391-08	2023-11-13 20:18:41.054391-08	2023-11-13 20:23:56.235987-08	2023-11-13 20:23:56.235987-08
468	107	155	3		2023-11-13 20:08:41.071883-08	2023-11-13 20:20:41.071883-08	2023-11-13 20:25:54.423429-08	2023-11-13 20:25:54.423429-08
469	107	160	3		2023-11-13 20:09:41.371121-08	2023-11-13 20:21:41.371121-08	2023-11-13 20:26:51.868275-08	2023-11-13 20:26:51.868275-08
470	107	\N	3		2023-11-13 20:11:41.270484-08	2023-11-13 20:23:41.270484-08	2023-11-13 20:28:45.046616-08	2023-11-13 20:28:45.046616-08
471	109	130	2		2023-11-13 20:22:41.1973-08	2023-11-13 20:34:41.1973-08	2023-11-13 20:39:43.593632-08	2023-11-13 20:39:43.593632-08
472	109	130	2		2023-11-13 20:24:41.069803-08	2023-11-13 20:36:41.069803-08	2023-11-13 20:41:46.757359-08	2023-11-13 20:41:46.757359-08
473	109	140	2		2023-11-13 20:25:41.219312-08	2023-11-13 20:37:41.219312-08	2023-11-13 20:42:43.715776-08	2023-11-13 20:42:43.715776-08
474	109	140	2		2023-11-13 20:27:41.06387-08	2023-11-13 20:39:41.06387-08	2023-11-13 20:44:57.514734-08	2023-11-13 20:44:57.514734-08
475	109	140	2		2023-11-13 20:28:41.215478-08	2023-11-13 20:40:41.215478-08	2023-11-13 20:45:48.518723-08	2023-11-13 20:45:48.518723-08
476	109	135	2		2023-11-13 20:30:41.082214-08	2023-11-13 20:42:41.082214-08	2023-11-13 20:47:46.709711-08	2023-11-13 20:47:46.709711-08
477	109	135	2		2023-11-13 20:32:41.039176-08	2023-11-13 20:44:41.039176-08	2023-11-13 20:49:44.620521-08	2023-11-13 20:49:44.620521-08
478	109	135	2		2023-11-13 20:33:41.071668-08	2023-11-13 20:45:41.071668-08	2023-11-13 20:50:43.023653-08	2023-11-13 20:50:43.023653-08
479	109	135	2		2023-11-13 20:35:41.044808-08	2023-11-13 20:47:41.044808-08	2023-11-13 20:52:42.698461-08	2023-11-13 20:52:42.698461-08
480	109	135	2		2023-11-13 20:36:41.069002-08	2023-11-13 20:48:41.069002-08	2023-11-13 20:53:43.69988-08	2023-11-13 20:53:43.69988-08
481	109	\N	\N		2023-11-13 20:38:41.045628-08	2023-11-13 20:50:41.045628-08	2023-11-13 20:55:42.945279-08	2023-11-13 20:55:42.945279-08
482	109	\N	\N		2023-11-13 20:40:41.034434-08	2023-11-13 20:52:41.034434-08	2023-11-13 20:57:42.665907-08	2023-11-13 20:57:42.665907-08
483	109	\N	\N		2023-11-13 20:41:41.069099-08	2023-11-13 20:53:41.069099-08	2023-11-13 20:58:42.622686-08	2023-11-13 20:58:42.622686-08
484	109	\N	\N		2023-11-13 20:43:41.025706-08	2023-11-13 20:55:41.025706-08	2023-11-13 21:00:42.896955-08	2023-11-13 21:00:42.896955-08
485	109	\N	\N		2023-11-13 20:44:41.087711-08	2023-11-13 20:56:41.087711-08	2023-11-13 21:01:43.29122-08	2023-11-13 21:01:43.29122-08
486	109	\N	\N		2023-11-13 20:45:41.10728-08	2023-11-13 20:57:41.10728-08	2023-11-13 21:02:43.455338-08	2023-11-13 21:02:43.455338-08
487	109	\N	\N		2023-11-13 20:47:41.08409-08	2023-11-13 20:59:41.08409-08	2023-11-13 21:04:43.352697-08	2023-11-13 21:04:43.352697-08
488	109	\N	\N		2023-11-13 20:49:41.26844-08	2023-11-13 21:01:41.26844-08	2023-11-13 21:06:44.194684-08	2023-11-13 21:06:44.194684-08
489	109	\N	\N		2023-11-13 20:51:41.017354-08	2023-11-13 21:03:41.017354-08	2023-11-13 21:08:43.588295-08	2023-11-13 21:08:43.588295-08
490	109	\N	\N		2023-11-13 20:53:41.04082-08	2023-11-13 21:05:41.04082-08	2023-11-13 21:10:43.013807-08	2023-11-13 21:10:43.013807-08
491	109	\N	\N		2023-11-13 20:55:41.047224-08	2023-11-13 21:07:41.047224-08	2023-11-13 21:12:43.047763-08	2023-11-13 21:12:43.047763-08
492	109	150	2		2023-11-13 20:57:41.083463-08	2023-11-13 21:09:41.083463-08	2023-11-13 21:14:44.232259-08	2023-11-13 21:14:44.232259-08
493	109	150	2		2023-11-13 20:59:41.027873-08	2023-11-13 21:11:41.027873-08	2023-11-13 21:16:46.911541-08	2023-11-13 21:16:46.911541-08
494	109	145	2		2023-11-13 21:00:41.054227-08	2023-11-13 21:12:41.054227-08	2023-11-13 21:17:42.486412-08	2023-11-13 21:17:42.486412-08
495	109	145	2		2023-11-13 21:02:41.035489-08	2023-11-13 21:14:41.035489-08	2023-11-13 21:19:42.861334-08	2023-11-13 21:19:42.861334-08
496	109	145	2		2023-11-13 21:03:41.072072-08	2023-11-13 21:15:41.072072-08	2023-11-13 21:20:43.387909-08	2023-11-13 21:20:43.387909-08
497	109	145	2		2023-11-13 21:05:41.204978-08	2023-11-13 21:17:41.204978-08	2023-11-13 21:22:43.776866-08	2023-11-13 21:22:43.776866-08
498	109	145	5		2023-11-13 21:07:41.007823-08	2023-11-13 21:19:41.007823-08	2023-11-13 21:24:43.372961-08	2023-11-13 21:24:43.372961-08
499	109	145	5		2023-11-13 21:08:41.013384-08	2023-11-13 21:20:41.013384-08	2023-11-13 21:25:44.079163-08	2023-11-13 21:25:44.079163-08
500	109	145	3		2023-11-13 21:09:41.035818-08	2023-11-13 21:21:41.035818-08	2023-11-13 21:26:43.231957-08	2023-11-13 21:26:43.231957-08
501	109	145	3		2023-11-13 21:11:41.039816-08	2023-11-13 21:23:41.039816-08	2023-11-13 21:28:45.182942-08	2023-11-13 21:28:45.182942-08
502	109	145	5		2023-11-13 21:12:41.057922-08	2023-11-13 21:24:41.057922-08	2023-11-13 21:29:44.987944-08	2023-11-13 21:29:44.987944-08
503	109	145	2		2023-11-13 21:14:41.034523-08	2023-11-13 21:26:41.034523-08	2023-11-13 21:31:45.892814-08	2023-11-13 21:31:45.892814-08
504	109	140	2		2023-11-13 21:57:17.399445-08	2023-11-13 22:09:17.399445-08	2023-11-13 22:14:25.446309-08	2023-11-13 22:14:25.446309-08
505	109	140	2		2023-11-13 21:59:17.377621-08	2023-11-13 22:11:17.377621-08	2023-11-13 22:16:27.92082-08	2023-11-13 22:16:27.92082-08
506	109	145	2		2023-11-13 22:01:17.235686-08	2023-11-13 22:13:17.235686-08	2023-11-13 22:18:25.099098-08	2023-11-13 22:18:25.099098-08
507	109	145	2		2023-11-13 22:03:17.163241-08	2023-11-13 22:15:17.163241-08	2023-11-13 22:20:22.47623-08	2023-11-13 22:20:22.47623-08
508	109	145	1		2023-11-13 22:04:17.199801-08	2023-11-13 22:16:17.199801-08	2023-11-13 22:21:21.569366-08	2023-11-13 22:21:21.569366-08
509	109	145	1		2023-11-13 22:06:17.16651-08	2023-11-13 22:18:17.16651-08	2023-11-13 22:23:20.55825-08	2023-11-13 22:23:20.55825-08
510	109	150	2		2023-11-13 22:07:17.194728-08	2023-11-13 22:19:17.194728-08	2023-11-13 22:24:20.224714-08	2023-11-13 22:24:20.224714-08
511	109	150	2		2023-11-13 22:09:17.203234-08	2023-11-13 22:21:17.203234-08	2023-11-13 22:26:20.939548-08	2023-11-13 22:26:20.939548-08
512	109	150	2		2023-11-13 22:10:17.207079-08	2023-11-13 22:22:17.207079-08	2023-11-13 22:27:21.021663-08	2023-11-13 22:27:21.021663-08
513	109	140	2		2023-11-13 22:12:17.146269-08	2023-11-13 22:24:17.146269-08	2023-11-13 22:29:21.721168-08	2023-11-13 22:29:21.721168-08
514	109	140	2		2023-11-13 22:13:17.194164-08	2023-11-13 22:25:17.194164-08	2023-11-13 22:30:20.678213-08	2023-11-13 22:30:20.678213-08
515	109	155	3		2023-11-13 22:15:17.216486-08	2023-11-13 22:27:17.216486-08	2023-11-13 22:32:21.935818-08	2023-11-13 22:32:21.935818-08
516	109	155	3		2023-11-13 22:17:17.194074-08	2023-11-13 22:29:17.194074-08	2023-11-13 22:34:19.624231-08	2023-11-13 22:34:19.624231-08
517	109	155	3		2023-11-13 22:18:17.267238-08	2023-11-13 22:30:17.267238-08	2023-11-13 22:35:20.017878-08	2023-11-13 22:35:20.017878-08
518	109	155	3		2023-11-13 22:20:17.190516-08	2023-11-13 22:32:17.190516-08	2023-11-13 22:37:19.915312-08	2023-11-13 22:37:19.915312-08
519	109	155	3		2023-11-13 22:21:17.201591-08	2023-11-13 22:33:17.201591-08	2023-11-13 22:38:19.628724-08	2023-11-13 22:38:19.628724-08
520	109	155	3		2023-11-13 22:23:17.177183-08	2023-11-13 22:35:17.177183-08	2023-11-13 22:40:19.739071-08	2023-11-13 22:40:19.739071-08
521	109	\N	4		2023-11-13 22:24:17.203821-08	2023-11-13 22:36:17.203821-08	2023-11-13 22:41:18.57358-08	2023-11-13 22:41:18.57358-08
522	109	\N	\N		2023-11-13 22:26:17.194681-08	2023-11-13 22:38:17.194681-08	2023-11-13 22:43:19.859661-08	2023-11-13 22:43:19.859661-08
523	109	140	2		2023-11-13 22:28:17.273934-08	2023-11-13 22:40:17.273934-08	2023-11-13 22:45:21.208843-08	2023-11-13 22:45:21.208843-08
524	109	140	2		2023-11-13 22:30:17.1679-08	2023-11-13 22:42:17.1679-08	2023-11-13 22:47:21.366453-08	2023-11-13 22:47:21.366453-08
525	109	140	3		2023-11-13 22:31:17.168352-08	2023-11-13 22:43:17.168352-08	2023-11-13 22:48:21.373125-08	2023-11-13 22:48:21.373125-08
526	109	140	3		2023-11-13 22:33:17.181319-08	2023-11-13 22:45:17.181319-08	2023-11-13 22:50:21.980236-08	2023-11-13 22:50:21.980236-08
527	109	140	2		2023-11-13 22:34:17.194997-08	2023-11-13 22:46:17.194997-08	2023-11-13 22:51:21.26532-08	2023-11-13 22:51:21.26532-08
528	109	140	2		2023-11-13 22:36:17.173726-08	2023-11-13 22:48:17.173726-08	2023-11-13 22:53:20.463967-08	2023-11-13 22:53:20.463967-08
529	109	140	2		2023-11-13 22:37:17.187193-08	2023-11-13 22:49:17.187193-08	2023-11-13 22:54:20.320005-08	2023-11-13 22:54:20.320005-08
530	109	140	2		2023-11-13 22:38:17.191337-08	2023-11-13 22:50:17.191337-08	2023-11-13 22:55:22.341919-08	2023-11-13 22:55:22.341919-08
531	109	135	2		2023-11-13 22:39:17.266747-08	2023-11-13 22:51:17.266747-08	2023-11-13 22:56:20.233232-08	2023-11-13 22:56:20.233232-08
532	109	130	2		2023-11-13 22:41:17.275278-08	2023-11-13 22:53:17.275278-08	2023-11-13 22:58:18.569498-08	2023-11-13 22:58:18.569498-08
533	109	130	2		2023-11-13 22:43:17.178344-08	2023-11-13 22:55:17.178344-08	2023-11-13 23:00:19.280415-08	2023-11-13 23:00:19.280415-08
534	109	130	2		2023-11-13 22:44:17.191607-08	2023-11-13 22:56:17.191607-08	2023-11-13 23:01:19.916782-08	2023-11-13 23:01:19.916782-08
535	109	130	2		2023-11-13 22:45:17.291918-08	2023-11-13 22:57:17.291918-08	2023-11-13 23:02:23.713238-08	2023-11-13 23:02:23.713238-08
536	109	145	2		2023-11-13 22:46:17.425452-08	2023-11-13 22:58:17.425452-08	2023-11-13 23:03:23.441139-08	2023-11-13 23:03:23.441139-08
537	109	145	1		2023-11-13 22:48:17.196836-08	2023-11-13 23:00:17.196836-08	2023-11-13 23:05:28.498642-08	2023-11-13 23:05:28.498642-08
538	109	145	1		2023-11-13 22:50:17.183075-08	2023-11-13 23:02:17.183075-08	2023-11-13 23:07:28.678969-08	2023-11-13 23:07:28.678969-08
539	109	145	1		2023-11-13 22:52:17.188328-08	2023-11-13 23:04:17.188328-08	2023-11-13 23:09:25.483623-08	2023-11-13 23:09:25.483623-08
540	109	140	2		2023-11-13 22:54:17.204539-08	2023-11-13 23:06:17.204539-08	2023-11-13 23:11:22.117436-08	2023-11-13 23:11:22.117436-08
541	109	\N	2		2023-11-13 22:55:17.233776-08	2023-11-13 23:07:17.233776-08	2023-11-13 23:12:21.530026-08	2023-11-13 23:12:21.530026-08
542	109	\N	\N		2023-11-13 22:57:17.426406-08	2023-11-13 23:09:17.426406-08	2023-11-13 23:14:22.663469-08	2023-11-13 23:14:22.663469-08
543	109	150	2		2023-11-13 22:58:17.441806-08	2023-11-13 23:10:17.441806-08	2023-11-13 23:15:23.584917-08	2023-11-13 23:15:23.584917-08
544	109	145	2		2023-11-13 22:59:17.541235-08	2023-11-13 23:11:17.541235-08	2023-11-13 23:16:25.144178-08	2023-11-13 23:16:25.144178-08
545	109	145	2		2023-11-13 23:01:17.185644-08	2023-11-13 23:13:17.185644-08	2023-11-13 23:18:26.487339-08	2023-11-13 23:18:26.487339-08
546	109	140	2		2023-11-13 23:02:18.02292-08	2023-11-13 23:14:18.02292-08	2023-11-13 23:19:23.011399-08	2023-11-13 23:19:23.011399-08
547	109	140	2		2023-11-13 23:04:17.173909-08	2023-11-13 23:16:17.173909-08	2023-11-13 23:21:22.689427-08	2023-11-13 23:21:22.689427-08
548	109	140	2		2023-11-13 23:05:17.221476-08	2023-11-13 23:17:17.221476-08	2023-11-13 23:22:22.613514-08	2023-11-13 23:22:22.613514-08
549	109	140	2		2023-11-13 23:07:17.192454-08	2023-11-13 23:19:17.192454-08	2023-11-13 23:24:23.037086-08	2023-11-13 23:24:23.037086-08
550	109	140	2		2023-11-13 23:08:17.205356-08	2023-11-13 23:20:17.205356-08	2023-11-13 23:25:22.786403-08	2023-11-13 23:25:22.786403-08
551	109	\N	\N		2023-11-13 23:10:17.211252-08	2023-11-13 23:22:17.211252-08	2023-11-13 23:27:22.384738-08	2023-11-13 23:27:22.384738-08
552	109	\N	\N		2023-11-13 23:11:17.252362-08	2023-11-13 23:23:17.252362-08	2023-11-13 23:28:22.489942-08	2023-11-13 23:28:22.489942-08
553	109	\N	\N		2023-11-13 23:13:17.179555-08	2023-11-13 23:25:17.179555-08	2023-11-13 23:30:19.4286-08	2023-11-13 23:30:19.4286-08
554	109	\N	\N		2023-11-13 23:14:17.447148-08	2023-11-13 23:26:17.447148-08	2023-11-13 23:31:18.768687-08	2023-11-13 23:31:18.768687-08
555	109	\N	\N		2023-11-13 23:16:17.34745-08	2023-11-13 23:28:17.34745-08	2023-11-13 23:33:18.0133-08	2023-11-13 23:33:18.0133-08
556	109	\N	\N		2023-11-13 23:18:17.172961-08	2023-11-13 23:30:17.172961-08	2023-11-13 23:35:17.726674-08	2023-11-13 23:35:17.726674-08
557	109	\N	\N		2023-11-13 23:20:17.179452-08	2023-11-13 23:32:17.179452-08	2023-11-13 23:37:18.091805-08	2023-11-13 23:37:18.091805-08
558	109	\N	\N		2023-11-13 23:21:17.226689-08	2023-11-13 23:33:17.226689-08	2023-11-13 23:38:18.268745-08	2023-11-13 23:38:18.268745-08
559	109	135	2		2023-11-13 23:23:17.184797-08	2023-11-13 23:35:17.184797-08	2023-11-13 23:40:18.597398-08	2023-11-13 23:40:18.597398-08
560	109	135	2		2023-11-13 23:24:17.187446-08	2023-11-13 23:36:17.187446-08	2023-11-13 23:41:19.322026-08	2023-11-13 23:41:19.322026-08
561	109	135	2		2023-11-13 23:25:17.201937-08	2023-11-13 23:37:17.201937-08	2023-11-13 23:42:19.464846-08	2023-11-13 23:42:19.464846-08
562	109	135	2		2023-11-13 23:27:17.170409-08	2023-11-13 23:39:17.170409-08	2023-11-13 23:44:19.621299-08	2023-11-13 23:44:19.621299-08
563	109	135	2		2023-11-13 23:28:17.176961-08	2023-11-13 23:40:17.176961-08	2023-11-13 23:45:19.93865-08	2023-11-13 23:45:19.93865-08
564	109	140	2		2023-11-13 23:29:17.178864-08	2023-11-13 23:41:17.178864-08	2023-11-13 23:46:19.984287-08	2023-11-13 23:46:19.984287-08
565	109	135	2		2023-11-13 23:30:17.180272-08	2023-11-13 23:42:17.180272-08	2023-11-13 23:47:20.186207-08	2023-11-13 23:47:20.186207-08
566	109	135	2		2023-11-13 23:31:17.183871-08	2023-11-13 23:43:17.183871-08	2023-11-13 23:48:19.654101-08	2023-11-13 23:48:19.654101-08
567	109	135	2		2023-11-13 23:33:17.155471-08	2023-11-13 23:45:17.155471-08	2023-11-13 23:50:18.955571-08	2023-11-13 23:50:18.955571-08
568	109	140	2		2023-11-13 23:34:17.183801-08	2023-11-13 23:46:17.183801-08	2023-11-13 23:51:19.495018-08	2023-11-13 23:51:19.495018-08
569	109	140	2		2023-11-13 23:35:17.194995-08	2023-11-13 23:47:17.194995-08	2023-11-13 23:52:20.228563-08	2023-11-13 23:52:20.228563-08
570	109	135	2		2023-11-13 23:37:17.246425-08	2023-11-13 23:49:17.246425-08	2023-11-13 23:54:19.631919-08	2023-11-13 23:54:19.631919-08
571	109	135	3		2023-11-13 23:39:17.203236-08	2023-11-13 23:51:17.203236-08	2023-11-13 23:56:19.091047-08	2023-11-13 23:56:19.091047-08
572	109	135	3		2023-11-13 23:40:17.213359-08	2023-11-13 23:52:17.213359-08	2023-11-13 23:57:19.777943-08	2023-11-13 23:57:19.777943-08
573	109	135	3		2023-11-13 23:42:17.215798-08	2023-11-13 23:54:17.215798-08	2023-11-13 23:59:20.5911-08	2023-11-13 23:59:20.5911-08
574	109	135	3		2023-11-13 23:44:17.198037-08	2023-11-13 23:56:17.198037-08	2023-11-14 00:01:24.617389-08	2023-11-14 00:01:24.617389-08
575	109	135	3		2023-11-13 23:46:17.203682-08	2023-11-13 23:58:17.203682-08	2023-11-14 00:03:25.260919-08	2023-11-14 00:03:25.260919-08
576	109	135	2		2023-11-13 23:48:17.805249-08	2023-11-14 00:00:17.805249-08	2023-11-14 00:05:23.659443-08	2023-11-14 00:05:23.659443-08
577	109	135	2		2023-11-13 23:50:17.1803-08	2023-11-14 00:02:17.1803-08	2023-11-14 00:07:21.149357-08	2023-11-14 00:07:21.149357-08
578	109	135	2		2023-11-13 23:51:17.278044-08	2023-11-14 00:03:17.278044-08	2023-11-14 00:08:20.913465-08	2023-11-14 00:08:20.913465-08
579	109	125	2		2023-11-13 23:53:17.190011-08	2023-11-14 00:05:17.190011-08	2023-11-14 00:10:20.057388-08	2023-11-14 00:10:20.057388-08
580	109	125	3		2023-11-13 23:55:17.22842-08	2023-11-14 00:07:17.22842-08	2023-11-14 00:12:21.389041-08	2023-11-14 00:12:21.389041-08
581	109	125	2		2023-11-13 23:56:17.261146-08	2023-11-14 00:08:17.261146-08	2023-11-14 00:13:22.422712-08	2023-11-14 00:13:22.422712-08
582	109	125	2		2023-11-13 23:58:17.184538-08	2023-11-14 00:10:17.184538-08	2023-11-14 00:15:22.041624-08	2023-11-14 00:15:22.041624-08
583	109	125	2		2023-11-14 00:00:17.278631-08	2023-11-14 00:12:17.278631-08	2023-11-14 00:17:23.899161-08	2023-11-14 00:17:23.899161-08
584	109	\N	\N		2023-11-14 00:02:17.325218-08	2023-11-14 00:14:17.325218-08	2023-11-14 00:19:24.223588-08	2023-11-14 00:19:24.223588-08
585	109	\N	\N		2023-11-14 00:03:17.869783-08	2023-11-14 00:15:17.869783-08	2023-11-14 00:20:26.380391-08	2023-11-14 00:20:26.380391-08
586	109	\N	\N		2023-11-14 00:05:17.234304-08	2023-11-14 00:17:17.234304-08	2023-11-14 00:22:21.014701-08	2023-11-14 00:22:21.014701-08
587	109	\N	\N		2023-11-14 00:06:17.241424-08	2023-11-14 00:18:17.241424-08	2023-11-14 00:23:20.740566-08	2023-11-14 00:23:20.740566-08
588	109	\N	\N		2023-11-14 00:07:17.868409-08	2023-11-14 00:19:17.868409-08	2023-11-14 00:24:22.03074-08	2023-11-14 00:24:22.03074-08
589	109	\N	\N		2023-11-14 00:08:19.41269-08	2023-11-14 00:20:19.41269-08	2023-11-14 00:25:28.128204-08	2023-11-14 00:25:28.128204-08
590	109	\N	\N		2023-11-14 00:10:17.162177-08	2023-11-14 00:22:17.162177-08	2023-11-14 00:27:20.024978-08	2023-11-14 00:27:20.024978-08
591	109	\N	\N		2023-11-14 00:11:17.179655-08	2023-11-14 00:23:17.179655-08	2023-11-14 00:28:19.634233-08	2023-11-14 00:28:19.634233-08
592	109	\N	\N		2023-11-14 00:12:17.239396-08	2023-11-14 00:24:17.239396-08	2023-11-14 00:29:19.525871-08	2023-11-14 00:29:19.525871-08
593	109	\N	\N		2023-11-14 00:14:17.232636-08	2023-11-14 00:26:17.232636-08	2023-11-14 00:31:25.589489-08	2023-11-14 00:31:25.589489-08
594	109	\N	\N		2023-11-14 00:16:17.131777-08	2023-11-14 00:28:17.131777-08	2023-11-14 00:33:21.165402-08	2023-11-14 00:33:21.165402-08
595	109	\N	\N		2023-11-14 00:17:17.164077-08	2023-11-14 00:29:17.164077-08	2023-11-14 00:34:21.144008-08	2023-11-14 00:34:21.144008-08
596	109	\N	\N		2023-11-14 00:19:17.350421-08	2023-11-14 00:31:17.350421-08	2023-11-14 00:36:21.195032-08	2023-11-14 00:36:21.195032-08
597	109	\N	\N		2023-11-14 00:20:17.610795-08	2023-11-14 00:32:17.610795-08	2023-11-14 00:37:19.992575-08	2023-11-14 00:37:19.992575-08
598	109	\N	\N		2023-11-14 00:22:17.184458-08	2023-11-14 00:34:17.184458-08	2023-11-14 00:39:19.642887-08	2023-11-14 00:39:19.642887-08
599	109	\N	\N		2023-11-14 00:23:17.209515-08	2023-11-14 00:35:17.209515-08	2023-11-14 00:40:19.460655-08	2023-11-14 00:40:19.460655-08
600	109	\N	\N		2023-11-14 00:24:17.34186-08	2023-11-14 00:36:17.34186-08	2023-11-14 00:41:19.634999-08	2023-11-14 00:41:19.634999-08
601	109	\N	\N		2023-11-14 00:26:17.45352-08	2023-11-14 00:38:17.45352-08	2023-11-14 00:43:20.449672-08	2023-11-14 00:43:20.449672-08
602	109	\N	\N		2023-11-14 00:28:17.221963-08	2023-11-14 00:40:17.221963-08	2023-11-14 00:45:20.124792-08	2023-11-14 00:45:20.124792-08
603	109	140	1		2023-11-14 00:30:17.294287-08	2023-11-14 00:42:17.294287-08	2023-11-14 00:47:19.909057-08	2023-11-14 00:47:19.909057-08
604	109	140	1		2023-11-14 00:32:17.196369-08	2023-11-14 00:44:17.196369-08	2023-11-14 00:49:21.724881-08	2023-11-14 00:49:21.724881-08
605	109	140	1		2023-11-14 00:33:17.212005-08	2023-11-14 00:45:17.212005-08	2023-11-14 00:50:21.835701-08	2023-11-14 00:50:21.835701-08
606	109	140	1		2023-11-14 00:34:17.491584-08	2023-11-14 00:46:17.491584-08	2023-11-14 00:51:23.71557-08	2023-11-14 00:51:23.71557-08
607	109	140	2		2023-11-14 00:36:17.241678-08	2023-11-14 00:48:17.241678-08	2023-11-14 00:53:21.792063-08	2023-11-14 00:53:21.792063-08
608	109	140	2		2023-11-14 00:37:17.25218-08	2023-11-14 00:49:17.25218-08	2023-11-14 00:54:21.744435-08	2023-11-14 00:54:21.744435-08
609	109	\N	2		2023-11-14 00:38:17.358482-08	2023-11-14 00:50:17.358482-08	2023-11-14 00:55:22.340313-08	2023-11-14 00:55:22.340313-08
610	109	\N	2		2023-11-14 00:40:17.173139-08	2023-11-14 00:52:17.173139-08	2023-11-14 00:57:19.698213-08	2023-11-14 00:57:19.698213-08
611	109	\N	\N		2023-11-14 00:42:17.404262-08	2023-11-14 00:54:17.404262-08	2023-11-14 00:59:19.937723-08	2023-11-14 00:59:19.937723-08
612	109	\N	\N		2023-11-14 00:44:17.185786-08	2023-11-14 00:56:17.185786-08	2023-11-14 01:01:19.486831-08	2023-11-14 01:01:19.486831-08
613	109	\N	\N		2023-11-14 00:45:17.269565-08	2023-11-14 00:57:17.269565-08	2023-11-14 01:02:20.164154-08	2023-11-14 01:02:20.164154-08
614	109	\N	\N		2023-11-14 00:47:17.296107-08	2023-11-14 00:59:17.296107-08	2023-11-14 01:04:20.288222-08	2023-11-14 01:04:20.288222-08
615	109	\N	\N		2023-11-14 00:49:17.242177-08	2023-11-14 01:01:17.242177-08	2023-11-14 01:06:27.647717-08	2023-11-14 01:06:27.647717-08
616	109	\N	\N		2023-11-14 00:50:17.301669-08	2023-11-14 01:02:17.301669-08	2023-11-14 01:07:20.627767-08	2023-11-14 01:07:20.627767-08
617	109	145	2		2023-11-14 00:52:17.226318-08	2023-11-14 01:04:17.226318-08	2023-11-14 01:09:20.317836-08	2023-11-14 01:09:20.317836-08
618	109	145	2		2023-11-14 00:53:17.398165-08	2023-11-14 01:05:17.398165-08	2023-11-14 01:10:21.128988-08	2023-11-14 01:10:21.128988-08
619	109	145	2		2023-11-14 00:55:17.313903-08	2023-11-14 01:07:17.313903-08	2023-11-14 01:12:23.830838-08	2023-11-14 01:12:23.830838-08
620	109	145	3		2023-11-14 00:56:17.358719-08	2023-11-14 01:08:17.358719-08	2023-11-14 01:13:24.705377-08	2023-11-14 01:13:24.705377-08
621	109	145	3		2023-11-14 00:57:17.39626-08	2023-11-14 01:09:17.39626-08	2023-11-14 01:14:25.267495-08	2023-11-14 01:14:25.267495-08
622	109	145	3		2023-11-14 00:59:17.201062-08	2023-11-14 01:11:17.201062-08	2023-11-14 01:16:23.277695-08	2023-11-14 01:16:23.277695-08
623	109	145	3		2023-11-14 01:00:17.500316-08	2023-11-14 01:12:17.500316-08	2023-11-14 01:17:25.337722-08	2023-11-14 01:17:25.337722-08
624	109	\N	3		2023-11-14 01:02:17.290574-08	2023-11-14 01:14:17.290574-08	2023-11-14 01:19:23.422253-08	2023-11-14 01:19:23.422253-08
625	109	\N	\N		2023-11-14 01:03:17.376671-08	2023-11-14 01:15:17.376671-08	2023-11-14 01:20:21.794246-08	2023-11-14 01:20:21.794246-08
626	109	150	2		2023-11-14 01:05:17.271983-08	2023-11-14 01:17:17.271983-08	2023-11-14 01:22:19.973733-08	2023-11-14 01:22:19.973733-08
627	109	150	2		2023-11-14 01:06:17.312857-08	2023-11-14 01:18:17.312857-08	2023-11-14 01:23:20.196984-08	2023-11-14 01:23:20.196984-08
628	109	150	2		2023-11-14 01:07:17.40758-08	2023-11-14 01:19:17.40758-08	2023-11-14 01:24:20.241465-08	2023-11-14 01:24:20.241465-08
629	109	150	2		2023-11-14 01:09:17.249063-08	2023-11-14 01:21:17.249063-08	2023-11-14 01:26:20.106715-08	2023-11-14 01:26:20.106715-08
630	109	150	2		2023-11-14 01:10:17.253127-08	2023-11-14 01:22:17.253127-08	2023-11-14 01:27:19.87778-08	2023-11-14 01:27:19.87778-08
631	109	150	2		2023-11-14 01:12:17.268813-08	2023-11-14 01:24:17.268813-08	2023-11-14 01:29:20.481106-08	2023-11-14 01:29:20.481106-08
632	109	\N	\N		2023-11-14 01:14:17.244389-08	2023-11-14 01:26:17.244389-08	2023-11-14 01:31:20.464341-08	2023-11-14 01:31:20.464341-08
633	109	\N	\N		2023-11-14 01:15:17.279293-08	2023-11-14 01:27:17.279293-08	2023-11-14 01:32:20.130263-08	2023-11-14 01:32:20.130263-08
634	109	\N	\N		2023-11-14 01:17:17.229336-08	2023-11-14 01:29:17.229336-08	2023-11-14 01:34:19.892015-08	2023-11-14 01:34:19.892015-08
635	109	\N	\N		2023-11-14 01:18:17.247812-08	2023-11-14 01:30:17.247812-08	2023-11-14 01:35:19.615149-08	2023-11-14 01:35:19.615149-08
636	109	\N	\N		2023-11-14 01:19:17.278616-08	2023-11-14 01:31:17.278616-08	2023-11-14 01:36:19.54884-08	2023-11-14 01:36:19.54884-08
637	109	\N	\N		2023-11-14 01:20:17.393401-08	2023-11-14 01:32:17.393401-08	2023-11-14 01:37:19.889464-08	2023-11-14 01:37:19.889464-08
638	109	\N	\N		2023-11-14 01:22:17.345704-08	2023-11-14 01:34:17.345704-08	2023-11-14 01:39:19.560204-08	2023-11-14 01:39:19.560204-08
639	109	\N	\N		2023-11-14 01:24:17.223878-08	2023-11-14 01:36:17.223878-08	2023-11-14 01:41:19.582486-08	2023-11-14 01:41:19.582486-08
640	109	140	2		2023-11-14 01:26:17.264263-08	2023-11-14 01:38:17.264263-08	2023-11-14 01:43:19.567133-08	2023-11-14 01:43:19.567133-08
641	109	140	2		2023-11-14 01:27:17.40725-08	2023-11-14 01:39:17.40725-08	2023-11-14 01:44:20.285802-08	2023-11-14 01:44:20.285802-08
642	109	\N	\N		2023-11-14 01:29:17.268747-08	2023-11-14 01:41:17.268747-08	2023-11-14 01:46:19.778131-08	2023-11-14 01:46:19.778131-08
643	109	\N	\N		2023-11-14 01:31:17.402027-08	2023-11-14 01:43:17.402027-08	2023-11-14 01:48:20.250004-08	2023-11-14 01:48:20.250004-08
644	109	\N	\N		2023-11-14 01:33:17.346899-08	2023-11-14 01:45:17.346899-08	2023-11-14 01:50:20.601916-08	2023-11-14 01:50:20.601916-08
645	109	140	1		2023-11-14 01:35:17.396813-08	2023-11-14 01:47:17.396813-08	2023-11-14 01:52:19.840658-08	2023-11-14 01:52:19.840658-08
646	109	140	1		2023-11-14 01:37:17.289844-08	2023-11-14 01:49:17.289844-08	2023-11-14 01:54:19.670836-08	2023-11-14 01:54:19.670836-08
647	109	135	2		2023-11-14 01:39:17.194868-08	2023-11-14 01:51:17.194868-08	2023-11-14 01:56:20.251172-08	2023-11-14 01:56:20.251172-08
648	109	140	1		2023-11-14 01:40:17.240594-08	2023-11-14 01:52:17.240594-08	2023-11-14 01:57:24.756982-08	2023-11-14 01:57:24.756982-08
649	109	135	2		2023-11-14 01:41:17.250134-08	2023-11-14 01:53:17.250134-08	2023-11-14 01:58:23.944929-08	2023-11-14 01:58:23.944929-08
650	109	135	2		2023-11-14 01:42:17.421732-08	2023-11-14 01:54:17.421732-08	2023-11-14 01:59:24.575447-08	2023-11-14 01:59:24.575447-08
651	109	135	2		2023-11-14 01:44:17.3056-08	2023-11-14 01:56:17.3056-08	2023-11-14 02:01:24.212348-08	2023-11-14 02:01:24.212348-08
652	109	135	2		2023-11-14 01:45:17.350629-08	2023-11-14 01:57:17.350629-08	2023-11-14 02:02:25.162725-08	2023-11-14 02:02:25.162725-08
653	109	\N	\N		2023-11-14 01:47:17.281549-08	2023-11-14 01:59:17.281549-08	2023-11-14 02:04:22.192762-08	2023-11-14 02:04:22.192762-08
654	109	\N	\N		2023-11-14 01:48:17.316946-08	2023-11-14 02:00:17.316946-08	2023-11-14 02:05:21.296439-08	2023-11-14 02:05:21.296439-08
655	109	\N	\N		2023-11-14 01:49:17.418381-08	2023-11-14 02:01:17.418381-08	2023-11-14 02:06:20.46097-08	2023-11-14 02:06:20.46097-08
656	109	\N	\N		2023-11-14 01:51:17.338235-08	2023-11-14 02:03:17.338235-08	2023-11-14 02:08:19.69636-08	2023-11-14 02:08:19.69636-08
657	109	\N	\N		2023-11-14 01:53:17.259008-08	2023-11-14 02:05:17.259008-08	2023-11-14 02:10:19.35756-08	2023-11-14 02:10:19.35756-08
658	109	\N	\N		2023-11-14 01:54:17.321366-08	2023-11-14 02:06:17.321366-08	2023-11-14 02:11:29.744267-08	2023-11-14 02:11:29.744267-08
659	109	\N	\N		2023-11-14 01:55:17.38465-08	2023-11-14 02:07:17.38465-08	2023-11-14 02:12:18.588632-08	2023-11-14 02:12:18.588632-08
660	109	\N	\N		2023-11-14 01:57:17.253988-08	2023-11-14 02:09:17.253988-08	2023-11-14 02:14:18.241317-08	2023-11-14 02:14:18.241317-08
661	109	\N	\N		2023-11-14 01:58:17.271807-08	2023-11-14 02:10:17.271807-08	2023-11-14 02:15:20.543406-08	2023-11-14 02:15:20.543406-08
662	109	\N	\N		2023-11-14 02:00:17.29619-08	2023-11-14 02:12:17.29619-08	2023-11-14 02:17:18.808562-08	2023-11-14 02:17:18.808562-08
663	109	\N	\N		2023-11-14 02:01:17.338845-08	2023-11-14 02:13:17.338845-08	2023-11-14 02:18:19.571861-08	2023-11-14 02:18:19.571861-08
664	109	125	2		2023-11-14 02:03:17.283428-08	2023-11-14 02:15:17.283428-08	2023-11-14 02:20:19.91072-08	2023-11-14 02:20:19.91072-08
665	109	125	2		2023-11-14 02:04:17.365883-08	2023-11-14 02:16:17.365883-08	2023-11-14 02:21:21.188769-08	2023-11-14 02:21:21.188769-08
666	109	125	2		2023-11-14 02:06:17.273802-08	2023-11-14 02:18:17.273802-08	2023-11-14 02:23:23.585692-08	2023-11-14 02:23:23.585692-08
667	109	125	2		2023-11-14 02:07:17.280277-08	2023-11-14 02:19:17.280277-08	2023-11-14 02:24:19.72678-08	2023-11-14 02:24:19.72678-08
668	109	125	2		2023-11-14 02:09:17.270372-08	2023-11-14 02:21:17.270372-08	2023-11-14 02:26:26.151748-08	2023-11-14 02:26:26.151748-08
669	109	125	2		2023-11-14 02:11:17.39826-08	2023-11-14 02:23:17.39826-08	2023-11-14 02:28:26.24558-08	2023-11-14 02:28:26.24558-08
670	109	125	2		2023-11-14 02:12:17.484862-08	2023-11-14 02:24:17.484862-08	2023-11-14 02:29:26.431959-08	2023-11-14 02:29:26.431959-08
671	109	130	2		2023-11-14 02:14:17.211664-08	2023-11-14 02:26:17.211664-08	2023-11-14 02:31:22.638971-08	2023-11-14 02:31:22.638971-08
672	109	130	2		2023-11-14 02:15:17.213996-08	2023-11-14 02:27:17.213996-08	2023-11-14 02:32:42.431928-08	2023-11-14 02:32:42.431928-08
673	109	130	2		2023-11-14 02:16:17.279365-08	2023-11-14 02:28:17.279365-08	2023-11-14 02:33:53.655816-08	2023-11-14 02:33:53.655816-08
674	109	130	2		2023-11-14 02:18:17.274659-08	2023-11-14 02:30:17.274659-08	2023-11-14 02:35:58.025758-08	2023-11-14 02:35:58.025758-08
675	109	130	2		2023-11-14 02:19:17.305874-08	2023-11-14 02:31:17.305874-08	2023-11-14 02:36:44.899871-08	2023-11-14 02:36:44.899871-08
676	109	130	2		2023-11-14 02:21:17.243807-08	2023-11-14 02:33:17.243807-08	2023-11-14 02:38:37.355891-08	2023-11-14 02:38:37.355891-08
677	109	\N	\N		2023-11-14 02:22:17.262191-08	2023-11-14 02:34:17.262191-08	2023-11-14 02:39:29.360237-08	2023-11-14 02:39:29.360237-08
678	109	\N	\N		2023-11-14 02:24:17.229007-08	2023-11-14 02:36:17.229007-08	2023-11-14 02:41:23.531752-08	2023-11-14 02:41:23.531752-08
679	109	125	2		2023-11-14 02:26:17.240865-08	2023-11-14 02:38:17.240865-08	2023-11-14 02:43:20.546357-08	2023-11-14 02:43:20.546357-08
680	109	125	2		2023-11-14 02:27:17.272607-08	2023-11-14 02:39:17.272607-08	2023-11-14 02:44:20.141295-08	2023-11-14 02:44:20.141295-08
681	109	120	2		2023-11-14 02:29:17.180919-08	2023-11-14 02:41:17.180919-08	2023-11-14 02:46:19.360473-08	2023-11-14 02:46:19.360473-08
682	109	120	2		2023-11-14 02:30:17.200623-08	2023-11-14 02:42:17.200623-08	2023-11-14 02:47:20.518502-08	2023-11-14 02:47:20.518502-08
683	109	120	2		2023-11-14 02:31:17.251241-08	2023-11-14 02:43:17.251241-08	2023-11-14 02:48:19.043698-08	2023-11-14 02:48:19.043698-08
684	109	125	2		2023-11-14 02:33:17.406952-08	2023-11-14 02:45:17.406952-08	2023-11-14 02:50:19.144343-08	2023-11-14 02:50:19.144343-08
685	109	125	2		2023-11-14 02:34:17.697211-08	2023-11-14 02:46:17.697211-08	2023-11-14 02:51:19.239603-08	2023-11-14 02:51:19.239603-08
686	109	125	2		2023-11-14 02:36:17.243223-08	2023-11-14 02:48:17.243223-08	2023-11-14 02:53:18.780663-08	2023-11-14 02:53:18.780663-08
687	109	125	1		2023-11-14 02:38:17.314679-08	2023-11-14 02:50:17.314679-08	2023-11-14 02:55:19.433978-08	2023-11-14 02:55:19.433978-08
688	109	125	2		2023-11-14 02:40:17.381243-08	2023-11-14 02:52:17.381243-08	2023-11-14 02:57:20.020901-08	2023-11-14 02:57:20.020901-08
689	109	125	2		2023-11-14 02:42:17.274916-08	2023-11-14 02:54:17.274916-08	2023-11-14 02:59:19.12073-08	2023-11-14 02:59:19.12073-08
690	109	125	2		2023-11-14 02:43:17.374185-08	2023-11-14 02:55:17.374185-08	2023-11-14 03:00:19.359122-08	2023-11-14 03:00:19.359122-08
691	109	120	2		2023-11-14 02:45:17.241112-08	2023-11-14 02:57:17.241112-08	2023-11-14 03:02:19.311615-08	2023-11-14 03:02:19.311615-08
692	109	120	3		2023-11-14 02:46:17.349826-08	2023-11-14 02:58:17.349826-08	2023-11-14 03:03:19.266107-08	2023-11-14 03:03:19.266107-08
693	109	120	3		2023-11-14 02:47:17.510341-08	2023-11-14 02:59:17.510341-08	2023-11-14 03:04:19.966206-08	2023-11-14 03:04:19.966206-08
694	109	120	3		2023-11-14 02:49:17.267532-08	2023-11-14 03:01:17.267532-08	2023-11-14 03:06:19.060737-08	2023-11-14 03:06:19.060737-08
695	109	125	3		2023-11-14 02:51:17.351135-08	2023-11-14 03:03:17.351135-08	2023-11-14 03:08:19.427685-08	2023-11-14 03:08:19.427685-08
696	111	\N	4		2023-11-17 06:41:12.009924-08	2023-11-17 06:53:12.009924-08	2023-11-17 06:58:17.93813-08	2023-11-17 06:58:17.93813-08
697	111	\N	4		2023-11-17 06:43:12.068541-08	2023-11-17 06:55:12.068541-08	2023-11-17 07:00:13.797889-08	2023-11-17 07:00:13.797889-08
698	111	\N	5		2023-11-17 06:45:11.939389-08	2023-11-17 06:57:11.939389-08	2023-11-17 07:02:13.972095-08	2023-11-17 07:02:13.972095-08
699	111	\N	4		2023-11-17 06:46:12.020238-08	2023-11-17 06:58:12.020238-08	2023-11-17 07:03:15.381591-08	2023-11-17 07:03:15.381591-08
700	111	\N	5		2023-11-17 06:47:12.110434-08	2023-11-17 06:59:12.110434-08	2023-11-17 07:04:19.366655-08	2023-11-17 07:04:19.366655-08
701	111	\N	4		2023-11-17 06:48:12.185105-08	2023-11-17 07:00:12.185105-08	2023-11-17 07:05:15.977422-08	2023-11-17 07:05:15.977422-08
702	111	\N	4		2023-11-17 06:50:11.935392-08	2023-11-17 07:02:11.935392-08	2023-11-17 07:07:19.320968-08	2023-11-17 07:07:19.320968-08
703	111	\N	4		2023-11-17 06:52:12.050774-08	2023-11-17 07:04:12.050774-08	2023-11-17 07:09:20.200851-08	2023-11-17 07:09:20.200851-08
704	111	\N	4		2023-11-17 06:54:12.097277-08	2023-11-17 07:06:12.097277-08	2023-11-17 07:11:15.693497-08	2023-11-17 07:11:15.693497-08
705	111	\N	4		2023-11-17 06:56:12.163279-08	2023-11-17 07:08:12.163279-08	2023-11-17 07:13:14.490132-08	2023-11-17 07:13:14.490132-08
706	111	\N	\N		2023-11-17 06:58:12.010862-08	2023-11-17 07:10:12.010862-08	2023-11-17 07:15:13.44962-08	2023-11-17 07:15:13.44962-08
707	111	\N	4		2023-11-17 07:00:12.274767-08	2023-11-17 07:12:12.274767-08	2023-11-17 07:17:20.787395-08	2023-11-17 07:17:20.787395-08
708	111	\N	\N		2023-11-17 07:02:11.950366-08	2023-11-17 07:14:11.950366-08	2023-11-17 07:19:14.027835-08	2023-11-17 07:19:14.027835-08
709	111	\N	4		2023-11-17 07:03:11.95642-08	2023-11-17 07:15:11.95642-08	2023-11-17 07:20:19.634654-08	2023-11-17 07:20:19.634654-08
710	112	\N	4		2023-11-17 07:56:12.245744-08	2023-11-17 08:08:12.245744-08	2023-11-17 08:13:19.335278-08	2023-11-17 08:13:19.335278-08
711	112	\N	5		2023-11-17 07:58:12.051619-08	2023-11-17 08:10:12.051619-08	2023-11-17 08:15:14.02656-08	2023-11-17 08:15:14.02656-08
712	112	\N	4		2023-11-17 07:59:12.166634-08	2023-11-17 08:11:12.166634-08	2023-11-17 08:16:20.207288-08	2023-11-17 08:16:20.207288-08
713	112	\N	4		2023-11-17 08:01:11.984934-08	2023-11-17 08:13:11.984934-08	2023-11-17 08:18:19.02375-08	2023-11-17 08:18:19.02375-08
714	112	\N	5		2023-11-17 08:03:12.009334-08	2023-11-17 08:15:12.009334-08	2023-11-17 08:20:15.216748-08	2023-11-17 08:20:15.216748-08
715	112	\N	4		2023-11-17 08:05:12.00158-08	2023-11-17 08:17:12.00158-08	2023-11-17 08:22:21.278413-08	2023-11-17 08:22:21.278413-08
716	112	\N	4		2023-11-17 08:07:12.015444-08	2023-11-17 08:19:12.015444-08	2023-11-17 08:24:14.380295-08	2023-11-17 08:24:14.380295-08
717	112	\N	\N		2023-11-17 08:08:12.061543-08	2023-11-17 08:20:12.061543-08	2023-11-17 08:25:25.338514-08	2023-11-17 08:25:25.338514-08
718	112	\N	4		2023-11-17 08:09:12.125387-08	2023-11-17 08:21:12.125387-08	2023-11-17 08:26:24.870554-08	2023-11-17 08:26:24.870554-08
719	112	\N	4		2023-11-17 08:11:11.991522-08	2023-11-17 08:23:11.991522-08	2023-11-17 08:28:14.665258-08	2023-11-17 08:28:14.665258-08
720	112	\N	4		2023-11-17 08:13:12.01017-08	2023-11-17 08:25:12.01017-08	2023-11-17 08:30:14.69413-08	2023-11-17 08:30:14.69413-08
721	112	\N	\N		2023-11-17 08:14:12.045125-08	2023-11-17 08:26:12.045125-08	2023-11-17 08:31:24.996307-08	2023-11-17 08:31:24.996307-08
722	112	\N	4		2023-11-17 08:16:11.990167-08	2023-11-17 08:28:11.990167-08	2023-11-17 08:33:19.268649-08	2023-11-17 08:33:19.268649-08
723	112	\N	4		2023-11-17 08:18:12.003354-08	2023-11-17 08:30:12.003354-08	2023-11-17 08:35:17.17124-08	2023-11-17 08:35:17.17124-08
724	120	\N	4		2023-11-20 01:01:05.665758-08	2023-11-20 01:13:05.665758-08	2023-11-20 01:18:10.84307-08	2023-11-20 01:18:10.84307-08
725	120	\N	4		2023-11-20 01:03:05.502939-08	2023-11-20 01:15:05.502939-08	2023-11-20 01:20:06.739124-08	2023-11-20 01:20:06.739124-08
726	120	\N	4		2023-11-20 01:04:05.543843-08	2023-11-20 01:16:05.543843-08	2023-11-20 01:21:11.21959-08	2023-11-20 01:21:11.21959-08
727	120	\N	4		2023-11-20 01:05:05.573425-08	2023-11-20 01:17:05.573425-08	2023-11-20 01:22:06.811085-08	2023-11-20 01:22:06.811085-08
728	120	\N	4		2023-11-20 01:06:05.589179-08	2023-11-20 01:18:05.589179-08	2023-11-20 01:23:10.762179-08	2023-11-20 01:23:10.762179-08
729	120	\N	4		2023-11-20 01:08:05.785117-08	2023-11-20 01:20:05.785117-08	2023-11-20 01:25:09.065749-08	2023-11-20 01:25:09.065749-08
730	120	\N	5		2023-11-20 01:10:05.840923-08	2023-11-20 01:22:05.840923-08	2023-11-20 01:27:11.434743-08	2023-11-20 01:27:11.434743-08
731	120	\N	5		2023-11-20 01:12:05.55985-08	2023-11-20 01:24:05.55985-08	2023-11-20 01:29:09.642393-08	2023-11-20 01:29:09.642393-08
732	121	\N	3		2023-11-20 01:33:05.501317-08	2023-11-20 01:45:05.501317-08	2023-11-20 01:50:06.667928-08	2023-11-20 01:50:06.667928-08
733	121	140	3		2023-11-20 01:34:05.728975-08	2023-11-20 01:46:05.728975-08	2023-11-20 01:51:07.350873-08	2023-11-20 01:51:07.350873-08
734	121	\N	3		2023-11-20 01:35:05.958538-08	2023-11-20 01:47:05.958538-08	2023-11-20 01:52:08.074064-08	2023-11-20 01:52:08.074064-08
735	121	\N	3		2023-11-20 01:37:05.661432-08	2023-11-20 01:49:05.661432-08	2023-11-20 01:54:07.506623-08	2023-11-20 01:54:07.506623-08
736	121	\N	5		2023-11-20 01:39:05.586637-08	2023-11-20 01:51:05.586637-08	2023-11-20 01:56:07.279517-08	2023-11-20 01:56:07.279517-08
737	121	\N	3		2023-11-20 01:40:05.698185-08	2023-11-20 01:52:05.698185-08	2023-11-20 01:57:08.078185-08	2023-11-20 01:57:08.078185-08
738	121	\N	5		2023-11-20 01:41:05.783818-08	2023-11-20 01:53:05.783818-08	2023-11-20 01:58:12.256394-08	2023-11-20 01:58:12.256394-08
739	121	\N	\N		2023-11-20 01:43:05.609894-08	2023-11-20 01:55:05.609894-08	2023-11-20 02:00:12.460554-08	2023-11-20 02:00:12.460554-08
740	121	135	2		2023-11-20 01:45:05.587591-08	2023-11-20 01:57:05.587591-08	2023-11-20 02:02:12.275204-08	2023-11-20 02:02:12.275204-08
741	121	140	2		2023-11-20 01:46:05.601969-08	2023-11-20 01:58:05.601969-08	2023-11-20 02:03:08.59378-08	2023-11-20 02:03:08.59378-08
742	121	\N	\N		2023-11-20 01:48:05.513357-08	2023-11-20 02:00:05.513357-08	2023-11-20 02:05:08.954334-08	2023-11-20 02:05:08.954334-08
743	121	140	2		2023-11-20 01:50:05.686356-08	2023-11-20 02:02:05.686356-08	2023-11-20 02:07:10.277494-08	2023-11-20 02:07:10.277494-08
744	122	\N	5		2023-11-20 02:19:05.598712-08	2023-11-20 02:31:05.598712-08	2023-11-20 02:36:06.790972-08	2023-11-20 02:36:06.790972-08
745	122	\N	3		2023-11-20 02:20:05.715425-08	2023-11-20 02:32:05.715425-08	2023-11-20 02:37:13.962151-08	2023-11-20 02:37:13.962151-08
746	122	\N	\N		2023-11-20 02:22:05.58467-08	2023-11-20 02:34:05.58467-08	2023-11-20 02:39:08.337223-08	2023-11-20 02:39:08.337223-08
747	122	135	1		2023-11-20 02:24:05.508409-08	2023-11-20 02:36:05.508409-08	2023-11-20 02:41:07.824637-08	2023-11-20 02:41:07.824637-08
748	122	135	2		2023-11-20 02:25:05.512618-08	2023-11-20 02:37:05.512618-08	2023-11-20 02:42:07.649184-08	2023-11-20 02:42:07.649184-08
749	122	135	2		2023-11-20 02:27:05.534144-08	2023-11-20 02:39:05.534144-08	2023-11-20 02:44:07.324364-08	2023-11-20 02:44:07.324364-08
750	122	135	2		2023-11-20 02:28:05.537577-08	2023-11-20 02:40:05.537577-08	2023-11-20 02:45:08.438864-08	2023-11-20 02:45:08.438864-08
751	122	135	2		2023-11-20 02:30:05.490305-08	2023-11-20 02:42:05.490305-08	2023-11-20 02:47:09.54286-08	2023-11-20 02:47:09.54286-08
752	122	\N	\N		2023-11-20 02:32:05.485603-08	2023-11-20 02:44:05.485603-08	2023-11-20 02:49:21.218927-08	2023-11-20 02:49:21.218927-08
753	122	\N	\N		2023-11-20 02:33:05.518513-08	2023-11-20 02:45:05.518513-08	2023-11-20 02:50:19.87836-08	2023-11-20 02:50:19.87836-08
754	122	140	2		2023-11-20 02:35:05.483572-08	2023-11-20 02:47:05.483572-08	2023-11-20 02:52:36.884779-08	2023-11-20 02:52:36.884779-08
755	122	140	2		2023-11-20 02:37:05.409209-08	2023-11-20 02:49:05.409209-08	2023-11-20 02:54:21.701441-08	2023-11-20 02:54:21.701441-08
756	123	140	2		2023-11-20 03:46:13.053248-08	2023-11-20 03:58:13.053248-08	2023-11-20 04:03:22.54411-08	2023-11-20 04:03:22.54411-08
757	123	135	2		2023-11-20 03:48:13.263947-08	2023-11-20 04:00:13.263947-08	2023-11-20 04:05:20.672971-08	2023-11-20 04:05:20.672971-08
758	123	135	2		2023-11-20 03:50:12.971035-08	2023-11-20 04:02:12.971035-08	2023-11-20 04:07:20.15064-08	2023-11-20 04:07:20.15064-08
759	123	135	5		2023-11-20 03:52:12.961605-08	2023-11-20 04:04:12.961605-08	2023-11-20 04:09:14.362514-08	2023-11-20 04:09:14.362514-08
760	123	135	5		2023-11-20 03:54:13.249508-08	2023-11-20 04:06:13.249508-08	2023-11-20 04:11:15.47044-08	2023-11-20 04:11:15.47044-08
761	123	135	5		2023-11-20 03:56:12.930741-08	2023-11-20 04:08:12.930741-08	2023-11-20 04:13:13.950623-08	2023-11-20 04:13:13.950623-08
762	124	155	2		2023-11-20 04:14:12.911906-08	2023-11-20 04:26:12.911906-08	2023-11-20 04:31:17.291655-08	2023-11-20 04:31:17.291655-08
763	124	155	3		2023-11-20 04:15:12.941157-08	2023-11-20 04:27:12.941157-08	2023-11-20 04:32:17.365225-08	2023-11-20 04:32:17.365225-08
764	124	155	2		2023-11-20 04:16:12.984217-08	2023-11-20 04:28:12.984217-08	2023-11-20 04:33:18.156194-08	2023-11-20 04:33:18.156194-08
765	124	155	2		2023-11-20 04:18:13.724331-08	2023-11-20 04:30:13.724331-08	2023-11-20 04:35:27.272347-08	2023-11-20 04:35:27.272347-08
766	124	150	2		2023-11-20 04:19:13.852671-08	2023-11-20 04:31:13.852671-08	2023-11-20 04:36:18.128283-08	2023-11-20 04:36:18.128283-08
767	124	155	2		2023-11-20 04:21:13.93226-08	2023-11-20 04:33:13.93226-08	2023-11-20 04:38:17.132373-08	2023-11-20 04:38:17.132373-08
768	124	155	2		2023-11-20 04:23:14.020506-08	2023-11-20 04:35:14.020506-08	2023-11-20 04:40:47.996001-08	2023-11-20 04:40:47.996001-08
769	124	155	2		2023-11-20 04:24:18.143834-08	2023-11-20 04:36:18.143834-08	2023-11-20 04:41:29.622945-08	2023-11-20 04:41:29.622945-08
770	124	160	2		2023-11-20 04:26:12.963633-08	2023-11-20 04:38:12.963633-08	2023-11-20 04:43:23.330967-08	2023-11-20 04:43:23.330967-08
771	124	\N	3		2023-11-20 04:27:12.989614-08	2023-11-20 04:39:12.989614-08	2023-11-20 04:44:22.95163-08	2023-11-20 04:44:22.95163-08
772	124	160	2		2023-11-20 04:28:13.03475-08	2023-11-20 04:40:13.03475-08	2023-11-20 04:45:26.502251-08	2023-11-20 04:45:26.502251-08
773	124	\N	4		2023-11-20 04:29:13.162464-08	2023-11-20 04:41:13.162464-08	2023-11-20 04:46:19.920393-08	2023-11-20 04:46:19.920393-08
774	124	\N	4		2023-11-20 04:31:13.080202-08	2023-11-20 04:43:13.080202-08	2023-11-20 04:48:19.263198-08	2023-11-20 04:48:19.263198-08
775	125	155	2		2023-11-20 18:34:25.800869-08	2023-11-20 18:46:25.800869-08	2023-11-20 18:51:31.676803-08	2023-11-20 18:51:31.676803-08
776	125	155	3		2023-11-20 18:35:25.856593-08	2023-11-20 18:47:25.856593-08	2023-11-20 18:52:29.872688-08	2023-11-20 18:52:29.872688-08
777	125	155	2		2023-11-20 18:37:25.973085-08	2023-11-20 18:49:25.973085-08	2023-11-20 18:54:30.677029-08	2023-11-20 18:54:30.677029-08
778	125	150	2		2023-11-20 18:39:25.930316-08	2023-11-20 18:51:25.930316-08	2023-11-20 18:56:28.475303-08	2023-11-20 18:56:28.475303-08
779	125	155	2		2023-11-20 18:41:25.834641-08	2023-11-20 18:53:25.834641-08	2023-11-20 18:58:28.790642-08	2023-11-20 18:58:28.790642-08
780	125	\N	\N		2023-11-20 18:42:26.000597-08	2023-11-20 18:54:26.000597-08	2023-11-20 18:59:27.442857-08	2023-11-20 18:59:27.442857-08
781	125	155	2		2023-11-20 18:44:25.909373-08	2023-11-20 18:56:25.909373-08	2023-11-20 19:01:27.053519-08	2023-11-20 19:01:27.053519-08
782	125	160	2		2023-11-20 18:46:25.944205-08	2023-11-20 18:58:25.944205-08	2023-11-20 19:03:36.972427-08	2023-11-20 19:03:36.972427-08
783	125	160	2		2023-11-20 18:47:26.161244-08	2023-11-20 18:59:26.161244-08	2023-11-20 19:04:35.787354-08	2023-11-20 19:04:35.787354-08
784	125	155	2		2023-11-20 18:49:26.047277-08	2023-11-20 19:01:26.047277-08	2023-11-20 19:06:41.028839-08	2023-11-20 19:06:41.028839-08
785	125	155	3		2023-11-20 18:51:25.944677-08	2023-11-20 19:03:25.944677-08	2023-11-20 19:08:30.465838-08	2023-11-20 19:08:30.465838-08
786	125	155	3		2023-11-20 18:52:25.986117-08	2023-11-20 19:04:25.986117-08	2023-11-20 19:09:34.015602-08	2023-11-20 19:09:34.015602-08
787	126	155	2		2023-11-20 19:15:26.042561-08	2023-11-20 19:27:26.042561-08	2023-11-20 19:32:31.713649-08	2023-11-20 19:32:31.713649-08
788	126	155	2		2023-11-20 19:17:25.900498-08	2023-11-20 19:29:25.900498-08	2023-11-20 19:34:31.092048-08	2023-11-20 19:34:31.092048-08
789	126	155	2		2023-11-20 19:18:25.954359-08	2023-11-20 19:30:25.954359-08	2023-11-20 19:35:30.627672-08	2023-11-20 19:35:30.627672-08
790	126	150	2		2023-11-20 19:20:26.077638-08	2023-11-20 19:32:26.077638-08	2023-11-20 19:37:29.309486-08	2023-11-20 19:37:29.309486-08
791	126	155	2		2023-11-20 19:22:25.890997-08	2023-11-20 19:34:25.890997-08	2023-11-20 19:39:29.456702-08	2023-11-20 19:39:29.456702-08
792	126	155	2		2023-11-20 19:23:25.977252-08	2023-11-20 19:35:25.977252-08	2023-11-20 19:40:27.543266-08	2023-11-20 19:40:27.543266-08
793	126	155	2		2023-11-20 19:25:25.931595-08	2023-11-20 19:37:25.931595-08	2023-11-20 19:42:34.138739-08	2023-11-20 19:42:34.138739-08
794	126	160	2		2023-11-20 19:27:25.891776-08	2023-11-20 19:39:25.891776-08	2023-11-20 19:44:36.768416-08	2023-11-20 19:44:36.768416-08
795	126	155	2		2023-11-20 19:28:25.94975-08	2023-11-20 19:40:25.94975-08	2023-11-20 19:45:34.714403-08	2023-11-20 19:45:34.714403-08
796	126	160	2		2023-11-20 19:30:25.93301-08	2023-11-20 19:42:25.93301-08	2023-11-20 19:47:36.726421-08	2023-11-20 19:47:36.726421-08
797	126	155	3		2023-11-20 19:32:25.905158-08	2023-11-20 19:44:25.905158-08	2023-11-20 19:49:29.862389-08	2023-11-20 19:49:29.862389-08
798	126	160	3		2023-11-20 19:33:25.912385-08	2023-11-20 19:45:25.912385-08	2023-11-20 19:50:28.958886-08	2023-11-20 19:50:28.958886-08
799	127	\N	\N		2023-11-20 22:47:20.954947-08	2023-11-20 22:59:20.954947-08	2023-11-20 23:04:24.694019-08	2023-11-20 23:04:24.694019-08
800	127	\N	\N		2023-11-20 22:49:20.939742-08	2023-11-20 23:01:20.939742-08	2023-11-20 23:06:24.967042-08	2023-11-20 23:06:24.967042-08
801	127	\N	\N		2023-11-20 22:50:20.967667-08	2023-11-20 23:02:20.967667-08	2023-11-20 23:07:25.154359-08	2023-11-20 23:07:25.154359-08
802	127	\N	\N		2023-11-20 22:52:20.695443-08	2023-11-20 23:04:20.695443-08	2023-11-20 23:09:27.745045-08	2023-11-20 23:09:27.745045-08
803	127	\N	\N		2023-11-20 22:53:20.800786-08	2023-11-20 23:05:20.800786-08	2023-11-20 23:10:31.482036-08	2023-11-20 23:10:31.482036-08
804	127	\N	\N		2023-11-20 22:54:20.995953-08	2023-11-20 23:06:20.995953-08	2023-11-20 23:11:33.911029-08	2023-11-20 23:11:33.911029-08
805	127	\N	\N		2023-11-20 22:56:20.959377-08	2023-11-20 23:08:20.959377-08	2023-11-20 23:13:33.372505-08	2023-11-20 23:13:33.372505-08
806	127	155	2		2023-11-20 22:58:20.954303-08	2023-11-20 23:10:20.954303-08	2023-11-20 23:15:33.001713-08	2023-11-20 23:15:33.001713-08
807	128	\N	\N		2023-11-20 23:43:22.858967-08	2023-11-20 23:55:22.858967-08	2023-11-21 00:00:26.546747-08	2023-11-21 00:00:26.546747-08
808	128	\N	\N		2023-11-20 23:45:22.944159-08	2023-11-20 23:57:22.944159-08	2023-11-21 00:02:26.575287-08	2023-11-21 00:02:26.575287-08
809	128	\N	\N		2023-11-20 23:47:22.79515-08	2023-11-20 23:59:22.79515-08	2023-11-21 00:04:26.555021-08	2023-11-21 00:04:26.555021-08
810	128	\N	\N		2023-11-20 23:48:22.932528-08	2023-11-21 00:00:22.932528-08	2023-11-21 00:05:30.489879-08	2023-11-21 00:05:30.489879-08
811	128	\N	\N		2023-11-20 23:50:22.799515-08	2023-11-21 00:02:22.799515-08	2023-11-21 00:07:34.862459-08	2023-11-21 00:07:34.862459-08
812	128	\N	\N		2023-11-20 23:51:22.970021-08	2023-11-21 00:03:22.970021-08	2023-11-21 00:08:33.528652-08	2023-11-21 00:08:33.528652-08
813	128	\N	\N		2023-11-20 23:53:22.875529-08	2023-11-21 00:05:22.875529-08	2023-11-21 00:10:34.931234-08	2023-11-21 00:10:34.931234-08
814	128	155	2		2023-11-20 23:55:22.871174-08	2023-11-21 00:07:22.871174-08	2023-11-21 00:12:30.520902-08	2023-11-21 00:12:30.520902-08
815	129	\N	\N		2023-11-21 00:09:22.898962-08	2023-11-21 00:21:22.898962-08	2023-11-21 00:26:26.984349-08	2023-11-21 00:26:26.984349-08
816	129	\N	\N		2023-11-21 00:11:22.910183-08	2023-11-21 00:23:22.910183-08	2023-11-21 00:28:26.635116-08	2023-11-21 00:28:26.635116-08
817	129	\N	\N		2023-11-21 00:13:22.810982-08	2023-11-21 00:25:22.810982-08	2023-11-21 00:30:26.859781-08	2023-11-21 00:30:26.859781-08
818	129	\N	\N		2023-11-21 00:14:23.011235-08	2023-11-21 00:26:23.011235-08	2023-11-21 00:31:28.081299-08	2023-11-21 00:31:28.081299-08
819	129	\N	\N		2023-11-21 00:16:22.822225-08	2023-11-21 00:28:22.822225-08	2023-11-21 00:33:33.278952-08	2023-11-21 00:33:33.278952-08
820	129	\N	\N		2023-11-21 00:18:22.777417-08	2023-11-21 00:30:22.777417-08	2023-11-21 00:35:32.526738-08	2023-11-21 00:35:32.526738-08
821	129	\N	\N		2023-11-21 00:19:22.795296-08	2023-11-21 00:31:22.795296-08	2023-11-21 00:36:33.173763-08	2023-11-21 00:36:33.173763-08
822	129	155	2		2023-11-21 00:20:22.801197-08	2023-11-21 00:32:22.801197-08	2023-11-21 00:37:33.755942-08	2023-11-21 00:37:33.755942-08
823	130	130	2		2023-11-21 02:07:20.359251-08	2023-11-21 02:19:20.359251-08	2023-11-21 02:24:22.413453-08	2023-11-21 02:24:22.413453-08
824	130	130	2		2023-11-21 02:09:20.30701-08	2023-11-21 02:21:20.30701-08	2023-11-21 02:26:25.246506-08	2023-11-21 02:26:25.246506-08
825	130	140	2		2023-11-21 02:10:20.630044-08	2023-11-21 02:22:20.630044-08	2023-11-21 02:27:22.781888-08	2023-11-21 02:27:22.781888-08
826	130	140	2		2023-11-21 02:12:20.328854-08	2023-11-21 02:24:20.328854-08	2023-11-21 02:29:35.877185-08	2023-11-21 02:29:35.877185-08
827	130	140	2		2023-11-21 02:14:20.291415-08	2023-11-21 02:26:20.291415-08	2023-11-21 02:31:26.49882-08	2023-11-21 02:31:26.49882-08
828	130	135	2		2023-11-21 02:15:20.307123-08	2023-11-21 02:27:20.307123-08	2023-11-21 02:32:25.707236-08	2023-11-21 02:32:25.707236-08
829	130	135	2		2023-11-21 02:16:20.348425-08	2023-11-21 02:28:20.348425-08	2023-11-21 02:33:25.608867-08	2023-11-21 02:33:25.608867-08
830	130	135	2		2023-11-21 02:18:20.375276-08	2023-11-21 02:30:20.375276-08	2023-11-21 02:35:22.544087-08	2023-11-21 02:35:22.544087-08
831	130	135	2		2023-11-21 02:20:20.392966-08	2023-11-21 02:32:20.392966-08	2023-11-21 02:37:22.403191-08	2023-11-21 02:37:22.403191-08
832	130	\N	\N		2023-11-21 02:22:20.783946-08	2023-11-21 02:34:20.783946-08	2023-11-21 02:39:23.436037-08	2023-11-21 02:39:23.436037-08
833	130	\N	\N		2023-11-21 02:24:20.332571-08	2023-11-21 02:36:20.332571-08	2023-11-21 02:41:22.153775-08	2023-11-21 02:41:22.153775-08
834	130	\N	\N		2023-11-21 04:41:48.224551-08	2023-11-21 04:53:48.224551-08	2023-11-21 04:58:50.065987-08	2023-11-21 04:58:50.065987-08
835	130	150	2		2023-11-21 04:42:48.318928-08	2023-11-21 04:54:48.318928-08	2023-11-21 04:59:53.0119-08	2023-11-21 04:59:53.0119-08
836	130	150	2		2023-11-21 04:44:48.817416-08	2023-11-21 04:56:48.817416-08	2023-11-21 05:01:56.022605-08	2023-11-21 05:01:56.022605-08
837	130	150	2		2023-11-21 04:46:48.694834-08	2023-11-21 04:58:48.694834-08	2023-11-21 05:03:54.957946-08	2023-11-21 05:03:54.957946-08
838	130	145	2		2023-11-21 04:47:48.766492-08	2023-11-21 04:59:48.766492-08	2023-11-21 05:04:51.297096-08	2023-11-21 05:04:51.297096-08
839	130	145	2		2023-11-21 04:49:48.712309-08	2023-11-21 05:01:48.712309-08	2023-11-21 05:06:51.244073-08	2023-11-21 05:06:51.244073-08
840	130	145	3		2023-11-21 04:50:48.751943-08	2023-11-21 05:02:48.751943-08	2023-11-21 05:07:52.048997-08	2023-11-21 05:07:52.048997-08
841	130	145	3		2023-11-21 04:51:48.860829-08	2023-11-21 05:03:48.860829-08	2023-11-21 05:08:51.74381-08	2023-11-21 05:08:51.74381-08
842	130	145	3		2023-11-21 04:53:48.845078-08	2023-11-21 05:05:48.845078-08	2023-11-21 05:10:51.609765-08	2023-11-21 05:10:51.609765-08
843	130	145	2		2023-11-21 04:55:49.01789-08	2023-11-21 05:07:49.01789-08	2023-11-21 05:12:53.480751-08	2023-11-21 05:12:53.480751-08
844	130	145	3		2023-11-21 04:57:48.898557-08	2023-11-21 05:09:48.898557-08	2023-11-21 05:14:54.175962-08	2023-11-21 05:14:54.175962-08
845	130	150	2		2023-11-21 04:59:48.782253-08	2023-11-21 05:11:48.782253-08	2023-11-21 05:16:54.575806-08	2023-11-21 05:16:54.575806-08
846	130	145	2		2023-11-21 05:01:48.911303-08	2023-11-21 05:13:48.911303-08	2023-11-21 05:18:52.404125-08	2023-11-21 05:18:52.404125-08
847	130	135	2		2023-11-21 05:02:48.987379-08	2023-11-21 05:14:48.987379-08	2023-11-21 05:19:54.27583-08	2023-11-21 05:19:54.27583-08
848	130	135	2		2023-11-21 05:04:48.713215-08	2023-11-21 05:16:48.713215-08	2023-11-21 05:21:50.672934-08	2023-11-21 05:21:50.672934-08
849	130	135	2		2023-11-21 05:05:48.736255-08	2023-11-21 05:17:48.736255-08	2023-11-21 05:22:51.843241-08	2023-11-21 05:22:51.843241-08
850	130	140	2		2023-11-21 05:07:48.767533-08	2023-11-21 05:19:48.767533-08	2023-11-21 05:24:50.868655-08	2023-11-21 05:24:50.868655-08
851	130	140	2		2023-11-21 05:09:48.710319-08	2023-11-21 05:21:48.710319-08	2023-11-21 05:26:51.251767-08	2023-11-21 05:26:51.251767-08
852	130	135	2		2023-11-21 05:10:48.778731-08	2023-11-21 05:22:48.778731-08	2023-11-21 05:27:51.572287-08	2023-11-21 05:27:51.572287-08
853	130	135	2		2023-11-21 05:12:48.859684-08	2023-11-21 05:24:48.859684-08	2023-11-21 05:29:51.769736-08	2023-11-21 05:29:51.769736-08
854	130	135	2		2023-11-21 05:13:48.874946-08	2023-11-21 05:25:48.874946-08	2023-11-21 05:30:56.744879-08	2023-11-21 05:30:56.744879-08
855	130	140	2		2023-11-21 05:15:48.707544-08	2023-11-21 05:27:48.707544-08	2023-11-21 05:32:52.585904-08	2023-11-21 05:32:52.585904-08
856	130	140	2		2023-11-21 05:16:48.773939-08	2023-11-21 05:28:48.773939-08	2023-11-21 05:33:56.32562-08	2023-11-21 05:33:56.32562-08
857	130	140	2		2023-11-21 05:17:48.896386-08	2023-11-21 05:29:48.896386-08	2023-11-21 05:34:59.210893-08	2023-11-21 05:34:59.210893-08
858	130	145	2		2023-11-21 05:19:48.795232-08	2023-11-21 05:31:48.795232-08	2023-11-21 05:36:58.981288-08	2023-11-21 05:36:58.981288-08
859	130	145	2		2023-11-21 05:20:48.840429-08	2023-11-21 05:32:48.840429-08	2023-11-21 05:37:58.261709-08	2023-11-21 05:37:58.261709-08
860	130	145	2		2023-11-21 05:22:48.70435-08	2023-11-21 05:34:48.70435-08	2023-11-21 05:39:54.066586-08	2023-11-21 05:39:54.066586-08
861	130	145	1		2023-11-21 05:23:48.713251-08	2023-11-21 05:35:48.713251-08	2023-11-21 05:40:53.411369-08	2023-11-21 05:40:53.411369-08
862	130	145	1		2023-11-21 05:24:48.751865-08	2023-11-21 05:36:48.751865-08	2023-11-21 05:41:53.115165-08	2023-11-21 05:41:53.115165-08
863	130	145	1		2023-11-21 05:26:48.744702-08	2023-11-21 05:38:48.744702-08	2023-11-21 05:43:52.76908-08	2023-11-21 05:43:52.76908-08
864	130	150	2		2023-11-21 05:27:48.947956-08	2023-11-21 05:39:48.947956-08	2023-11-21 05:44:53.118943-08	2023-11-21 05:44:53.118943-08
865	130	150	2		2023-11-21 05:29:48.99688-08	2023-11-21 05:41:48.99688-08	2023-11-21 05:46:53.402536-08	2023-11-21 05:46:53.402536-08
866	130	140	2		2023-11-21 05:31:48.795779-08	2023-11-21 05:43:48.795779-08	2023-11-21 05:48:52.210251-08	2023-11-21 05:48:52.210251-08
867	130	140	3		2023-11-21 05:33:48.863107-08	2023-11-21 05:45:48.863107-08	2023-11-21 05:50:52.538977-08	2023-11-21 05:50:52.538977-08
868	130	155	3		2023-11-21 05:35:48.826428-08	2023-11-21 05:47:48.826428-08	2023-11-21 05:52:52.296244-08	2023-11-21 05:52:52.296244-08
869	130	155	3		2023-11-21 05:37:48.858119-08	2023-11-21 05:49:48.858119-08	2023-11-21 05:54:51.648695-08	2023-11-21 05:54:51.648695-08
870	130	155	3		2023-11-21 05:39:48.739145-08	2023-11-21 05:51:48.739145-08	2023-11-21 05:56:51.661483-08	2023-11-21 05:56:51.661483-08
871	130	155	3		2023-11-21 05:40:48.769281-08	2023-11-21 05:52:48.769281-08	2023-11-21 05:57:51.571485-08	2023-11-21 05:57:51.571485-08
872	130	155	2		2023-11-21 05:41:48.996046-08	2023-11-21 05:53:48.996046-08	2023-11-21 05:58:52.17893-08	2023-11-21 05:58:52.17893-08
873	130	\N	3		2023-11-21 05:43:48.685863-08	2023-11-21 05:55:48.685863-08	2023-11-21 06:00:51.216253-08	2023-11-21 06:00:51.216253-08
874	130	\N	\N		2023-11-21 05:44:48.704063-08	2023-11-21 05:56:48.704063-08	2023-11-21 06:01:51.125184-08	2023-11-21 06:01:51.125184-08
875	130	\N	\N		2023-11-21 05:45:48.719852-08	2023-11-21 05:57:48.719852-08	2023-11-21 06:02:51.179164-08	2023-11-21 06:02:51.179164-08
876	130	140	2		2023-11-21 05:46:48.77807-08	2023-11-21 05:58:48.77807-08	2023-11-21 06:03:51.268518-08	2023-11-21 06:03:51.268518-08
877	130	140	2		2023-11-21 05:47:48.861293-08	2023-11-21 05:59:48.861293-08	2023-11-21 06:04:53.184186-08	2023-11-21 06:04:53.184186-08
878	130	140	2		2023-11-21 05:48:48.962601-08	2023-11-21 06:00:48.962601-08	2023-11-21 06:05:53.698385-08	2023-11-21 06:05:53.698385-08
879	130	140	2		2023-11-21 05:50:48.717858-08	2023-11-21 06:02:48.717858-08	2023-11-21 06:07:51.771025-08	2023-11-21 06:07:51.771025-08
880	130	140	3		2023-11-21 05:51:48.777869-08	2023-11-21 06:03:48.777869-08	2023-11-21 06:08:53.187856-08	2023-11-21 06:08:53.187856-08
881	130	140	2		2023-11-21 05:52:48.807723-08	2023-11-21 06:04:48.807723-08	2023-11-21 06:09:52.865053-08	2023-11-21 06:09:52.865053-08
882	130	145	2		2023-11-21 05:54:48.772205-08	2023-11-21 06:06:48.772205-08	2023-11-21 06:11:54.435767-08	2023-11-21 06:11:54.435767-08
883	130	140	3		2023-11-21 05:55:48.840614-08	2023-11-21 06:07:48.840614-08	2023-11-21 06:12:52.659553-08	2023-11-21 06:12:52.659553-08
884	130	140	3		2023-11-21 05:57:48.888618-08	2023-11-21 06:09:48.888618-08	2023-11-21 06:14:52.361936-08	2023-11-21 06:14:52.361936-08
885	130	135	2		2023-11-21 05:59:48.850942-08	2023-11-21 06:11:48.850942-08	2023-11-21 06:16:50.512274-08	2023-11-21 06:16:50.512274-08
886	130	130	2		2023-11-21 06:01:48.76043-08	2023-11-21 06:13:48.76043-08	2023-11-21 06:18:50.546332-08	2023-11-21 06:18:50.546332-08
887	130	130	2		2023-11-21 06:03:48.728946-08	2023-11-21 06:15:48.728946-08	2023-11-21 06:20:51.473845-08	2023-11-21 06:20:51.473845-08
888	130	140	2		2023-11-21 06:05:48.817407-08	2023-11-21 06:17:48.817407-08	2023-11-21 06:22:51.152658-08	2023-11-21 06:22:51.152658-08
889	130	140	2		2023-11-21 06:06:48.839404-08	2023-11-21 06:18:48.839404-08	2023-11-21 06:23:57.291704-08	2023-11-21 06:23:57.291704-08
890	130	140	2		2023-11-21 06:08:48.731674-08	2023-11-21 06:20:48.731674-08	2023-11-21 06:25:56.291645-08	2023-11-21 06:25:56.291645-08
891	130	140	1		2023-11-21 06:09:48.832449-08	2023-11-21 06:21:48.832449-08	2023-11-21 06:26:58.166026-08	2023-11-21 06:26:58.166026-08
892	130	140	2		2023-11-21 06:10:48.877898-08	2023-11-21 06:22:48.877898-08	2023-11-21 06:27:56.862082-08	2023-11-21 06:27:56.862082-08
893	130	140	1		2023-11-21 06:11:48.931819-08	2023-11-21 06:23:48.931819-08	2023-11-21 06:28:56.30235-08	2023-11-21 06:28:56.30235-08
894	130	145	1		2023-11-21 06:13:48.750209-08	2023-11-21 06:25:48.750209-08	2023-11-21 06:30:54.887378-08	2023-11-21 06:30:54.887378-08
895	130	\N	2		2023-11-21 06:14:48.872701-08	2023-11-21 06:26:48.872701-08	2023-11-21 06:31:54.923799-08	2023-11-21 06:31:54.923799-08
896	130	\N	\N		2023-11-21 06:16:48.960205-08	2023-11-21 06:28:48.960205-08	2023-11-21 06:33:53.366383-08	2023-11-21 06:33:53.366383-08
897	130	\N	\N		2023-11-21 06:17:49.048704-08	2023-11-21 06:29:49.048704-08	2023-11-21 06:34:55.66821-08	2023-11-21 06:34:55.66821-08
898	130	145	2		2023-11-21 06:19:48.743994-08	2023-11-21 06:31:48.743994-08	2023-11-21 06:36:59.427203-08	2023-11-21 06:36:59.427203-08
899	130	140	2		2023-11-21 06:21:49.131022-08	2023-11-21 06:33:49.131022-08	2023-11-21 06:38:54.818158-08	2023-11-21 06:38:54.818158-08
900	130	140	2		2023-11-21 06:22:49.160787-08	2023-11-21 06:34:49.160787-08	2023-11-21 06:39:55.291018-08	2023-11-21 06:39:55.291018-08
901	130	140	2		2023-11-21 06:24:49.060763-08	2023-11-21 06:36:49.060763-08	2023-11-21 06:41:56.536671-08	2023-11-21 06:41:56.536671-08
902	130	140	2		2023-11-21 06:26:48.761835-08	2023-11-21 06:38:48.761835-08	2023-11-21 06:43:55.125825-08	2023-11-21 06:43:55.125825-08
903	130	\N	\N		2023-11-21 06:28:48.713857-08	2023-11-21 06:40:48.713857-08	2023-11-21 06:45:54.50498-08	2023-11-21 06:45:54.50498-08
904	130	\N	\N		2023-11-21 06:29:48.748409-08	2023-11-21 06:41:48.748409-08	2023-11-21 06:46:54.171895-08	2023-11-21 06:46:54.171895-08
905	130	\N	\N		2023-11-21 06:30:48.77381-08	2023-11-21 06:42:48.77381-08	2023-11-21 06:47:54.31013-08	2023-11-21 06:47:54.31013-08
906	130	\N	\N		2023-11-21 06:32:48.75722-08	2023-11-21 06:44:48.75722-08	2023-11-21 06:49:51.569382-08	2023-11-21 06:49:51.569382-08
907	130	\N	\N		2023-11-21 06:34:48.744804-08	2023-11-21 06:46:48.744804-08	2023-11-21 06:51:49.587344-08	2023-11-21 06:51:49.587344-08
908	130	\N	\N		2023-11-21 06:36:48.699861-08	2023-11-21 06:48:48.699861-08	2023-11-21 06:53:53.151389-08	2023-11-21 06:53:53.151389-08
909	130	\N	\N		2023-11-21 06:37:48.752784-08	2023-11-21 06:49:48.752784-08	2023-11-21 06:54:49.295262-08	2023-11-21 06:54:49.295262-08
910	130	\N	\N		2023-11-21 06:38:48.807666-08	2023-11-21 06:50:48.807666-08	2023-11-21 06:55:49.512257-08	2023-11-21 06:55:49.512257-08
911	130	\N	\N		2023-11-21 06:39:48.937325-08	2023-11-21 06:51:48.937325-08	2023-11-21 06:56:50.040436-08	2023-11-21 06:56:50.040436-08
912	130	\N	\N		2023-11-21 06:41:48.847156-08	2023-11-21 06:53:48.847156-08	2023-11-21 06:58:50.450217-08	2023-11-21 06:58:50.450217-08
913	130	135	2		2023-11-21 06:43:48.771749-08	2023-11-21 06:55:48.771749-08	2023-11-21 07:00:50.927754-08	2023-11-21 07:00:50.927754-08
914	130	135	2		2023-11-21 06:44:49.024381-08	2023-11-21 06:56:49.024381-08	2023-11-21 07:01:52.11898-08	2023-11-21 07:01:52.11898-08
915	130	135	2		2023-11-21 06:46:48.674766-08	2023-11-21 06:58:48.674766-08	2023-11-21 07:03:51.260312-08	2023-11-21 07:03:51.260312-08
916	130	140	2		2023-11-21 06:48:48.709409-08	2023-11-21 07:00:48.709409-08	2023-11-21 07:05:51.480127-08	2023-11-21 07:05:51.480127-08
917	130	135	2		2023-11-21 06:50:48.678343-08	2023-11-21 07:02:48.678343-08	2023-11-21 07:07:51.190322-08	2023-11-21 07:07:51.190322-08
918	130	135	2		2023-11-21 06:51:48.688535-08	2023-11-21 07:03:48.688535-08	2023-11-21 07:08:50.979857-08	2023-11-21 07:08:50.979857-08
919	130	135	2		2023-11-21 06:52:48.889255-08	2023-11-21 07:04:48.889255-08	2023-11-21 07:09:51.298527-08	2023-11-21 07:09:51.298527-08
920	130	140	2		2023-11-21 06:54:48.708394-08	2023-11-21 07:06:48.708394-08	2023-11-21 07:11:51.991601-08	2023-11-21 07:11:51.991601-08
921	130	140	2		2023-11-21 06:55:49.431801-08	2023-11-21 07:07:49.431801-08	2023-11-21 07:12:53.860902-08	2023-11-21 07:12:53.860902-08
922	130	135	2		2023-11-21 06:57:49.193561-08	2023-11-21 07:09:49.193561-08	2023-11-21 07:14:52.169936-08	2023-11-21 07:14:52.169936-08
923	130	135	3		2023-11-21 06:59:48.931838-08	2023-11-21 07:11:48.931838-08	2023-11-21 07:16:51.667359-08	2023-11-21 07:16:51.667359-08
924	130	135	3		2023-11-21 07:00:49.236951-08	2023-11-21 07:12:49.236951-08	2023-11-21 07:17:52.943998-08	2023-11-21 07:17:52.943998-08
925	130	135	3		2023-11-21 07:02:48.748442-08	2023-11-21 07:14:48.748442-08	2023-11-21 07:19:59.548671-08	2023-11-21 07:19:59.548671-08
926	130	135	3		2023-11-21 07:03:48.757182-08	2023-11-21 07:15:48.757182-08	2023-11-21 07:20:53.116675-08	2023-11-21 07:20:53.116675-08
927	130	135	3		2023-11-21 07:04:48.790651-08	2023-11-21 07:16:48.790651-08	2023-11-21 07:21:57.640653-08	2023-11-21 07:21:57.640653-08
928	130	135	3		2023-11-21 07:05:48.828751-08	2023-11-21 07:17:48.828751-08	2023-11-21 07:22:58.085648-08	2023-11-21 07:22:58.085648-08
929	130	135	3		2023-11-21 07:06:48.83169-08	2023-11-21 07:18:48.83169-08	2023-11-21 07:23:57.045415-08	2023-11-21 07:23:57.045415-08
930	130	135	2		2023-11-21 07:08:48.803188-08	2023-11-21 07:20:48.803188-08	2023-11-21 07:25:54.185289-08	2023-11-21 07:25:54.185289-08
931	130	135	2		2023-11-21 07:09:48.937419-08	2023-11-21 07:21:48.937419-08	2023-11-21 07:26:53.399499-08	2023-11-21 07:26:53.399499-08
932	130	135	2		2023-11-21 07:11:49.108844-08	2023-11-21 07:23:49.108844-08	2023-11-21 07:28:53.081208-08	2023-11-21 07:28:53.081208-08
933	130	125	2		2023-11-21 07:13:48.771726-08	2023-11-21 07:25:48.771726-08	2023-11-21 07:30:51.722264-08	2023-11-21 07:30:51.722264-08
934	130	125	2		2023-11-21 07:15:49.041607-08	2023-11-21 07:27:49.041607-08	2023-11-21 07:32:54.766895-08	2023-11-21 07:32:54.766895-08
935	130	125	2		2023-11-21 07:17:48.980397-08	2023-11-21 07:29:48.980397-08	2023-11-21 07:34:55.562449-08	2023-11-21 07:34:55.562449-08
936	130	125	2		2023-11-21 07:19:48.764503-08	2023-11-21 07:31:48.764503-08	2023-11-21 07:36:55.276518-08	2023-11-21 07:36:55.276518-08
937	130	125	2		2023-11-21 07:20:48.778984-08	2023-11-21 07:32:48.778984-08	2023-11-21 07:37:54.1065-08	2023-11-21 07:37:54.1065-08
938	130	\N	\N		2023-11-21 07:22:48.716716-08	2023-11-21 07:34:48.716716-08	2023-11-21 07:39:54.651481-08	2023-11-21 07:39:54.651481-08
939	130	\N	\N		2023-11-21 07:23:48.780753-08	2023-11-21 07:35:48.780753-08	2023-11-21 07:40:53.365479-08	2023-11-21 07:40:53.365479-08
940	130	\N	\N		2023-11-21 07:25:48.801496-08	2023-11-21 07:37:48.801496-08	2023-11-21 07:42:52.66344-08	2023-11-21 07:42:52.66344-08
941	130	\N	\N		2023-11-21 07:26:48.876793-08	2023-11-21 07:38:48.876793-08	2023-11-21 07:43:52.987323-08	2023-11-21 07:43:52.987323-08
942	130	\N	\N		2023-11-21 07:28:48.718073-08	2023-11-21 07:40:48.718073-08	2023-11-21 07:45:52.318497-08	2023-11-21 07:45:52.318497-08
943	130	\N	\N		2023-11-21 07:30:48.901798-08	2023-11-21 07:42:48.901798-08	2023-11-21 07:47:51.634303-08	2023-11-21 07:47:51.634303-08
944	130	\N	\N		2023-11-21 07:32:48.881324-08	2023-11-21 07:44:48.881324-08	2023-11-21 07:49:51.598495-08	2023-11-21 07:49:51.598495-08
945	130	\N	\N		2023-11-21 07:34:48.860257-08	2023-11-21 07:46:48.860257-08	2023-11-21 07:51:59.086693-08	2023-11-21 07:51:59.086693-08
946	130	\N	\N		2023-11-21 07:36:48.769174-08	2023-11-21 07:48:48.769174-08	2023-11-21 07:53:55.306522-08	2023-11-21 07:53:55.306522-08
947	130	\N	\N		2023-11-21 07:37:48.784264-08	2023-11-21 07:49:48.784264-08	2023-11-21 07:54:51.842048-08	2023-11-21 07:54:51.842048-08
948	130	\N	\N		2023-11-21 07:38:48.931632-08	2023-11-21 07:50:48.931632-08	2023-11-21 07:55:52.368708-08	2023-11-21 07:55:52.368708-08
949	130	\N	\N		2023-11-21 07:40:48.904317-08	2023-11-21 07:52:48.904317-08	2023-11-21 07:57:52.934725-08	2023-11-21 07:57:52.934725-08
950	130	\N	\N		2023-11-21 07:42:48.865672-08	2023-11-21 07:54:48.865672-08	2023-11-21 07:59:51.34819-08	2023-11-21 07:59:51.34819-08
951	130	\N	\N		2023-11-21 07:44:48.779031-08	2023-11-21 07:56:48.779031-08	2023-11-21 08:01:51.2638-08	2023-11-21 08:01:51.2638-08
952	130	\N	\N		2023-11-21 07:46:48.953708-08	2023-11-21 07:58:48.953708-08	2023-11-21 08:03:51.913336-08	2023-11-21 08:03:51.913336-08
953	130	140	1		2023-11-21 07:48:48.912382-08	2023-11-21 08:00:48.912382-08	2023-11-21 08:05:52.03479-08	2023-11-21 08:05:52.03479-08
954	130	140	1		2023-11-21 07:50:48.884182-08	2023-11-21 08:02:48.884182-08	2023-11-21 08:07:52.473991-08	2023-11-21 08:07:52.473991-08
955	130	140	1		2023-11-21 07:52:48.771599-08	2023-11-21 08:04:48.771599-08	2023-11-21 08:09:53.72614-08	2023-11-21 08:09:53.72614-08
956	130	140	2		2023-11-21 07:54:48.813323-08	2023-11-21 08:06:48.813323-08	2023-11-21 08:11:53.627874-08	2023-11-21 08:11:53.627874-08
957	130	140	2		2023-11-21 07:56:48.950372-08	2023-11-21 08:08:48.950372-08	2023-11-21 08:13:54.262038-08	2023-11-21 08:13:54.262038-08
958	130	\N	2		2023-11-21 07:58:48.812985-08	2023-11-21 08:10:48.812985-08	2023-11-21 08:15:52.941821-08	2023-11-21 08:15:52.941821-08
959	130	\N	2		2023-11-21 07:59:48.835528-08	2023-11-21 08:11:48.835528-08	2023-11-21 08:16:51.927631-08	2023-11-21 08:16:51.927631-08
960	130	\N	\N		2023-11-21 08:00:49.078786-08	2023-11-21 08:12:49.078786-08	2023-11-21 08:17:52.865121-08	2023-11-21 08:17:52.865121-08
961	130	\N	\N		2023-11-21 08:02:48.75674-08	2023-11-21 08:14:48.75674-08	2023-11-21 08:19:51.430539-08	2023-11-21 08:19:51.430539-08
962	130	\N	\N		2023-11-21 08:03:48.855671-08	2023-11-21 08:15:48.855671-08	2023-11-21 08:20:51.533866-08	2023-11-21 08:20:51.533866-08
963	130	\N	\N		2023-11-21 08:04:49.193329-08	2023-11-21 08:16:49.193329-08	2023-11-21 08:21:51.962876-08	2023-11-21 08:21:51.962876-08
964	130	\N	\N		2023-11-21 08:06:48.84151-08	2023-11-21 08:18:48.84151-08	2023-11-21 08:23:51.503311-08	2023-11-21 08:23:51.503311-08
965	130	\N	\N		2023-11-21 08:08:48.790391-08	2023-11-21 08:20:48.790391-08	2023-11-21 08:25:53.433154-08	2023-11-21 08:25:53.433154-08
966	130	\N	\N		2023-11-21 08:10:48.831291-08	2023-11-21 08:22:48.831291-08	2023-11-21 08:27:52.527058-08	2023-11-21 08:27:52.527058-08
967	130	145	2		2023-11-21 08:12:48.79926-08	2023-11-21 08:24:48.79926-08	2023-11-21 08:29:52.400312-08	2023-11-21 08:29:52.400312-08
968	130	145	2		2023-11-21 08:14:48.839608-08	2023-11-21 08:26:48.839608-08	2023-11-21 08:31:54.785396-08	2023-11-21 08:31:54.785396-08
969	130	145	3		2023-11-21 08:16:48.714706-08	2023-11-21 08:28:48.714706-08	2023-11-21 08:33:58.442828-08	2023-11-21 08:33:58.442828-08
970	130	145	3		2023-11-21 08:17:48.922467-08	2023-11-21 08:29:48.922467-08	2023-11-21 08:34:57.279425-08	2023-11-21 08:34:57.279425-08
971	130	145	3		2023-11-21 08:19:48.773624-08	2023-11-21 08:31:48.773624-08	2023-11-21 08:36:56.195155-08	2023-11-21 08:36:56.195155-08
972	130	\N	3		2023-11-21 08:20:49.030677-08	2023-11-21 08:32:49.030677-08	2023-11-21 08:37:56.08493-08	2023-11-21 08:37:56.08493-08
973	130	\N	3		2023-11-21 08:22:48.758122-08	2023-11-21 08:34:48.758122-08	2023-11-21 08:39:53.530514-08	2023-11-21 08:39:53.530514-08
974	130	150	2		2023-11-21 08:23:48.765638-08	2023-11-21 08:35:48.765638-08	2023-11-21 08:40:53.131509-08	2023-11-21 08:40:53.131509-08
975	130	150	2		2023-11-21 08:25:48.681598-08	2023-11-21 08:37:48.681598-08	2023-11-21 08:42:51.333046-08	2023-11-21 08:42:51.333046-08
976	130	150	2		2023-11-21 08:26:48.775089-08	2023-11-21 08:38:48.775089-08	2023-11-21 08:43:51.89839-08	2023-11-21 08:43:51.89839-08
977	130	150	2		2023-11-21 08:28:48.719623-08	2023-11-21 08:40:48.719623-08	2023-11-21 08:45:52.139574-08	2023-11-21 08:45:52.139574-08
978	130	150	2		2023-11-21 08:29:48.882444-08	2023-11-21 08:41:48.882444-08	2023-11-21 08:46:52.553382-08	2023-11-21 08:46:52.553382-08
979	130	150	2		2023-11-21 08:31:48.904029-08	2023-11-21 08:43:48.904029-08	2023-11-21 08:48:52.173324-08	2023-11-21 08:48:52.173324-08
980	130	\N	\N		2023-11-21 08:33:48.748018-08	2023-11-21 08:45:48.748018-08	2023-11-21 08:50:52.044128-08	2023-11-21 08:50:52.044128-08
981	130	\N	\N		2023-11-21 08:34:48.851527-08	2023-11-21 08:46:48.851527-08	2023-11-21 08:51:51.736467-08	2023-11-21 08:51:51.736467-08
982	130	\N	\N		2023-11-21 08:36:48.718516-08	2023-11-21 08:48:48.718516-08	2023-11-21 08:53:51.427948-08	2023-11-21 08:53:51.427948-08
983	130	\N	\N		2023-11-21 08:38:48.715426-08	2023-11-21 08:50:48.715426-08	2023-11-21 08:55:51.051258-08	2023-11-21 08:55:51.051258-08
984	130	\N	\N		2023-11-21 08:40:48.898703-08	2023-11-21 08:52:48.898703-08	2023-11-21 08:57:51.81491-08	2023-11-21 08:57:51.81491-08
985	130	\N	\N		2023-11-21 08:42:48.770362-08	2023-11-21 08:54:48.770362-08	2023-11-21 08:59:50.964025-08	2023-11-21 08:59:50.964025-08
986	130	140	2		2023-11-21 08:44:48.766405-08	2023-11-21 08:56:48.766405-08	2023-11-21 09:01:51.222471-08	2023-11-21 09:01:51.222471-08
987	130	\N	\N		2023-11-21 08:46:48.716438-08	2023-11-21 08:58:48.716438-08	2023-11-21 09:03:51.532724-08	2023-11-21 09:03:51.532724-08
988	130	\N	\N		2023-11-21 08:48:48.834008-08	2023-11-21 09:00:48.834008-08	2023-11-21 09:05:51.619768-08	2023-11-21 09:05:51.619768-08
989	130	140	2		2023-11-21 08:50:48.737268-08	2023-11-21 09:02:48.737268-08	2023-11-21 09:07:51.57499-08	2023-11-21 09:07:51.57499-08
990	130	\N	\N		2023-11-21 08:52:48.691058-08	2023-11-21 09:04:48.691058-08	2023-11-21 09:09:51.672916-08	2023-11-21 09:09:51.672916-08
991	130	145	2		2023-11-21 08:53:48.733111-08	2023-11-21 09:05:48.733111-08	2023-11-21 09:10:50.910464-08	2023-11-21 09:10:50.910464-08
992	130	140	2		2023-11-21 08:54:48.950928-08	2023-11-21 09:06:48.950928-08	2023-11-21 09:11:51.874638-08	2023-11-21 09:11:51.874638-08
993	130	145	2		2023-11-21 08:55:49.019175-08	2023-11-21 09:07:49.019175-08	2023-11-21 09:12:51.605329-08	2023-11-21 09:12:51.605329-08
994	130	135	2		2023-11-21 08:57:48.937451-08	2023-11-21 09:09:48.937451-08	2023-11-21 09:14:51.443876-08	2023-11-21 09:14:51.443876-08
995	130	140	2		2023-11-21 08:59:48.79372-08	2023-11-21 09:11:48.79372-08	2023-11-21 09:16:57.543677-08	2023-11-21 09:16:57.543677-08
996	130	135	2		2023-11-21 09:01:48.728956-08	2023-11-21 09:13:48.728956-08	2023-11-21 09:18:55.386482-08	2023-11-21 09:18:55.386482-08
997	130	135	2		2023-11-21 09:03:48.862714-08	2023-11-21 09:15:48.862714-08	2023-11-21 09:20:56.576974-08	2023-11-21 09:20:56.576974-08
998	130	\N	\N		2023-11-21 09:05:48.815851-08	2023-11-21 09:17:48.815851-08	2023-11-21 09:22:55.084006-08	2023-11-21 09:22:55.084006-08
999	130	\N	\N		2023-11-21 09:06:49.842069-08	2023-11-21 09:18:49.842069-08	2023-11-21 09:23:54.898402-08	2023-11-21 09:23:54.898402-08
1000	130	\N	\N		2023-11-21 09:08:48.795697-08	2023-11-21 09:20:48.795697-08	2023-11-21 09:25:51.825129-08	2023-11-21 09:25:51.825129-08
1001	130	\N	\N		2023-11-21 09:10:48.712725-08	2023-11-21 09:22:48.712725-08	2023-11-21 09:27:51.007183-08	2023-11-21 09:27:51.007183-08
1002	130	\N	\N		2023-11-21 09:12:48.688158-08	2023-11-21 09:24:48.688158-08	2023-11-21 09:29:50.799305-08	2023-11-21 09:29:50.799305-08
1003	130	\N	\N		2023-11-21 09:13:48.69296-08	2023-11-21 09:25:48.69296-08	2023-11-21 09:31:02.140483-08	2023-11-21 09:31:02.140483-08
1004	130	\N	\N		2023-11-21 09:14:49.393035-08	2023-11-21 09:26:49.393035-08	2023-11-21 09:31:54.123207-08	2023-11-21 09:31:54.123207-08
1005	130	\N	\N		2023-11-21 09:16:48.709872-08	2023-11-21 09:28:48.709872-08	2023-11-21 09:33:54.939156-08	2023-11-21 09:33:54.939156-08
1006	130	\N	\N		2023-11-21 09:17:48.719177-08	2023-11-21 09:29:48.719177-08	2023-11-21 09:34:49.81011-08	2023-11-21 09:34:49.81011-08
1007	130	\N	\N		2023-11-21 09:18:48.793547-08	2023-11-21 09:30:48.793547-08	2023-11-21 09:35:51.247532-08	2023-11-21 09:35:51.247532-08
1008	130	\N	\N		2023-11-21 09:20:48.707395-08	2023-11-21 09:32:48.707395-08	2023-11-21 09:37:50.66224-08	2023-11-21 09:37:50.66224-08
1009	130	\N	\N		2023-11-21 09:21:48.850642-08	2023-11-21 09:33:48.850642-08	2023-11-21 09:38:51.398181-08	2023-11-21 09:38:51.398181-08
1010	130	125	2		2023-11-21 09:23:48.730661-08	2023-11-21 09:35:48.730661-08	2023-11-21 09:40:51.906823-08	2023-11-21 09:40:51.906823-08
1011	130	125	2		2023-11-21 09:24:48.780312-08	2023-11-21 09:36:48.780312-08	2023-11-21 09:41:51.873464-08	2023-11-21 09:41:51.873464-08
1012	130	125	2		2023-11-21 09:25:48.858167-08	2023-11-21 09:37:48.858167-08	2023-11-21 09:42:56.14873-08	2023-11-21 09:42:56.14873-08
1013	130	125	2		2023-11-21 09:27:49.243951-08	2023-11-21 09:39:49.243951-08	2023-11-21 09:44:57.226129-08	2023-11-21 09:44:57.226129-08
1014	130	125	2		2023-11-21 09:29:49.018077-08	2023-11-21 09:41:49.018077-08	2023-11-21 09:46:58.555452-08	2023-11-21 09:46:58.555452-08
1015	130	125	2		2023-11-21 09:31:48.685742-08	2023-11-21 09:43:48.685742-08	2023-11-21 09:48:56.971774-08	2023-11-21 09:48:56.971774-08
1016	130	125	2		2023-11-21 09:32:48.705304-08	2023-11-21 09:44:48.705304-08	2023-11-21 09:49:57.326104-08	2023-11-21 09:49:57.326104-08
1017	130	130	2		2023-11-21 09:33:48.837472-08	2023-11-21 09:45:48.837472-08	2023-11-21 09:50:57.041042-08	2023-11-21 09:50:57.041042-08
1018	130	130	2		2023-11-21 09:35:48.725915-08	2023-11-21 09:47:48.725915-08	2023-11-21 09:53:22.27497-08	2023-11-21 09:53:22.27497-08
1019	130	130	2		2023-11-21 09:36:48.792864-08	2023-11-21 09:48:48.792864-08	2023-11-21 09:54:19.638057-08	2023-11-21 09:54:19.638057-08
1020	130	130	2		2023-11-21 09:38:48.910189-08	2023-11-21 09:50:48.910189-08	2023-11-21 09:56:20.157641-08	2023-11-21 09:56:20.157641-08
1021	130	130	2		2023-11-21 09:40:48.803297-08	2023-11-21 09:52:48.803297-08	2023-11-21 09:58:12.091558-08	2023-11-21 09:58:12.091558-08
1022	130	\N	\N		2023-11-21 09:41:49.522906-08	2023-11-21 09:53:49.522906-08	2023-11-21 09:59:05.433719-08	2023-11-21 09:59:05.433719-08
1023	133	\N	4		2023-11-22 17:56:30.02912-08	2023-11-22 18:08:30.02912-08	2023-11-22 18:13:39.155215-08	2023-11-22 18:13:39.155215-08
1024	133	\N	4		2023-11-22 17:58:30.022418-08	2023-11-22 18:10:30.022418-08	2023-11-22 18:15:38.725628-08	2023-11-22 18:15:38.725628-08
1025	133	\N	5		2023-11-22 18:00:29.86318-08	2023-11-22 18:12:29.86318-08	2023-11-22 18:17:32.286069-08	2023-11-22 18:17:32.286069-08
1026	133	\N	4		2023-11-22 18:01:29.946399-08	2023-11-22 18:13:29.946399-08	2023-11-22 18:18:36.914457-08	2023-11-22 18:18:36.914457-08
1027	133	\N	4		2023-11-22 18:02:30.05047-08	2023-11-22 18:14:30.05047-08	2023-11-22 18:19:32.704736-08	2023-11-22 18:19:32.704736-08
1028	133	\N	4		2023-11-22 18:04:29.930409-08	2023-11-22 18:16:29.930409-08	2023-11-22 18:21:38.244699-08	2023-11-22 18:21:38.244699-08
1029	133	\N	4		2023-11-22 18:05:30.137554-08	2023-11-22 18:17:30.137554-08	2023-11-22 18:22:45.523748-08	2023-11-22 18:22:45.523748-08
1030	133	\N	4		2023-11-22 18:07:29.987992-08	2023-11-22 18:19:29.987992-08	2023-11-22 18:24:37.919717-08	2023-11-22 18:24:37.919717-08
1031	133	\N	4		2023-11-22 18:09:29.905999-08	2023-11-22 18:21:29.905999-08	2023-11-22 18:26:40.93429-08	2023-11-22 18:26:40.93429-08
1032	133	\N	4		2023-11-22 18:10:29.971643-08	2023-11-22 18:22:29.971643-08	2023-11-22 18:27:44.562148-08	2023-11-22 18:27:44.562148-08
1033	133	\N	4		2023-11-22 18:12:29.913454-08	2023-11-22 18:24:29.913454-08	2023-11-22 18:29:39.825065-08	2023-11-22 18:29:39.825065-08
1034	133	\N	4		2023-11-22 18:14:29.914882-08	2023-11-22 18:26:29.914882-08	2023-11-22 18:31:31.739423-08	2023-11-22 18:31:31.739423-08
1035	133	\N	4		2023-11-22 18:15:30.056295-08	2023-11-22 18:27:30.056295-08	2023-11-22 18:32:38.230803-08	2023-11-22 18:32:38.230803-08
1036	133	\N	4		2023-11-22 18:17:30.070706-08	2023-11-22 18:29:30.070706-08	2023-11-22 18:34:33.500918-08	2023-11-22 18:34:33.500918-08
1037	133	\N	4		2023-11-22 18:19:29.966522-08	2023-11-22 18:31:29.966522-08	2023-11-22 18:36:38.031001-08	2023-11-22 18:36:38.031001-08
1038	136	\N	2		2023-12-23 17:54:08.096298-08	2023-12-23 18:06:08.096298-08	2023-12-23 18:11:14.286008-08	2023-12-23 18:11:14.286008-08
1039	136	\N	4		2023-12-23 17:56:08.104262-08	2023-12-23 18:08:08.104262-08	2023-12-23 18:13:17.143855-08	2023-12-23 18:13:17.143855-08
1040	136	\N	4		2023-12-23 17:57:08.12848-08	2023-12-23 18:09:08.12848-08	2023-12-23 18:14:13.639525-08	2023-12-23 18:14:13.639525-08
1041	136	\N	4		2023-12-23 17:58:08.151005-08	2023-12-23 18:10:08.151005-08	2023-12-23 18:15:10.500799-08	2023-12-23 18:15:10.500799-08
1042	136	\N	4		2023-12-23 17:59:08.164844-08	2023-12-23 18:11:08.164844-08	2023-12-23 18:16:11.247842-08	2023-12-23 18:16:11.247842-08
1043	136	\N	4		2023-12-23 18:00:08.288355-08	2023-12-23 18:12:08.288355-08	2023-12-23 18:17:09.987092-08	2023-12-23 18:17:09.987092-08
1044	136	\N	4		2023-12-23 18:02:08.291026-08	2023-12-23 18:14:08.291026-08	2023-12-23 18:19:10.595437-08	2023-12-23 18:19:10.595437-08
1045	136	\N	4		2023-12-23 18:03:08.384682-08	2023-12-23 18:15:08.384682-08	2023-12-23 18:20:10.403632-08	2023-12-23 18:20:10.403632-08
1046	136	\N	4		2023-12-23 18:05:08.259094-08	2023-12-23 18:17:08.259094-08	2023-12-23 18:22:11.644907-08	2023-12-23 18:22:11.644907-08
\.


--
-- Data for Name: diagnosis_algorithm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diagnosis_algorithm (id, name, version, memo, created_at, modified_at) FROM stdin;
1	CTGRiskAssessmentor	1.1.0		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
3	testdata-algorithm	0.0.1		2023-11-07 05:33:40.232722-08	2023-11-07 05:33:40.232722-08
\.


--
-- Data for Name: diagnosis_authentication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diagnosis_authentication (id, api_key, created_at) FROM stdin;
\.


--
-- Data for Name: diagnosis_content; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.diagnosis_content (id, diagnosis_id, range_from, range_until, parameters, risk, category, baseline, baseline_bpm, variability, variability_bpm, deceleration) FROM stdin;
731	61	2023-11-09 13:14:57.448-08	2023-11-09 13:16:13.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
732	61	2023-11-09 13:23:57.448-08	2023-11-09 13:24:49.448-08	{"Risk": 1, "Baseline-ACCELERATION": 152, "BaselineVariability-SINUSOIDAL": 14}	1		\N	\N	\N	\N	\N
733	61	2023-11-09 13:35:57.448-08	2023-11-09 13:37:00.448-08	{"Risk": 3, "Deceleration-HI_VD": null}	3		\N	\N	\N	\N	\N
734	61	2023-11-09 13:48:57.448-08	2023-11-09 13:50:45.448-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2		\N	\N	\N	\N	\N
735	61	2023-11-09 13:56:57.448-08	2023-11-09 13:58:27.448-08	{"Risk": 1, "Baseline-HiDECELERATION": 161, "BaselineVariability-SINUSOIDAL": 25}	1		\N	\N	\N	\N	\N
736	61	2023-11-09 14:10:57.448-08	2023-11-09 14:11:47.448-08	{"Baseline-HiDECELERATION": 130, "BaselineVariability-NORMAL": 21}	\N		\N	\N	\N	\N	\N
737	61	2023-11-09 14:18:57.448-08	2023-11-09 14:19:33.448-08	{"Baseline-HiDECELERATION": 159, "BaselineVariability-LOST": 6}	\N		\N	\N	\N	\N	\N
738	61	2023-11-09 14:31:57.448-08	2023-11-09 14:32:52.448-08	{"Baseline-DECELERATION": 159, "BaselineVariability-LOST": 21}	\N		\N	\N	\N	\N	\N
739	61	2023-11-09 14:41:57.448-08	2023-11-09 14:42:42.448-08	{"Risk": 2, "Baseline-NORMAL": 165, "BaselineVariability-SINUSOIDAL": 28}	2		\N	\N	\N	\N	\N
740	61	2023-11-09 14:55:57.448-08	2023-11-09 14:57:43.448-08	{"Baseline-DECELERATION": 143, "BaselineVariability-INCREASE": 20}	\N		\N	\N	\N	\N	\N
741	61	2023-11-09 15:06:57.448-08	2023-11-09 15:07:41.448-08	{"Baseline-DECELERATION": 161, "BaselineVariability-INCREASE": 22}	\N		\N	\N	\N	\N	\N
742	62	2023-11-09 12:53:57.448-08	2023-11-09 12:55:01.448-08	{"Baseline-HiDECELERATION": 162, "BaselineVariability-NORMAL": 2}	\N		\N	\N	\N	\N	\N
743	62	2023-11-09 13:01:57.448-08	2023-11-09 13:03:47.448-08	{"Baseline-NORMAL": 133, "BaselineVariability-DECREASE": 25}	\N		\N	\N	\N	\N	\N
744	62	2023-11-09 13:15:57.448-08	2023-11-09 13:17:12.448-08	{"Risk": 3, "Deceleration-LOW_LD": null}	3		\N	\N	\N	\N	\N
745	62	2023-11-09 13:29:57.448-08	2023-11-09 13:31:30.448-08	{"Risk": 2, "Baseline-NORMAL": 147, "BaselineVariability-SINUSOIDAL": 26}	2		\N	\N	\N	\N	\N
746	62	2023-11-09 13:36:57.448-08	2023-11-09 13:38:41.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
747	62	2023-11-09 13:46:57.448-08	2023-11-09 13:48:27.448-08	{"Risk": 5, "Baseline-HiDECELERATION": 155, "BaselineVariability-SINUSOIDAL": 11}	5		\N	\N	\N	\N	\N
748	62	2023-11-09 13:59:57.448-08	2023-11-09 14:01:13.448-08	{"Risk": 4, "Deceleration-ED": null}	4		\N	\N	\N	\N	\N
749	62	2023-11-09 14:04:57.448-08	2023-11-09 14:05:51.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
750	62	2023-11-09 14:11:57.448-08	2023-11-09 14:13:34.448-08	{"Risk": 3, "Deceleration-HI_VD": null}	3		\N	\N	\N	\N	\N
751	62	2023-11-09 14:21:57.448-08	2023-11-09 14:22:28.448-08	{"Baseline-ACCELERATION": 144, "BaselineVariability-DECREASE": 4}	\N		\N	\N	\N	\N	\N
752	62	2023-11-09 14:28:57.448-08	2023-11-09 14:30:19.448-08	{"Deceleration-HI_PD": null}	\N		\N	\N	\N	\N	\N
753	62	2023-11-09 14:42:57.448-08	2023-11-09 14:44:52.448-08	{"Risk": 4, "Deceleration-ED": null}	4		\N	\N	\N	\N	\N
754	63	2023-11-09 12:35:57.448-08	2023-11-09 12:36:45.448-08	{"Risk": 1, "Baseline-HiDECELERATION": 139, "BaselineVariability-INCREASE": 26}	1		\N	\N	\N	\N	\N
755	63	2023-11-09 12:41:57.448-08	2023-11-09 12:43:06.448-08	{"Risk": 3, "Deceleration-HI_VD": null}	3		\N	\N	\N	\N	\N
756	63	2023-11-09 12:53:57.448-08	2023-11-09 12:54:56.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
757	63	2023-11-09 13:01:57.448-08	2023-11-09 13:03:33.448-08	{"Risk": 5, "Deceleration-LOW_PD": null}	5		\N	\N	\N	\N	\N
758	63	2023-11-09 13:13:57.448-08	2023-11-09 13:15:02.448-08	{"Baseline-ACCELERATION": 166, "BaselineVariability-INCREASE": 15}	\N		\N	\N	\N	\N	\N
759	63	2023-11-09 13:18:57.448-08	2023-11-09 13:20:47.448-08	{"Risk": 4, "Baseline-HiDECELERATION": 125, "BaselineVariability-INCREASE": 4}	4		\N	\N	\N	\N	\N
760	63	2023-11-09 13:27:57.448-08	2023-11-09 13:28:46.448-08	{"Risk": 3, "Deceleration-None": null}	3		\N	\N	\N	\N	\N
761	63	2023-11-09 13:32:57.448-08	2023-11-09 13:34:36.448-08	{"Risk": 2, "Deceleration-LOW_PD": null}	2		\N	\N	\N	\N	\N
762	63	2023-11-09 13:42:57.448-08	2023-11-09 13:43:37.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
763	63	2023-11-09 13:54:57.448-08	2023-11-09 13:56:36.448-08	{"Risk": 3, "Deceleration-HI_LD": null}	3		\N	\N	\N	\N	\N
764	63	2023-11-09 14:00:57.448-08	2023-11-09 14:02:26.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
765	63	2023-11-09 14:09:57.448-08	2023-11-09 14:11:40.448-08	{"Risk": 2, "Deceleration-HI_LD": null}	2		\N	\N	\N	\N	\N
766	63	2023-11-09 14:16:57.448-08	2023-11-09 14:18:17.448-08	{"Risk": 5, "Deceleration-HI_LD": null}	5		\N	\N	\N	\N	\N
767	63	2023-11-09 14:23:57.448-08	2023-11-09 14:25:30.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
768	64	2023-11-09 13:30:57.448-08	2023-11-09 13:31:50.448-08	{"Baseline-ACCELERATION": 125, "BaselineVariability-LOST": 15}	\N		\N	\N	\N	\N	\N
769	64	2023-11-09 13:39:57.448-08	2023-11-09 13:41:16.448-08	{"Risk": 1, "Deceleration-LOW_PD": null}	1		\N	\N	\N	\N	\N
770	64	2023-11-09 13:48:57.448-08	2023-11-09 13:50:45.448-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-NORMAL": 11}	2		\N	\N	\N	\N	\N
771	64	2023-11-09 13:53:57.448-08	2023-11-09 13:54:49.448-08	{"Risk": 1, "Baseline-DECELERATION": 140, "BaselineVariability-INCREASE": 2}	1		\N	\N	\N	\N	\N
772	64	2023-11-09 14:05:57.448-08	2023-11-09 14:07:41.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
773	64	2023-11-09 14:19:57.448-08	2023-11-09 14:20:54.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
774	64	2023-11-09 14:33:57.448-08	2023-11-09 14:34:33.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
775	64	2023-11-09 14:46:57.448-08	2023-11-09 14:47:57.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
776	64	2023-11-09 14:59:57.448-08	2023-11-09 15:00:58.448-08	{"Risk": 3, "Baseline-NORMAL": 158, "BaselineVariability-INCREASE": 13}	3		\N	\N	\N	\N	\N
777	64	2023-11-09 15:12:57.448-08	2023-11-09 15:14:46.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
778	65	2023-11-09 13:10:57.448-08	2023-11-09 13:11:28.448-08	{"Deceleration-HI_PD": null}	\N		\N	\N	\N	\N	\N
779	65	2023-11-09 13:23:57.448-08	2023-11-09 13:24:47.448-08	{"Risk": 1, "Deceleration-LOW_PD": null}	1		\N	\N	\N	\N	\N
780	65	2023-11-09 13:28:57.448-08	2023-11-09 13:29:47.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
781	65	2023-11-09 13:34:57.448-08	2023-11-09 13:36:04.448-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-INCREASE": 2}	2		\N	\N	\N	\N	\N
782	65	2023-11-09 13:43:57.448-08	2023-11-09 13:45:13.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
783	65	2023-11-09 13:57:57.448-08	2023-11-09 13:59:17.448-08	{"Risk": 5, "Deceleration-HI_PD": null}	5		\N	\N	\N	\N	\N
784	65	2023-11-09 14:11:57.448-08	2023-11-09 14:13:22.448-08	{"Risk": 1, "Deceleration-LOW_PD": null}	1		\N	\N	\N	\N	\N
785	65	2023-11-09 14:20:57.448-08	2023-11-09 14:21:36.448-08	{"Risk": 1, "Deceleration-HI_VD": null}	1		\N	\N	\N	\N	\N
786	65	2023-11-09 14:25:57.448-08	2023-11-09 14:27:30.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
787	65	2023-11-09 14:32:57.448-08	2023-11-09 14:34:19.448-08	{"Deceleration-HI_VD": null}	\N		\N	\N	\N	\N	\N
788	65	2023-11-09 14:37:57.448-08	2023-11-09 14:39:16.448-08	{"Risk": 3, "Baseline-DECELERATION": 158, "BaselineVariability-LOST": 0}	3		\N	\N	\N	\N	\N
789	65	2023-11-09 14:44:57.448-08	2023-11-09 14:46:28.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
790	65	2023-11-09 14:53:57.448-08	2023-11-09 14:55:21.448-08	{"Baseline-NORMAL": 154, "BaselineVariability-LOST": 2}	\N		\N	\N	\N	\N	\N
791	65	2023-11-09 15:02:57.448-08	2023-11-09 15:04:04.448-08	{"Baseline-NORMAL": 137, "BaselineVariability-NORMAL": 6}	\N		\N	\N	\N	\N	\N
792	66	2023-11-09 12:48:57.448-08	2023-11-09 12:50:25.448-08	{"Risk": 4, "Deceleration-LOW_LD": null}	4		\N	\N	\N	\N	\N
793	66	2023-11-09 12:57:57.448-08	2023-11-09 12:59:47.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
794	66	2023-11-09 13:08:57.448-08	2023-11-09 13:09:28.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
795	66	2023-11-09 13:13:57.448-08	2023-11-09 13:15:43.448-08	{"Risk": 2, "Baseline-ACCELERATION": 132, "BaselineVariability-SINUSOIDAL": 1}	2		\N	\N	\N	\N	\N
796	66	2023-11-09 13:26:57.448-08	2023-11-09 13:28:12.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
797	66	2023-11-09 13:38:57.448-08	2023-11-09 13:40:14.448-08	{"Risk": 2, "Baseline-HiDECELERATION": 122, "BaselineVariability-SINUSOIDAL": 14}	2		\N	\N	\N	\N	\N
798	66	2023-11-09 13:46:57.448-08	2023-11-09 13:47:44.448-08	{"Risk": 5, "Deceleration-LOW_LD": null}	5		\N	\N	\N	\N	\N
799	66	2023-11-09 13:57:57.448-08	2023-11-09 13:58:33.448-08	{"Baseline-HiDECELERATION": 161, "BaselineVariability-SINUSOIDAL": 13}	\N		\N	\N	\N	\N	\N
800	66	2023-11-09 14:03:57.448-08	2023-11-09 14:05:13.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
801	66	2023-11-09 14:14:57.448-08	2023-11-09 14:16:10.448-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-NORMAL": 22}	2		\N	\N	\N	\N	\N
802	66	2023-11-09 14:22:57.448-08	2023-11-09 14:24:46.448-08	{"Risk": 2, "Baseline-DECELERATION": 138, "BaselineVariability-INCREASE": 19}	2		\N	\N	\N	\N	\N
803	66	2023-11-09 14:34:57.448-08	2023-11-09 14:36:29.448-08	{"Acceleration": null}	\N		\N	\N	\N	\N	\N
804	67	2023-11-09 16:58:57.089-08	2023-11-09 16:59:51.373-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
805	67	2023-11-09 17:00:00.659-08	2023-11-09 17:01:55.869-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
806	67	2023-11-09 17:02:22.211-08	2023-11-09 17:02:40.751-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
807	68	2023-11-09 18:17:37.459-08	2023-11-09 18:18:14.646-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
808	68	2023-11-09 18:20:04.711-08	2023-11-09 18:21:35.677-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
809	68	2023-11-09 18:22:21.643-08	2023-11-09 18:22:52.558-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
810	68	2023-11-09 18:26:18.111-08	2023-11-09 18:26:46.454-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
811	69	2023-11-09 18:20:04.86-08	2023-11-09 18:21:35.567-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
812	69	2023-11-09 18:22:21.533-08	2023-11-09 18:22:52.698-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
813	70	2023-11-09 18:40:24.095-08	2023-11-09 18:41:28.638-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
814	70	2023-11-09 18:43:53.621-08	2023-11-09 18:47:32.139-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
815	71	2023-11-09 18:43:53.531-08	2023-11-09 18:47:32.05-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
816	71	2023-11-09 18:51:41.843-08	2023-11-09 18:52:09.961-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
817	72	2023-11-09 18:51:43.549-08	2023-11-09 18:53:06.672-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
818	72	2023-11-09 18:53:10.445-08	2023-11-09 18:53:59.056-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
819	72	2023-11-09 18:54:11.612-08	2023-11-09 18:54:50.26-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
820	72	2023-11-09 18:56:37.209-08	2023-11-09 18:57:18.868-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
821	72	2023-11-09 18:58:17.099-08	2023-11-09 18:58:45.2-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
822	73	2023-11-09 20:02:19.689-08	2023-11-09 20:02:44.052-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
823	73	2023-11-09 20:04:10.485-08	2023-11-09 20:04:43.158-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
824	73	2023-11-09 20:06:58.322-08	2023-11-09 20:07:39.25-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
825	74	2023-11-09 23:10:10.714-08	2023-11-09 23:14:22.004-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
826	75	2023-11-10 04:34:46.672-08	2023-11-10 04:35:11.793-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
827	75	2023-11-10 04:36:46.097-08	2023-11-10 04:38:45.888-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
828	75	2023-11-10 04:42:34.531-08	2023-11-10 04:43:13.156-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
829	76	2023-11-10 04:35:40.253-08	2023-11-10 04:36:08.309-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
830	76	2023-11-10 04:36:37.84-08	2023-11-10 04:38:45.908-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	110	decrease	10	\N
831	76	2023-11-10 04:39:33.905-08	2023-11-10 04:42:01.671-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
832	76	2023-11-10 04:42:26.728-08	2023-11-10 04:43:04.822-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
833	76	2023-11-10 04:43:05.577-08	2023-11-10 04:45:07.112-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	110	decrease	10	\N
834	77	2023-11-10 04:39:02.652-08	2023-11-10 04:39:31.774-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
835	77	2023-11-10 04:39:33.785-08	2023-11-10 04:42:01.801-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
836	77	2023-11-10 04:42:29.923-08	2023-11-10 04:43:05.507-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
837	77	2023-11-10 04:43:06.007-08	2023-11-10 04:46:47.945-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	110	decrease	10	\N
838	79	2023-11-10 06:35:22.451-08	2023-11-10 06:38:23.735-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
839	79	2023-11-10 06:39:13.538-08	2023-11-10 06:40:50.186-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
840	79	2023-11-10 06:41:36.89-08	2023-11-10 06:42:07.974-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
841	79	2023-11-10 06:43:15.264-08	2023-11-10 06:44:09.176-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
842	80	2023-11-10 06:37:49.59-08	2023-11-10 06:39:26.702-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
843	80	2023-11-10 06:39:50.254-08	2023-11-10 06:41:25.159-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
844	80	2023-11-10 06:44:03.431-08	2023-11-10 06:46:41.581-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
845	82	2023-11-10 06:40:07.81-08	2023-11-10 06:41:24.493-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
846	82	2023-11-10 06:41:53.073-08	2023-11-10 06:42:24.676-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
847	82	2023-11-10 06:44:04.532-08	2023-11-10 06:49:45.907-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
848	83	2023-11-10 06:41:38.153-08	2023-11-10 06:42:01.186-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
849	83	2023-11-10 06:44:05.38-08	2023-11-10 06:51:41.013-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
850	84	2023-11-10 06:43:15.294-08	2023-11-10 06:44:09.206-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
851	84	2023-11-10 06:44:34.008-08	2023-11-10 06:52:19.967-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
852	85	2023-11-10 06:44:07.047-08	2023-11-10 06:53:34.151-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 20}	2	baseline	normal	135	decrease	20	\N
853	88	2023-11-10 06:52:20.047-08	2023-11-10 06:53:34.124-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
854	88	2023-11-10 06:54:32.095-08	2023-11-10 06:55:38.376-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
855	89	2023-11-10 06:52:20.122-08	2023-11-10 06:54:46.218-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
856	89	2023-11-10 06:58:54.847-08	2023-11-10 06:59:43.491-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
857	90	2023-11-10 07:55:38.237-08	2023-11-10 07:56:18.163-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
858	90	2023-11-10 07:57:03.245-08	2023-11-10 07:58:51.316-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
859	90	2023-11-10 07:59:51.051-08	2023-11-10 08:00:19.888-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
860	90	2023-11-10 08:00:34.701-08	2023-11-10 08:02:49.072-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
861	91	2023-11-10 07:55:35.138-08	2023-11-10 07:57:25.816-08	{"Risk": 3, "Deceleration-LOW_LD": null}	3	deceleration	\N	\N	\N	\N	low_ld
862	91	2023-11-10 07:59:50.631-08	2023-11-10 08:00:19.462-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
863	91	2023-11-10 08:00:34.531-08	2023-11-10 08:04:39.835-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
864	92	2023-11-10 07:55:38.717-08	2023-11-10 07:57:21.644-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
865	92	2023-11-10 07:59:51.974-08	2023-11-10 08:00:19.552-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
866	92	2023-11-10 08:00:34.621-08	2023-11-10 08:04:40.175-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
867	93	2023-11-10 07:59:50.371-08	2023-11-10 08:00:19.452-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
868	93	2023-11-10 08:00:34.521-08	2023-11-10 08:04:39.825-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
869	94	2023-11-10 07:59:51.131-08	2023-11-10 08:00:19.968-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
870	94	2023-11-10 08:00:34.531-08	2023-11-10 08:04:39.835-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
871	94	2023-11-10 08:05:28.557-08	2023-11-10 08:07:40.725-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
872	95	2023-11-10 07:59:50.321-08	2023-11-10 08:00:19.402-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
873	95	2023-11-10 08:00:34.721-08	2023-11-10 08:04:39.775-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
874	95	2023-11-10 08:05:28.497-08	2023-11-10 08:07:40.705-08	{"Risk": 4, "Deceleration-HI_LD": null}	4	deceleration	\N	\N	\N	\N	high_ld
875	96	2023-11-10 08:00:34.781-08	2023-11-10 08:04:40.085-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
876	96	2023-11-10 08:05:28.557-08	2023-11-10 08:07:40.766-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
877	96	2023-11-10 08:07:42.517-08	2023-11-10 08:11:08.676-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
878	97	2023-11-10 08:05:28.577-08	2023-11-10 08:07:40.535-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
879	97	2023-11-10 08:07:42.537-08	2023-11-10 08:11:56.671-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
880	98	2023-11-10 08:05:30.753-08	2023-11-10 08:07:40.705-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
881	98	2023-11-10 08:07:42.707-08	2023-11-10 08:11:59.355-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
882	98	2023-11-10 08:12:36.76-08	2023-11-10 08:12:58.362-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
883	99	2023-11-12 16:45:57.741-08	2023-11-12 16:47:05.172-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
884	99	2023-11-12 16:47:05.422-08	2023-11-12 16:49:57.494-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
885	99	2023-11-12 16:50:45.522-08	2023-11-12 16:53:09.464-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	2	baseline	normal	155	decrease	5	\N
886	100	2023-11-12 16:45:27.902-08	2023-11-12 16:46:26.518-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
887	100	2023-11-12 16:46:33.814-08	2023-11-12 16:49:57.344-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
888	100	2023-11-12 16:50:45.622-08	2023-11-12 16:54:01.402-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	2	baseline	normal	155	decrease	5	\N
889	101	2023-11-12 16:45:27.822-08	2023-11-12 16:46:26.688-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
890	101	2023-11-12 16:46:33.484-08	2023-11-12 16:49:57.514-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
891	101	2023-11-12 16:50:45.542-08	2023-11-12 16:54:54.458-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	2	baseline	normal	155	decrease	5	\N
892	102	2023-11-12 16:45:57.902-08	2023-11-12 16:47:05.332-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
893	102	2023-11-12 16:47:05.582-08	2023-11-12 16:49:57.404-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
894	102	2023-11-12 16:50:45.682-08	2023-11-12 16:56:24.17-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
895	103	2023-11-12 16:50:45.682-08	2023-11-12 16:56:24.17-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
896	103	2023-11-12 16:56:24.42-08	2023-11-12 16:58:12.147-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
897	104	2023-11-12 16:50:45.562-08	2023-11-12 16:56:24.05-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
898	104	2023-11-12 16:56:24.3-08	2023-11-12 16:58:59.331-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
899	105	2023-11-12 16:50:45.612-08	2023-11-12 16:56:24.35-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
900	105	2023-11-12 16:56:24.6-08	2023-11-12 17:01:10.982-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
901	106	2023-11-12 16:56:24.24-08	2023-11-12 17:01:42.821-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
902	107	2023-11-12 16:56:24.4-08	2023-11-12 17:01:42.981-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
903	107	2023-11-12 17:01:43.238-08	2023-11-12 17:04:14.054-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
904	108	2023-11-12 17:01:43.218-08	2023-11-12 17:04:13.514-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
905	108	2023-11-12 17:04:49.478-08	2023-11-12 17:05:37.261-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
906	109	2023-11-12 17:01:43.318-08	2023-11-12 17:04:50.356-08	{"Risk": 3, "Baseline-ACCELERATION": 160, "BaselineVariability-DECREASE": 20}	3	baseline	acceleration	160	decrease	20	\N
907	109	2023-11-12 17:04:50.356-08	2023-11-12 17:05:37.381-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
908	110	2023-11-12 17:01:43.328-08	2023-11-12 17:03:55.329-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
909	110	2023-11-12 17:04:50.336-08	2023-11-12 17:05:37.361-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
910	110	2023-11-12 17:08:06.758-08	2023-11-12 17:08:29.654-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
911	110	2023-11-12 17:09:01.813-08	2023-11-12 17:09:28.395-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
912	111	2023-11-12 17:01:43.208-08	2023-11-12 17:04:14.024-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
913	111	2023-11-12 17:04:49.488-08	2023-11-12 17:05:37.271-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
914	111	2023-11-12 17:06:32.902-08	2023-11-12 17:07:30.235-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
915	111	2023-11-12 17:08:06.919-08	2023-11-12 17:08:46.432-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
916	112	2023-11-12 17:01:43.348-08	2023-11-12 17:04:14.394-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
917	112	2023-11-12 17:04:50.366-08	2023-11-12 17:05:37.391-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
918	112	2023-11-12 17:08:06.789-08	2023-11-12 17:08:45.794-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
919	112	2023-11-12 17:08:58.326-08	2023-11-12 17:09:55.301-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
920	112	2023-11-12 17:10:32.979-08	2023-11-12 17:11:08.81-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
921	113	2023-11-12 17:23:18.392-08	2023-11-12 17:24:32.892-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
922	113	2023-11-12 17:27:43.133-08	2023-11-12 17:28:18.125-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
923	114	2023-11-12 17:23:18.402-08	2023-11-12 17:24:32.902-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
924	114	2023-11-12 17:27:42.886-08	2023-11-12 17:28:17.885-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
925	115	2023-11-12 17:23:18.282-08	2023-11-12 17:24:32.782-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
926	115	2023-11-12 17:27:43.273-08	2023-11-12 17:28:18.014-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
927	115	2023-11-12 17:30:52.158-08	2023-11-12 17:31:27.121-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
928	116	2023-11-12 17:27:43.093-08	2023-11-12 17:28:18.085-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
929	116	2023-11-12 17:30:51.478-08	2023-11-12 17:32:29.289-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
930	116	2023-11-12 17:32:29.289-08	2023-11-12 17:33:48.33-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
931	117	2023-11-12 17:26:20.681-08	2023-11-12 17:27:09.762-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
932	117	2023-11-12 17:27:42.943-08	2023-11-12 17:28:17.935-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
933	117	2023-11-12 17:30:51.578-08	2023-11-12 17:31:26.741-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
934	117	2023-11-12 17:32:29.139-08	2023-11-12 17:33:08.33-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
935	118	2023-11-12 17:27:43.203-08	2023-11-12 17:28:17.945-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
936	118	2023-11-12 17:30:52.339-08	2023-11-12 17:31:27.051-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
937	118	2023-11-12 17:32:51.814-08	2023-11-12 17:33:48.431-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
938	118	2023-11-12 17:36:41.551-08	2023-11-12 17:37:50.537-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
939	119	2023-11-12 17:28:56.435-08	2023-11-12 17:29:33.892-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
940	119	2023-11-12 17:30:51.398-08	2023-11-12 17:32:29.199-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
941	119	2023-11-12 17:32:29.199-08	2023-11-12 17:33:03.655-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
942	119	2023-11-12 17:36:41.718-08	2023-11-12 17:37:50.698-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
943	120	2023-11-12 17:30:51.253-08	2023-11-12 17:32:29.319-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
944	120	2023-11-12 17:32:29.319-08	2023-11-12 17:33:48.111-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
945	120	2023-11-12 17:36:41.231-08	2023-11-12 17:37:52.48-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
946	120	2023-11-12 17:37:52.73-08	2023-11-12 17:40:23.466-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	2	baseline	normal	155	decrease	5	\N
947	121	2023-11-12 17:47:48.932-08	2023-11-12 17:49:01.766-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
948	121	2023-11-12 17:49:02.016-08	2023-11-12 17:51:03.533-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
949	121	2023-11-12 17:51:03.783-08	2023-11-12 17:56:24.844-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
950	122	2023-11-12 17:47:48.952-08	2023-11-12 17:49:01.786-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
951	122	2023-11-12 17:49:02.036-08	2023-11-12 17:51:03.553-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
952	122	2023-11-12 17:51:03.803-08	2023-11-12 17:56:24.864-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
953	122	2023-11-12 17:56:24.864-08	2023-11-12 17:56:54.477-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
954	123	2023-11-12 17:47:49.212-08	2023-11-12 17:49:02.55-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
955	123	2023-11-12 17:49:02.8-08	2023-11-12 17:51:03.563-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
956	123	2023-11-12 17:51:03.813-08	2023-11-12 17:56:25.124-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
957	123	2023-11-12 17:56:25.124-08	2023-11-12 17:56:54.74-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
958	124	2023-11-12 17:49:02.61-08	2023-11-12 17:51:03.373-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
1028	139	2023-11-12 18:19:40.874-08	2023-11-12 18:20:17.52-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
959	124	2023-11-12 17:51:03.623-08	2023-11-12 17:56:24.934-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
960	124	2023-11-12 17:56:24.934-08	2023-11-12 17:56:54.8-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
961	124	2023-11-12 17:57:00.32-08	2023-11-12 17:59:15.362-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
962	125	2023-11-12 17:52:45.445-08	2023-11-12 17:56:24.814-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
963	125	2023-11-12 17:56:24.814-08	2023-11-12 17:56:54.677-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
964	125	2023-11-12 17:56:59.95-08	2023-11-12 17:59:15.239-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
965	126	2023-11-12 17:56:24.884-08	2023-11-12 17:56:54.497-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
966	126	2023-11-12 17:57:00.02-08	2023-11-12 17:59:15.309-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
967	126	2023-11-12 17:59:54.456-08	2023-11-12 18:02:43.364-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
968	127	2023-11-12 17:56:24.904-08	2023-11-12 17:56:54.77-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
969	127	2023-11-12 17:57:00.29-08	2023-11-12 17:59:15.329-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
970	127	2023-11-12 17:59:54.226-08	2023-11-12 18:04:05.225-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
971	128	2023-11-12 17:56:24.924-08	2023-11-12 17:56:54.79-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
972	128	2023-11-12 17:57:00.31-08	2023-11-12 17:59:15.352-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
973	128	2023-11-12 17:59:54.246-08	2023-11-12 18:04:05.245-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
974	128	2023-11-12 18:04:05.245-08	2023-11-12 18:05:08.001-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
975	128	2023-11-12 18:05:30.842-08	2023-11-12 18:06:27.329-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
976	129	2023-11-12 17:59:54.386-08	2023-11-12 18:03:35.007-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
977	129	2023-11-12 18:04:06.138-08	2023-11-12 18:05:07.891-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
978	129	2023-11-12 18:05:30.732-08	2023-11-12 18:06:27.219-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
979	129	2023-11-12 18:06:57.092-08	2023-11-12 18:07:40.773-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
980	130	2023-11-12 18:00:52.364-08	2023-11-12 18:04:06.138-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
981	130	2023-11-12 18:04:06.138-08	2023-11-12 18:05:07.891-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
982	130	2023-11-12 18:05:30.732-08	2023-11-12 18:06:27.219-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
983	130	2023-11-12 18:06:57.092-08	2023-11-12 18:07:40.773-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
984	131	2023-11-12 18:04:05.215-08	2023-11-12 18:05:07.971-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
985	131	2023-11-12 18:05:30.812-08	2023-11-12 18:06:27.299-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
986	131	2023-11-12 18:06:57.172-08	2023-11-12 18:07:40.858-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
987	131	2023-11-12 18:09:46.157-08	2023-11-12 18:10:24.081-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
988	132	2023-11-12 18:04:05.215-08	2023-11-12 18:05:07.971-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
989	132	2023-11-12 18:05:30.812-08	2023-11-12 18:06:27.299-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
990	132	2023-11-12 18:06:57.172-08	2023-11-12 18:07:40.858-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
991	132	2023-11-12 18:09:46.157-08	2023-11-12 18:10:24.081-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
992	132	2023-11-12 18:11:28.395-08	2023-11-12 18:12:23.638-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
993	133	2023-11-12 18:04:05.215-08	2023-11-12 18:05:09.228-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
994	133	2023-11-12 18:05:30.812-08	2023-11-12 18:06:27.299-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
995	133	2023-11-12 18:06:57.172-08	2023-11-12 18:07:40.858-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
996	133	2023-11-12 18:09:46.157-08	2023-11-12 18:10:24.081-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
997	133	2023-11-12 18:11:28.395-08	2023-11-12 18:12:23.638-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
998	133	2023-11-12 18:12:54.259-08	2023-11-12 18:13:53.764-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
999	134	2023-11-12 18:05:30.812-08	2023-11-12 18:06:27.299-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1000	134	2023-11-12 18:06:57.172-08	2023-11-12 18:07:40.858-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1001	134	2023-11-12 18:09:46.157-08	2023-11-12 18:10:24.081-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1002	134	2023-11-12 18:11:26.637-08	2023-11-12 18:12:24.138-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1003	134	2023-11-12 18:12:54.009-08	2023-11-12 18:13:53.509-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1004	134	2023-11-12 18:14:33.939-08	2023-11-12 18:15:19.139-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1005	135	2023-11-12 18:06:57.072-08	2023-11-12 18:07:41.008-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1006	135	2023-11-12 18:09:46.307-08	2023-11-12 18:10:23.981-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1007	135	2023-11-12 18:11:28.294-08	2023-11-12 18:12:23.537-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1008	135	2023-11-12 18:12:54.159-08	2023-11-12 18:13:53.914-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1009	135	2023-11-12 18:14:33.839-08	2023-11-12 18:15:19.289-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1010	136	2023-11-12 18:09:46.107-08	2023-11-12 18:10:24.031-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1011	136	2023-11-12 18:11:28.345-08	2023-11-12 18:12:23.588-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1012	136	2023-11-12 18:12:54.209-08	2023-11-12 18:13:53.714-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1013	136	2023-11-12 18:14:33.889-08	2023-11-12 18:15:19.089-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1014	136	2023-11-12 18:17:04.831-08	2023-11-12 18:17:40.979-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1015	137	2023-11-12 18:09:46.137-08	2023-11-12 18:10:24.061-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1016	137	2023-11-12 18:11:28.375-08	2023-11-12 18:12:23.618-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1017	137	2023-11-12 18:12:54.239-08	2023-11-12 18:13:53.744-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1018	137	2023-11-12 18:14:33.919-08	2023-11-12 18:15:19.119-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1019	137	2023-11-12 18:17:04.611-08	2023-11-12 18:17:41.009-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1020	137	2023-11-12 18:19:40.824-08	2023-11-12 18:20:17.72-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1021	138	2023-11-12 18:12:53.989-08	2023-11-12 18:13:53.744-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1022	138	2023-11-12 18:14:33.919-08	2023-11-12 18:15:19.119-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1023	138	2023-11-12 18:17:04.861-08	2023-11-12 18:17:41.259-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1024	138	2023-11-12 18:19:40.824-08	2023-11-12 18:20:17.22-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1025	138	2023-11-12 18:20:53.881-08	2023-11-12 18:22:01.43-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1026	139	2023-11-12 18:14:33.969-08	2023-11-12 18:15:19.169-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1027	139	2023-11-12 18:17:04.661-08	2023-11-12 18:17:41.059-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1029	139	2023-11-12 18:20:53.672-08	2023-11-12 18:22:01.73-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1030	140	2023-11-12 18:14:33.726-08	2023-11-12 18:15:19.179-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1031	140	2023-11-12 18:17:04.671-08	2023-11-12 18:17:41.069-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1032	140	2023-11-12 18:19:40.884-08	2023-11-12 18:20:17.53-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1033	140	2023-11-12 18:20:53.682-08	2023-11-12 18:22:01.74-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1034	140	2023-11-12 18:23:04.778-08	2023-11-12 18:24:40.715-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1035	141	2023-11-12 18:17:04.661-08	2023-11-12 18:17:41.059-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1036	141	2023-11-12 18:19:40.874-08	2023-11-12 18:20:17.52-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1037	141	2023-11-12 18:20:53.672-08	2023-11-12 18:22:01.73-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1038	141	2023-11-12 18:23:04.768-08	2023-11-12 18:24:40.705-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1039	142	2023-11-12 18:19:40.944-08	2023-11-12 18:20:17.34-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1040	142	2023-11-12 18:20:53.742-08	2023-11-12 18:22:01.3-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1041	142	2023-11-12 18:23:04.838-08	2023-11-12 18:24:40.775-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1042	143	2023-11-12 18:19:40.844-08	2023-11-12 18:20:17.49-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1043	143	2023-11-12 18:20:53.901-08	2023-11-12 18:22:01.45-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1044	143	2023-11-12 18:23:04.738-08	2023-11-12 18:24:40.675-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1045	143	2023-11-12 18:28:02.263-08	2023-11-12 18:29:13.309-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1046	143	2023-11-12 18:29:13.309-08	2023-11-12 18:30:09.819-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1047	144	2023-11-12 18:20:53.672-08	2023-11-12 18:22:01.73-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1048	144	2023-11-12 18:23:04.768-08	2023-11-12 18:24:40.705-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1049	144	2023-11-12 18:28:02.293-08	2023-11-12 18:29:26.807-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1050	144	2023-11-12 18:29:27.057-08	2023-11-12 18:31:24.339-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	2	baseline	normal	150	decrease	15	\N
1051	145	2023-11-12 18:22:48.029-08	2023-11-12 18:23:51.576-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1052	145	2023-11-12 18:25:16.961-08	2023-11-12 18:25:45.593-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1053	145	2023-11-12 18:28:02.393-08	2023-11-12 18:29:26.657-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1054	145	2023-11-12 18:29:26.907-08	2023-11-12 18:31:24.439-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	2	baseline	normal	150	decrease	15	\N
1055	146	2023-11-12 18:28:02.243-08	2023-11-12 18:29:27.007-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1056	146	2023-11-12 18:29:27.257-08	2023-11-12 18:31:24.289-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	2	baseline	normal	150	decrease	15	\N
1057	147	2023-11-12 18:29:22.726-08	2023-11-12 18:31:24.529-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	2	baseline	normal	150	decrease	15	\N
1058	148	2023-11-12 18:28:02.403-08	2023-11-12 18:29:25.932-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1059	148	2023-11-12 18:29:26.182-08	2023-11-12 18:31:24.469-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	2	baseline	normal	150	decrease	15	\N
1060	148	2023-11-12 18:35:11.2-08	2023-11-12 18:37:15.501-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1061	149	2023-11-12 18:29:26.001-08	2023-11-12 18:31:24.539-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	2	baseline	normal	150	decrease	15	\N
1062	149	2023-11-12 18:35:11.27-08	2023-11-12 18:37:15.57-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1063	150	2023-11-12 18:35:11.63-08	2023-11-12 18:37:15.681-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1064	150	2023-11-12 18:37:33.507-08	2023-11-12 18:38:33.831-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1065	151	2023-11-12 18:35:11.41-08	2023-11-12 18:37:15.461-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1066	151	2023-11-12 18:37:35.295-08	2023-11-12 18:40:01.385-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
1067	152	2023-11-12 18:35:11.24-08	2023-11-12 18:37:15.541-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1068	152	2023-11-12 18:37:35.375-08	2023-11-12 18:39:56.96-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
1069	152	2023-11-12 18:39:57.21-08	2023-11-12 18:43:22.815-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 20}	2	baseline	normal	145	decrease	20	\N
1070	153	2023-11-12 18:37:35.495-08	2023-11-12 18:39:57.08-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
1071	153	2023-11-12 18:39:57.33-08	2023-11-12 18:43:22.685-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 15}	2	baseline	normal	145	decrease	15	\N
1072	154	2023-11-12 18:37:35.245-08	2023-11-12 18:40:02.333-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
1073	154	2023-11-12 18:41:11.614-08	2023-11-12 18:43:22.421-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1074	154	2023-11-12 18:45:46.513-08	2023-11-12 18:46:09.101-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1075	155	2023-11-12 18:41:11.564-08	2023-11-12 18:43:22.625-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1076	155	2023-11-12 18:45:46.493-08	2023-11-12 18:46:15.879-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1077	156	2023-11-12 18:41:11.614-08	2023-11-12 18:43:22.675-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1078	156	2023-11-12 18:45:46.543-08	2023-11-12 18:46:13.917-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1079	156	2023-11-12 18:47:11.111-08	2023-11-12 18:50:07.88-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1080	157	2023-11-12 18:41:11.524-08	2023-11-12 18:45:02.731-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 15}	2	baseline	normal	145	decrease	15	\N
1081	157	2023-11-12 18:45:46.673-08	2023-11-12 18:46:15.779-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1082	157	2023-11-12 18:47:10.477-08	2023-11-12 18:50:07.75-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1083	158	2023-11-12 18:45:46.543-08	2023-11-12 18:46:11.909-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1084	158	2023-11-12 18:47:10.861-08	2023-11-12 18:50:07.126-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1085	158	2023-11-12 18:50:07.376-08	2023-11-12 18:53:01.403-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1086	159	2023-11-12 18:45:46.783-08	2023-11-12 18:46:19.125-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1087	159	2023-11-12 18:47:11.06-08	2023-11-12 18:50:07.83-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1088	159	2023-11-12 18:50:08.08-08	2023-11-12 18:53:37.258-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1089	160	2023-11-12 18:45:46.393-08	2023-11-12 18:46:09.965-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1090	160	2023-11-12 18:47:10.167-08	2023-11-12 18:50:07.69-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1091	160	2023-11-12 18:50:07.94-08	2023-11-12 18:53:37.118-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1092	160	2023-11-12 18:53:55.951-08	2023-11-12 18:56:11.792-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1093	161	2023-11-12 18:47:10.267-08	2023-11-12 18:50:07.286-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1094	161	2023-11-12 18:50:07.54-08	2023-11-12 18:53:38.224-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1095	161	2023-11-12 18:53:57.305-08	2023-11-12 18:56:35.998-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
1096	162	2023-11-12 18:50:07.446-08	2023-11-12 18:53:38.134-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1097	162	2023-11-12 18:53:57.215-08	2023-11-12 18:56:35.908-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
1098	162	2023-11-12 18:57:12.09-08	2023-11-12 18:57:47.736-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1099	163	2023-11-12 18:53:21.063-08	2023-11-12 18:56:35.918-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1100	163	2023-11-12 18:57:12.35-08	2023-11-12 18:57:47.746-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1101	163	2023-11-12 18:57:47.996-08	2023-11-12 19:00:54.32-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1102	164	2023-11-12 18:53:55.971-08	2023-11-12 18:56:35.918-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
1103	164	2023-11-12 18:57:12.35-08	2023-11-12 18:57:47.746-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1104	164	2023-11-12 18:57:47.996-08	2023-11-12 19:00:54.32-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1105	165	2023-11-12 18:57:12.34-08	2023-11-12 18:57:47.736-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1106	165	2023-11-12 18:57:47.986-08	2023-11-12 19:00:54.31-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1107	165	2023-11-12 19:01:57.601-08	2023-11-12 19:04:05.43-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 20}	2	baseline	normal	140	decrease	20	\N
1108	166	2023-11-12 18:57:12.149-08	2023-11-12 18:57:43.276-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1109	166	2023-11-12 18:57:43.526-08	2023-11-12 19:00:54.873-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1110	166	2023-11-12 19:01:57.661-08	2023-11-12 19:04:05.745-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
1111	166	2023-11-12 19:05:08.256-08	2023-11-12 19:06:21.059-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1112	167	2023-11-12 18:57:12.22-08	2023-11-12 18:57:47.866-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1113	167	2023-11-12 18:57:48.116-08	2023-11-12 19:00:54.943-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1114	167	2023-11-12 19:01:57.481-08	2023-11-12 19:04:05.56-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
1115	167	2023-11-12 19:05:08.326-08	2023-11-12 19:06:20.879-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1116	168	2023-11-12 19:01:57.531-08	2023-11-12 19:04:05.61-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 20}	2	baseline	normal	140	decrease	20	\N
1117	168	2023-11-12 19:05:08.376-08	2023-11-12 19:06:21.179-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1118	168	2023-11-12 19:07:08.133-08	2023-11-12 19:09:15.449-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
1119	169	2023-11-12 19:00:55.033-08	2023-11-12 19:01:38.74-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1120	169	2023-11-12 19:01:57.571-08	2023-11-12 19:04:05.65-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
1121	169	2023-11-12 19:05:08.166-08	2023-11-12 19:06:20.969-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1122	169	2023-11-12 19:07:06.414-08	2023-11-12 19:11:08.477-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
1123	170	2023-11-12 19:05:08.296-08	2023-11-12 19:06:21.099-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1124	170	2023-11-12 19:07:06.548-08	2023-11-12 19:11:08.607-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
1125	170	2023-11-12 19:11:08.607-08	2023-11-12 19:12:02.109-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1126	171	2023-11-12 19:05:08.376-08	2023-11-12 19:06:21.179-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1127	171	2023-11-12 19:07:08.133-08	2023-11-12 19:11:08.437-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
1128	171	2023-11-12 19:11:08.437-08	2023-11-12 19:12:01.935-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1129	171	2023-11-12 19:13:10.992-08	2023-11-12 19:14:07.103-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1130	172	2023-11-12 19:07:08.213-08	2023-11-12 19:11:08.517-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
1131	172	2023-11-12 19:11:08.517-08	2023-11-12 19:12:02.019-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1132	172	2023-11-12 19:13:11.072-08	2023-11-12 19:14:07.183-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1133	172	2023-11-12 19:14:18.98-08	2023-11-12 19:16:28.277-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
1134	173	2023-11-12 19:11:08.517-08	2023-11-12 19:12:02.019-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1135	173	2023-11-12 19:13:13.596-08	2023-11-12 19:14:08.72-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1136	173	2023-11-12 19:14:19.26-08	2023-11-12 19:15:48.138-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
1137	174	2023-11-12 19:11:08.527-08	2023-11-12 19:12:02.029-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1138	174	2023-11-12 19:13:11.843-08	2023-11-12 19:13:50.661-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1139	174	2023-11-12 19:14:19.26-08	2023-11-12 19:15:48.138-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
1140	175	2023-11-12 19:11:52.082-08	2023-11-12 19:12:13.673-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1141	175	2023-11-12 19:12:15.931-08	2023-11-12 19:13:30.204-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1142	175	2023-11-12 19:14:19.12-08	2023-11-12 19:16:28.167-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
1143	175	2023-11-12 19:18:47.57-08	2023-11-12 19:20:39.566-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
1144	176	2023-11-12 19:13:13.466-08	2023-11-12 19:14:56.04-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1145	176	2023-11-12 19:18:47.58-08	2023-11-12 19:20:39.576-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
1146	176	2023-11-12 19:21:40.088-08	2023-11-12 19:22:28.792-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1147	177	2023-11-12 19:18:47.629-08	2023-11-12 19:20:39.626-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
1148	177	2023-11-12 19:21:40.138-08	2023-11-12 19:21:56.708-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1149	177	2023-11-12 19:22:01.23-08	2023-11-12 19:23:56.218-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 20}	2	baseline	normal	155	decrease	20	\N
1150	178	2023-11-12 19:18:41.366-08	2023-11-12 19:20:39.636-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
1151	178	2023-11-12 19:21:39.645-08	2023-11-12 19:21:56.718-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1152	178	2023-11-12 19:22:01.24-08	2023-11-12 19:23:56.228-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 15}	2	baseline	normal	155	decrease	15	\N
1153	178	2023-11-12 19:23:56.228-08	2023-11-12 19:24:36.918-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1154	179	2023-11-12 19:18:47.51-08	2023-11-12 19:20:39.506-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
1155	179	2023-11-12 19:21:40.268-08	2023-11-12 19:21:56.588-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1156	179	2023-11-12 19:22:01.11-08	2023-11-12 19:23:56.098-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 20}	2	baseline	normal	155	decrease	20	\N
1157	179	2023-11-12 19:23:56.098-08	2023-11-12 19:24:37.288-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1158	179	2023-11-12 19:26:11.186-08	2023-11-12 19:26:46.841-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1159	180	2023-11-12 19:18:41.516-08	2023-11-12 19:20:39.536-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
1160	180	2023-11-12 19:21:39.797-08	2023-11-12 19:21:56.618-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1161	180	2023-11-12 19:22:01.389-08	2023-11-12 19:23:56.128-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 15}	2	baseline	normal	155	decrease	15	\N
1162	180	2023-11-12 19:23:56.128-08	2023-11-12 19:24:37.068-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1163	180	2023-11-12 19:24:46.357-08	2023-11-12 19:25:22.28-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1164	180	2023-11-12 19:26:11.216-08	2023-11-12 19:26:46.871-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1165	181	2023-11-12 19:21:39.817-08	2023-11-12 19:21:56.638-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1166	181	2023-11-12 19:22:01.409-08	2023-11-12 19:23:56.148-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 15}	2	baseline	normal	155	decrease	15	\N
1167	181	2023-11-12 19:23:56.148-08	2023-11-12 19:24:37.088-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1168	181	2023-11-12 19:24:46.377-08	2023-11-12 19:25:22.55-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1169	181	2023-11-12 19:26:11.236-08	2023-11-12 19:26:46.891-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1170	182	2023-11-12 19:22:01.18-08	2023-11-12 19:23:56.168-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 20}	2	baseline	normal	155	decrease	20	\N
1171	182	2023-11-12 19:23:56.168-08	2023-11-12 19:24:37.108-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1172	182	2023-11-12 19:24:46.147-08	2023-11-12 19:25:22.32-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1173	182	2023-11-12 19:26:11.256-08	2023-11-12 19:26:46.911-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1174	182	2023-11-12 19:27:44.919-08	2023-11-12 19:30:54.491-08	{"Risk": 4, "Deceleration-LOW_PD": null}	4	deceleration	\N	\N	\N	\N	low_pd
1175	182	2023-11-12 19:31:00.013-08	2023-11-12 19:31:21.106-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1176	183	2023-11-12 19:26:11.106-08	2023-11-12 19:26:47.011-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1177	183	2023-11-12 19:30:59.863-08	2023-11-12 19:31:21.206-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1178	183	2023-11-12 19:32:49.309-08	2023-11-12 19:33:15.601-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1179	183	2023-11-12 19:33:15.601-08	2023-11-12 19:33:44.898-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1180	183	2023-11-12 19:33:52.898-08	2023-11-12 19:34:24.97-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1181	184	2023-11-12 19:26:11.356-08	2023-11-12 19:26:46.761-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1182	184	2023-11-12 19:28:49.796-08	2023-11-12 19:29:14.889-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1183	184	2023-11-12 19:29:39.497-08	2023-11-12 19:31:13.637-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1184	184	2023-11-12 19:33:40.82-08	2023-11-12 19:34:24.427-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1185	185	2023-11-12 19:28:49.846-08	2023-11-12 19:29:14.939-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1186	185	2023-11-12 19:29:39.547-08	2023-11-12 19:31:13.687-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1187	185	2023-11-12 19:33:40.87-08	2023-11-12 19:34:24.477-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1188	185	2023-11-12 19:34:30-08	2023-11-12 19:36:26.465-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
1189	186	2023-11-12 19:29:42.84-08	2023-11-12 19:31:13.477-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1190	186	2023-11-12 19:32:51.619-08	2023-11-12 19:33:15.401-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1191	186	2023-11-12 19:33:15.401-08	2023-11-12 19:34:03.444-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1192	186	2023-11-12 19:34:03.694-08	2023-11-12 19:36:26.505-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
1193	187	2023-11-12 19:29:41.115-08	2023-11-12 19:31:13.507-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1194	187	2023-11-12 19:32:53.144-08	2023-11-12 19:33:38.47-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1195	187	2023-11-12 19:33:44.745-08	2023-11-12 19:34:24.59-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1196	187	2023-11-12 19:34:27.098-08	2023-11-12 19:36:26.075-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
1197	187	2023-11-12 19:38:19.492-08	2023-11-12 19:39:07.93-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1198	187	2023-11-12 19:39:07.93-08	2023-11-12 19:40:11.106-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1199	188	2023-11-12 19:32:50.009-08	2023-11-12 19:33:35.805-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1200	188	2023-11-12 19:33:43.833-08	2023-11-12 19:34:24.427-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1201	188	2023-11-12 19:34:29.95-08	2023-11-12 19:36:26.415-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
1202	188	2023-11-12 19:38:16.32-08	2023-11-12 19:39:08.02-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1203	188	2023-11-12 19:39:08.02-08	2023-11-12 19:40:10.663-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1204	189	2023-11-12 19:33:04.565-08	2023-11-12 19:33:27.103-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1205	189	2023-11-12 19:33:41.675-08	2023-11-12 19:34:24.527-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1206	189	2023-11-12 19:34:30.05-08	2023-11-12 19:36:26.515-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
1207	189	2023-11-12 19:37:59.381-08	2023-11-12 19:38:52.338-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1208	189	2023-11-12 19:39:08.65-08	2023-11-12 19:40:11.296-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1209	190	2023-11-12 19:38:05.532-08	2023-11-12 19:38:52.428-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1210	190	2023-11-12 19:39:13.252-08	2023-11-12 19:40:10.883-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1211	190	2023-11-12 19:41:51.251-08	2023-11-12 19:45:08.546-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
1212	191	2023-11-12 19:38:19.452-08	2023-11-12 19:39:08.14-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1213	191	2023-11-12 19:39:08.14-08	2023-11-12 19:40:10.313-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1214	191	2023-11-12 19:40:22.859-08	2023-11-12 19:40:52.945-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1215	191	2023-11-12 19:41:50.931-08	2023-11-12 19:45:08.98-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
1216	192	2023-11-12 19:38:19.452-08	2023-11-12 19:39:08.14-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1217	192	2023-11-12 19:39:08.14-08	2023-11-12 19:40:10.313-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1218	192	2023-11-12 19:40:22.859-08	2023-11-12 19:40:52.945-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1219	192	2023-11-12 19:41:50.931-08	2023-11-12 19:45:08.98-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
1220	192	2023-11-12 19:45:55.158-08	2023-11-12 19:48:11.185-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1221	193	2023-11-12 19:39:07.89-08	2023-11-12 19:40:11.066-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1222	193	2023-11-12 19:41:51.181-08	2023-11-12 19:45:08.476-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
1223	193	2023-11-12 19:45:55.158-08	2023-11-12 19:48:55.606-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1224	194	2023-11-12 19:41:51.211-08	2023-11-12 19:45:08.506-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
1225	194	2023-11-12 19:45:55.188-08	2023-11-12 19:50:35.531-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
1226	195	2023-11-12 19:41:51.301-08	2023-11-12 19:45:08.596-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
1227	195	2023-11-12 19:45:55.278-08	2023-11-12 19:50:35.622-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
1228	196	2023-11-12 19:45:55.278-08	2023-11-12 19:50:35.622-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
1229	196	2023-11-12 19:51:41.373-08	2023-11-12 19:52:34.836-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1230	197	2023-11-12 19:47:43.708-08	2023-11-12 19:50:35.632-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 5}	2	baseline	normal	130	decrease	5	\N
1231	197	2023-11-12 19:51:41.383-08	2023-11-12 19:52:34.846-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1232	197	2023-11-12 19:52:44.38-08	2023-11-12 19:54:38.319-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
1233	198	2023-11-12 19:51:41.153-08	2023-11-12 19:52:34.612-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1234	198	2023-11-12 19:52:44.15-08	2023-11-12 19:55:12.983-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
1235	199	2023-11-12 19:51:41.403-08	2023-11-12 19:52:34.866-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1236	199	2023-11-12 19:52:44.4-08	2023-11-12 19:54:38.339-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
1237	199	2023-11-12 19:55:04.457-08	2023-11-12 19:55:22.996-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
1238	200	2023-11-12 19:51:41.393-08	2023-11-12 19:52:34.856-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1239	200	2023-11-12 19:52:44.39-08	2023-11-12 19:54:38.329-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
1240	200	2023-11-12 19:55:04.447-08	2023-11-12 19:55:22.986-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
1241	201	2023-11-12 19:51:41.143-08	2023-11-12 19:52:34.602-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1242	201	2023-11-12 19:52:44.14-08	2023-11-12 19:54:38.829-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
1243	201	2023-11-12 19:55:04.447-08	2023-11-12 19:55:22.737-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
1244	202	2023-11-12 19:52:44.14-08	2023-11-12 19:55:13.466-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
1245	203	2023-11-12 19:54:38.829-08	2023-11-12 19:55:13.466-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1246	203	2023-11-12 19:55:13.466-08	2023-11-12 19:55:57.623-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1247	203	2023-11-12 20:03:23.539-08	2023-11-12 20:04:18.72-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1248	203	2023-11-12 20:04:34.538-08	2023-11-12 20:05:07.662-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1249	204	2023-11-12 20:03:59.189-08	2023-11-12 20:04:34.568-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1250	204	2023-11-12 20:04:34.568-08	2023-11-12 20:05:05.193-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1251	205	2023-11-12 20:03:44.807-08	2023-11-12 20:04:34.498-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1252	205	2023-11-12 20:04:34.498-08	2023-11-12 20:05:08.619-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1253	205	2023-11-12 20:05:08.619-08	2023-11-12 20:05:33.211-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1254	206	2023-11-12 20:03:44.617-08	2023-11-12 20:04:34.558-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1255	206	2023-11-12 20:04:34.558-08	2023-11-12 20:05:08.429-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1256	206	2023-11-12 20:05:08.429-08	2023-11-12 20:05:33.271-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1257	206	2023-11-12 20:05:33.526-08	2023-11-12 20:07:52.375-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1258	207	2023-11-12 20:03:44.737-08	2023-11-12 20:04:34.668-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1259	207	2023-11-12 20:04:34.668-08	2023-11-12 20:05:01.781-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1260	207	2023-11-12 20:05:14.551-08	2023-11-12 20:07:52.235-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1261	208	2023-11-12 20:03:43.733-08	2023-11-12 20:04:34.628-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1262	208	2023-11-12 20:04:34.628-08	2023-11-12 20:05:28.786-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1263	208	2023-11-12 20:05:29.036-08	2023-11-12 20:07:52.155-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1264	208	2023-11-12 20:08:20.034-08	2023-11-12 20:10:35.609-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
1265	209	2023-11-12 20:03:23.963-08	2023-11-12 20:04:18.63-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1266	209	2023-11-12 20:04:34.698-08	2023-11-12 20:05:00.051-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1267	209	2023-11-12 20:05:06.561-08	2023-11-12 20:07:52.225-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1268	209	2023-11-12 20:08:20.613-08	2023-11-12 20:10:35.429-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
1269	210	2023-11-12 20:04:01.646-08	2023-11-12 20:04:34.538-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1270	210	2023-11-12 20:04:34.538-08	2023-11-12 20:05:22.195-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1271	210	2023-11-12 20:05:22.451-08	2023-11-12 20:07:52.345-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1272	210	2023-11-12 20:08:20.483-08	2023-11-12 20:10:35.299-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
1273	211	2023-11-12 20:08:20.563-08	2023-11-12 20:10:35.379-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
1274	212	2023-11-12 20:08:20.094-08	2023-11-12 20:10:35.669-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
1275	219	2023-11-12 20:27:54.605-08	2023-11-12 20:28:32.278-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1276	220	2023-11-12 20:27:54.605-08	2023-11-12 20:28:32.278-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1277	221	2023-11-12 20:27:54.605-08	2023-11-12 20:28:32.278-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1278	221	2023-11-12 20:29:39.292-08	2023-11-12 20:31:50.836-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1279	221	2023-11-12 20:31:50.836-08	2023-11-12 20:32:40.027-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1280	222	2023-11-12 20:27:54.605-08	2023-11-12 20:28:32.278-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1281	222	2023-11-12 20:29:39.292-08	2023-11-12 20:31:50.836-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1282	222	2023-11-12 20:31:50.836-08	2023-11-12 20:32:40.027-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1283	223	2023-11-12 20:27:54.605-08	2023-11-12 20:28:32.278-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1284	223	2023-11-12 20:29:39.292-08	2023-11-12 20:31:50.836-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1285	223	2023-11-12 20:31:50.836-08	2023-11-12 20:32:40.027-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1286	223	2023-11-12 20:34:50.538-08	2023-11-12 20:36:02.068-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1287	224	2023-11-12 20:27:54.605-08	2023-11-12 20:28:32.278-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1288	224	2023-11-12 20:29:39.292-08	2023-11-12 20:31:50.836-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1289	224	2023-11-12 20:31:50.836-08	2023-11-12 20:32:40.027-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1290	224	2023-11-12 20:34:50.538-08	2023-11-12 20:36:02.068-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1291	224	2023-11-12 20:36:02.318-08	2023-11-12 20:37:57.816-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
1292	225	2023-11-12 20:29:39.332-08	2023-11-12 20:31:50.626-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1293	225	2023-11-12 20:31:50.626-08	2023-11-12 20:32:40.067-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1294	225	2023-11-12 20:34:50.578-08	2023-11-12 20:36:02.108-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1295	225	2023-11-12 20:36:02.358-08	2023-11-12 20:37:57.856-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
1296	225	2023-11-12 20:38:02.13-08	2023-11-12 20:40:22.99-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
1297	226	2023-11-12 20:31:50.776-08	2023-11-12 20:32:39.967-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1298	226	2023-11-12 20:34:50.728-08	2023-11-12 20:36:02.258-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1299	226	2023-11-12 20:36:02.508-08	2023-11-12 20:37:58.011-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1300	226	2023-11-12 20:38:04.537-08	2023-11-12 20:40:22.639-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
1301	227	2023-11-12 20:31:50.776-08	2023-11-12 20:32:39.967-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1302	227	2023-11-12 20:34:50.728-08	2023-11-12 20:36:02.258-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1303	227	2023-11-12 20:36:02.508-08	2023-11-12 20:37:58.011-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1304	227	2023-11-12 20:38:04.537-08	2023-11-12 20:40:22.639-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
1305	227	2023-11-12 20:40:22.889-08	2023-11-12 20:41:58.047-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
1306	228	2023-11-12 20:34:50.718-08	2023-11-12 20:36:02.248-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1307	228	2023-11-12 20:36:02.498-08	2023-11-12 20:37:58.001-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1308	228	2023-11-12 20:38:04.528-08	2023-11-12 20:40:22.629-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
1309	228	2023-11-12 20:40:22.879-08	2023-11-12 20:43:19.377-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
1310	229	2023-11-12 20:34:50.708-08	2023-11-12 20:36:01.985-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1311	229	2023-11-12 20:36:02.238-08	2023-11-12 20:37:57.991-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
1312	229	2023-11-12 20:38:02.26-08	2023-11-12 20:40:22.87-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
1313	229	2023-11-12 20:40:23.12-08	2023-11-12 20:43:19.617-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
1314	230	2023-11-12 20:36:02.248-08	2023-11-12 20:37:58.001-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
1315	230	2023-11-12 20:38:02.27-08	2023-11-12 20:40:22.879-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
1316	230	2023-11-12 20:40:23.129-08	2023-11-12 20:43:19.627-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
1317	230	2023-11-12 20:43:40.46-08	2023-11-12 20:45:46.712-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1318	231	2023-11-12 20:40:22.879-08	2023-11-12 20:43:19.377-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
1319	231	2023-11-12 20:43:40.71-08	2023-11-12 20:46:48.199-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1320	231	2023-11-12 20:46:59.243-08	2023-11-12 20:47:24.604-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1321	232	2023-11-12 20:40:22.99-08	2023-11-12 20:43:19.237-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
1322	232	2023-11-12 20:43:40.57-08	2023-11-12 20:46:48.059-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1323	232	2023-11-12 20:46:59.103-08	2023-11-12 20:47:24.717-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1324	233	2023-11-12 20:41:57.702-08	2023-11-12 20:42:51.43-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1325	233	2023-11-12 20:43:40.38-08	2023-11-12 20:45:46.882-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1326	233	2023-11-12 20:46:59.163-08	2023-11-12 20:47:24.274-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1327	233	2023-11-12 20:47:31.051-08	2023-11-12 20:51:08.42-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1328	234	2023-11-12 20:43:40.38-08	2023-11-12 20:45:46.882-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1329	234	2023-11-12 20:46:59.163-08	2023-11-12 20:47:24.274-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1330	234	2023-11-12 20:47:31.051-08	2023-11-12 20:52:12.672-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1331	235	2023-11-12 20:43:40.38-08	2023-11-12 20:45:46.882-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1332	235	2023-11-12 20:46:59.163-08	2023-11-12 20:47:24.274-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1333	235	2023-11-12 20:47:31.051-08	2023-11-12 20:52:55.342-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1334	236	2023-11-12 20:46:59.163-08	2023-11-12 20:47:24.524-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1335	236	2023-11-12 20:47:31.051-08	2023-11-12 20:52:55.342-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1336	237	2023-11-12 20:46:59.243-08	2023-11-12 20:47:24.354-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1337	237	2023-11-12 20:47:30.881-08	2023-11-12 20:52:55.172-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1338	237	2023-11-12 20:53:46.622-08	2023-11-12 20:55:16.717-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1339	237	2023-11-12 20:55:16.717-08	2023-11-12 20:56:38.784-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1340	238	2023-11-12 20:53:46.622-08	2023-11-12 20:55:16.717-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1341	238	2023-11-12 20:55:16.717-08	2023-11-12 20:56:38.784-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1342	239	2023-11-12 20:53:46.612-08	2023-11-12 20:55:16.707-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1343	239	2023-11-12 20:55:16.707-08	2023-11-12 20:56:38.774-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1344	240	2023-11-12 20:53:46.852-08	2023-11-12 20:55:16.947-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1345	240	2023-11-12 20:55:16.947-08	2023-11-12 20:56:39.268-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1346	240	2023-11-12 20:58:52.801-08	2023-11-12 20:59:26.149-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1347	240	2023-11-12 20:59:43.967-08	2023-11-12 21:02:37.921-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
1348	241	2023-11-12 20:55:16.947-08	2023-11-12 20:56:39.268-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1349	241	2023-11-12 20:58:52.801-08	2023-11-12 20:59:26.149-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1350	241	2023-11-12 20:59:43.967-08	2023-11-12 21:02:37.921-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
1351	242	2023-11-12 20:59:44.007-08	2023-11-12 21:02:37.711-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
1352	243	2023-11-12 22:59:14.301-08	2023-11-12 22:59:45.188-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1353	244	2023-11-12 23:03:08.406-08	2023-11-12 23:03:36.499-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1354	244	2023-11-12 23:07:54.853-08	2023-11-12 23:08:40.585-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1355	245	2023-11-12 23:03:08.316-08	2023-11-12 23:03:36.409-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1356	245	2023-11-12 23:07:54.763-08	2023-11-12 23:08:40.495-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1357	245	2023-11-12 23:11:07.124-08	2023-11-12 23:11:59.611-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1358	246	2023-11-12 23:03:08.376-08	2023-11-12 23:03:51.531-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1359	246	2023-11-12 23:07:54.853-08	2023-11-12 23:08:40.585-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1360	246	2023-11-12 23:11:11.74-08	2023-11-12 23:11:59.451-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1361	246	2023-11-12 23:11:59.451-08	2023-11-12 23:12:41.135-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1362	247	2023-11-12 23:06:30.166-08	2023-11-12 23:07:55.053-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1363	247	2023-11-12 23:11:13.742-08	2023-11-12 23:11:59.441-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1364	247	2023-11-12 23:11:59.441-08	2023-11-12 23:12:41.125-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1365	247	2023-11-12 23:12:51.177-08	2023-11-12 23:13:36.654-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1366	248	2023-11-12 23:06:08.73-08	2023-11-12 23:07:54.873-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1367	248	2023-11-12 23:11:19.044-08	2023-11-12 23:11:57.713-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1368	248	2023-11-12 23:11:59.471-08	2023-11-12 23:12:41.155-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1369	248	2023-11-12 23:12:51.457-08	2023-11-12 23:13:36.684-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1370	249	2023-11-12 23:07:54.843-08	2023-11-12 23:08:40.575-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1371	249	2023-11-12 23:11:19.014-08	2023-11-12 23:11:57.683-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1372	249	2023-11-12 23:11:59.441-08	2023-11-12 23:12:41.125-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1373	249	2023-11-12 23:12:51.427-08	2023-11-12 23:13:36.654-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1374	250	2023-11-12 23:11:10.966-08	2023-11-12 23:11:59.431-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1375	250	2023-11-12 23:11:59.431-08	2023-11-12 23:12:41.115-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1376	250	2023-11-12 23:12:51.417-08	2023-11-12 23:13:36.644-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1377	250	2023-11-12 23:17:06.908-08	2023-11-12 23:18:10.697-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1378	251	2023-11-12 23:11:10.277-08	2023-11-12 23:11:59.491-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1379	251	2023-11-12 23:11:59.491-08	2023-11-12 23:12:41.175-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1380	251	2023-11-12 23:12:51.227-08	2023-11-12 23:13:36.704-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1381	251	2023-11-12 23:17:06.718-08	2023-11-12 23:18:10.502-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1382	252	2023-11-12 23:12:51.327-08	2023-11-12 23:13:36.554-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1383	252	2023-11-12 23:17:06.818-08	2023-11-12 23:18:10.602-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1384	252	2023-11-12 23:20:33.991-08	2023-11-12 23:23:16.424-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
1385	253	2023-11-12 23:16:55.139-08	2023-11-12 23:17:19.494-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1386	253	2023-11-12 23:20:34.111-08	2023-11-12 23:24:10.528-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
1387	254	2023-11-12 23:16:54.899-08	2023-11-12 23:17:19.504-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1388	254	2023-11-12 23:20:34.121-08	2023-11-12 23:24:10.537-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
1389	255	2023-11-12 23:16:55-08	2023-11-12 23:17:19.349-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1390	255	2023-11-12 23:20:33.971-08	2023-11-12 23:24:10.638-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
1391	256	2023-11-12 23:20:34.021-08	2023-11-12 23:24:10.688-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
1392	257	2023-11-12 23:20:34.031-08	2023-11-12 23:24:10.698-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
1393	258	2023-11-12 23:20:34.111-08	2023-11-12 23:24:10.528-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
1394	258	2023-11-12 23:30:02.166-08	2023-11-12 23:30:28.006-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1395	258	2023-11-12 23:30:45.087-08	2023-11-12 23:31:09.289-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1396	259	2023-11-12 23:30:02.228-08	2023-11-12 23:30:55.33-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1397	259	2023-11-12 23:30:55.58-08	2023-11-12 23:32:47.359-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariavility-INCREASE": 55}	2	baseline	normal	135	\N	\N	\N
1398	260	2023-11-12 23:30:00.269-08	2023-11-12 23:30:36.911-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1399	260	2023-11-12 23:33:48.11-08	2023-11-12 23:34:12.667-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1400	260	2023-11-12 23:34:02.887-08	2023-11-12 23:34:45.583-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1401	261	2023-11-12 23:30:02.82-08	2023-11-12 23:30:46.961-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1402	261	2023-11-12 23:30:46.961-08	2023-11-12 23:31:09.399-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1403	261	2023-11-12 23:31:09.655-08	2023-11-12 23:32:46.033-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariavility-INCREASE": 35}	2	baseline	normal	135	\N	\N	\N
1404	261	2023-11-12 23:33:53.019-08	2023-11-12 23:34:15.809-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1405	262	2023-11-12 23:30:00.096-08	2023-11-12 23:30:36.741-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1406	262	2023-11-12 23:32:19.423-08	2023-11-12 23:32:45.958-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1407	262	2023-11-12 23:32:45.958-08	2023-11-12 23:33:21.753-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1408	262	2023-11-12 23:33:28.588-08	2023-11-12 23:34:01.967-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1409	262	2023-11-12 23:34:02.967-08	2023-11-12 23:34:45.413-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1410	263	2023-11-12 23:30:02.62-08	2023-11-12 23:30:46.761-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1411	263	2023-11-12 23:30:58.125-08	2023-11-12 23:32:46.083-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariavility-INCREASE": 35}	2	baseline	normal	140	\N	\N	\N
1412	263	2023-11-12 23:33:53.069-08	2023-11-12 23:34:15.859-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1413	264	2023-11-12 23:30:19.277-08	2023-11-12 23:30:42.595-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1414	264	2023-11-12 23:30:50.644-08	2023-11-12 23:32:47.289-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariavility-INCREASE": 70}	2	baseline	normal	135	\N	\N	\N
1415	264	2023-11-12 23:33:38.17-08	2023-11-12 23:34:03.278-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1416	264	2023-11-12 23:34:12.317-08	2023-11-12 23:34:50.509-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1417	264	2023-11-12 23:36:21.394-08	2023-11-12 23:36:40.218-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1418	265	2023-11-12 23:29:31.501-08	2023-11-12 23:30:46.338-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1419	265	2023-11-12 23:31:19.618-08	2023-11-12 23:33:38.05-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariavility-INCREASE": 35}	2	baseline	normal	130	\N	\N	\N
1420	265	2023-11-12 23:33:38.05-08	2023-11-12 23:33:59.644-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1421	265	2023-11-12 23:34:08.404-08	2023-11-12 23:34:50.359-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1422	265	2023-11-12 23:36:21.244-08	2023-11-12 23:36:41.32-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1423	265	2023-11-12 23:37:32.277-08	2023-11-12 23:39:58.932-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1424	266	2023-11-12 23:33:49.155-08	2023-11-12 23:34:16.966-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1425	266	2023-11-12 23:34:16.966-08	2023-11-12 23:34:50.389-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1426	266	2023-11-12 23:37:32.807-08	2023-11-12 23:40:56.698-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1427	267	2023-11-12 23:34:08.537-08	2023-11-12 23:34:50.499-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1428	267	2023-11-12 23:36:21.384-08	2023-11-12 23:36:40.961-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1429	267	2023-11-12 23:37:32.417-08	2023-11-12 23:40:56.558-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1430	268	2023-11-12 23:36:34.394-08	2023-11-12 23:36:56.985-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1431	268	2023-11-12 23:37:32.877-08	2023-11-12 23:40:56.768-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1432	268	2023-11-12 23:43:18.849-08	2023-11-12 23:43:48.975-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1433	268	2023-11-12 23:43:59.774-08	2023-11-12 23:44:38.932-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1434	269	2023-11-12 23:35:55.684-08	2023-11-12 23:36:21.284-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1435	269	2023-11-12 23:36:34.334-08	2023-11-12 23:36:56.925-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1436	269	2023-11-12 23:37:32.817-08	2023-11-12 23:40:56.708-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1437	269	2023-11-12 23:43:18.789-08	2023-11-12 23:43:48.916-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1438	269	2023-11-12 23:43:59.714-08	2023-11-12 23:44:38.873-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1439	269	2023-11-12 23:45:48.691-08	2023-11-12 23:46:24.587-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1440	270	2023-11-12 23:37:32.407-08	2023-11-12 23:40:56.547-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
1441	270	2023-11-12 23:43:18.879-08	2023-11-12 23:43:49.005-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1442	270	2023-11-12 23:43:59.55-08	2023-11-12 23:44:38.962-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1443	270	2023-11-12 23:45:48.281-08	2023-11-12 23:46:13.873-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1444	271	2023-11-12 23:43:59.804-08	2023-11-12 23:44:38.962-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1445	271	2023-11-12 23:45:48.531-08	2023-11-12 23:46:14.622-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1446	271	2023-11-12 23:48:24.396-08	2023-11-12 23:48:57.793-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1447	272	2023-11-12 23:43:59.66-08	2023-11-12 23:44:38.819-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1448	272	2023-11-12 23:46:06.229-08	2023-11-12 23:46:26.545-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1449	272	2023-11-12 23:47:36.593-08	2023-11-12 23:48:17.514-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1450	273	2023-11-12 23:43:59.66-08	2023-11-12 23:44:38.819-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1451	273	2023-11-12 23:46:06.229-08	2023-11-12 23:46:26.545-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1452	273	2023-11-12 23:47:36.593-08	2023-11-12 23:48:17.514-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1453	273	2023-11-12 23:50:03.93-08	2023-11-12 23:52:37.847-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
1454	274	2023-11-12 23:43:59.66-08	2023-11-12 23:44:38.819-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1455	274	2023-11-12 23:45:34.813-08	2023-11-12 23:46:13.727-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1456	274	2023-11-12 23:48:09.221-08	2023-11-12 23:48:29.307-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1457	274	2023-11-12 23:50:03.71-08	2023-11-12 23:52:37.877-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
1458	275	2023-11-12 23:45:34.813-08	2023-11-12 23:46:13.727-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1459	275	2023-11-12 23:48:09.221-08	2023-11-12 23:48:29.307-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1460	275	2023-11-12 23:50:03.71-08	2023-11-12 23:52:37.877-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
1461	275	2023-11-12 23:55:02.004-08	2023-11-12 23:55:45.433-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1462	276	2023-11-12 23:47:36.583-08	2023-11-12 23:48:16-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1463	276	2023-11-12 23:48:08.971-08	2023-11-12 23:48:29.517-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1464	276	2023-11-12 23:50:03.67-08	2023-11-12 23:52:37.837-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
1465	276	2023-11-12 23:55:01.964-08	2023-11-12 23:55:45.393-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1466	277	2023-11-12 23:48:09.031-08	2023-11-12 23:48:29.617-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1467	277	2023-11-12 23:50:04.02-08	2023-11-12 23:52:37.937-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
1468	277	2023-11-12 23:55:01.31-08	2023-11-12 23:55:45.243-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1469	278	2023-11-12 23:50:04.03-08	2023-11-12 23:52:37.947-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
1470	278	2023-11-12 23:55:01.32-08	2023-11-12 23:55:45.253-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1471	279	2023-11-12 23:55:01.884-08	2023-11-12 23:55:45.313-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1472	280	2023-11-12 23:55:01.914-08	2023-11-12 23:55:45.343-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1473	280	2023-11-13 00:01:16.479-08	2023-11-13 00:02:52.872-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1474	281	2023-11-12 23:55:01.33-08	2023-11-12 23:55:45.263-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1475	281	2023-11-13 00:01:16.149-08	2023-11-13 00:02:53.046-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1476	282	2023-11-13 00:01:16.149-08	2023-11-13 00:02:53.046-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1477	283	2023-11-13 00:01:16.419-08	2023-11-13 00:02:52.812-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1478	283	2023-11-13 00:06:35.046-08	2023-11-13 00:07:40.819-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1479	284	2023-11-13 00:01:16.439-08	2023-11-13 00:02:52.832-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1480	284	2023-11-13 00:06:35.066-08	2023-11-13 00:07:40.839-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1481	285	2023-11-13 00:01:16.439-08	2023-11-13 00:02:52.832-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1482	285	2023-11-13 00:06:35.066-08	2023-11-13 00:07:40.839-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1483	285	2023-11-13 00:09:22.524-08	2023-11-13 00:11:00.692-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
1484	286	2023-11-13 00:06:34.351-08	2023-11-13 00:07:40.629-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1485	286	2023-11-13 00:11:29.352-08	2023-11-13 00:12:35.385-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1486	287	2023-11-13 00:06:34.351-08	2023-11-13 00:07:40.629-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1487	287	2023-11-13 00:11:29.352-08	2023-11-13 00:12:35.385-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1488	287	2023-11-13 00:13:29.624-08	2023-11-13 00:13:53.728-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1489	288	2023-11-13 00:06:34.861-08	2023-11-13 00:07:40.889-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1490	288	2023-11-13 00:09:22.574-08	2023-11-13 00:11:29.362-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariavility-INCREASE": 25}	2	baseline	normal	140	\N	\N	\N
1491	288	2023-11-13 00:13:29.634-08	2023-11-13 00:13:54.242-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1492	288	2023-11-13 00:15:19.329-08	2023-11-13 00:15:51.722-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1493	289	2023-11-13 00:09:22.645-08	2023-11-13 00:11:29.182-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariavility-INCREASE": 25}	2	baseline	normal	140	\N	\N	\N
1494	289	2023-11-13 00:13:29.704-08	2023-11-13 00:13:54.058-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1495	289	2023-11-13 00:15:19.149-08	2023-11-13 00:15:51.792-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1496	290	2023-11-13 00:11:29.202-08	2023-11-13 00:12:35.235-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1497	290	2023-11-13 00:13:29.724-08	2023-11-13 00:13:53.828-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1498	290	2023-11-13 00:15:19.169-08	2023-11-13 00:15:51.562-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1499	290	2023-11-13 00:18:05.812-08	2023-11-13 00:18:45.743-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1500	291	2023-11-13 00:11:29.272-08	2023-11-13 00:12:35.305-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1501	291	2023-11-13 00:13:29.794-08	2023-11-13 00:13:53.898-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1502	291	2023-11-13 00:15:19.238-08	2023-11-13 00:15:51.632-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1503	291	2023-11-13 00:18:05.882-08	2023-11-13 00:18:45.563-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1504	292	2023-11-13 00:13:29.634-08	2023-11-13 00:13:54.242-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1505	292	2023-11-13 00:18:06.191-08	2023-11-13 00:18:45.339-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1506	292	2023-11-13 00:20:46.093-08	2023-11-13 00:24:14.023-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1507	293	2023-11-13 00:15:19.319-08	2023-11-13 00:15:51.712-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1508	293	2023-11-13 00:18:04.491-08	2023-11-13 00:18:45.403-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1509	293	2023-11-13 00:20:26.101-08	2023-11-13 00:22:14.56-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 25}	1	baseline	normal	145	normal	25	\N
1510	293	2023-11-13 00:23:00.509-08	2023-11-13 00:25:02.544-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
1511	294	2023-11-13 00:18:04.592-08	2023-11-13 00:18:45.753-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1512	294	2023-11-13 00:20:43.994-08	2023-11-13 00:24:14.188-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
1513	295	2023-11-13 00:20:44.044-08	2023-11-13 00:24:14.238-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
1514	296	2023-11-13 00:20:27.545-08	2023-11-13 00:22:14.75-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 25}	1	baseline	normal	145	normal	25	\N
1515	296	2023-11-13 00:23:00.449-08	2023-11-13 00:26:03.995-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1516	296	2023-11-13 00:28:52.957-08	2023-11-13 00:29:41.662-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1517	297	2023-11-13 00:28:52.957-08	2023-11-13 00:29:41.662-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1518	298	2023-11-13 00:22:59.545-08	2023-11-13 00:26:04.095-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1519	298	2023-11-13 00:28:53.057-08	2023-11-13 00:29:41.762-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1520	299	2023-11-13 00:28:53.067-08	2023-11-13 00:29:41.772-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1521	300	2023-11-13 00:28:53.106-08	2023-11-13 00:29:41.812-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1522	301	2023-11-13 00:28:53.106-08	2023-11-13 00:29:41.812-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1523	302	2023-11-13 00:28:52.957-08	2023-11-13 00:29:41.662-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1524	303	2023-11-13 00:28:52.987-08	2023-11-13 00:29:41.692-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1525	305	2023-11-13 00:32:28.237-08	2023-11-13 00:33:01.631-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1526	308	2023-11-13 00:44:07.07-08	2023-11-13 00:45:50.422-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1527	311	2023-11-13 00:48:47.379-08	2023-11-13 00:51:24.257-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1528	312	2023-11-13 00:48:47.369-08	2023-11-13 00:52:51.6-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1529	313	2023-11-13 00:48:47.399-08	2023-11-13 00:52:51.63-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1530	313	2023-11-13 00:52:51.88-08	2023-11-13 00:55:08.436-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1531	314	2023-11-13 00:48:47.439-08	2023-11-13 00:52:51.67-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1532	314	2023-11-13 00:52:51.92-08	2023-11-13 00:55:08.476-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1533	315	2023-11-13 00:48:47.359-08	2023-11-13 00:52:51.84-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1534	315	2023-11-13 00:52:52.09-08	2023-11-13 00:55:08.646-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1535	316	2023-11-13 00:48:47.359-08	2023-11-13 00:52:51.84-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1536	316	2023-11-13 00:52:52.09-08	2023-11-13 00:55:08.646-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1537	316	2023-11-13 00:56:40.511-08	2023-11-13 00:58:49.514-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1538	317	2023-11-13 00:52:51.98-08	2023-11-13 00:55:08.536-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1539	318	2023-11-13 00:56:40.652-08	2023-11-13 01:01:32.291-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
1540	318	2023-11-13 01:01:32.291-08	2023-11-13 01:02:01.88-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1541	318	2023-11-13 01:02:01.88-08	2023-11-13 01:02:53.591-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1542	319	2023-11-13 00:56:40.652-08	2023-11-13 01:01:32.041-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
1543	319	2023-11-13 01:01:32.041-08	2023-11-13 01:02:02.877-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1544	320	2023-11-13 00:56:40.652-08	2023-11-13 01:01:32.041-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
1545	320	2023-11-13 01:01:32.041-08	2023-11-13 01:02:02.157-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1546	320	2023-11-13 01:02:02.157-08	2023-11-13 01:02:53.875-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1547	321	2023-11-13 00:56:40.652-08	2023-11-13 01:01:32.041-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
1548	321	2023-11-13 01:01:32.041-08	2023-11-13 01:02:02.877-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1549	321	2023-11-13 01:06:14.16-08	2023-11-13 01:06:45.535-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1550	322	2023-11-13 00:58:55.929-08	2023-11-13 01:01:32.291-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 10}	2	baseline	normal	130	decrease	10	\N
1551	322	2023-11-13 01:01:32.291-08	2023-11-13 01:02:02.403-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1552	322	2023-11-13 01:02:02.403-08	2023-11-13 01:02:53.591-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1553	322	2023-11-13 01:06:13.94-08	2023-11-13 01:06:45.565-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1554	323	2023-11-13 01:01:32.291-08	2023-11-13 01:02:02.639-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1555	323	2023-11-13 01:04:45.793-08	2023-11-13 01:05:11.931-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1556	323	2023-11-13 01:06:13.94-08	2023-11-13 01:06:45.565-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1557	324	2023-11-13 01:01:32.291-08	2023-11-13 01:02:02.403-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1558	324	2023-11-13 01:02:02.403-08	2023-11-13 01:02:53.591-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1559	324	2023-11-13 01:06:13.94-08	2023-11-13 01:06:45.565-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1560	324	2023-11-13 01:09:55.575-08	2023-11-13 01:10:45.523-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1561	325	2023-11-13 01:01:32.051-08	2023-11-13 01:02:02.649-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1562	325	2023-11-13 01:06:13.95-08	2023-11-13 01:06:45.575-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1563	325	2023-11-13 01:09:55.585-08	2023-11-13 01:10:45.533-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1564	326	2023-11-13 01:09:55.595-08	2023-11-13 01:10:45.793-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1565	326	2023-11-13 01:11:03.365-08	2023-11-13 01:12:45.774-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1566	327	2023-11-13 01:06:13.93-08	2023-11-13 01:06:45.555-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1567	327	2023-11-13 01:09:55.565-08	2023-11-13 01:10:45.513-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1568	327	2023-11-13 01:11:03.585-08	2023-11-13 01:12:45.744-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1569	328	2023-11-13 01:09:55.555-08	2023-11-13 01:10:45.753-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1570	328	2023-11-13 01:11:03.575-08	2023-11-13 01:12:45.734-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1571	328	2023-11-13 01:13:49.731-08	2023-11-13 01:16:16.334-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1572	329	2023-11-13 01:09:55.575-08	2023-11-13 01:10:45.773-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1573	329	2023-11-13 01:11:03.345-08	2023-11-13 01:12:45.754-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1574	329	2023-11-13 01:13:49.751-08	2023-11-13 01:16:16.354-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1575	329	2023-11-13 01:17:12.351-08	2023-11-13 01:18:14.866-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1576	330	2023-11-13 01:09:55.615-08	2023-11-13 01:10:45.563-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1577	330	2023-11-13 01:11:03.385-08	2023-11-13 01:12:45.794-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1578	330	2023-11-13 01:13:49.537-08	2023-11-13 01:16:15.889-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1579	330	2023-11-13 01:17:12.641-08	2023-11-13 01:18:14.906-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1580	330	2023-11-13 01:18:15.162-08	2023-11-13 01:20:15.462-08	{"Risk": 1, "Baseline-NORMAL": 125, "BaselineVariability-NORMAL": 20}	1	baseline	normal	125	normal	20	\N
1581	331	2023-11-13 01:11:03.385-08	2023-11-13 01:12:45.794-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1582	331	2023-11-13 01:13:49.537-08	2023-11-13 01:16:15.889-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1583	331	2023-11-13 01:17:12.641-08	2023-11-13 01:18:14.906-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1584	331	2023-11-13 01:18:15.162-08	2023-11-13 01:21:12.737-08	{"Risk": 1, "Baseline-NORMAL": 125, "BaselineVariability-NORMAL": 20}	1	baseline	normal	125	normal	20	\N
1585	332	2023-11-13 01:13:49.527-08	2023-11-13 01:16:15.879-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1586	332	2023-11-13 01:17:12.631-08	2023-11-13 01:18:14.896-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1587	332	2023-11-13 01:18:15.152-08	2023-11-13 01:22:16.512-08	{"Risk": 1, "Baseline-NORMAL": 125, "BaselineVariability-NORMAL": 20}	1	baseline	normal	125	normal	20	\N
1588	333	2023-11-13 01:13:49.771-08	2023-11-13 01:16:16.374-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1589	333	2023-11-13 01:17:12.371-08	2023-11-13 01:18:14.886-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1590	333	2023-11-13 01:18:15.142-08	2023-11-13 01:23:18.029-08	{"Risk": 1, "Baseline-NORMAL": 125, "BaselineVariability-NORMAL": 20}	1	baseline	normal	125	normal	20	\N
1591	333	2023-11-13 01:23:18.029-08	2023-11-13 01:24:04.75-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1592	334	2023-11-13 01:17:12.381-08	2023-11-13 01:18:14.896-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1593	334	2023-11-13 01:18:15.152-08	2023-11-13 01:23:18.039-08	{"Risk": 1, "Baseline-NORMAL": 125, "BaselineVariability-NORMAL": 20}	1	baseline	normal	125	normal	20	\N
1594	334	2023-11-13 01:23:18.039-08	2023-11-13 01:24:04.76-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1595	335	2023-11-13 01:17:12.391-08	2023-11-13 01:18:14.906-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1596	335	2023-11-13 01:18:15.162-08	2023-11-13 01:23:18.049-08	{"Risk": 1, "Baseline-NORMAL": 125, "BaselineVariability-NORMAL": 20}	1	baseline	normal	125	normal	20	\N
1597	335	2023-11-13 01:23:18.049-08	2023-11-13 01:24:04.77-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1598	336	2023-11-13 01:18:14.656-08	2023-11-13 01:23:18.049-08	{"Risk": 1, "Baseline-NORMAL": 125, "BaselineVariability-NORMAL": 20}	1	baseline	normal	125	normal	20	\N
1599	336	2023-11-13 01:23:18.049-08	2023-11-13 01:24:04.77-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1600	337	2023-11-13 01:23:17.968-08	2023-11-13 01:24:04.69-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1601	337	2023-11-13 01:26:35.601-08	2023-11-13 01:29:12.341-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1602	338	2023-11-13 01:23:18.059-08	2023-11-13 01:24:01.761-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1603	338	2023-11-13 01:26:35.691-08	2023-11-13 01:29:12.431-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1604	339	2023-11-13 01:23:18.069-08	2023-11-13 01:23:57.251-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1605	339	2023-11-13 01:26:35.701-08	2023-11-13 01:29:12.441-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1606	339	2023-11-13 01:29:44.839-08	2023-11-13 01:31:43.865-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1607	340	2023-11-13 01:26:35.621-08	2023-11-13 01:29:12.361-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1608	340	2023-11-13 01:29:44.759-08	2023-11-13 01:31:43.785-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1609	340	2023-11-13 01:31:43.785-08	2023-11-13 01:32:44.313-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1610	341	2023-11-13 01:26:35.521-08	2023-11-13 01:29:12.261-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1611	341	2023-11-13 01:29:44.659-08	2023-11-13 01:31:43.935-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1612	341	2023-11-13 01:31:43.935-08	2023-11-13 01:32:54.244-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1613	341	2023-11-13 01:33:03.494-08	2023-11-13 01:33:47.764-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1614	341	2023-11-13 01:34:27.939-08	2023-11-13 01:35:04.848-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1615	342	2023-11-13 01:26:35.521-08	2023-11-13 01:29:12.261-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1616	342	2023-11-13 01:29:44.659-08	2023-11-13 01:31:43.935-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1617	342	2023-11-13 01:31:43.935-08	2023-11-13 01:32:47.688-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1618	342	2023-11-13 01:34:28.149-08	2023-11-13 01:35:04.808-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1619	342	2023-11-13 01:36:14.605-08	2023-11-13 01:37:12.986-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1620	343	2023-11-13 01:29:44.659-08	2023-11-13 01:31:43.935-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1621	343	2023-11-13 01:31:43.935-08	2023-11-13 01:32:54.244-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1622	343	2023-11-13 01:33:03.494-08	2023-11-13 01:33:47.764-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1623	343	2023-11-13 01:34:27.939-08	2023-11-13 01:35:04.848-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1624	343	2023-11-13 01:35:35.729-08	2023-11-13 01:38:04.268-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1625	344	2023-11-13 01:29:44.759-08	2023-11-13 01:31:43.785-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1626	344	2023-11-13 01:31:43.785-08	2023-11-13 01:32:49.299-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1627	344	2023-11-13 01:32:49.299-08	2023-11-13 01:33:41.549-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1628	344	2023-11-13 01:34:27.999-08	2023-11-13 01:35:04.658-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1629	344	2023-11-13 01:36:41.552-08	2023-11-13 01:37:10.828-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1630	344	2023-11-13 01:37:11.582-08	2023-11-13 01:39:15.151-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
1631	344	2023-11-13 01:39:15.151-08	2023-11-13 01:40:09.881-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1632	345	2023-11-13 01:32:40.793-08	2023-11-13 01:33:25.063-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1633	345	2023-11-13 01:34:28.029-08	2023-11-13 01:35:04.688-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1634	345	2023-11-13 01:35:17.74-08	2023-11-13 01:39:15.151-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1635	345	2023-11-13 01:39:15.151-08	2023-11-13 01:40:08.626-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1636	346	2023-11-13 01:31:43.885-08	2023-11-13 01:32:49.149-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1637	346	2023-11-13 01:32:49.149-08	2023-11-13 01:33:41.649-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1638	346	2023-11-13 01:34:40.651-08	2023-11-13 01:35:36.393-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1639	346	2023-11-13 01:36:56.91-08	2023-11-13 01:37:41.562-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1640	346	2023-11-13 01:39:15.001-08	2023-11-13 01:40:09.981-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1641	346	2023-11-13 01:40:24.543-08	2023-11-13 01:41:57.186-08	{"Risk": 1, "Baseline-NORMAL": 125, "BaselineVariability-NORMAL": 20}	1	baseline	normal	125	normal	20	\N
1642	347	2023-11-13 01:34:24.172-08	2023-11-13 01:35:04.848-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1643	347	2023-11-13 01:35:17.15-08	2023-11-13 01:39:15.091-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
1644	347	2023-11-13 01:39:15.091-08	2023-11-13 01:40:08.313-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1645	347	2023-11-13 01:40:24.633-08	2023-11-13 01:42:58.032-08	{"Risk": 1, "Baseline-NORMAL": 120, "BaselineVariability-NORMAL": 20}	1	baseline	normal	120	normal	20	\N
1646	348	2023-11-13 01:34:28.119-08	2023-11-13 01:35:04.778-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1647	348	2023-11-13 01:36:14.825-08	2023-11-13 01:37:15.184-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1648	348	2023-11-13 01:37:15.434-08	2023-11-13 01:39:14.991-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
1649	348	2023-11-13 01:39:14.991-08	2023-11-13 01:40:07.458-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1650	348	2023-11-13 01:40:24.53-08	2023-11-13 01:42:58.182-08	{"Risk": 1, "Baseline-NORMAL": 120, "BaselineVariability-NORMAL": 20}	1	baseline	normal	120	normal	20	\N
1651	349	2023-11-13 01:39:15.131-08	2023-11-13 01:40:08.353-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1652	349	2023-11-13 01:40:24.673-08	2023-11-13 01:42:58.072-08	{"Risk": 1, "Baseline-NORMAL": 120, "BaselineVariability-NORMAL": 20}	1	baseline	normal	120	normal	20	\N
1653	350	2023-11-13 01:39:15.041-08	2023-11-13 01:40:07.513-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1654	350	2023-11-13 01:40:24.583-08	2023-11-13 01:42:58.236-08	{"Risk": 1, "Baseline-NORMAL": 120, "BaselineVariability-NORMAL": 20}	1	baseline	normal	120	normal	20	\N
1655	350	2023-11-13 01:42:58.486-08	2023-11-13 01:44:50.207-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
1656	350	2023-11-13 01:46:29.972-08	2023-11-13 01:48:46.752-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariavility-INCREASE": 25}	2	baseline	normal	125	\N	\N	\N
1657	351	2023-11-13 01:42:58.316-08	2023-11-13 01:45:08.1-08	{"Risk": 1, "Baseline-NORMAL": 125, "BaselineVariability-NORMAL": 20}	1	baseline	normal	125	normal	20	\N
1658	351	2023-11-13 01:45:08.1-08	2023-11-13 01:45:45.152-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1659	351	2023-11-13 01:47:26.086-08	2023-11-13 01:50:18.735-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariavility-INCREASE": 25}	2	baseline	normal	120	\N	\N	\N
1660	352	2023-11-13 01:45:08.221-08	2023-11-13 01:45:45.021-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1661	352	2023-11-13 01:47:25.955-08	2023-11-13 01:50:18.605-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariavility-INCREASE": 25}	2	baseline	normal	120	\N	\N	\N
1662	353	2023-11-13 01:44:49.402-08	2023-11-13 01:45:46.024-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1663	353	2023-11-13 01:48:32.682-08	2023-11-13 01:50:54.016-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1664	353	2023-11-13 01:52:09.08-08	2023-11-13 01:52:57.655-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1665	353	2023-11-13 01:52:48.117-08	2023-11-13 01:53:26.745-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1666	354	2023-11-13 01:47:32.747-08	2023-11-13 01:48:21.146-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1667	354	2023-11-13 01:48:33.197-08	2023-11-13 01:50:54.016-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1668	354	2023-11-13 01:52:49.374-08	2023-11-13 01:53:28.254-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1669	355	2023-11-13 01:47:32.747-08	2023-11-13 01:48:21.146-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1670	355	2023-11-13 01:48:33.197-08	2023-11-13 01:50:54.016-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1671	355	2023-11-13 01:52:49.374-08	2023-11-13 01:53:28.254-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1672	355	2023-11-13 01:53:28.504-08	2023-11-13 01:56:00.401-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1673	356	2023-11-13 01:50:54.136-08	2023-11-13 01:52:07.406-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1674	356	2023-11-13 01:52:50.215-08	2023-11-13 01:53:29.85-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1675	356	2023-11-13 01:53:30.104-08	2023-11-13 01:56:00.491-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1676	356	2023-11-13 01:57:13.072-08	2023-11-13 01:59:05.327-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 10}	2	baseline	normal	120	decrease	10	\N
1677	357	2023-11-13 01:52:13.336-08	2023-11-13 01:53:00.885-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1678	357	2023-11-13 01:52:48.336-08	2023-11-13 01:53:27.72-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1679	357	2023-11-13 01:53:27.97-08	2023-11-13 01:56:00.371-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1680	357	2023-11-13 01:56:00.371-08	2023-11-13 01:56:55.632-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1681	357	2023-11-13 01:57:12.952-08	2023-11-13 01:59:05.457-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 10}	2	baseline	normal	120	decrease	10	\N
1682	358	2023-11-13 01:52:09.08-08	2023-11-13 01:52:57.655-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1683	358	2023-11-13 01:52:48.117-08	2023-11-13 01:53:26.745-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1684	358	2023-11-13 01:53:26.995-08	2023-11-13 01:56:00.401-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1685	358	2023-11-13 01:57:12.982-08	2023-11-13 01:59:05.487-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 10}	2	baseline	normal	120	decrease	10	\N
1686	358	2023-11-13 02:00:38.9-08	2023-11-13 02:01:08.019-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1687	359	2023-11-13 01:52:49.134-08	2023-11-13 01:53:28.264-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1688	359	2023-11-13 01:53:28.514-08	2023-11-13 01:56:00.411-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1689	359	2023-11-13 01:57:12.992-08	2023-11-13 01:59:05.247-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 10}	2	baseline	normal	120	decrease	10	\N
1690	360	2023-11-13 01:53:28.444-08	2023-11-13 01:56:00.341-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1691	360	2023-11-13 01:57:12.922-08	2023-11-13 01:59:05.427-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 10}	2	baseline	normal	120	decrease	10	\N
1692	360	2023-11-13 02:01:37.815-08	2023-11-13 02:03:50.48-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 5}	2	baseline	normal	120	decrease	5	\N
1693	361	2023-11-13 01:56:43.415-08	2023-11-13 01:57:11.797-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1694	361	2023-11-13 01:57:13.052-08	2023-11-13 01:59:05.307-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 10}	2	baseline	normal	120	decrease	10	\N
1695	361	2023-11-13 02:01:37.695-08	2023-11-13 02:03:50.61-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 5}	2	baseline	normal	120	decrease	5	\N
1696	362	2023-11-13 02:01:37.775-08	2023-11-13 02:03:50.44-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 5}	2	baseline	normal	120	decrease	5	\N
1697	362	2023-11-13 02:05:04.533-08	2023-11-13 02:07:29.177-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1698	363	2023-11-13 02:00:38.84-08	2023-11-13 02:00:59.464-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1699	363	2023-11-13 02:01:37.915-08	2023-11-13 02:03:50.33-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 5}	2	baseline	normal	120	decrease	5	\N
1700	363	2023-11-13 02:05:04.172-08	2023-11-13 02:07:27.311-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1701	364	2023-11-13 02:00:38.63-08	2023-11-13 02:00:59.245-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1702	364	2023-11-13 02:01:37.955-08	2023-11-13 02:03:50.37-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 5}	2	baseline	normal	120	decrease	5	\N
1703	364	2023-11-13 02:05:03.963-08	2023-11-13 02:07:27.351-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1704	364	2023-11-13 02:09:04.562-08	2023-11-13 02:10:22.161-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1705	365	2023-11-13 02:05:04.503-08	2023-11-13 02:07:29.146-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1706	365	2023-11-13 02:09:04.602-08	2023-11-13 02:10:22.451-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1707	365	2023-11-13 02:11:46.304-08	2023-11-13 02:12:22.472-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1708	366	2023-11-13 02:05:04.523-08	2023-11-13 02:07:29.167-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1709	366	2023-11-13 02:09:04.372-08	2023-11-13 02:10:22.471-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1710	366	2023-11-13 02:11:46.324-08	2023-11-13 02:12:22.492-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1711	366	2023-11-13 02:13:51.421-08	2023-11-13 02:14:30.866-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1712	367	2023-11-13 02:09:04.382-08	2023-11-13 02:10:22.231-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1713	367	2023-11-13 02:11:46.334-08	2023-11-13 02:12:22.502-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1714	367	2023-11-13 02:13:51.681-08	2023-11-13 02:14:33.135-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1715	368	2023-11-13 02:09:04.382-08	2023-11-13 02:10:22.231-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1716	368	2023-11-13 02:11:46.334-08	2023-11-13 02:12:22.502-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1717	368	2023-11-13 02:13:51.681-08	2023-11-13 02:14:33.385-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1718	369	2023-11-13 02:09:04.382-08	2023-11-13 02:10:22.231-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1719	369	2023-11-13 02:11:46.334-08	2023-11-13 02:12:22.502-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1720	369	2023-11-13 02:13:51.681-08	2023-11-13 02:14:33.135-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1721	370	2023-11-13 02:11:46.424-08	2023-11-13 02:12:22.592-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1722	370	2023-11-13 02:13:51.521-08	2023-11-13 02:14:32.725-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1723	370	2023-11-13 02:16:49.134-08	2023-11-13 02:18:23.529-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1724	370	2023-11-13 02:19:06.929-08	2023-11-13 02:19:32.296-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1725	371	2023-11-13 02:11:46.444-08	2023-11-13 02:12:22.612-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1726	371	2023-11-13 02:13:51.541-08	2023-11-13 02:15:19.068-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1727	371	2023-11-13 02:19:06.919-08	2023-11-13 02:19:32.286-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1728	372	2023-11-13 02:11:46.224-08	2023-11-13 02:12:22.642-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1729	372	2023-11-13 02:13:51.571-08	2023-11-13 02:14:33.024-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1730	372	2023-11-13 02:19:06.989-08	2023-11-13 02:19:32.356-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1731	373	2023-11-13 02:13:51.661-08	2023-11-13 02:14:33.115-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1732	373	2023-11-13 02:19:06.829-08	2023-11-13 02:19:32.445-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1733	373	2023-11-13 02:22:17.184-08	2023-11-13 02:22:46.819-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1734	374	2023-11-13 02:19:06.799-08	2023-11-13 02:19:32.416-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1735	374	2023-11-13 02:22:17.154-08	2023-11-13 02:22:46.789-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1736	375	2023-11-13 02:18:16.898-08	2023-11-13 02:18:39.679-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1737	375	2023-11-13 02:19:07.049-08	2023-11-13 02:19:32.416-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1738	375	2023-11-13 02:23:41.553-08	2023-11-13 02:25:34.561-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 20}	2	baseline	normal	135	decrease	20	\N
1739	375	2023-11-13 02:25:34.561-08	2023-11-13 02:26:39.62-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1740	376	2023-11-13 02:18:37.474-08	2023-11-13 02:18:57.555-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1741	376	2023-11-13 02:19:07.099-08	2023-11-13 02:19:32.215-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1742	376	2023-11-13 02:23:41.353-08	2023-11-13 02:25:34.361-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 20}	2	baseline	normal	135	decrease	20	\N
1743	376	2023-11-13 02:25:34.361-08	2023-11-13 02:26:39.67-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1744	377	2023-11-13 02:23:41.373-08	2023-11-13 02:25:34.381-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 20}	2	baseline	normal	135	decrease	20	\N
1745	377	2023-11-13 02:25:34.381-08	2023-11-13 02:26:39.69-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1746	378	2023-11-13 02:22:17.354-08	2023-11-13 02:22:46.738-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1747	378	2023-11-13 02:23:40.493-08	2023-11-13 02:25:34.761-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 20}	2	baseline	normal	130	decrease	20	\N
1748	378	2023-11-13 02:25:34.761-08	2023-11-13 02:26:39.065-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1749	379	2023-11-13 02:23:40.333-08	2023-11-13 02:25:34.601-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 20}	2	baseline	normal	130	decrease	20	\N
1750	379	2023-11-13 02:25:34.601-08	2023-11-13 02:26:39.155-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1751	380	2023-11-13 02:25:34.641-08	2023-11-13 02:26:38.945-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1752	385	2023-11-13 02:41:01.679-08	2023-11-13 02:41:53.249-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1753	385	2023-11-13 02:41:56.768-08	2023-11-13 02:42:38.211-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1754	386	2023-11-13 02:41:01.679-08	2023-11-13 02:41:53.249-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1755	386	2023-11-13 02:41:56.768-08	2023-11-13 02:42:38.211-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1756	386	2023-11-13 02:44:09.379-08	2023-11-13 02:44:50.318-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1757	387	2023-11-13 02:41:01.679-08	2023-11-13 02:41:53.249-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1758	387	2023-11-13 02:41:56.768-08	2023-11-13 02:42:38.211-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1759	387	2023-11-13 02:44:09.379-08	2023-11-13 02:44:50.318-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1760	387	2023-11-13 02:44:50.568-08	2023-11-13 02:47:21.542-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1761	388	2023-11-13 02:41:01.679-08	2023-11-13 02:41:53.249-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1762	388	2023-11-13 02:41:56.768-08	2023-11-13 02:42:38.211-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1763	388	2023-11-13 02:44:09.379-08	2023-11-13 02:44:50.318-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1764	388	2023-11-13 02:44:50.568-08	2023-11-13 02:47:21.542-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1765	389	2023-11-13 02:41:01.679-08	2023-11-13 02:41:53.249-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1766	389	2023-11-13 02:41:56.768-08	2023-11-13 02:42:38.211-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1767	389	2023-11-13 02:44:09.379-08	2023-11-13 02:44:50.318-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1768	389	2023-11-13 02:44:50.568-08	2023-11-13 02:47:21.542-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1769	389	2023-11-13 02:48:24.074-08	2023-11-13 02:49:38.939-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1770	390	2023-11-13 02:44:09.499-08	2023-11-13 02:44:50.438-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1771	390	2023-11-13 02:44:50.693-08	2023-11-13 02:47:21.402-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1772	390	2023-11-13 02:48:24.194-08	2023-11-13 02:49:38.809-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1773	390	2023-11-13 02:51:24.059-08	2023-11-13 02:52:11.166-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1774	390	2023-11-13 02:52:14.925-08	2023-11-13 02:52:38.295-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1775	390	2023-11-13 02:52:27.737-08	2023-11-13 02:53:01.415-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1830	403	2023-11-13 03:08:26.688-08	2023-11-13 03:09:22.655-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1776	391	2023-11-13 02:44:50.703-08	2023-11-13 02:47:21.412-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1777	391	2023-11-13 02:48:24.204-08	2023-11-13 02:49:38.819-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1778	391	2023-11-13 02:51:24.319-08	2023-11-13 02:52:10.212-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1779	391	2023-11-13 02:52:41.86-08	2023-11-13 02:54:49.182-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
1780	392	2023-11-13 02:48:24.274-08	2023-11-13 02:49:38.889-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1781	392	2023-11-13 02:51:38.454-08	2023-11-13 02:52:20.024-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1782	392	2023-11-13 02:55:06.047-08	2023-11-13 02:55:45.716-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1783	393	2023-11-13 02:48:24.194-08	2023-11-13 02:49:38.809-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1784	393	2023-11-13 02:52:41.81-08	2023-11-13 02:54:49.132-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
1785	393	2023-11-13 02:55:05.964-08	2023-11-13 02:55:45.886-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1786	393	2023-11-13 02:55:46.39-08	2023-11-13 02:57:46.181-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
1787	394	2023-11-13 02:51:50.959-08	2023-11-13 02:52:27.827-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1788	394	2023-11-13 02:52:41.899-08	2023-11-13 02:54:49.222-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
1789	394	2023-11-13 02:55:06.057-08	2023-11-13 02:55:45.726-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1790	394	2023-11-13 02:55:46.48-08	2023-11-13 02:57:46.271-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
1791	394	2023-11-13 02:57:56.81-08	2023-11-13 02:58:38.419-08	{"Risk": 4, "Deceleration-HI_VD": null}	4	deceleration	\N	\N	\N	\N	high_vd
1792	395	2023-11-13 02:51:37.08-08	2023-11-13 02:52:06.865-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1793	395	2023-11-13 02:52:42.02-08	2023-11-13 02:54:49.092-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
1794	395	2023-11-13 02:55:05.924-08	2023-11-13 02:55:45.846-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1795	395	2023-11-13 02:55:46.35-08	2023-11-13 02:57:46.391-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
1796	395	2023-11-13 02:57:56.68-08	2023-11-13 02:58:36.278-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1797	395	2023-11-13 02:58:37.535-08	2023-11-13 03:01:17.164-08	{"Risk": 1, "Baseline-NORMAL": 130, "BaselineVariability-NORMAL": 25}	1	baseline	normal	130	normal	25	\N
1798	396	2023-11-13 02:52:41.82-08	2023-11-13 02:54:49.142-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
1799	396	2023-11-13 02:55:05.974-08	2023-11-13 02:55:45.896-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1800	396	2023-11-13 02:55:46.4-08	2023-11-13 02:57:46.441-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
1801	396	2023-11-13 02:57:56.73-08	2023-11-13 02:58:36.331-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1802	396	2023-11-13 02:58:37.585-08	2023-11-13 03:01:17.214-08	{"Risk": 1, "Baseline-NORMAL": 130, "BaselineVariability-NORMAL": 25}	1	baseline	normal	130	normal	25	\N
1803	396	2023-11-13 03:01:43.322-08	2023-11-13 03:02:22.987-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
1804	397	2023-11-13 02:55:06.116-08	2023-11-13 02:55:45.786-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1805	397	2023-11-13 02:55:46.29-08	2023-11-13 02:57:46.331-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
1806	397	2023-11-13 02:57:56.62-08	2023-11-13 02:58:35.718-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1807	397	2023-11-13 02:58:36.721-08	2023-11-13 03:01:17.354-08	{"Risk": 1, "Baseline-NORMAL": 130, "BaselineVariability-NORMAL": 25}	1	baseline	normal	130	normal	25	\N
1808	397	2023-11-13 03:01:43.212-08	2023-11-13 03:02:22.877-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
1809	398	2023-11-13 02:55:46.4-08	2023-11-13 02:57:46.441-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
1810	398	2023-11-13 02:57:56.98-08	2023-11-13 02:58:39.623-08	{"Risk": 4, "Deceleration-HI_VD": null}	4	deceleration	\N	\N	\N	\N	high_vd
1811	398	2023-11-13 02:58:40.877-08	2023-11-13 03:01:17.244-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
1812	398	2023-11-13 03:01:44.606-08	2023-11-13 03:02:23.017-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1813	398	2023-11-13 03:03:56.68-08	2023-11-13 03:05:01.69-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1814	399	2023-11-13 02:57:56.51-08	2023-11-13 02:58:35.608-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1815	399	2023-11-13 02:58:36.611-08	2023-11-13 03:01:17.244-08	{"Risk": 1, "Baseline-NORMAL": 130, "BaselineVariability-NORMAL": 25}	1	baseline	normal	130	normal	25	\N
1816	399	2023-11-13 03:01:43.102-08	2023-11-13 03:02:23.017-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
1817	399	2023-11-13 03:03:56.68-08	2023-11-13 03:05:01.69-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1818	400	2023-11-13 02:57:58.309-08	2023-11-13 02:58:38.909-08	{"Deceleration-HI_VD": null}	\N	deceleration	\N	\N	\N	\N	high_vd
1819	400	2023-11-13 02:58:40.162-08	2023-11-13 03:01:17.284-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
1820	400	2023-11-13 03:01:44.146-08	2023-11-13 03:02:22.807-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1821	400	2023-11-13 03:03:56.47-08	2023-11-13 03:05:01.98-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1822	401	2023-11-13 03:01:48.502-08	2023-11-13 03:02:22.897-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1823	401	2023-11-13 03:03:56.56-08	2023-11-13 03:05:01.82-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1824	401	2023-11-13 03:08:26.878-08	2023-11-13 03:09:22.595-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1825	402	2023-11-13 03:01:49.316-08	2023-11-13 03:02:22.957-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1826	402	2023-11-13 03:03:56.62-08	2023-11-13 03:05:01.88-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1827	402	2023-11-13 03:08:26.688-08	2023-11-13 03:09:22.655-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1828	402	2023-11-13 03:10:25.15-08	2023-11-13 03:11:13.087-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1829	403	2023-11-13 03:03:56.62-08	2023-11-13 03:05:01.88-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1831	403	2023-11-13 03:10:25.15-08	2023-11-13 03:11:13.087-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1832	404	2023-11-13 03:03:56.62-08	2023-11-13 03:05:01.88-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1833	404	2023-11-13 03:08:26.688-08	2023-11-13 03:09:22.655-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1834	404	2023-11-13 03:10:25.15-08	2023-11-13 03:11:13.087-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1835	405	2023-11-13 03:08:26.708-08	2023-11-13 03:09:22.675-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1836	405	2023-11-13 03:10:25.17-08	2023-11-13 03:11:13.107-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1837	406	2023-11-13 03:08:26.708-08	2023-11-13 03:09:22.675-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1838	406	2023-11-13 03:10:25.17-08	2023-11-13 03:11:13.107-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1839	406	2023-11-13 03:13:31.404-08	2023-11-13 03:16:49.248-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 10}	2	baseline	normal	120	decrease	10	\N
1840	407	2023-11-13 03:08:26.728-08	2023-11-13 03:09:22.695-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1841	407	2023-11-13 03:10:09.378-08	2023-11-13 03:10:41.252-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1842	407	2023-11-13 03:10:41.752-08	2023-11-13 03:13:18.625-08	{"Risk": 2, "Baseline-NORMAL": 115, "BaselineVariability-DECREASE": 15}	2	baseline	normal	115	decrease	15	\N
1843	407	2023-11-13 03:13:31.424-08	2023-11-13 03:16:49.268-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1844	407	2023-11-13 03:17:07.852-08	2023-11-13 03:17:44.999-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1845	408	2023-11-13 03:10:09.378-08	2023-11-13 03:10:41.252-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1846	408	2023-11-13 03:10:41.752-08	2023-11-13 03:13:18.625-08	{"Risk": 2, "Baseline-NORMAL": 115, "BaselineVariability-DECREASE": 15}	2	baseline	normal	115	decrease	15	\N
1847	408	2023-11-13 03:13:31.424-08	2023-11-13 03:16:49.268-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1848	408	2023-11-13 03:17:07.852-08	2023-11-13 03:17:44.999-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1849	409	2023-11-13 03:13:31.424-08	2023-11-13 03:16:49.268-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1850	409	2023-11-13 03:17:07.852-08	2023-11-13 03:17:44.999-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1851	410	2023-11-13 03:13:31.424-08	2023-11-13 03:16:49.268-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
1852	410	2023-11-13 03:17:07.852-08	2023-11-13 03:17:44.999-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1853	411	2023-11-13 03:17:06.708-08	2023-11-13 03:17:45.109-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1854	411	2023-11-13 03:19:38.066-08	2023-11-13 03:20:56.167-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 5}	2	baseline	normal	130	decrease	5	\N
1855	412	2023-11-13 03:17:31.639-08	2023-11-13 03:18:44.177-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1856	412	2023-11-13 03:19:37.141-08	2023-11-13 03:20:56.247-08	{"Risk": 2, "Baseline-NORMAL": 115, "BaselineVariability-DECREASE": 5}	2	baseline	normal	115	decrease	5	\N
1857	412	2023-11-13 03:22:13.83-08	2023-11-13 03:25:29.106-08	{"Risk": 4, "Deceleration-LOW_PD": null}	4	deceleration	\N	\N	\N	\N	low_pd
1858	413	2023-11-13 03:19:37.396-08	2023-11-13 03:21:18.826-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
1859	413	2023-11-13 03:26:31.343-08	2023-11-13 03:27:19.272-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1860	413	2023-11-13 03:27:33.82-08	2023-11-13 03:28:29.794-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1861	414	2023-11-13 03:26:31.373-08	2023-11-13 03:27:19.302-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1862	414	2023-11-13 03:27:33.85-08	2023-11-13 03:28:29.824-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1863	414	2023-11-13 03:29:10.273-08	2023-11-13 03:29:53.708-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1864	415	2023-11-13 03:26:31.243-08	2023-11-13 03:27:17.917-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1865	415	2023-11-13 03:27:33.72-08	2023-11-13 03:28:29.694-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1866	415	2023-11-13 03:29:10.393-08	2023-11-13 03:29:53.828-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1867	416	2023-11-13 03:26:31.353-08	2023-11-13 03:27:21.04-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1868	416	2023-11-13 03:27:35.076-08	2023-11-13 03:28:29.764-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1869	416	2023-11-13 03:29:10.463-08	2023-11-13 03:29:53.898-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1870	417	2023-11-13 03:26:31.353-08	2023-11-13 03:27:21.04-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1871	417	2023-11-13 03:27:35.076-08	2023-11-13 03:28:29.764-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1872	417	2023-11-13 03:29:10.463-08	2023-11-13 03:29:53.898-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1873	418	2023-11-13 03:26:31.353-08	2023-11-13 03:27:19.299-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1874	418	2023-11-13 03:27:32.352-08	2023-11-13 03:28:29.833-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1875	418	2023-11-13 03:29:10.283-08	2023-11-13 03:29:53.718-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1876	418	2023-11-13 03:33:50.23-08	2023-11-13 03:36:54.75-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1877	419	2023-11-13 03:27:31.067-08	2023-11-13 03:28:29.774-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1878	419	2023-11-13 03:29:10.473-08	2023-11-13 03:29:53.658-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1879	419	2023-11-13 03:31:26.566-08	2023-11-13 03:31:42.135-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1880	419	2023-11-13 03:33:50.17-08	2023-11-13 03:38:20.087-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1881	420	2023-11-13 03:31:26.496-08	2023-11-13 03:31:42.065-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1882	420	2023-11-13 03:33:50.1-08	2023-11-13 03:38:20.017-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1883	420	2023-11-13 03:38:20.017-08	2023-11-13 03:39:07.208-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1884	420	2023-11-13 03:39:31.56-08	2023-11-13 03:40:05.912-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1885	421	2023-11-13 03:31:26.546-08	2023-11-13 03:31:42.115-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1886	421	2023-11-13 03:33:50.149-08	2023-11-13 03:38:19.812-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1887	421	2023-11-13 03:38:19.812-08	2023-11-13 03:39:07.005-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1888	421	2023-11-13 03:39:31.36-08	2023-11-13 03:40:05.962-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1889	422	2023-11-13 03:33:50.18-08	2023-11-13 03:38:19.842-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
1890	422	2023-11-13 03:38:19.842-08	2023-11-13 03:39:07.035-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1891	422	2023-11-13 03:39:31.39-08	2023-11-13 03:40:06.507-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1892	422	2023-11-13 03:41:19.801-08	2023-11-13 03:42:16.759-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1893	423	2023-11-13 16:55:57.93-08	2023-11-13 16:59:24.185-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	110	decrease	10	\N
1894	423	2023-11-13 16:59:42.052-08	2023-11-13 17:00:07.161-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
1895	424	2023-11-13 16:54:41.807-08	2023-11-13 16:55:40.141-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1896	424	2023-11-13 16:55:57.77-08	2023-11-13 17:00:40.19-08	{"Risk": 2, "Baseline-DECELERATION": 110, "BaselineVariavility-INCREASE": 25}	2	baseline	deceleration	110	\N	\N	\N
1897	424	2023-11-13 17:01:07.279-08	2023-11-13 17:01:48.081-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1898	424	2023-11-13 17:01:48.331-08	2023-11-13 17:03:41.09-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
1899	424	2023-11-13 17:03:59.462-08	2023-11-13 17:04:27.334-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
1900	425	2023-11-13 16:55:57.77-08	2023-11-13 17:00:32.415-08	{"Risk": 2, "Baseline-DECELERATION": 110, "BaselineVariavility-INCREASE": 25}	2	baseline	deceleration	110	\N	\N	\N
1901	425	2023-11-13 17:01:06.779-08	2023-11-13 17:01:46.323-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1902	425	2023-11-13 17:01:46.573-08	2023-11-13 17:03:41.09-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
1903	426	2023-11-13 17:01:04.955-08	2023-11-13 17:01:48.561-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1904	426	2023-11-13 17:01:48.818-08	2023-11-13 17:03:41.07-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
1905	426	2023-11-13 17:07:32.439-08	2023-11-13 17:08:08.559-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
1906	427	2023-11-13 17:01:41.96-08	2023-11-13 17:03:41.01-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	110	decrease	10	\N
1907	427	2023-11-13 17:03:57.875-08	2023-11-13 17:04:27.004-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
1908	427	2023-11-13 17:07:25.118-08	2023-11-13 17:08:00.702-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
1909	427	2023-11-13 17:08:01.452-08	2023-11-13 17:10:02.785-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	110	decrease	10	\N
1910	428	2023-11-13 17:01:13.968-08	2023-11-13 17:01:45.014-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1911	428	2023-11-13 17:01:45.264-08	2023-11-13 17:03:41.04-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
1912	428	2023-11-13 17:04:29.296-08	2023-11-13 17:06:24.308-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-LOST": 0}	4	baseline	deceleration	105	lost	0	\N
1913	428	2023-11-13 17:07:36.161-08	2023-11-13 17:08:00.742-08	{"Risk": 5, "Deceleration-LOW_VD": null}	5	deceleration	\N	\N	\N	\N	low_vd
1914	429	2023-11-13 17:07:29.754-08	2023-11-13 17:08:00.592-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
1915	429	2023-11-13 17:08:01.092-08	2023-11-13 17:12:41.122-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 15}	4	baseline	deceleration	105	decrease	15	\N
1916	430	2023-11-13 18:32:36.537-08	2023-11-13 18:33:50.345-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1917	430	2023-11-13 18:34:27.753-08	2023-11-13 18:34:52.534-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1918	431	2023-11-13 18:28:16.825-08	2023-11-13 18:31:16.614-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
1919	431	2023-11-13 18:32:05.92-08	2023-11-13 18:33:40.845-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1920	431	2023-11-13 18:34:26.791-08	2023-11-13 18:34:57.632-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1921	432	2023-11-13 18:32:55.843-08	2023-11-13 18:34:15.753-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1922	432	2023-11-13 18:34:44.114-08	2023-11-13 18:35:15.467-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1923	432	2023-11-13 18:36:04.194-08	2023-11-13 18:36:57.843-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1924	433	2023-11-13 18:30:54.145-08	2023-11-13 18:32:26.806-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1925	433	2023-11-13 18:32:42.059-08	2023-11-13 18:33:21.809-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1926	433	2023-11-13 18:34:43.364-08	2023-11-13 18:35:13.988-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1927	433	2023-11-13 18:36:57.117-08	2023-11-13 18:39:28.752-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 20}	2	baseline	normal	135	decrease	20	\N
1928	434	2023-11-13 18:33:02.256-08	2023-11-13 18:33:53.389-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1929	434	2023-11-13 18:34:26.281-08	2023-11-13 18:34:58.595-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1930	434	2023-11-13 18:36:54.527-08	2023-11-13 18:41:10.346-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 20}	2	baseline	normal	135	decrease	20	\N
1931	435	2023-11-13 18:32:38.013-08	2023-11-13 18:33:50.325-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1932	435	2023-11-13 18:34:27.483-08	2023-11-13 18:34:52.512-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1933	435	2023-11-13 18:36:12.375-08	2023-11-13 18:36:55.724-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1934	435	2023-11-13 18:36:55.974-08	2023-11-13 18:42:53.785-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 20}	2	baseline	normal	135	decrease	20	\N
1935	436	2023-11-13 18:34:28.228-08	2023-11-13 18:34:51.01-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1936	436	2023-11-13 18:36:53.966-08	2023-11-13 18:44:25.625-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1937	437	2023-11-13 18:36:53.112-08	2023-11-13 18:46:17.447-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
1938	441	2023-11-13 18:51:35.065-08	2023-11-13 18:52:23.44-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1939	442	2023-11-13 18:56:54.526-08	2023-11-13 18:57:33.667-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1940	442	2023-11-13 18:58:18.256-08	2023-11-13 19:00:05.579-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1941	442	2023-11-13 19:01:04.852-08	2023-11-13 19:01:33.188-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1942	442	2023-11-13 19:01:47.743-08	2023-11-13 19:04:00.844-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
1943	443	2023-11-13 18:56:48.019-08	2023-11-13 18:58:44.204-08	{"Risk": 4, "Deceleration-HI_LD": null}	4	deceleration	\N	\N	\N	\N	high_ld
1944	443	2023-11-13 19:01:03.797-08	2023-11-13 19:01:32.393-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1945	443	2023-11-13 19:01:47.953-08	2023-11-13 19:04:00.804-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1946	444	2023-11-13 19:01:05.394-08	2023-11-13 19:01:33.518-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1947	444	2023-11-13 19:01:47.823-08	2023-11-13 19:05:51.365-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1948	445	2023-11-13 19:01:05.174-08	2023-11-13 19:01:33.548-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1949	445	2023-11-13 19:01:47.853-08	2023-11-13 19:05:51.395-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1950	445	2023-11-13 19:07:33.057-08	2023-11-13 19:08:32.019-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1951	446	2023-11-13 19:01:05.274-08	2023-11-13 19:01:33.648-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1952	446	2023-11-13 19:01:47.953-08	2023-11-13 19:05:51.245-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1953	446	2023-11-13 19:06:39.19-08	2023-11-13 19:08:27.602-08	{"Risk": 4, "Deceleration-HI_LD": null}	4	deceleration	\N	\N	\N	\N	high_ld
1954	447	2023-11-13 19:01:03.847-08	2023-11-13 19:01:32.443-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1955	447	2023-11-13 19:01:47.753-08	2023-11-13 19:05:51.045-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
1956	447	2023-11-13 19:06:39.24-08	2023-11-13 19:08:50.252-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
1957	447	2023-11-13 19:08:52.259-08	2023-11-13 19:11:03.555-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
1958	448	2023-11-13 19:06:39.23-08	2023-11-13 19:08:50.242-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
1959	448	2023-11-13 19:08:52.249-08	2023-11-13 19:13:05.057-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
1960	449	2023-11-13 19:06:40.023-08	2023-11-13 19:08:50.282-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
1961	449	2023-11-13 19:08:52.289-08	2023-11-13 19:13:06.351-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
1962	449	2023-11-13 19:13:43.501-08	2023-11-13 19:14:07.1-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1963	450	2023-11-13 19:07:33.027-08	2023-11-13 19:08:31.989-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1964	450	2023-11-13 19:08:52.319-08	2023-11-13 19:13:06.381-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
1965	450	2023-11-13 19:13:43.531-08	2023-11-13 19:14:06.126-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
1966	451	2023-11-13 19:57:10.968-08	2023-11-13 19:58:17.513-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1967	451	2023-11-13 19:58:17.763-08	2023-11-13 20:01:07.46-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
1968	451	2023-11-13 20:01:55.149-08	2023-11-13 20:05:08.22-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	2	baseline	normal	155	decrease	5	\N
1969	452	2023-11-13 19:59:03.378-08	2023-11-13 20:00:17.675-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1970	453	2023-11-13 19:59:03.418-08	2023-11-13 20:00:17.715-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1971	453	2023-11-13 20:03:27.243-08	2023-11-13 20:04:02.137-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1972	454	2023-11-13 19:56:41.355-08	2023-11-13 19:57:39.628-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
1973	454	2023-11-13 19:57:46.152-08	2023-11-13 20:01:07.49-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
1974	454	2023-11-13 20:01:54.929-08	2023-11-13 20:06:52.442-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	2	baseline	normal	155	decrease	5	\N
1975	455	2023-11-13 19:59:03.238-08	2023-11-13 20:00:17.785-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1976	455	2023-11-13 20:03:27.563-08	2023-11-13 20:04:01.957-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1977	455	2023-11-13 20:04:38.079-08	2023-11-13 20:05:17.754-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1978	455	2023-11-13 20:06:35.093-08	2023-11-13 20:08:12.724-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1979	455	2023-11-13 20:08:12.724-08	2023-11-13 20:08:48.622-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1980	456	2023-11-13 19:58:17.793-08	2023-11-13 20:01:07.49-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
1981	456	2023-11-13 20:01:54.929-08	2023-11-13 20:07:29.113-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
1982	457	2023-11-13 20:01:55.179-08	2023-11-13 20:07:29.363-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
1983	457	2023-11-13 20:07:29.613-08	2023-11-13 20:10:01.735-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
1984	458	2023-11-13 20:03:27.543-08	2023-11-13 20:04:00.669-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1985	458	2023-11-13 20:06:35.763-08	2023-11-13 20:07:10.629-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1986	458	2023-11-13 20:08:12.654-08	2023-11-13 20:08:52.805-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1987	459	2023-11-13 20:01:55.179-08	2023-11-13 20:07:29.363-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
1988	460	2023-11-13 20:02:05.288-08	2023-11-13 20:02:54.747-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1989	460	2023-11-13 20:03:27.633-08	2023-11-13 20:04:03.02-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1990	460	2023-11-13 20:04:40.66-08	2023-11-13 20:05:17.794-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1991	460	2023-11-13 20:06:35.133-08	2023-11-13 20:08:12.774-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1992	460	2023-11-13 20:08:12.774-08	2023-11-13 20:08:47.164-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1993	461	2023-11-13 20:07:29.603-08	2023-11-13 20:12:43.624-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
1994	462	2023-11-13 20:03:27.633-08	2023-11-13 20:04:02.027-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1995	462	2023-11-13 20:06:35.883-08	2023-11-13 20:07:10.778-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1996	462	2023-11-13 20:08:35.133-08	2023-11-13 20:09:31.721-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
1997	463	2023-11-13 20:07:29.353-08	2023-11-13 20:12:43.624-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
1998	463	2023-11-13 20:12:43.874-08	2023-11-13 20:14:52.404-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
1999	464	2023-11-13 20:06:35.883-08	2023-11-13 20:07:10.778-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2000	464	2023-11-13 20:08:35.133-08	2023-11-13 20:09:31.721-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2001	464	2023-11-13 20:12:24.417-08	2023-11-13 20:13:33.211-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2002	465	2023-11-13 20:06:35.503-08	2023-11-13 20:07:10.106-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2003	465	2023-11-13 20:08:12.884-08	2023-11-13 20:08:46.519-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2004	465	2023-11-13 20:12:24.087-08	2023-11-13 20:13:35.139-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2005	465	2023-11-13 20:13:35.389-08	2023-11-13 20:16:37.123-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	2	baseline	normal	155	decrease	5	\N
2006	466	2023-11-13 20:12:43.924-08	2023-11-13 20:15:12.998-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2007	466	2023-11-13 20:15:48.149-08	2023-11-13 20:16:35.338-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2008	467	2023-11-13 20:12:43.924-08	2023-11-13 20:14:54.462-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2009	467	2023-11-13 20:15:49.153-08	2023-11-13 20:16:35.338-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2010	468	2023-11-13 20:12:43.924-08	2023-11-13 20:14:54.462-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2011	468	2023-11-13 20:15:49.153-08	2023-11-13 20:16:35.338-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2012	468	2023-11-13 20:19:02.955-08	2023-11-13 20:19:25.543-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2013	469	2023-11-13 20:12:43.924-08	2023-11-13 20:15:12.998-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
2014	469	2023-11-13 20:15:49.153-08	2023-11-13 20:16:35.338-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2015	469	2023-11-13 20:19:02.955-08	2023-11-13 20:19:40.86-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2016	469	2023-11-13 20:19:58.661-08	2023-11-13 20:20:25.014-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2017	470	2023-11-13 20:15:48.159-08	2023-11-13 20:16:33.59-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2018	470	2023-11-13 20:17:30.314-08	2023-11-13 20:18:26.797-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2019	470	2023-11-13 20:19:02.965-08	2023-11-13 20:19:42.126-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2020	470	2023-11-13 20:19:54.661-08	2023-11-13 20:20:21.954-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2021	471	2023-11-13 20:25:36.921-08	2023-11-13 20:26:49.78-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2022	471	2023-11-13 20:26:50.03-08	2023-11-13 20:28:51.329-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2023	471	2023-11-13 20:28:51.579-08	2023-11-13 20:33:36.758-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 10}	2	baseline	normal	130	decrease	10	\N
2024	472	2023-11-13 20:25:37.031-08	2023-11-13 20:26:50.398-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2025	472	2023-11-13 20:26:50.648-08	2023-11-13 20:28:51.439-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2026	472	2023-11-13 20:28:51.689-08	2023-11-13 20:34:12.758-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
2027	472	2023-11-13 20:34:12.758-08	2023-11-13 20:34:42.381-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2028	473	2023-11-13 20:26:50.648-08	2023-11-13 20:28:51.439-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2029	473	2023-11-13 20:28:51.689-08	2023-11-13 20:34:12.758-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
2030	473	2023-11-13 20:34:12.758-08	2023-11-13 20:34:42.381-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2031	473	2023-11-13 20:34:47.907-08	2023-11-13 20:37:02.983-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
2032	474	2023-11-13 20:28:51.739-08	2023-11-13 20:34:12.557-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
2033	474	2023-11-13 20:34:12.557-08	2023-11-13 20:34:42.178-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2034	474	2023-11-13 20:34:47.707-08	2023-11-13 20:37:02.783-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
2035	475	2023-11-13 20:34:12.587-08	2023-11-13 20:34:42.208-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2036	475	2023-11-13 20:34:47.737-08	2023-11-13 20:37:02.813-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
2037	475	2023-11-13 20:37:42.229-08	2023-11-13 20:39:48.284-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
2038	476	2023-11-13 20:34:12.658-08	2023-11-13 20:34:42.278-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2039	476	2023-11-13 20:34:47.807-08	2023-11-13 20:37:02.883-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 25}	1	baseline	normal	145	normal	25	\N
2040	476	2023-11-13 20:37:41.796-08	2023-11-13 20:41:52.655-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2041	477	2023-11-13 20:34:12.648-08	2023-11-13 20:34:42.268-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2042	477	2023-11-13 20:34:47.797-08	2023-11-13 20:37:02.873-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 25}	1	baseline	normal	145	normal	25	\N
2043	477	2023-11-13 20:37:41.786-08	2023-11-13 20:41:52.645-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2044	477	2023-11-13 20:41:52.645-08	2023-11-13 20:42:55.416-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2045	478	2023-11-13 20:34:12.668-08	2023-11-13 20:34:42.288-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2046	478	2023-11-13 20:34:47.817-08	2023-11-13 20:37:02.893-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 25}	1	baseline	normal	145	normal	25	\N
2047	478	2023-11-13 20:37:02.893-08	2023-11-13 20:37:56.866-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2048	478	2023-11-13 20:37:57.116-08	2023-11-13 20:41:52.665-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2049	478	2023-11-13 20:41:52.665-08	2023-11-13 20:42:55.435-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2050	478	2023-11-13 20:43:18.294-08	2023-11-13 20:44:14.789-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2051	479	2023-11-13 20:38:40.107-08	2023-11-13 20:41:53.482-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2052	479	2023-11-13 20:41:53.482-08	2023-11-13 20:42:55.246-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2053	479	2023-11-13 20:43:18.354-08	2023-11-13 20:44:14.849-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2054	479	2023-11-13 20:44:44.725-08	2023-11-13 20:45:28.169-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2055	480	2023-11-13 20:37:42.146-08	2023-11-13 20:41:22.616-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2056	480	2023-11-13 20:41:53.512-08	2023-11-13 20:42:55.276-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2057	480	2023-11-13 20:43:18.384-08	2023-11-13 20:44:14.879-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2058	480	2023-11-13 20:44:44.505-08	2023-11-13 20:45:28.199-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2059	481	2023-11-13 20:41:52.755-08	2023-11-13 20:42:55.526-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2060	481	2023-11-13 20:43:18.384-08	2023-11-13 20:44:14.879-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2061	481	2023-11-13 20:44:44.505-08	2023-11-13 20:45:28.455-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2062	481	2023-11-13 20:47:33.754-08	2023-11-13 20:48:11.414-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2063	481	2023-11-13 20:49:15.695-08	2023-11-13 20:50:10.932-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2064	482	2023-11-13 20:41:52.745-08	2023-11-13 20:42:56.267-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2065	482	2023-11-13 20:43:18.374-08	2023-11-13 20:44:14.869-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2066	482	2023-11-13 20:44:44.495-08	2023-11-13 20:45:28.445-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2067	482	2023-11-13 20:47:33.744-08	2023-11-13 20:48:11.404-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2068	482	2023-11-13 20:49:15.685-08	2023-11-13 20:50:10.922-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2069	482	2023-11-13 20:50:41.552-08	2023-11-13 20:51:41.316-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2070	483	2023-11-13 20:43:18.414-08	2023-11-13 20:44:14.909-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2071	483	2023-11-13 20:44:44.535-08	2023-11-13 20:45:28.485-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2072	483	2023-11-13 20:47:33.784-08	2023-11-13 20:48:11.444-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2073	483	2023-11-13 20:49:15.726-08	2023-11-13 20:50:10.963-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2074	483	2023-11-13 20:50:41.592-08	2023-11-13 20:51:41.356-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2075	483	2023-11-13 20:52:21.278-08	2023-11-13 20:53:06.471-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2076	484	2023-11-13 20:44:44.555-08	2023-11-13 20:45:28.249-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2077	484	2023-11-13 20:47:33.554-08	2023-11-13 20:48:11.464-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2078	484	2023-11-13 20:49:13.985-08	2023-11-13 20:50:11.483-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2079	484	2023-11-13 20:50:41.362-08	2023-11-13 20:51:41.126-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2080	484	2023-11-13 20:52:21.298-08	2023-11-13 20:53:06.491-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2081	485	2023-11-13 20:47:33.544-08	2023-11-13 20:48:11.454-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2082	485	2023-11-13 20:49:13.975-08	2023-11-13 20:50:11.473-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2083	485	2023-11-13 20:50:41.352-08	2023-11-13 20:51:41.116-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2084	485	2023-11-13 20:52:21.288-08	2023-11-13 20:53:06.481-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2085	485	2023-11-13 20:54:51.941-08	2023-11-13 20:55:28.588-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2086	486	2023-11-13 20:47:33.604-08	2023-11-13 20:48:11.514-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2087	486	2023-11-13 20:49:15.796-08	2023-11-13 20:50:11.033-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2088	486	2023-11-13 20:50:41.662-08	2023-11-13 20:51:41.176-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2089	486	2023-11-13 20:52:21.348-08	2023-11-13 20:53:06.541-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2090	486	2023-11-13 20:54:52.001-08	2023-11-13 20:55:28.148-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2091	487	2023-11-13 20:49:15.826-08	2023-11-13 20:50:11.063-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2092	487	2023-11-13 20:50:41.442-08	2023-11-13 20:51:41.206-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2093	487	2023-11-13 20:52:21.126-08	2023-11-13 20:53:06.571-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2094	487	2023-11-13 20:54:52.031-08	2023-11-13 20:55:28.178-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2095	487	2023-11-13 20:57:27.951-08	2023-11-13 20:58:04.609-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2096	488	2023-11-13 20:50:41.442-08	2023-11-13 20:51:40.953-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2097	488	2023-11-13 20:52:21.378-08	2023-11-13 20:53:06.571-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2098	488	2023-11-13 20:54:52.031-08	2023-11-13 20:55:28.428-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2099	488	2023-11-13 20:57:27.951-08	2023-11-13 20:58:04.609-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2100	488	2023-11-13 20:58:40.774-08	2023-11-13 20:59:48.559-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2101	489	2023-11-13 20:52:21.368-08	2023-11-13 20:53:06.561-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2102	489	2023-11-13 20:54:52.021-08	2023-11-13 20:55:28.418-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2103	489	2023-11-13 20:57:27.941-08	2023-11-13 20:58:04.599-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2104	489	2023-11-13 20:58:40.764-08	2023-11-13 20:59:48.549-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2105	489	2023-11-13 21:00:51.815-08	2023-11-13 21:02:27.48-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2106	490	2023-11-13 20:54:52.031-08	2023-11-13 20:55:28.178-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2107	490	2023-11-13 20:57:27.951-08	2023-11-13 20:58:04.609-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2108	490	2023-11-13 20:58:40.774-08	2023-11-13 20:59:48.809-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2109	490	2023-11-13 21:00:51.825-08	2023-11-13 21:02:27.49-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2110	491	2023-11-13 20:57:27.961-08	2023-11-13 20:58:04.619-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2111	491	2023-11-13 20:58:40.784-08	2023-11-13 20:59:48.569-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2112	491	2023-11-13 21:00:51.835-08	2023-11-13 21:02:27.5-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2113	492	2023-11-13 20:58:40.784-08	2023-11-13 20:59:48.569-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2114	492	2023-11-13 21:00:51.585-08	2023-11-13 21:02:27.5-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2115	492	2023-11-13 21:05:49.544-08	2023-11-13 21:07:09.009-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2116	492	2023-11-13 21:07:09.266-08	2023-11-13 21:08:21.312-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	2	baseline	normal	150	decrease	15	\N
2117	493	2023-11-13 21:00:34.584-08	2023-11-13 21:01:38.353-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2118	493	2023-11-13 21:05:49.365-08	2023-11-13 21:07:09.079-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2119	493	2023-11-13 21:07:09.336-08	2023-11-13 21:09:12.343-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	2	baseline	normal	150	decrease	15	\N
2120	494	2023-11-13 21:03:03.714-08	2023-11-13 21:03:32.833-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2121	494	2023-11-13 21:05:49.575-08	2023-11-13 21:07:03.838-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2122	494	2023-11-13 21:07:03.838-08	2023-11-13 21:07:58.038-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2123	494	2023-11-13 21:07:58.288-08	2023-11-13 21:11:06.294-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 15}	2	baseline	normal	145	decrease	15	\N
2124	495	2023-11-13 21:05:49.615-08	2023-11-13 21:07:03.878-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2125	495	2023-11-13 21:07:03.878-08	2023-11-13 21:07:58.078-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2126	495	2023-11-13 21:07:58.328-08	2023-11-13 21:11:06.333-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 15}	2	baseline	normal	145	decrease	15	\N
2127	496	2023-11-13 21:05:49.665-08	2023-11-13 21:07:14.653-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2128	496	2023-11-13 21:07:14.903-08	2023-11-13 21:09:12.143-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	2	baseline	normal	150	decrease	15	\N
2129	496	2023-11-13 21:12:58.805-08	2023-11-13 21:15:03.064-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2130	497	2023-11-13 21:07:15.143-08	2023-11-13 21:09:12.133-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	2	baseline	normal	150	decrease	15	\N
2131	497	2023-11-13 21:12:59.045-08	2023-11-13 21:15:03.054-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2243	527	2023-11-13 22:35:17.572-08	2023-11-13 22:36:03.103-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2132	498	2023-11-13 21:12:58.714-08	2023-11-13 21:15:02.974-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2133	498	2023-11-13 21:15:21.301-08	2023-11-13 21:17:30.093-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
2134	499	2023-11-13 21:12:59.205-08	2023-11-13 21:15:03.214-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2135	499	2023-11-13 21:15:23.046-08	2023-11-13 21:17:48.875-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
2136	500	2023-11-13 21:12:59.205-08	2023-11-13 21:15:03.214-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2137	500	2023-11-13 21:15:21.041-08	2023-11-13 21:16:21.362-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2138	500	2023-11-13 21:17:43.862-08	2023-11-13 21:21:09.909-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 15}	2	baseline	normal	145	decrease	15	\N
2139	501	2023-11-13 21:12:58.714-08	2023-11-13 21:15:02.974-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2140	501	2023-11-13 21:15:22.556-08	2023-11-13 21:15:37.617-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2141	501	2023-11-13 21:17:27.367-08	2023-11-13 21:18:33.068-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2142	501	2023-11-13 21:18:58.923-08	2023-11-13 21:21:09.949-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2143	502	2023-11-13 21:15:23.056-08	2023-11-13 21:17:44.38-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
2144	502	2023-11-13 21:17:44.63-08	2023-11-13 21:21:09.949-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 20}	2	baseline	normal	145	decrease	20	\N
2145	503	2023-11-13 21:15:23.056-08	2023-11-13 21:17:44.38-08	{"Deceleration-HI_PD": null}	\N	deceleration	\N	\N	\N	\N	high_pd
2146	503	2023-11-13 21:17:44.63-08	2023-11-13 21:21:09.949-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 20}	2	baseline	normal	145	decrease	20	\N
2147	503	2023-11-13 21:23:34.324-08	2023-11-13 21:23:57.887-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2148	504	2023-11-13 21:59:40.495-08	2023-11-13 22:00:15.899-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2149	504	2023-11-13 22:00:16.149-08	2023-11-13 22:03:22.264-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2150	504	2023-11-13 22:04:25.533-08	2023-11-13 22:06:33.315-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 20}	2	baseline	normal	140	decrease	20	\N
2151	505	2023-11-13 22:00:04.913-08	2023-11-13 22:03:23.076-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2152	505	2023-11-13 22:04:25.593-08	2023-11-13 22:06:33.63-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
2153	505	2023-11-13 22:07:36.17-08	2023-11-13 22:08:49.01-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2154	506	2023-11-13 22:04:25.682-08	2023-11-13 22:06:33.465-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
2155	506	2023-11-13 22:07:36.51-08	2023-11-13 22:08:49.35-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2156	506	2023-11-13 22:09:36.077-08	2023-11-13 22:12:43.13-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
2157	507	2023-11-13 22:04:25.533-08	2023-11-13 22:06:33.565-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
2158	507	2023-11-13 22:07:36.36-08	2023-11-13 22:08:49.2-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2159	507	2023-11-13 22:09:34.412-08	2023-11-13 22:13:36.445-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
2160	507	2023-11-13 22:13:36.445-08	2023-11-13 22:14:29.932-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2161	508	2023-11-13 22:07:36.379-08	2023-11-13 22:08:49.22-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2162	508	2023-11-13 22:09:34.432-08	2023-11-13 22:13:36.465-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
2163	508	2023-11-13 22:13:36.465-08	2023-11-13 22:14:29.952-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2164	509	2023-11-13 22:07:36.39-08	2023-11-13 22:08:49.23-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2165	509	2023-11-13 22:09:36.207-08	2023-11-13 22:13:36.475-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
2166	509	2023-11-13 22:13:36.475-08	2023-11-13 22:14:29.962-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2167	509	2023-11-13 22:15:38.994-08	2023-11-13 22:16:35.341-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2168	510	2023-11-13 22:09:36.207-08	2023-11-13 22:13:36.475-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
2169	510	2023-11-13 22:13:36.475-08	2023-11-13 22:14:29.962-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2170	510	2023-11-13 22:15:40.76-08	2023-11-13 22:16:33.64-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2171	510	2023-11-13 22:16:47.196-08	2023-11-13 22:18:16.6-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
2172	511	2023-11-13 22:13:36.635-08	2023-11-13 22:14:29.868-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2173	511	2023-11-13 22:15:39.669-08	2023-11-13 22:16:18.492-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2174	511	2023-11-13 22:16:47.356-08	2023-11-13 22:18:16.51-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
2175	512	2023-11-13 22:13:36.655-08	2023-11-13 22:14:29.888-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2176	512	2023-11-13 22:15:41.447-08	2023-11-13 22:16:36.821-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2177	512	2023-11-13 22:16:47.366-08	2023-11-13 22:18:16.52-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
2178	513	2023-11-13 22:13:36.635-08	2023-11-13 22:14:29.868-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2179	513	2023-11-13 22:15:41.427-08	2023-11-13 22:17:24.26-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2180	513	2023-11-13 22:21:15.524-08	2023-11-13 22:23:07.499-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2181	514	2023-11-13 22:15:11.293-08	2023-11-13 22:15:58.179-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2182	514	2023-11-13 22:16:47.106-08	2023-11-13 22:18:56.437-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
2183	514	2023-11-13 22:21:15.534-08	2023-11-13 22:23:07.509-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2244	527	2023-11-13 22:36:11.129-08	2023-11-13 22:36:51.73-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2184	515	2023-11-13 22:16:47.146-08	2023-11-13 22:18:56.477-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
2185	515	2023-11-13 22:21:15.574-08	2023-11-13 22:23:07.549-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2186	515	2023-11-13 22:24:08.304-08	2023-11-13 22:24:24.642-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2187	515	2023-11-13 22:24:29.161-08	2023-11-13 22:26:24.152-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 20}	2	baseline	normal	155	decrease	20	\N
2188	516	2023-11-13 22:21:15.584-08	2023-11-13 22:23:07.559-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2189	516	2023-11-13 22:24:08.315-08	2023-11-13 22:24:24.652-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2190	516	2023-11-13 22:24:29.171-08	2023-11-13 22:26:24.162-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 20}	2	baseline	normal	155	decrease	20	\N
2191	516	2023-11-13 22:26:24.162-08	2023-11-13 22:27:05.096-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2192	516	2023-11-13 22:27:14.138-08	2023-11-13 22:27:50.29-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2193	517	2023-11-13 22:21:15.634-08	2023-11-13 22:23:07.609-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2194	517	2023-11-13 22:24:08.115-08	2023-11-13 22:24:24.702-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2195	517	2023-11-13 22:24:29.221-08	2023-11-13 22:26:24.212-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 20}	2	baseline	normal	155	decrease	20	\N
2196	517	2023-11-13 22:26:24.212-08	2023-11-13 22:27:05.146-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2197	517	2023-11-13 22:28:39.253-08	2023-11-13 22:29:14.906-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2198	518	2023-11-13 22:21:09.65-08	2023-11-13 22:23:07.649-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2199	518	2023-11-13 22:24:07.905-08	2023-11-13 22:24:24.742-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2200	518	2023-11-13 22:24:29.261-08	2023-11-13 22:26:24.252-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 15}	2	baseline	normal	155	decrease	15	\N
2201	518	2023-11-13 22:26:24.252-08	2023-11-13 22:27:04.936-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2202	518	2023-11-13 22:27:14.478-08	2023-11-13 22:27:50.63-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2203	518	2023-11-13 22:28:39.303-08	2023-11-13 22:29:14.706-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2204	519	2023-11-13 22:24:07.915-08	2023-11-13 22:24:24.752-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2205	519	2023-11-13 22:24:29.271-08	2023-11-13 22:26:24.262-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 15}	2	baseline	normal	155	decrease	15	\N
2206	519	2023-11-13 22:26:24.262-08	2023-11-13 22:27:04.946-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2207	519	2023-11-13 22:27:14.488-08	2023-11-13 22:27:50.39-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2208	519	2023-11-13 22:28:39.313-08	2023-11-13 22:29:14.716-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2209	520	2023-11-13 22:24:29.271-08	2023-11-13 22:26:24.262-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 20}	2	baseline	normal	155	decrease	20	\N
2210	520	2023-11-13 22:26:24.262-08	2023-11-13 22:27:05.196-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2211	520	2023-11-13 22:27:13.988-08	2023-11-13 22:27:50.14-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2212	520	2023-11-13 22:28:39.303-08	2023-11-13 22:29:14.706-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2213	520	2023-11-13 22:33:27.73-08	2023-11-13 22:33:48.817-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2214	521	2023-11-13 22:26:24.262-08	2023-11-13 22:27:05.196-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2215	521	2023-11-13 22:27:13.988-08	2023-11-13 22:27:50.39-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2216	521	2023-11-13 22:28:39.063-08	2023-11-13 22:29:14.716-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2217	521	2023-11-13 22:30:12.713-08	2023-11-13 22:33:22.26-08	{"Risk": 4, "Deceleration-LOW_PD": null}	4	deceleration	\N	\N	\N	\N	low_pd
2218	521	2023-11-13 22:33:27.78-08	2023-11-13 22:33:48.868-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2219	522	2023-11-13 22:28:39.073-08	2023-11-13 22:29:14.726-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2220	522	2023-11-13 22:32:10.698-08	2023-11-13 22:33:41.307-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2221	522	2023-11-13 22:35:18.958-08	2023-11-13 22:35:42.99-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2222	522	2023-11-13 22:35:42.99-08	2023-11-13 22:36:30.771-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2223	523	2023-11-13 22:32:10.698-08	2023-11-13 22:33:41.307-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2224	523	2023-11-13 22:35:18.958-08	2023-11-13 22:35:42.99-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2225	523	2023-11-13 22:35:42.99-08	2023-11-13 22:36:30.771-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2226	523	2023-11-13 22:36:31.021-08	2023-11-13 22:38:53.889-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
2227	524	2023-11-13 22:32:08.984-08	2023-11-13 22:33:41.348-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2228	524	2023-11-13 22:35:20.497-08	2023-11-13 22:36:05.805-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2229	524	2023-11-13 22:36:12.083-08	2023-11-13 22:36:51.93-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2230	524	2023-11-13 22:36:54.446-08	2023-11-13 22:38:53.708-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2231	524	2023-11-13 22:40:46.904-08	2023-11-13 22:41:35.612-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2232	525	2023-11-13 22:32:05.228-08	2023-11-13 22:33:41.358-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2233	525	2023-11-13 22:34:47.369-08	2023-11-13 22:35:31.993-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2234	525	2023-11-13 22:36:06.301-08	2023-11-13 22:36:51.92-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2235	525	2023-11-13 22:36:54.436-08	2023-11-13 22:38:53.699-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2236	525	2023-11-13 22:40:26.34-08	2023-11-13 22:41:19.784-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2237	525	2023-11-13 22:41:34.092-08	2023-11-13 22:41:57.873-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2238	526	2023-11-13 22:34:47.449-08	2023-11-13 22:35:32.073-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2239	526	2023-11-13 22:36:06.381-08	2023-11-13 22:36:52-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2240	526	2023-11-13 22:36:54.516-08	2023-11-13 22:38:53.779-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2241	526	2023-11-13 22:40:26.421-08	2023-11-13 22:41:19.863-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2242	526	2023-11-13 22:41:33.922-08	2023-11-13 22:41:57.703-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2245	527	2023-11-13 22:36:57.509-08	2023-11-13 22:38:54.009-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2246	527	2023-11-13 22:40:43.939-08	2023-11-13 22:41:35.662-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2247	527	2023-11-13 22:41:35.662-08	2023-11-13 22:42:38.327-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2248	528	2023-11-13 22:36:57.399-08	2023-11-13 22:38:53.899-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2249	528	2023-11-13 22:40:43.829-08	2023-11-13 22:41:35.552-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2250	528	2023-11-13 22:41:35.552-08	2023-11-13 22:42:38.467-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2251	528	2023-11-13 22:44:18.615-08	2023-11-13 22:47:35.978-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
2252	529	2023-11-13 22:40:46.954-08	2023-11-13 22:41:35.412-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2253	529	2023-11-13 22:41:35.412-08	2023-11-13 22:42:38.621-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2254	529	2023-11-13 22:44:19.015-08	2023-11-13 22:47:35.62-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
2255	530	2023-11-13 22:40:46.974-08	2023-11-13 22:41:35.682-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2256	530	2023-11-13 22:41:35.682-08	2023-11-13 22:42:38.127-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2257	530	2023-11-13 22:42:50.417-08	2023-11-13 22:43:20.523-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2258	530	2023-11-13 22:44:18.525-08	2023-11-13 22:47:35.889-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
2259	531	2023-11-13 22:40:52.071-08	2023-11-13 22:41:40.009-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2260	531	2023-11-13 22:41:43.009-08	2023-11-13 22:42:38.671-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2261	531	2023-11-13 22:44:18.565-08	2023-11-13 22:47:35.929-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
2262	531	2023-11-13 22:48:22.151-08	2023-11-13 22:50:38.463-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2263	532	2023-11-13 22:44:18.555-08	2023-11-13 22:47:35.919-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
2264	532	2023-11-13 22:48:22.141-08	2023-11-13 22:52:41.964-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
2265	533	2023-11-13 22:44:18.965-08	2023-11-13 22:47:35.57-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
2266	533	2023-11-13 22:48:22.301-08	2023-11-13 22:53:02.961-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
2267	534	2023-11-13 22:48:22.341-08	2023-11-13 22:53:03.001-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
2268	534	2023-11-13 22:54:08.535-08	2023-11-13 22:55:01.772-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2269	535	2023-11-13 22:48:22.341-08	2023-11-13 22:53:03.001-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
2270	535	2023-11-13 22:54:08.535-08	2023-11-13 22:55:02.278-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2271	536	2023-11-13 22:50:10.804-08	2023-11-13 22:53:03.011-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 5}	2	baseline	normal	130	decrease	5	\N
2272	536	2023-11-13 22:54:08.545-08	2023-11-13 22:55:02.288-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2273	536	2023-11-13 22:55:11.824-08	2023-11-13 22:57:05.829-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
2274	537	2023-11-13 22:54:08.525-08	2023-11-13 22:55:02.268-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2275	537	2023-11-13 22:55:11.804-08	2023-11-13 22:57:05.809-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
2276	538	2023-11-13 22:54:08.495-08	2023-11-13 22:55:01.988-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2277	538	2023-11-13 22:55:11.524-08	2023-11-13 22:57:06.279-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
2278	539	2023-11-13 22:54:08.675-08	2023-11-13 22:55:01.912-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2279	539	2023-11-13 22:55:11.704-08	2023-11-13 22:57:06.209-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
2280	540	2023-11-13 22:55:11.734-08	2023-11-13 22:57:05.739-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
2281	540	2023-11-13 22:57:31.871-08	2023-11-13 22:57:50.419-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
2282	541	2023-11-13 22:57:31.616-08	2023-11-13 22:57:50.21-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
2283	541	2023-11-13 23:05:48.064-08	2023-11-13 23:06:25.7-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
2284	542	2023-11-13 23:06:12.607-08	2023-11-13 23:07:01.787-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2285	542	2023-11-13 23:07:01.787-08	2023-11-13 23:07:34.914-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2286	543	2023-11-13 23:06:26.442-08	2023-11-13 23:07:01.818-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2287	543	2023-11-13 23:07:01.818-08	2023-11-13 23:07:32.444-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2288	543	2023-11-13 23:07:44.21-08	2023-11-13 23:09:22.138-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
2289	544	2023-11-13 23:06:12.041-08	2023-11-13 23:07:01.728-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2290	544	2023-11-13 23:07:01.728-08	2023-11-13 23:07:35.85-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2291	544	2023-11-13 23:07:35.85-08	2023-11-13 23:08:00.44-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2292	544	2023-11-13 23:08:00.694-08	2023-11-13 23:10:19.528-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2293	545	2023-11-13 23:06:12.031-08	2023-11-13 23:07:01.718-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2294	545	2023-11-13 23:07:01.718-08	2023-11-13 23:07:35.84-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2295	545	2023-11-13 23:07:35.84-08	2023-11-13 23:08:00.43-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2296	545	2023-11-13 23:08:00.68-08	2023-11-13 23:10:19.518-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2297	546	2023-11-13 23:06:26.372-08	2023-11-13 23:07:01.748-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2298	546	2023-11-13 23:07:01.748-08	2023-11-13 23:07:32.374-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2299	546	2023-11-13 23:07:44.39-08	2023-11-13 23:10:19.548-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2406	587	2023-11-14 00:16:43.112-08	2023-11-14 00:17:14.009-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2300	546	2023-11-13 23:10:47.423-08	2023-11-13 23:13:02.766-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2301	547	2023-11-13 23:05:51.038-08	2023-11-13 23:06:45.979-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2302	547	2023-11-13 23:07:01.798-08	2023-11-13 23:07:29.161-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2303	547	2023-11-13 23:07:41.681-08	2023-11-13 23:10:19.598-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2304	547	2023-11-13 23:10:47.223-08	2023-11-13 23:13:02.816-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2305	548	2023-11-13 23:05:51.068-08	2023-11-13 23:06:45.699-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2306	548	2023-11-13 23:07:01.768-08	2023-11-13 23:07:55.922-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2307	548	2023-11-13 23:07:56.172-08	2023-11-13 23:10:19.528-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2308	548	2023-11-13 23:10:47.403-08	2023-11-13 23:13:02.746-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2309	549	2023-11-13 23:10:47.794-08	2023-11-13 23:13:02.636-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2310	550	2023-11-13 23:10:47.834-08	2023-11-13 23:13:02.676-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2311	557	2023-11-13 23:30:22.852-08	2023-11-13 23:30:59.763-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2312	558	2023-11-13 23:30:22.852-08	2023-11-13 23:30:59.763-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2313	559	2023-11-13 23:30:22.852-08	2023-11-13 23:30:59.763-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2314	559	2023-11-13 23:32:07.056-08	2023-11-13 23:34:18.631-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2315	560	2023-11-13 23:30:22.852-08	2023-11-13 23:30:59.763-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2316	560	2023-11-13 23:32:07.056-08	2023-11-13 23:34:18.631-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2317	560	2023-11-13 23:34:18.631-08	2023-11-13 23:35:07.837-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2318	561	2023-11-13 23:30:22.852-08	2023-11-13 23:30:59.763-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2319	561	2023-11-13 23:32:07.056-08	2023-11-13 23:34:18.631-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2320	561	2023-11-13 23:34:18.631-08	2023-11-13 23:35:07.837-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2321	562	2023-11-13 23:30:22.852-08	2023-11-13 23:30:59.763-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2322	562	2023-11-13 23:32:07.056-08	2023-11-13 23:34:18.631-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2323	562	2023-11-13 23:34:18.631-08	2023-11-13 23:35:07.837-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2324	562	2023-11-13 23:37:18.386-08	2023-11-13 23:38:29.925-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2325	563	2023-11-13 23:30:22.852-08	2023-11-13 23:30:59.763-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2326	563	2023-11-13 23:32:07.056-08	2023-11-13 23:34:18.631-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2327	563	2023-11-13 23:34:18.631-08	2023-11-13 23:35:07.837-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2328	563	2023-11-13 23:37:18.386-08	2023-11-13 23:38:29.925-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2329	564	2023-11-13 23:30:22.852-08	2023-11-13 23:30:59.763-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2330	564	2023-11-13 23:32:07.056-08	2023-11-13 23:34:18.631-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2331	564	2023-11-13 23:34:18.631-08	2023-11-13 23:35:07.837-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2332	564	2023-11-13 23:37:18.386-08	2023-11-13 23:38:29.925-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2333	564	2023-11-13 23:38:30.179-08	2023-11-13 23:40:25.427-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
2334	565	2023-11-13 23:32:07.056-08	2023-11-13 23:34:18.631-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2335	565	2023-11-13 23:34:18.631-08	2023-11-13 23:35:07.837-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2336	565	2023-11-13 23:37:18.386-08	2023-11-13 23:38:29.925-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2337	565	2023-11-13 23:38:30.179-08	2023-11-13 23:40:25.427-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2338	566	2023-11-13 23:32:06.866-08	2023-11-13 23:34:18.691-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2339	566	2023-11-13 23:34:18.691-08	2023-11-13 23:35:07.897-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2340	566	2023-11-13 23:37:18.446-08	2023-11-13 23:38:29.989-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2341	566	2023-11-13 23:38:30.239-08	2023-11-13 23:40:25.493-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2342	566	2023-11-13 23:40:29.758-08	2023-11-13 23:42:09.435-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
2343	567	2023-11-13 23:34:18.501-08	2023-11-13 23:35:07.707-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2344	567	2023-11-13 23:37:18.506-08	2023-11-13 23:38:30.049-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2345	567	2023-11-13 23:38:30.299-08	2023-11-13 23:40:25.553-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2346	567	2023-11-13 23:40:32.075-08	2023-11-13 23:42:50.174-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
2347	567	2023-11-13 23:42:50.424-08	2023-11-13 23:44:25.58-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
2348	568	2023-11-13 23:37:18.576-08	2023-11-13 23:38:30.119-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2349	568	2023-11-13 23:38:30.369-08	2023-11-13 23:40:25.623-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2350	568	2023-11-13 23:40:32.145-08	2023-11-13 23:42:50.244-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
2351	568	2023-11-13 23:42:50.494-08	2023-11-13 23:45:19.122-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2352	569	2023-11-13 23:37:18.626-08	2023-11-13 23:38:30.169-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2353	569	2023-11-13 23:38:30.419-08	2023-11-13 23:40:25.417-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2354	569	2023-11-13 23:40:31.945-08	2023-11-13 23:42:50.294-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
2355	569	2023-11-13 23:42:50.544-08	2023-11-13 23:45:46.792-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
2356	570	2023-11-13 23:38:30.169-08	2023-11-13 23:40:25.417-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2357	570	2023-11-13 23:40:29.688-08	2023-11-13 23:42:50.294-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
2358	570	2023-11-13 23:42:50.544-08	2023-11-13 23:45:47.301-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
2359	570	2023-11-13 23:46:07.627-08	2023-11-13 23:48:14.21-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2360	571	2023-11-13 23:42:50.554-08	2023-11-13 23:45:47.311-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
2361	571	2023-11-13 23:46:07.637-08	2023-11-13 23:48:14.22-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2362	571	2023-11-13 23:49:26.519-08	2023-11-13 23:49:51.869-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2363	572	2023-11-13 23:42:50.554-08	2023-11-13 23:45:46.802-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
2364	572	2023-11-13 23:46:07.887-08	2023-11-13 23:49:15.476-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2365	572	2023-11-13 23:49:26.519-08	2023-11-13 23:49:52.125-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2366	573	2023-11-13 23:44:25.7-08	2023-11-13 23:45:19.172-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2367	573	2023-11-13 23:46:07.877-08	2023-11-13 23:49:15.465-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2368	573	2023-11-13 23:49:26.508-08	2023-11-13 23:49:52.115-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2369	573	2023-11-13 23:49:58.401-08	2023-11-13 23:53:36.345-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2370	574	2023-11-13 23:46:07.657-08	2023-11-13 23:48:14.24-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2371	574	2023-11-13 23:49:26.539-08	2023-11-13 23:49:51.639-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2372	574	2023-11-13 23:49:58.431-08	2023-11-13 23:55:22.827-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2373	575	2023-11-13 23:49:26.579-08	2023-11-13 23:49:51.679-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2374	575	2023-11-13 23:49:58.221-08	2023-11-13 23:55:22.868-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2375	576	2023-11-13 23:49:26.609-08	2023-11-13 23:49:51.959-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2376	576	2023-11-13 23:49:58.251-08	2023-11-13 23:55:22.898-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2377	576	2023-11-13 23:56:14.365-08	2023-11-13 23:57:44.511-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2378	576	2023-11-13 23:57:44.511-08	2023-11-13 23:59:06.843-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2379	577	2023-11-13 23:56:14.375-08	2023-11-13 23:57:44.521-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2380	577	2023-11-13 23:57:44.521-08	2023-11-13 23:59:06.853-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2381	578	2023-11-13 23:56:14.115-08	2023-11-13 23:57:44.261-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2382	578	2023-11-13 23:57:44.261-08	2023-11-13 23:59:06.593-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2383	579	2023-11-13 23:56:14.145-08	2023-11-13 23:57:44.291-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2384	579	2023-11-13 23:57:44.291-08	2023-11-13 23:59:06.623-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2385	579	2023-11-14 00:02:11.931-08	2023-11-14 00:04:40.83-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
2386	580	2023-11-13 23:56:14.415-08	2023-11-13 23:57:44.561-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2387	580	2023-11-13 23:57:44.561-08	2023-11-13 23:59:06.893-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2388	580	2023-11-14 00:01:20.728-08	2023-11-14 00:01:54.083-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2389	580	2023-11-14 00:02:11.661-08	2023-11-14 00:05:04.415-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
2390	581	2023-11-13 23:57:44.561-08	2023-11-13 23:59:06.893-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2391	581	2023-11-14 00:02:11.701-08	2023-11-14 00:05:04.455-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
2392	582	2023-11-14 00:02:11.721-08	2023-11-14 00:05:04.475-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
2393	583	2023-11-14 00:01:30.384-08	2023-11-14 00:02:07.794-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2394	583	2023-11-14 00:02:11.811-08	2023-11-14 00:05:04.062-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
2395	584	2023-11-14 00:10:43.511-08	2023-11-14 00:12:02.1-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2396	584	2023-11-14 00:12:02.1-08	2023-11-14 00:12:38.766-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2397	585	2023-11-14 00:10:43.511-08	2023-11-14 00:12:02.1-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2398	585	2023-11-14 00:12:02.1-08	2023-11-14 00:12:38.766-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2399	586	2023-11-14 00:05:57.548-08	2023-11-14 00:07:27.678-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2400	586	2023-11-14 00:10:43.511-08	2023-11-14 00:12:02.1-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2401	586	2023-11-14 00:12:02.1-08	2023-11-14 00:12:38.766-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2402	586	2023-11-14 00:14:27.75-08	2023-11-14 00:15:57.64-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2403	587	2023-11-14 00:10:43.541-08	2023-11-14 00:12:01.88-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2404	587	2023-11-14 00:12:01.88-08	2023-11-14 00:12:38.546-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2405	587	2023-11-14 00:14:28.038-08	2023-11-14 00:15:57.67-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2407	588	2023-11-14 00:10:43.521-08	2023-11-14 00:12:01.86-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2408	588	2023-11-14 00:12:01.86-08	2023-11-14 00:12:38.526-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2409	588	2023-11-14 00:14:28.018-08	2023-11-14 00:15:57.65-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2410	588	2023-11-14 00:16:43.092-08	2023-11-14 00:17:13.989-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2411	589	2023-11-14 00:10:43.521-08	2023-11-14 00:12:01.86-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2412	589	2023-11-14 00:12:01.86-08	2023-11-14 00:12:38.526-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2413	589	2023-11-14 00:14:28.018-08	2023-11-14 00:15:57.65-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2414	589	2023-11-14 00:16:43.092-08	2023-11-14 00:17:13.989-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2415	590	2023-11-14 00:12:01.97-08	2023-11-14 00:12:38.636-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2416	590	2023-11-14 00:14:27.87-08	2023-11-14 00:15:57.76-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2417	590	2023-11-14 00:16:43.202-08	2023-11-14 00:17:13.849-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2418	591	2023-11-14 00:12:02.04-08	2023-11-14 00:12:38.705-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2419	591	2023-11-14 00:14:27.94-08	2023-11-14 00:15:57.83-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2420	591	2023-11-14 00:16:43.272-08	2023-11-14 00:17:13.919-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2421	591	2023-11-14 00:20:37.37-08	2023-11-14 00:21:06.231-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2422	592	2023-11-14 00:14:27.76-08	2023-11-14 00:15:57.65-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2423	592	2023-11-14 00:16:43.342-08	2023-11-14 00:17:13.989-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2424	593	2023-11-14 00:16:43.142-08	2023-11-14 00:17:14.039-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2425	593	2023-11-14 00:20:37.49-08	2023-11-14 00:21:21.146-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2426	594	2023-11-14 00:20:37.39-08	2023-11-14 00:21:21.296-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2427	595	2023-11-14 00:20:37.35-08	2023-11-14 00:21:04.7-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2428	595	2023-11-14 00:21:04.7-08	2023-11-14 00:21:19.745-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2429	595	2023-11-14 00:23:38.583-08	2023-11-14 00:25:24.981-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2430	596	2023-11-14 00:28:40.299-08	2023-11-14 00:29:29.496-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2431	596	2023-11-14 00:29:29.496-08	2023-11-14 00:30:11.177-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2432	597	2023-11-14 00:25:25.131-08	2023-11-14 00:26:10.815-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2433	597	2023-11-14 00:28:37.659-08	2023-11-14 00:29:29.626-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2434	597	2023-11-14 00:29:29.626-08	2023-11-14 00:30:11.057-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2435	597	2023-11-14 00:30:21.352-08	2023-11-14 00:31:06.559-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2436	598	2023-11-14 00:25:25.061-08	2023-11-14 00:26:10.745-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2437	598	2023-11-14 00:28:37.34-08	2023-11-14 00:29:29.566-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2438	598	2023-11-14 00:29:29.566-08	2023-11-14 00:30:11.247-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2439	598	2023-11-14 00:30:21.292-08	2023-11-14 00:31:06.499-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2440	599	2023-11-14 00:25:25.261-08	2023-11-14 00:26:10.949-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2441	599	2023-11-14 00:28:41.813-08	2023-11-14 00:29:29.506-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2442	599	2023-11-14 00:29:29.506-08	2023-11-14 00:30:11.187-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2443	599	2023-11-14 00:30:21.232-08	2023-11-14 00:31:06.439-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2444	600	2023-11-14 00:25:25.011-08	2023-11-14 00:26:10.695-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2445	600	2023-11-14 00:28:41.057-08	2023-11-14 00:29:29.506-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2446	600	2023-11-14 00:29:29.506-08	2023-11-14 00:30:11.187-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2447	600	2023-11-14 00:30:21.232-08	2023-11-14 00:31:06.439-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2448	600	2023-11-14 00:34:36.703-08	2023-11-14 00:35:40.488-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2449	601	2023-11-14 00:28:41.097-08	2023-11-14 00:29:29.546-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2450	601	2023-11-14 00:29:29.546-08	2023-11-14 00:30:11.227-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2451	601	2023-11-14 00:30:21.272-08	2023-11-14 00:31:06.479-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2452	601	2023-11-14 00:34:36.743-08	2023-11-14 00:35:40.528-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2453	602	2023-11-14 00:29:29.406-08	2023-11-14 00:30:11.087-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2454	602	2023-11-14 00:30:21.132-08	2023-11-14 00:31:06.589-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2455	602	2023-11-14 00:34:36.853-08	2023-11-14 00:35:40.641-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2456	603	2023-11-14 00:34:36.643-08	2023-11-14 00:35:40.428-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2457	603	2023-11-14 00:38:04.095-08	2023-11-14 00:41:40.561-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
2458	604	2023-11-14 00:34:25.115-08	2023-11-14 00:34:49.472-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2459	604	2023-11-14 00:38:04.115-08	2023-11-14 00:41:40.581-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
2460	605	2023-11-14 00:34:24.995-08	2023-11-14 00:34:49.344-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2461	605	2023-11-14 00:38:03.995-08	2023-11-14 00:41:40.711-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
2462	606	2023-11-14 00:38:04.005-08	2023-11-14 00:41:40.721-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
2463	607	2023-11-14 00:38:04.025-08	2023-11-14 00:41:40.741-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
2464	607	2023-11-14 00:45:48.325-08	2023-11-14 00:47:10.927-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
2465	607	2023-11-14 00:47:14.436-08	2023-11-14 00:47:44.034-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
2466	608	2023-11-14 00:38:04.025-08	2023-11-14 00:41:40.741-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
2467	608	2023-11-14 00:45:48.325-08	2023-11-14 00:47:13.182-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
2468	608	2023-11-14 00:47:18.21-08	2023-11-14 00:48:10.377-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
2469	609	2023-11-14 00:45:48.113-08	2023-11-14 00:47:12.219-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
2470	609	2023-11-14 00:47:16.237-08	2023-11-14 00:48:04.351-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
2471	609	2023-11-14 00:48:16.659-08	2023-11-14 00:48:55.043-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2472	610	2023-11-14 00:45:50.448-08	2023-11-14 00:47:12.289-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
2473	610	2023-11-14 00:47:16.057-08	2023-11-14 00:48:04.421-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
2474	610	2023-11-14 00:48:16.729-08	2023-11-14 00:48:54.863-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2475	610	2023-11-14 00:50:46.852-08	2023-11-14 00:51:38.568-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
2476	611	2023-11-14 00:47:50.282-08	2023-11-14 00:48:16.619-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2477	611	2023-11-14 00:51:03.528-08	2023-11-14 00:51:49.498-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2478	612	2023-11-14 00:47:51.94-08	2023-11-14 00:48:16.799-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2479	612	2023-11-14 00:51:06.76-08	2023-11-14 00:51:49.468-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2480	612	2023-11-14 00:53:13.348-08	2023-11-14 00:54:04.318-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2481	613	2023-11-14 00:47:49.371-08	2023-11-14 00:48:16.449-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2482	613	2023-11-14 00:48:16.449-08	2023-11-14 00:48:43.311-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2483	613	2023-11-14 00:51:08.369-08	2023-11-14 00:51:49.568-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2484	613	2023-11-14 00:53:13.198-08	2023-11-14 00:54:04.418-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2485	613	2023-11-14 00:55:14.005-08	2023-11-14 00:56:13.268-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2486	614	2023-11-14 00:47:49.511-08	2023-11-14 00:48:16.599-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2487	614	2023-11-14 00:51:04.27-08	2023-11-14 00:51:49.478-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2488	614	2023-11-14 00:53:13.067-08	2023-11-14 00:54:04.794-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2489	614	2023-11-14 00:55:14.131-08	2023-11-14 00:56:13.393-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2490	614	2023-11-14 00:57:10.128-08	2023-11-14 00:57:36.184-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2491	614	2023-11-14 00:57:43.952-08	2023-11-14 00:58:19.092-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2492	615	2023-11-14 00:51:04.36-08	2023-11-14 00:51:49.568-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2493	615	2023-11-14 00:53:13.158-08	2023-11-14 00:54:04.884-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2494	615	2023-11-14 00:55:13.965-08	2023-11-14 00:56:13.483-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2495	615	2023-11-14 00:57:10.218-08	2023-11-14 00:57:36.274-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2496	615	2023-11-14 00:57:43.792-08	2023-11-14 00:58:18.932-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2497	616	2023-11-14 00:51:06.69-08	2023-11-14 00:51:49.398-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2498	616	2023-11-14 00:53:13.278-08	2023-11-14 00:54:04.498-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2499	616	2023-11-14 00:55:14.091-08	2023-11-14 00:56:13.353-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2500	616	2023-11-14 00:57:29.131-08	2023-11-14 00:58:19.062-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2501	617	2023-11-14 00:53:13.358-08	2023-11-14 00:54:04.328-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2502	617	2023-11-14 00:55:14.171-08	2023-11-14 00:56:13.432-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2503	617	2023-11-14 00:57:29.211-08	2023-11-14 00:58:19.142-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2504	617	2023-11-14 01:01:01.635-08	2023-11-14 01:03:27.517-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2505	618	2023-11-14 00:54:29.27-08	2023-11-14 00:54:52.39-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2506	618	2023-11-14 00:55:13.995-08	2023-11-14 00:56:13.513-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2507	618	2023-11-14 00:56:56.945-08	2023-11-14 00:57:19.016-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2508	618	2023-11-14 00:57:37.516-08	2023-11-14 00:58:18.932-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2509	618	2023-11-14 01:00:03.162-08	2023-11-14 01:00:25.762-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2510	618	2023-11-14 01:01:00.916-08	2023-11-14 01:04:25.316-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2511	619	2023-11-14 00:56:56.935-08	2023-11-14 00:57:19.006-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2512	619	2023-11-14 00:57:37.506-08	2023-11-14 00:58:19.172-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2513	619	2023-11-14 01:00:03.152-08	2023-11-14 01:00:25.752-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2514	619	2023-11-14 01:01:00.906-08	2023-11-14 01:04:25.306-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2515	620	2023-11-14 00:56:56.985-08	2023-11-14 00:57:25.567-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2516	620	2023-11-14 00:57:27.074-08	2023-11-14 00:58:14.263-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2517	620	2023-11-14 00:59:49.957-08	2023-11-14 01:00:09.29-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2518	620	2023-11-14 01:00:03.012-08	2023-11-14 01:00:25.612-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2519	620	2023-11-14 01:01:01.516-08	2023-11-14 01:04:25.416-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2520	620	2023-11-14 01:06:47.778-08	2023-11-14 01:07:17.914-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2521	621	2023-11-14 01:00:02.962-08	2023-11-14 01:00:25.562-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2522	621	2023-11-14 01:01:01.465-08	2023-11-14 01:04:25.616-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2523	621	2023-11-14 01:06:47.728-08	2023-11-14 01:07:17.864-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2524	621	2023-11-14 01:07:28.654-08	2023-11-14 01:08:07.826-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2525	622	2023-11-14 01:00:03.072-08	2023-11-14 01:00:25.672-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2526	622	2023-11-14 01:01:01.576-08	2023-11-14 01:04:25.476-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2527	622	2023-11-14 01:06:47.838-08	2023-11-14 01:07:17.974-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2528	622	2023-11-14 01:07:28.764-08	2023-11-14 01:08:07.942-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2529	622	2023-11-14 01:09:20.506-08	2023-11-14 01:09:46.078-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2530	623	2023-11-14 01:01:01.066-08	2023-11-14 01:04:25.216-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
2531	623	2023-11-14 01:06:47.828-08	2023-11-14 01:07:17.714-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2532	623	2023-11-14 01:07:28.754-08	2023-11-14 01:08:07.932-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2533	623	2023-11-14 01:09:17.23-08	2023-11-14 01:09:42.817-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2534	624	2023-11-14 01:07:28.52-08	2023-11-14 01:08:07.952-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2535	624	2023-11-14 01:09:17.25-08	2023-11-14 01:09:42.837-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2536	625	2023-11-14 01:07:28.55-08	2023-11-14 01:08:07.981-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2537	625	2023-11-14 01:09:36.369-08	2023-11-14 01:10:17.793-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2538	625	2023-11-14 01:11:05.513-08	2023-11-14 01:11:45.451-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2539	626	2023-11-14 01:05:51.585-08	2023-11-14 01:06:30.263-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2540	626	2023-11-14 01:07:28.764-08	2023-11-14 01:08:07.942-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2541	626	2023-11-14 01:09:35.072-08	2023-11-14 01:09:55.381-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2542	626	2023-11-14 01:11:05.727-08	2023-11-14 01:11:46.665-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2543	626	2023-11-14 01:13:33.089-08	2023-11-14 01:16:06.78-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
2544	627	2023-11-14 01:06:47.908-08	2023-11-14 01:07:17.794-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2545	627	2023-11-14 01:07:28.58-08	2023-11-14 01:08:08.012-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2546	627	2023-11-14 01:09:03.75-08	2023-11-14 01:09:42.637-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2547	627	2023-11-14 01:11:38.191-08	2023-11-14 01:11:58.539-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2548	627	2023-11-14 01:13:32.699-08	2023-11-14 01:16:06.64-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
2549	628	2023-11-14 01:09:34.392-08	2023-11-14 01:09:56.708-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2550	628	2023-11-14 01:11:05.543-08	2023-11-14 01:11:44.476-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2551	628	2023-11-14 01:11:37.951-08	2023-11-14 01:12:08.046-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2552	628	2023-11-14 01:13:32.919-08	2023-11-14 01:16:06.86-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
2553	629	2023-11-14 01:11:05.623-08	2023-11-14 01:11:45.061-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2554	629	2023-11-14 01:11:38.031-08	2023-11-14 01:11:58.589-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2555	629	2023-11-14 01:13:32.749-08	2023-11-14 01:16:06.69-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
2556	629	2023-11-14 01:18:31.344-08	2023-11-14 01:19:14.79-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2557	630	2023-11-14 01:11:38.011-08	2023-11-14 01:12:08.146-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2558	630	2023-11-14 01:13:33.019-08	2023-11-14 01:16:06.96-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
2559	630	2023-11-14 01:18:30.611-08	2023-11-14 01:19:14.81-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2560	631	2023-11-14 01:13:33.039-08	2023-11-14 01:16:06.98-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
2561	631	2023-11-14 01:18:30.631-08	2023-11-14 01:19:14.83-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2562	632	2023-11-14 01:18:31.284-08	2023-11-14 01:19:14.73-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2563	633	2023-11-14 01:18:31.294-08	2023-11-14 01:19:14.74-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2564	633	2023-11-14 01:24:46.258-08	2023-11-14 01:26:22.727-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2565	634	2023-11-14 01:18:30.791-08	2023-11-14 01:19:14.74-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2566	634	2023-11-14 01:24:45.752-08	2023-11-14 01:26:22.977-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2567	635	2023-11-14 01:24:45.832-08	2023-11-14 01:26:22.807-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2568	636	2023-11-14 01:24:46.348-08	2023-11-14 01:26:22.817-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2569	637	2023-11-14 01:24:46.218-08	2023-11-14 01:26:22.68-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2570	637	2023-11-14 01:30:04.655-08	2023-11-14 01:31:10.714-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2571	638	2023-11-14 01:24:45.842-08	2023-11-14 01:26:22.817-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2572	638	2023-11-14 01:30:04.285-08	2023-11-14 01:31:10.594-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2573	639	2023-11-14 01:30:04.065-08	2023-11-14 01:31:10.624-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2574	640	2023-11-14 01:30:04.635-08	2023-11-14 01:31:10.694-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2575	640	2023-11-14 01:32:52.656-08	2023-11-14 01:34:59.165-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariavility-INCREASE": 25}	2	baseline	normal	140	\N	\N	\N
2576	640	2023-11-14 01:36:59.694-08	2023-11-14 01:37:24.077-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2577	641	2023-11-14 01:30:04.675-08	2023-11-14 01:31:10.734-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2578	641	2023-11-14 01:32:52.697-08	2023-11-14 01:34:59.205-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariavility-INCREASE": 25}	2	baseline	normal	140	\N	\N	\N
2579	641	2023-11-14 01:36:59.484-08	2023-11-14 01:37:24.116-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2580	642	2023-11-14 01:30:04.185-08	2023-11-14 01:31:10.494-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2581	642	2023-11-14 01:34:59.215-08	2023-11-14 01:36:05.255-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2582	642	2023-11-14 01:36:59.744-08	2023-11-14 01:37:23.872-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2583	642	2023-11-14 01:38:49.245-08	2023-11-14 01:39:21.641-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2584	643	2023-11-14 01:34:59.275-08	2023-11-14 01:36:05.315-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2585	643	2023-11-14 01:36:59.554-08	2023-11-14 01:37:23.682-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2586	643	2023-11-14 01:38:49.305-08	2023-11-14 01:39:21.446-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2587	643	2023-11-14 01:41:35.296-08	2023-11-14 01:42:15.689-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2588	644	2023-11-14 01:36:59.554-08	2023-11-14 01:37:23.932-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2589	644	2023-11-14 01:38:49.305-08	2023-11-14 01:39:21.701-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2590	644	2023-11-14 01:41:34.542-08	2023-11-14 01:42:15.439-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2591	645	2023-11-14 01:36:59.544-08	2023-11-14 01:37:23.672-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2592	645	2023-11-14 01:38:49.295-08	2023-11-14 01:39:21.436-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2593	645	2023-11-14 01:41:34.562-08	2023-11-14 01:42:15.708-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2594	645	2023-11-14 01:44:13.91-08	2023-11-14 01:46:27.509-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
2595	646	2023-11-14 01:38:49.345-08	2023-11-14 01:39:21.486-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2596	646	2023-11-14 01:41:34.612-08	2023-11-14 01:42:15.758-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2597	646	2023-11-14 01:44:13.964-08	2023-11-14 01:47:44.182-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
2598	647	2023-11-14 01:41:34.902-08	2023-11-14 01:42:15.549-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2599	647	2023-11-14 01:43:57.465-08	2023-11-14 01:45:44.662-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 25}	1	baseline	normal	145	normal	25	\N
2600	647	2023-11-14 01:46:30.875-08	2023-11-14 01:49:33.97-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2601	648	2023-11-14 01:41:36.372-08	2023-11-14 01:42:15.498-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2602	648	2023-11-14 01:44:14.669-08	2023-11-14 01:47:44.142-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
2603	649	2023-11-14 01:43:57.495-08	2023-11-14 01:45:44.692-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 25}	1	baseline	normal	145	normal	25	\N
2604	649	2023-11-14 01:46:30.905-08	2023-11-14 01:49:34-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2605	650	2023-11-14 01:46:30.131-08	2023-11-14 01:49:33.98-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2606	650	2023-11-14 01:52:23.294-08	2023-11-14 01:53:11.758-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2607	651	2023-11-14 01:46:29.951-08	2023-11-14 01:49:34.05-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2608	651	2023-11-14 01:52:23.114-08	2023-11-14 01:53:11.828-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2978	803	2023-11-20 22:59:28.046-08	2023-11-20 23:00:02.685-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2609	652	2023-11-14 01:46:30.041-08	2023-11-14 01:49:34.139-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2610	652	2023-11-14 01:52:23.204-08	2023-11-14 01:53:11.918-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2611	653	2023-11-14 01:52:23.034-08	2023-11-14 01:53:11.748-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2612	654	2023-11-14 01:52:23.054-08	2023-11-14 01:53:11.768-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2613	655	2023-11-14 01:52:23.314-08	2023-11-14 01:53:11.778-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2614	656	2023-11-14 01:52:23.114-08	2023-11-14 01:53:11.828-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2615	662	2023-11-14 02:07:37.296-08	2023-11-14 02:09:20.642-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2616	664	2023-11-14 02:12:17.442-08	2023-11-14 02:14:08.954-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
2617	665	2023-11-14 02:12:17.452-08	2023-11-14 02:14:54.66-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
2618	666	2023-11-14 02:12:17.452-08	2023-11-14 02:16:21.8-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
2619	667	2023-11-14 02:12:17.442-08	2023-11-14 02:16:21.79-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
2620	667	2023-11-14 02:16:22.04-08	2023-11-14 02:18:38.915-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
2621	668	2023-11-14 02:12:17.382-08	2023-11-14 02:16:21.73-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
2622	668	2023-11-14 02:16:21.98-08	2023-11-14 02:18:38.855-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
2623	669	2023-11-14 02:12:17.402-08	2023-11-14 02:16:21.75-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
2624	669	2023-11-14 02:16:22-08	2023-11-14 02:18:38.875-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
2625	669	2023-11-14 02:20:10.792-08	2023-11-14 02:22:20.141-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
2626	670	2023-11-14 02:16:22-08	2023-11-14 02:18:38.875-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
2627	670	2023-11-14 02:20:10.792-08	2023-11-14 02:23:43.018-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
2628	671	2023-11-14 02:20:10.912-08	2023-11-14 02:25:02.737-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
2629	671	2023-11-14 02:25:02.737-08	2023-11-14 02:25:32.876-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2630	672	2023-11-14 02:20:10.902-08	2023-11-14 02:25:02.727-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
2631	672	2023-11-14 02:25:02.727-08	2023-11-14 02:25:33.335-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2632	673	2023-11-14 02:20:10.912-08	2023-11-14 02:25:02.737-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
2633	673	2023-11-14 02:25:02.737-08	2023-11-14 02:25:33.105-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2634	674	2023-11-14 02:20:10.922-08	2023-11-14 02:25:02.747-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
2635	674	2023-11-14 02:25:02.747-08	2023-11-14 02:25:33.115-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2636	675	2023-11-14 02:20:10.962-08	2023-11-14 02:25:02.787-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
2637	675	2023-11-14 02:25:02.787-08	2023-11-14 02:25:33.173-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2638	675	2023-11-14 02:25:33.173-08	2023-11-14 02:26:23.414-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2639	675	2023-11-14 02:29:43.346-08	2023-11-14 02:30:15.221-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2640	676	2023-11-14 02:22:26.393-08	2023-11-14 02:25:02.587-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 10}	2	baseline	normal	130	decrease	10	\N
2641	676	2023-11-14 02:25:02.587-08	2023-11-14 02:25:32.469-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2642	676	2023-11-14 02:29:43.636-08	2023-11-14 02:30:15.261-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2643	677	2023-11-14 02:25:02.597-08	2023-11-14 02:25:32.963-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2644	677	2023-11-14 02:25:32.963-08	2023-11-14 02:26:23.474-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2645	677	2023-11-14 02:28:15.22-08	2023-11-14 02:28:41.592-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2646	678	2023-11-14 02:25:02.617-08	2023-11-14 02:25:32.479-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2647	678	2023-11-14 02:25:32.479-08	2023-11-14 02:26:23.244-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2648	678	2023-11-14 02:29:43.426-08	2023-11-14 02:30:15.051-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2649	678	2023-11-14 02:33:25.4-08	2023-11-14 02:34:15.381-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2650	679	2023-11-14 02:29:43.416-08	2023-11-14 02:30:15.291-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2651	679	2023-11-14 02:33:25.39-08	2023-11-14 02:34:15.371-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2652	679	2023-11-14 02:34:33.204-08	2023-11-14 02:36:15.688-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
2653	680	2023-11-14 02:29:43.656-08	2023-11-14 02:30:15.031-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2654	680	2023-11-14 02:33:25.38-08	2023-11-14 02:34:15.614-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2655	680	2023-11-14 02:34:33.194-08	2023-11-14 02:36:15.678-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
2656	681	2023-11-14 02:33:25.38-08	2023-11-14 02:34:15.614-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2657	681	2023-11-14 02:34:33.194-08	2023-11-14 02:36:15.678-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
2658	681	2023-11-14 02:37:19.746-08	2023-11-14 02:39:46.158-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
2659	682	2023-11-14 02:33:25.41-08	2023-11-14 02:34:15.391-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2660	682	2023-11-14 02:34:33.224-08	2023-11-14 02:36:15.708-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
2661	682	2023-11-14 02:37:19.523-08	2023-11-14 02:39:45.938-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
2662	683	2023-11-14 02:33:25.225-08	2023-11-14 02:34:15.211-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2713	698	2023-11-17 06:52:12.864-08	2023-11-17 06:52:58.502-08	{"Risk": 5, "Deceleration-HI_LD": null}	5	deceleration	\N	\N	\N	\N	high_ld
2663	683	2023-11-14 02:34:33.294-08	2023-11-14 02:36:15.528-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
2664	683	2023-11-14 02:37:19.596-08	2023-11-14 02:39:46.008-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
2665	683	2023-11-14 02:40:42.522-08	2023-11-14 02:41:45.008-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2666	684	2023-11-14 02:34:33.354-08	2023-11-14 02:36:15.588-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
2667	684	2023-11-14 02:37:19.403-08	2023-11-14 02:39:45.817-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
2668	684	2023-11-14 02:40:42.582-08	2023-11-14 02:41:45.068-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2669	684	2023-11-14 02:41:45.324-08	2023-11-14 02:44:42.585-08	{"Risk": 1, "Baseline-NORMAL": 125, "BaselineVariability-NORMAL": 20}	1	baseline	normal	125	normal	20	\N
2670	685	2023-11-14 02:37:19.696-08	2023-11-14 02:39:46.365-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
2671	685	2023-11-14 02:40:42.364-08	2023-11-14 02:41:44.858-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2672	685	2023-11-14 02:41:45.114-08	2023-11-14 02:45:46.386-08	{"Risk": 1, "Baseline-NORMAL": 125, "BaselineVariability-NORMAL": 20}	1	baseline	normal	125	normal	20	\N
2673	686	2023-11-14 02:37:19.676-08	2023-11-14 02:39:46.345-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
2674	686	2023-11-14 02:40:42.343-08	2023-11-14 02:41:44.838-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2675	686	2023-11-14 02:41:45.088-08	2023-11-14 02:46:47.368-08	{"Risk": 1, "Baseline-NORMAL": 125, "BaselineVariability-NORMAL": 20}	1	baseline	normal	125	normal	20	\N
2676	686	2023-11-14 02:46:47.368-08	2023-11-14 02:47:34.046-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2677	687	2023-11-14 02:40:42.692-08	2023-11-14 02:41:44.928-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2678	687	2023-11-14 02:41:45.184-08	2023-11-14 02:46:47.462-08	{"Risk": 1, "Baseline-NORMAL": 125, "BaselineVariability-NORMAL": 20}	1	baseline	normal	125	normal	20	\N
2679	687	2023-11-14 02:46:47.462-08	2023-11-14 02:47:34.136-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2680	688	2023-11-14 02:41:45.714-08	2023-11-14 02:46:47.491-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
2681	688	2023-11-14 02:46:47.491-08	2023-11-14 02:47:34.166-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2682	689	2023-11-14 02:46:47.358-08	2023-11-14 02:47:34.036-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2683	689	2023-11-14 02:50:04.936-08	2023-11-14 02:52:43.896-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
2684	690	2023-11-14 02:46:47.358-08	2023-11-14 02:47:31.778-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2685	690	2023-11-14 02:50:04.936-08	2023-11-14 02:52:43.896-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
2686	691	2023-11-14 02:46:47.368-08	2023-11-14 02:47:26.015-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2687	691	2023-11-14 02:50:04.946-08	2023-11-14 02:52:43.906-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
2688	691	2023-11-14 02:53:16.283-08	2023-11-14 02:55:15.04-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
2689	692	2023-11-14 02:46:47.368-08	2023-11-14 02:47:24.764-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2690	692	2023-11-14 02:50:04.946-08	2023-11-14 02:52:43.906-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
2691	692	2023-11-14 02:53:16.283-08	2023-11-14 02:55:15.04-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
2692	692	2023-11-14 02:55:15.04-08	2023-11-14 02:56:22.294-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2693	692	2023-11-14 02:56:31.544-08	2023-11-14 02:57:38.659-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2694	693	2023-11-14 02:50:04.946-08	2023-11-14 02:52:43.906-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
2695	693	2023-11-14 02:53:16.283-08	2023-11-14 02:55:15.04-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
2696	693	2023-11-14 02:55:15.04-08	2023-11-14 02:56:15.749-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2697	693	2023-11-14 02:57:56.198-08	2023-11-14 02:58:32.847-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2698	694	2023-11-14 02:50:04.946-08	2023-11-14 02:52:43.906-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
2699	694	2023-11-14 02:53:16.283-08	2023-11-14 02:55:15.04-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
2700	694	2023-11-14 02:55:15.04-08	2023-11-14 02:56:15.749-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2701	694	2023-11-14 02:57:56.198-08	2023-11-14 02:58:32.847-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2702	694	2023-11-14 02:59:42.642-08	2023-11-14 03:00:41.024-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2703	695	2023-11-14 02:53:16.363-08	2023-11-14 02:55:14.867-08	{"Risk": 2, "Baseline-NORMAL": 120, "BaselineVariability-DECREASE": 15}	2	baseline	normal	120	decrease	15	\N
2704	695	2023-11-14 02:56:08.056-08	2023-11-14 02:56:53.074-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2705	695	2023-11-14 02:57:56.028-08	2023-11-14 02:58:32.927-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2706	695	2023-11-14 02:58:45.73-08	2023-11-14 03:02:43.816-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
2707	696	2023-11-17 06:44:57.591-08	2023-11-17 06:45:48.763-08	{"Risk": 4, "Deceleration-HI_LD": null}	4	deceleration	\N	\N	\N	\N	high_ld
2708	696	2023-11-17 06:47:00.501-08	2023-11-17 06:52:02.32-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
2709	697	2023-11-17 06:47:00.361-08	2023-11-17 06:51:24.412-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
2710	697	2023-11-17 06:52:03.437-08	2023-11-17 06:52:18.488-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
2711	697	2023-11-17 06:52:40.794-08	2023-11-17 06:54:20.869-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2712	698	2023-11-17 06:47:00.481-08	2023-11-17 06:51:24.533-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
2873	762	2023-11-20 04:17:32.057-08	2023-11-20 04:18:38.61-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2714	698	2023-11-17 06:53:41.034-08	2023-11-17 06:56:16.823-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2715	699	2023-11-17 06:47:00.701-08	2023-11-17 06:52:02.77-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
2716	699	2023-11-17 06:52:47.646-08	2023-11-17 06:54:20.199-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2717	699	2023-11-17 06:54:20.449-08	2023-11-17 06:57:32.956-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2718	700	2023-11-17 06:52:15.597-08	2023-11-17 06:52:59.668-08	{"Risk": 5, "Deceleration-HI_LD": null}	5	deceleration	\N	\N	\N	\N	high_ld
2719	700	2023-11-17 06:53:41.194-08	2023-11-17 06:57:32.956-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2720	701	2023-11-17 06:53:41.074-08	2023-11-17 06:59:41.803-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2721	702	2023-11-17 06:53:41.124-08	2023-11-17 07:01:24.418-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	105	decrease	10	\N
2722	703	2023-11-17 06:53:41.274-08	2023-11-17 07:03:21.799-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	105	decrease	10	\N
2723	704	2023-11-17 06:57:32.986-08	2023-11-17 07:04:12.232-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2724	704	2023-11-17 07:04:12.232-08	2023-11-17 07:05:04.792-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2725	705	2023-11-17 07:01:12.023-08	2023-11-17 07:07:41.824-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2726	707	2023-11-17 07:05:05.008-08	2023-11-17 07:10:01.263-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	105	decrease	10	\N
2727	709	2023-11-17 07:11:17.559-08	2023-11-17 07:14:39.059-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2728	710	2023-11-17 07:58:04.491-08	2023-11-17 07:58:19.539-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2729	710	2023-11-17 07:59:46.419-08	2023-11-17 08:00:37.486-08	{"Risk": 4, "Deceleration-HI_LD": null}	4	deceleration	\N	\N	\N	\N	high_ld
2730	710	2023-11-17 08:01:48.316-08	2023-11-17 08:06:11.786-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
2731	711	2023-11-17 08:01:48.686-08	2023-11-17 08:06:50.079-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
2732	711	2023-11-17 08:07:02.883-08	2023-11-17 08:07:46.697-08	{"Risk": 5, "Deceleration-HI_LD": null}	5	deceleration	\N	\N	\N	\N	high_ld
2733	712	2023-11-17 08:00:23.682-08	2023-11-17 08:01:07.843-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2734	712	2023-11-17 08:01:48.536-08	2023-11-17 08:06:11.756-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
2735	712	2023-11-17 08:08:28.275-08	2023-11-17 08:10:33.326-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2736	713	2023-11-17 08:01:48.456-08	2023-11-17 08:06:11.676-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
2737	713	2023-11-17 08:08:28.455-08	2023-11-17 08:12:19.77-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2738	714	2023-11-17 08:07:02.933-08	2023-11-17 08:07:46.747-08	{"Risk": 5, "Deceleration-HI_LD": null}	5	deceleration	\N	\N	\N	\N	high_ld
2739	714	2023-11-17 08:08:28.445-08	2023-11-17 08:12:19.76-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2740	714	2023-11-17 08:12:20.01-08	2023-11-17 08:14:28.487-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2741	715	2023-11-17 08:06:49.699-08	2023-11-17 08:07:21.248-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2742	715	2023-11-17 08:07:34.296-08	2023-11-17 08:09:08.196-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2743	715	2023-11-17 08:09:08.446-08	2023-11-17 08:15:58.261-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2744	716	2023-11-17 08:08:28.415-08	2023-11-17 08:16:01.946-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2745	716	2023-11-17 08:16:02.196-08	2023-11-17 08:18:39.901-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2746	718	2023-11-17 08:15:54.661-08	2023-11-17 08:20:03.594-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2747	719	2023-11-17 08:15:56.815-08	2023-11-17 08:19:01.643-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2748	719	2023-11-17 08:19:01.643-08	2023-11-17 08:19:57.929-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2749	719	2023-11-17 08:19:58.184-08	2023-11-17 08:22:28.1-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2750	720	2023-11-17 08:19:01.503-08	2023-11-17 08:19:58.039-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2751	720	2023-11-17 08:19:58.294-08	2023-11-17 08:24:22.25-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2752	722	2023-11-17 08:19:51.333-08	2023-11-17 08:24:47.174-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	105	decrease	10	\N
2753	723	2023-11-17 08:19:01.533-08	2023-11-17 08:19:58.069-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2754	723	2023-11-17 08:19:58.324-08	2023-11-17 08:29:24.408-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	105	decrease	10	\N
2755	724	2023-11-20 01:05:32.545-08	2023-11-20 01:08:54.959-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	110	decrease	10	\N
2756	724	2023-11-20 01:09:12.544-08	2023-11-20 01:09:37.618-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
2757	725	2023-11-20 01:04:16.343-08	2023-11-20 01:05:14.813-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2758	725	2023-11-20 01:05:05.773-08	2023-11-20 01:05:25.615-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2759	725	2023-11-20 01:10:29.129-08	2023-11-20 01:11:18.201-08	{"Risk": 4, "Deceleration-HI_LD": null}	4	deceleration	\N	\N	\N	\N	high_ld
2760	725	2023-11-20 01:11:18.451-08	2023-11-20 01:13:11.228-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2761	725	2023-11-20 01:13:29.555-08	2023-11-20 01:13:57.142-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
2762	726	2023-11-20 01:05:32.385-08	2023-11-20 01:10:02.826-08	{"Risk": 2, "Baseline-DECELERATION": 110, "BaselineVariavility-INCREASE": 30}	2	baseline	deceleration	110	\N	\N	\N
2763	726	2023-11-20 01:10:37.162-08	2023-11-20 01:11:16.687-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2764	726	2023-11-20 01:11:16.937-08	2023-11-20 01:13:11.218-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2765	727	2023-11-20 01:10:37.682-08	2023-11-20 01:11:18.211-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2766	727	2023-11-20 01:11:18.461-08	2023-11-20 01:13:11.238-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2767	727	2023-11-20 01:13:29.565-08	2023-11-20 01:13:57.152-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
2768	727	2023-11-20 01:13:58.909-08	2023-11-20 01:16:26.571-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
2769	728	2023-11-20 01:10:35.223-08	2023-11-20 01:11:19.046-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2770	728	2023-11-20 01:11:19.296-08	2023-11-20 01:13:11.318-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2771	728	2023-11-20 01:13:59.239-08	2023-11-20 01:16:27.906-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
2772	729	2023-11-20 01:10:35.223-08	2023-11-20 01:11:19.046-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2773	729	2023-11-20 01:11:19.296-08	2023-11-20 01:13:11.318-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
2774	729	2023-11-20 01:17:01.744-08	2023-11-20 01:17:30.044-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
2775	729	2023-11-20 01:17:30.544-08	2023-11-20 01:19:31.894-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	110	decrease	10	\N
2776	730	2023-11-20 01:10:44.299-08	2023-11-20 01:11:15.33-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2777	730	2023-11-20 01:11:15.58-08	2023-11-20 01:13:11.118-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
2778	730	2023-11-20 01:13:59.039-08	2023-11-20 01:15:53.803-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-LOST": 0}	4	baseline	deceleration	105	lost	0	\N
2779	730	2023-11-20 01:17:05.539-08	2023-11-20 01:17:30.094-08	{"Risk": 5, "Deceleration-LOW_VD": null}	5	deceleration	\N	\N	\N	\N	low_vd
2780	730	2023-11-20 01:17:30.594-08	2023-11-20 01:21:32.025-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	110	decrease	10	\N
2781	731	2023-11-20 01:13:59.139-08	2023-11-20 01:16:26.551-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
2782	731	2023-11-20 01:16:47.853-08	2023-11-20 01:17:29.185-08	{"Risk": 5, "Deceleration-HI_VD": null}	5	deceleration	\N	\N	\N	\N	high_vd
2783	731	2023-11-20 01:17:29.685-08	2023-11-20 01:21:34.133-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	110	decrease	10	\N
2784	732	2023-11-20 01:42:34.824-08	2023-11-20 01:43:13.765-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2785	733	2023-11-20 01:34:59.603-08	2023-11-20 01:41:57.691-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
2786	733	2023-11-20 01:42:35.598-08	2023-11-20 01:43:13.785-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2787	734	2023-11-20 01:42:35.598-08	2023-11-20 01:43:13.785-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2788	735	2023-11-20 01:42:35.428-08	2023-11-20 01:43:13.615-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2789	735	2023-11-20 01:46:54.623-08	2023-11-20 01:47:39.815-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2790	736	2023-11-20 01:42:35.328-08	2023-11-20 01:43:13.765-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2791	736	2023-11-20 01:45:12.094-08	2023-11-20 01:49:06.827-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
2792	736	2023-11-20 01:49:32.637-08	2023-11-20 01:50:08.463-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2793	737	2023-11-20 01:42:35.638-08	2023-11-20 01:43:13.825-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2794	737	2023-11-20 01:46:54.583-08	2023-11-20 01:47:38.514-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2795	737	2023-11-20 01:47:38.514-08	2023-11-20 01:48:11.547-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2796	737	2023-11-20 01:48:17.047-08	2023-11-20 01:48:39.064-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2797	737	2023-11-20 01:48:39.064-08	2023-11-20 01:49:24.929-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2798	737	2023-11-20 01:50:09.538-08	2023-11-20 01:50:38.954-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2799	738	2023-11-20 01:42:35.648-08	2023-11-20 01:43:13.835-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2800	738	2023-11-20 01:45:25.225-08	2023-11-20 01:49:08.154-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
2801	738	2023-11-20 01:49:26.945-08	2023-11-20 01:50:08.293-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2802	738	2023-11-20 01:50:08.293-08	2023-11-20 01:50:37.405-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2803	739	2023-11-20 01:46:54.692-08	2023-11-20 01:47:39.128-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2804	739	2023-11-20 01:47:57.411-08	2023-11-20 01:48:38.924-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2805	739	2023-11-20 01:49:26.795-08	2023-11-20 01:50:08.139-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2806	739	2023-11-20 01:50:08.139-08	2023-11-20 01:50:37.509-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2807	739	2023-11-20 01:52:34.58-08	2023-11-20 01:54:26.011-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2808	740	2023-11-20 01:46:54.543-08	2023-11-20 01:47:48.755-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2809	740	2023-11-20 01:48:09.505-08	2023-11-20 01:48:39.024-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2810	740	2023-11-20 01:49:31.145-08	2023-11-20 01:50:07.729-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2811	740	2023-11-20 01:50:07.729-08	2023-11-20 01:50:36.845-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2812	740	2023-11-20 01:52:31.407-08	2023-11-20 01:54:26.093-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2920	783	2023-11-20 18:57:04.265-08	2023-11-20 18:57:51.267-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2813	740	2023-11-20 01:54:26.343-08	2023-11-20 01:56:28.129-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2814	741	2023-11-20 01:46:54.543-08	2023-11-20 01:47:39.735-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2815	741	2023-11-20 01:47:41.742-08	2023-11-20 01:48:08.539-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2816	741	2023-11-20 01:48:15.797-08	2023-11-20 01:48:39.311-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2817	741	2023-11-20 01:48:39.311-08	2023-11-20 01:50:11.523-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2818	741	2023-11-20 01:50:11.523-08	2023-11-20 01:50:45.417-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2819	741	2023-11-20 01:51:09.797-08	2023-11-20 01:51:52.233-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2820	741	2023-11-20 01:52:35.925-08	2023-11-20 01:54:26.083-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2821	741	2023-11-20 01:54:26.333-08	2023-11-20 01:57:22.362-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
2822	742	2023-11-20 01:49:26.935-08	2023-11-20 01:50:08.283-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2823	742	2023-11-20 01:50:08.283-08	2023-11-20 01:50:37.395-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2824	742	2023-11-20 01:52:34.72-08	2023-11-20 01:54:26.153-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2825	743	2023-11-20 01:51:10.913-08	2023-11-20 01:51:51.878-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2826	743	2023-11-20 01:52:55.069-08	2023-11-20 01:59:40.642-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
2827	744	2023-11-20 02:23:19.54-08	2023-11-20 02:26:19.325-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
2828	744	2023-11-20 02:27:08.645-08	2023-11-20 02:28:43.57-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2829	744	2023-11-20 02:29:29.776-08	2023-11-20 02:30:00.643-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2830	745	2023-11-20 02:27:40.859-08	2023-11-20 02:28:53.166-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2831	745	2023-11-20 02:29:30.34-08	2023-11-20 02:29:55.625-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2832	746	2023-11-20 02:23:20.649-08	2023-11-20 02:24:43.184-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2833	746	2023-11-20 02:25:56.934-08	2023-11-20 02:27:29.631-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2834	746	2023-11-20 02:27:44.885-08	2023-11-20 02:28:24.635-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2835	746	2023-11-20 02:29:46.442-08	2023-11-20 02:30:17.094-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2836	747	2023-11-20 02:25:57.034-08	2023-11-20 02:27:29.731-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2837	747	2023-11-20 02:27:44.985-08	2023-11-20 02:28:24.735-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2838	747	2023-11-20 02:29:46.291-08	2023-11-20 02:30:17.194-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2839	747	2023-11-20 02:32:00.304-08	2023-11-20 02:35:29.972-08	{"Risk": 1, "Baseline-NORMAL": 135, "BaselineVariability-NORMAL": 25}	1	baseline	normal	135	normal	25	\N
2840	748	2023-11-20 02:28:05.091-08	2023-11-20 02:28:56.213-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2841	748	2023-11-20 02:29:29.366-08	2023-11-20 02:30:01.439-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2842	748	2023-11-20 02:31:57.613-08	2023-11-20 02:36:13.692-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 20}	2	baseline	normal	135	decrease	20	\N
2843	749	2023-11-20 02:27:40.849-08	2023-11-20 02:28:53.156-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2844	749	2023-11-20 02:29:30.33-08	2023-11-20 02:29:55.615-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2845	749	2023-11-20 02:31:15.465-08	2023-11-20 02:31:58.83-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2846	749	2023-11-20 02:31:59.08-08	2023-11-20 02:38:35.123-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 20}	2	baseline	normal	135	decrease	20	\N
2847	750	2023-11-20 02:29:28.122-08	2023-11-20 02:29:59.686-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2848	750	2023-11-20 02:31:56.364-08	2023-11-20 02:39:29.677-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2849	751	2023-11-20 02:31:15.115-08	2023-11-20 02:32:00.991-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2850	751	2023-11-20 02:32:01.241-08	2023-11-20 02:41:21.307-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
2851	752	2023-11-20 02:41:21.064-08	2023-11-20 02:42:34.579-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2852	753	2023-11-20 02:41:21.185-08	2023-11-20 02:42:34.699-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2853	754	2023-11-20 02:40:07.504-08	2023-11-20 02:42:22.81-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariavility-INCREASE": 30}	2	baseline	normal	140	\N	\N	\N
2854	755	2023-11-20 02:40:07.695-08	2023-11-20 02:42:35.275-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
2855	756	2023-11-20 03:50:17.956-08	2023-11-20 03:51:59.279-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2856	756	2023-11-20 03:52:20.529-08	2023-11-20 03:53:10.201-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2857	756	2023-11-20 03:53:32.306-08	2023-11-20 03:54:00.393-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2858	756	2023-11-20 03:54:15.211-08	2023-11-20 03:56:28.362-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
2859	757	2023-11-20 03:49:11.53-08	2023-11-20 03:51:08.22-08	{"Deceleration-HI_LD": null}	\N	deceleration	\N	\N	\N	\N	high_ld
2860	757	2023-11-20 03:53:31.575-08	2023-11-20 03:54:00.162-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2861	757	2023-11-20 03:54:15.231-08	2023-11-20 03:58:18.152-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2862	758	2023-11-20 03:53:32.636-08	2023-11-20 03:54:01.003-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2863	758	2023-11-20 03:54:15.321-08	2023-11-20 03:58:18.492-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2864	759	2023-11-20 03:53:31.156-08	2023-11-20 03:53:59.752-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2865	759	2023-11-20 03:54:15.321-08	2023-11-20 03:58:18.242-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
2866	759	2023-11-20 03:59:06.469-08	2023-11-20 04:01:17.481-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
2867	759	2023-11-20 04:01:19.495-08	2023-11-20 04:03:30.887-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
2868	760	2023-11-20 03:59:06.459-08	2023-11-20 04:01:17.472-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
2869	760	2023-11-20 04:01:19.485-08	2023-11-20 04:05:32.709-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
2870	761	2023-11-20 03:59:08.595-08	2023-11-20 04:01:17.602-08	{"Risk": 5, "Deceleration-HI_PD": null}	5	deceleration	\N	\N	\N	\N	high_pd
2871	761	2023-11-20 04:01:19.615-08	2023-11-20 04:05:34.101-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
2872	761	2023-11-20 04:06:11.008-08	2023-11-20 04:06:32.612-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2874	762	2023-11-20 04:18:38.86-08	2023-11-20 04:21:28.635-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
2875	762	2023-11-20 04:22:16.59-08	2023-11-20 04:25:29.429-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	2	baseline	normal	155	decrease	5	\N
2876	763	2023-11-20 04:17:02.501-08	2023-11-20 04:18:00.771-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2877	763	2023-11-20 04:18:07.296-08	2023-11-20 04:21:28.715-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
2878	763	2023-11-20 04:22:16.167-08	2023-11-20 04:26:22.042-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	2	baseline	normal	155	decrease	5	\N
2879	764	2023-11-20 04:17:02.521-08	2023-11-20 04:18:00.791-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2880	764	2023-11-20 04:18:07.316-08	2023-11-20 04:21:28.735-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
2881	764	2023-11-20 04:22:16.187-08	2023-11-20 04:27:13.798-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	2	baseline	normal	155	decrease	5	\N
2882	765	2023-11-20 04:21:28.735-08	2023-11-20 04:23:27.731-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2883	765	2023-11-20 04:23:27.986-08	2023-11-20 04:27:50.73-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2884	766	2023-11-20 04:22:16.177-08	2023-11-20 04:27:50.72-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2885	766	2023-11-20 04:27:50.97-08	2023-11-20 04:30:23.91-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
2886	767	2023-11-20 04:22:16.177-08	2023-11-20 04:27:50.72-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2887	767	2023-11-20 04:27:50.97-08	2023-11-20 04:32:33.99-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2888	768	2023-11-20 04:27:50.98-08	2023-11-20 04:33:05.402-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2889	769	2023-11-20 04:27:51-08	2023-11-20 04:33:05.422-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2890	769	2023-11-20 04:33:05.672-08	2023-11-20 04:35:35.112-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2891	770	2023-11-20 04:33:05.732-08	2023-11-20 04:35:35.422-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
2892	770	2023-11-20 04:36:11.361-08	2023-11-20 04:36:58.142-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2893	771	2023-11-20 04:33:05.836-08	2023-11-20 04:36:11.471-08	{"Risk": 3, "Baseline-ACCELERATION": 160, "BaselineVariability-DECREASE": 20}	3	baseline	acceleration	160	decrease	20	\N
2894	771	2023-11-20 04:36:11.471-08	2023-11-20 04:36:58.002-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2895	772	2023-11-20 04:33:05.886-08	2023-11-20 04:35:35.572-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
2896	772	2023-11-20 04:36:11.261-08	2023-11-20 04:36:58.042-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2897	773	2023-11-20 04:33:05.916-08	2023-11-20 04:36:11.301-08	{"Risk": 3, "Baseline-ACCELERATION": 160, "BaselineVariability-DECREASE": 20}	3	baseline	acceleration	160	decrease	20	\N
2898	773	2023-11-20 04:36:11.301-08	2023-11-20 04:36:58.082-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2899	773	2023-11-20 04:39:26.459-08	2023-11-20 04:40:08.735-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
2900	774	2023-11-20 04:33:05.692-08	2023-11-20 04:36:11.331-08	{"Risk": 3, "Baseline-ACCELERATION": 160, "BaselineVariability-DECREASE": 20}	3	baseline	acceleration	160	decrease	20	\N
2901	774	2023-11-20 04:36:11.331-08	2023-11-20 04:36:58.112-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2902	774	2023-11-20 04:39:26.489-08	2023-11-20 04:40:08.764-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
2903	774	2023-11-20 04:40:10.271-08	2023-11-20 04:40:47.867-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2904	775	2023-11-20 18:38:08.518-08	2023-11-20 18:39:15.896-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2905	775	2023-11-20 18:39:16.146-08	2023-11-20 18:42:08.014-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
2906	775	2023-11-20 18:42:55.804-08	2023-11-20 18:45:19.41-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	2	baseline	normal	155	decrease	5	\N
2907	776	2023-11-20 18:37:38.602-08	2023-11-20 18:38:37.186-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2908	776	2023-11-20 18:38:44.477-08	2023-11-20 18:42:07.774-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
2909	776	2023-11-20 18:42:56.064-08	2023-11-20 18:46:15.701-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	2	baseline	normal	155	decrease	5	\N
2910	777	2023-11-20 18:38:43.968-08	2023-11-20 18:42:08.024-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
2911	777	2023-11-20 18:42:55.814-08	2023-11-20 18:48:38.243-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2912	778	2023-11-20 18:42:55.784-08	2023-11-20 18:48:38.463-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2913	778	2023-11-20 18:48:38.713-08	2023-11-20 18:50:26.349-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
2914	779	2023-11-20 18:42:55.764-08	2023-11-20 18:48:38.443-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2915	779	2023-11-20 18:48:38.693-08	2023-11-20 18:52:28.272-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2916	781	2023-11-20 18:48:38.903-08	2023-11-20 18:53:56.919-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2917	782	2023-11-20 18:53:57.136-08	2023-11-20 18:56:27.978-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
2918	782	2023-11-20 18:57:04.415-08	2023-11-20 18:57:51.417-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2919	783	2023-11-20 18:53:57.236-08	2023-11-20 18:56:28.078-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
2921	784	2023-11-20 18:53:57.056-08	2023-11-20 18:56:09.359-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2922	784	2023-11-20 18:57:04.335-08	2023-11-20 18:57:51.337-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2923	785	2023-11-20 18:53:57.026-08	2023-11-20 18:56:28.128-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2924	785	2023-11-20 18:57:03.559-08	2023-11-20 18:57:51.317-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2925	785	2023-11-20 18:58:46.843-08	2023-11-20 18:59:43.891-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2926	785	2023-11-20 19:00:20.579-08	2023-11-20 19:01:05.552-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2927	785	2023-11-20 19:01:13.552-08	2023-11-20 19:02:09.797-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2928	786	2023-11-20 18:53:57.106-08	2023-11-20 18:56:09.409-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2929	786	2023-11-20 18:57:04.385-08	2023-11-20 18:57:51.387-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2930	786	2023-11-20 19:00:20.649-08	2023-11-20 19:00:43.513-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2931	786	2023-11-20 19:01:15.388-08	2023-11-20 19:01:42.216-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2932	787	2023-11-20 19:19:17.498-08	2023-11-20 19:20:24.189-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2933	787	2023-11-20 19:20:24.439-08	2023-11-20 19:23:15.099-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
2934	787	2023-11-20 19:24:02.659-08	2023-11-20 19:26:25.806-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	2	baseline	normal	155	decrease	5	\N
2935	788	2023-11-20 19:18:47.851-08	2023-11-20 19:19:46.238-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
2936	788	2023-11-20 19:19:52.78-08	2023-11-20 19:23:15.139-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
2937	788	2023-11-20 19:24:02.699-08	2023-11-20 19:28:09.767-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	2	baseline	normal	155	decrease	5	\N
2938	789	2023-11-20 19:19:52.956-08	2023-11-20 19:23:15.059-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
2939	789	2023-11-20 19:24:02.619-08	2023-11-20 19:29:38.755-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2940	790	2023-11-20 19:24:02.559-08	2023-11-20 19:29:38.945-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2941	790	2023-11-20 19:29:39.195-08	2023-11-20 19:31:25.598-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
2942	791	2023-11-20 19:24:02.649-08	2023-11-20 19:29:38.785-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2943	791	2023-11-20 19:29:39.035-08	2023-11-20 19:33:26.722-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2944	792	2023-11-20 19:24:02.947-08	2023-11-20 19:29:39.075-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2945	792	2023-11-20 19:29:39.331-08	2023-11-20 19:34:54.587-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2946	793	2023-11-20 19:29:39.175-08	2023-11-20 19:34:54.687-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2947	793	2023-11-20 19:34:54.937-08	2023-11-20 19:36:37.166-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2948	794	2023-11-20 19:34:54.917-08	2023-11-20 19:37:24.66-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
2949	794	2023-11-20 19:38:00.61-08	2023-11-20 19:38:47.173-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2950	795	2023-11-20 19:34:54.917-08	2023-11-20 19:37:23.903-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2951	795	2023-11-20 19:37:59.853-08	2023-11-20 19:38:47.173-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2952	796	2023-11-20 19:34:55.044-08	2023-11-20 19:37:24.78-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
2953	796	2023-11-20 19:38:00.73-08	2023-11-20 19:38:47.293-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2954	797	2023-11-20 19:34:54.927-08	2023-11-20 19:37:24.42-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 10}	2	baseline	normal	155	decrease	10	\N
2955	797	2023-11-20 19:37:59.863-08	2023-11-20 19:38:47.183-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2956	797	2023-11-20 19:39:42.297-08	2023-11-20 19:40:39.193-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2957	797	2023-11-20 19:41:15.443-08	2023-11-20 19:41:59.978-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2958	797	2023-11-20 19:42:07.728-08	2023-11-20 19:43:03.759-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2959	798	2023-11-20 19:34:54.965-08	2023-11-20 19:37:24.7-08	{"Risk": 2, "Baseline-NORMAL": 160, "BaselineVariability-DECREASE": 10}	2	baseline	normal	160	decrease	10	\N
2960	798	2023-11-20 19:37:59.893-08	2023-11-20 19:38:47.213-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2961	798	2023-11-20 19:39:42.327-08	2023-11-20 19:40:38.973-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2962	798	2023-11-20 19:41:15.473-08	2023-11-20 19:41:38.123-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
2963	798	2023-11-20 19:42:10.033-08	2023-11-20 19:43:03.789-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2964	798	2023-11-20 19:43:42.785-08	2023-11-20 19:44:13.867-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2965	799	2023-11-20 22:51:54.587-08	2023-11-20 22:53:08.947-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2966	799	2023-11-20 22:56:18.665-08	2023-11-20 22:56:53.589-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2967	800	2023-11-20 22:51:54.397-08	2023-11-20 22:53:09.007-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2968	800	2023-11-20 22:56:18.975-08	2023-11-20 22:56:53.399-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2969	800	2023-11-20 22:57:29.774-08	2023-11-20 22:58:09.679-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2970	801	2023-11-20 22:51:54.407-08	2023-11-20 22:53:09.017-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2971	801	2023-11-20 22:56:18.985-08	2023-11-20 22:56:51.889-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2972	801	2023-11-20 22:59:27.693-08	2023-11-20 23:00:02.555-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2973	802	2023-11-20 22:56:19.045-08	2023-11-20 22:56:53.469-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2974	802	2023-11-20 22:57:29.844-08	2023-11-20 22:58:09.753-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2975	802	2023-11-20 22:59:27.063-08	2023-11-20 23:01:04.669-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2976	802	2023-11-20 23:01:04.669-08	2023-11-20 23:01:40.565-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2977	803	2023-11-20 22:56:19.055-08	2023-11-20 22:56:53.479-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2979	803	2023-11-20 23:01:27.267-08	2023-11-20 23:02:24.111-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2980	804	2023-11-20 22:54:56.651-08	2023-11-20 22:55:39.869-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2981	804	2023-11-20 22:56:19.065-08	2023-11-20 22:56:54.48-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2982	804	2023-11-20 22:57:32.375-08	2023-11-20 22:58:09.743-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2983	804	2023-11-20 22:59:27.053-08	2023-11-20 23:01:04.659-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2984	804	2023-11-20 23:01:04.659-08	2023-11-20 23:01:39.046-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2985	805	2023-11-20 22:59:27.533-08	2023-11-20 23:00:02.131-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2986	805	2023-11-20 23:01:04.639-08	2023-11-20 23:01:39.026-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2987	805	2023-11-20 23:05:16.791-08	2023-11-20 23:06:27.664-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2988	806	2023-11-20 22:59:27.993-08	2023-11-20 23:00:02.635-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2989	806	2023-11-20 23:01:27.217-08	2023-11-20 23:02:24.06-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2990	806	2023-11-20 23:05:17.197-08	2023-11-20 23:06:25.804-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2991	806	2023-11-20 23:06:26.054-08	2023-11-20 23:08:58.478-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	2	baseline	normal	155	decrease	5	\N
2992	807	2023-11-20 23:48:27.838-08	2023-11-20 23:49:42.439-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2993	807	2023-11-20 23:52:52.555-08	2023-11-20 23:53:26.952-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2994	808	2023-11-20 23:48:27.868-08	2023-11-20 23:49:42.469-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2995	808	2023-11-20 23:52:52.335-08	2023-11-20 23:53:27.233-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2996	809	2023-11-20 23:48:28.008-08	2023-11-20 23:49:42.359-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2997	809	2023-11-20 23:52:52.225-08	2023-11-20 23:53:27.123-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2998	809	2023-11-20 23:55:59.94-08	2023-11-20 23:57:37.799-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
2999	810	2023-11-20 23:52:52.495-08	2023-11-20 23:53:25.626-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3000	810	2023-11-20 23:56:00.664-08	2023-11-20 23:56:35.52-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3001	810	2023-11-20 23:57:37.769-08	2023-11-20 23:58:17.682-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3002	811	2023-11-20 23:51:30.228-08	2023-11-20 23:52:19.207-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3003	811	2023-11-20 23:52:52.355-08	2023-11-20 23:53:27.253-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3004	811	2023-11-20 23:54:04.37-08	2023-11-20 23:55:22.919-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3005	811	2023-11-20 23:56:00.064-08	2023-11-20 23:57:37.669-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3006	811	2023-11-20 23:57:37.669-08	2023-11-20 23:58:14.328-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3007	812	2023-11-20 23:52:52.435-08	2023-11-20 23:53:27.083-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3008	812	2023-11-20 23:56:00.894-08	2023-11-20 23:56:35.53-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3009	812	2023-11-20 23:58:00.104-08	2023-11-20 23:58:56.694-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3010	813	2023-11-20 23:56:01.069-08	2023-11-20 23:56:35.7-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3011	813	2023-11-20 23:58:00.274-08	2023-11-20 23:58:56.869-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3012	813	2023-11-21 00:01:49.609-08	2023-11-21 00:02:58.422-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3013	814	2023-11-20 23:56:00.474-08	2023-11-20 23:56:35.076-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3014	814	2023-11-20 23:57:37.829-08	2023-11-20 23:58:11.477-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3015	814	2023-11-21 00:01:49.349-08	2023-11-21 00:03:00.171-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3016	814	2023-11-21 00:03:00.421-08	2023-11-21 00:06:02.463-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	2	baseline	normal	155	decrease	5	\N
3017	815	2023-11-21 00:14:32.91-08	2023-11-21 00:15:47.259-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3018	816	2023-11-21 00:14:32.95-08	2023-11-21 00:15:47.299-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3019	816	2023-11-21 00:18:57.44-08	2023-11-21 00:19:30.563-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3020	816	2023-11-21 00:22:05.862-08	2023-11-21 00:22:40.721-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3021	817	2023-11-21 00:14:32.72-08	2023-11-21 00:15:47.319-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3022	817	2023-11-21 00:18:57.46-08	2023-11-21 00:19:30.583-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3023	817	2023-11-21 00:22:05.882-08	2023-11-21 00:22:40.741-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3024	817	2023-11-21 00:23:42.765-08	2023-11-21 00:24:22.924-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3025	818	2023-11-21 00:18:57.52-08	2023-11-21 00:19:32.158-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3026	818	2023-11-21 00:20:08.026-08	2023-11-21 00:20:47.678-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3027	818	2023-11-21 00:22:05.252-08	2023-11-21 00:23:42.885-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3028	818	2023-11-21 00:23:42.885-08	2023-11-21 00:24:18.79-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3029	819	2023-11-21 00:17:35.251-08	2023-11-21 00:18:24.727-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3030	819	2023-11-21 00:18:57.6-08	2023-11-21 00:19:32.238-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3031	819	2023-11-21 00:22:06.052-08	2023-11-21 00:22:40.701-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3032	819	2023-11-21 00:24:05.308-08	2023-11-21 00:25:01.892-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3033	820	2023-11-21 00:18:57.2-08	2023-11-21 00:19:32.337-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3034	820	2023-11-21 00:22:05.152-08	2023-11-21 00:23:42.785-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3035	820	2023-11-21 00:23:42.785-08	2023-11-21 00:25:01.742-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3036	820	2023-11-21 00:27:54.491-08	2023-11-21 00:29:05.541-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3037	821	2023-11-21 00:22:05.492-08	2023-11-21 00:22:40.097-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3038	821	2023-11-21 00:23:42.875-08	2023-11-21 00:24:16.769-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3039	821	2023-11-21 00:27:54.401-08	2023-11-21 00:29:05.452-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3040	822	2023-11-21 00:22:05.292-08	2023-11-21 00:23:42.925-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3041	822	2023-11-21 00:23:42.925-08	2023-11-21 00:24:17.319-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3042	822	2023-11-21 00:27:54.701-08	2023-11-21 00:29:03.493-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3043	822	2023-11-21 00:29:03.743-08	2023-11-21 00:31:36.408-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 5}	2	baseline	normal	155	decrease	5	\N
3044	823	2023-11-21 02:10:14.778-08	2023-11-21 02:11:27.545-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3045	823	2023-11-21 02:11:27.795-08	2023-11-21 02:13:28.999-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3046	823	2023-11-21 02:13:29.249-08	2023-11-21 02:18:14.319-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 10}	2	baseline	normal	130	decrease	10	\N
3047	824	2023-11-21 02:10:14.898-08	2023-11-21 02:11:28.169-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3048	824	2023-11-21 02:11:28.419-08	2023-11-21 02:13:29.119-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3049	824	2023-11-21 02:13:29.369-08	2023-11-21 02:18:50.076-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
3050	824	2023-11-21 02:18:50.076-08	2023-11-21 02:19:19.686-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3051	825	2023-11-21 02:11:27.695-08	2023-11-21 02:13:28.899-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3052	825	2023-11-21 02:13:29.149-08	2023-11-21 02:18:49.856-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
3053	825	2023-11-21 02:18:49.856-08	2023-11-21 02:19:19.716-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3054	825	2023-11-21 02:19:24.988-08	2023-11-21 02:21:41.014-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
3055	826	2023-11-21 02:13:29.149-08	2023-11-21 02:18:49.856-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
3056	826	2023-11-21 02:18:49.856-08	2023-11-21 02:19:19.716-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3057	826	2023-11-21 02:19:24.988-08	2023-11-21 02:21:41.014-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
3058	827	2023-11-21 02:18:50.106-08	2023-11-21 02:19:19.716-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3059	827	2023-11-21 02:19:25.238-08	2023-11-21 02:21:41.014-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
3060	827	2023-11-21 02:22:20.164-08	2023-11-21 02:25:09.59-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
3061	828	2023-11-21 02:18:50.106-08	2023-11-21 02:19:19.716-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3062	828	2023-11-21 02:19:25.238-08	2023-11-21 02:21:41.014-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
3063	828	2023-11-21 02:22:20.164-08	2023-11-21 02:26:01.04-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3064	829	2023-11-21 02:18:50.106-08	2023-11-21 02:19:19.716-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3065	829	2023-11-21 02:19:25.238-08	2023-11-21 02:21:41.014-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
3066	829	2023-11-21 02:22:20.164-08	2023-11-21 02:26:01.04-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3067	830	2023-11-21 02:19:24.988-08	2023-11-21 02:21:41.014-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
3068	830	2023-11-21 02:21:41.014-08	2023-11-21 02:22:35.223-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3069	830	2023-11-21 02:22:35.477-08	2023-11-21 02:26:31.654-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3070	830	2023-11-21 02:26:31.654-08	2023-11-21 02:27:34.641-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3071	830	2023-11-21 02:27:57.981-08	2023-11-21 02:28:54.448-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3072	831	2023-11-21 02:23:18.142-08	2023-11-21 02:26:31.654-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3073	831	2023-11-21 02:26:31.654-08	2023-11-21 02:27:34.641-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3074	831	2023-11-21 02:27:57.981-08	2023-11-21 02:28:54.448-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3075	831	2023-11-21 02:29:24.329-08	2023-11-21 02:30:07.746-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3076	832	2023-11-21 02:26:30.9-08	2023-11-21 02:27:34.891-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3077	832	2023-11-21 02:27:57.981-08	2023-11-21 02:28:54.448-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3078	832	2023-11-21 02:29:24.079-08	2023-11-21 02:30:07.999-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3079	832	2023-11-21 02:32:13.23-08	2023-11-21 02:32:51.121-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3080	833	2023-11-21 02:26:31.654-08	2023-11-21 02:27:34.891-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3081	833	2023-11-21 02:27:57.981-08	2023-11-21 02:28:54.448-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3082	833	2023-11-21 02:29:24.329-08	2023-11-21 02:30:07.746-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3083	833	2023-11-21 02:32:13.23-08	2023-11-21 02:32:51.121-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3084	833	2023-11-21 02:33:53.36-08	2023-11-21 02:34:50.833-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3085	834	2023-11-21 04:42:56.871-08	2023-11-21 04:44:04.884-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3086	834	2023-11-21 04:45:07.945-08	2023-11-21 04:46:43.854-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3087	834	2023-11-21 04:50:05.402-08	2023-11-21 04:51:29.669-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3088	835	2023-11-21 04:45:07.995-08	2023-11-21 04:46:43.654-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3089	835	2023-11-21 04:50:05.422-08	2023-11-21 04:51:19.202-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3090	835	2023-11-21 04:51:19.202-08	2023-11-21 04:52:13.151-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3091	835	2023-11-21 04:52:13.401-08	2023-11-21 04:53:27.475-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	2	baseline	normal	150	decrease	15	\N
3092	836	2023-11-21 04:51:25.622-08	2023-11-21 04:53:27.395-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	2	baseline	normal	150	decrease	15	\N
3093	837	2023-11-21 04:51:25.501-08	2023-11-21 04:53:27.274-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	2	baseline	normal	150	decrease	15	\N
3094	838	2023-11-21 04:50:05.362-08	2023-11-21 04:51:28.896-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3095	838	2023-11-21 04:51:29.146-08	2023-11-21 04:53:27.405-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	2	baseline	normal	150	decrease	15	\N
3096	838	2023-11-21 04:57:14.144-08	2023-11-21 04:59:18.417-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3097	839	2023-11-21 04:51:28.926-08	2023-11-21 04:53:27.435-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	2	baseline	normal	150	decrease	15	\N
3098	839	2023-11-21 04:57:14.174-08	2023-11-21 04:59:18.447-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3099	840	2023-11-21 04:51:27.861-08	2023-11-21 04:53:27.375-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 15}	2	baseline	normal	150	decrease	15	\N
3100	840	2023-11-21 04:57:14.114-08	2023-11-21 04:59:18.387-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3101	840	2023-11-21 04:59:37.979-08	2023-11-21 04:59:53.044-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3102	841	2023-11-21 04:57:14.564-08	2023-11-21 04:59:18.587-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3103	841	2023-11-21 04:59:36.418-08	2023-11-21 05:00:36.769-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3104	842	2023-11-21 04:57:14.334-08	2023-11-21 04:59:18.357-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3105	842	2023-11-21 04:59:36.438-08	2023-11-21 05:00:36.789-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3154	858	2023-11-21 05:27:11.459-08	2023-11-21 05:28:24.308-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3106	842	2023-11-21 05:01:59.789-08	2023-11-21 05:05:06.05-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3107	843	2023-11-21 04:57:14.424-08	2023-11-21 04:59:18.447-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3108	843	2023-11-21 05:01:59.629-08	2023-11-21 05:05:25.968-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 15}	2	baseline	normal	145	decrease	15	\N
3109	844	2023-11-21 04:59:37.899-08	2023-11-21 04:59:52.982-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3110	844	2023-11-21 05:01:43.232-08	2023-11-21 05:02:48.951-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3111	844	2023-11-21 05:03:14.82-08	2023-11-21 05:05:26.108-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3112	844	2023-11-21 05:07:49.962-08	2023-11-21 05:08:22.3-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3113	844	2023-11-21 05:08:12.3-08	2023-11-21 05:08:41.126-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3114	845	2023-11-21 05:03:14.84-08	2023-11-21 05:05:25.878-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3115	845	2023-11-21 05:07:49.732-08	2023-11-21 05:08:12.316-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3116	845	2023-11-21 05:09:13.533-08	2023-11-21 05:11:11.806-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
3117	846	2023-11-21 05:03:14.931-08	2023-11-21 05:05:25.968-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3118	846	2023-11-21 05:07:49.602-08	2023-11-21 05:08:14.968-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3119	846	2023-11-21 05:09:13.903-08	2023-11-21 05:12:10.428-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3120	847	2023-11-21 05:07:49.572-08	2023-11-21 05:08:20.684-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3121	847	2023-11-21 05:09:13.343-08	2023-11-21 05:12:10.618-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3122	847	2023-11-21 05:12:10.872-08	2023-11-21 05:13:33.986-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
3123	848	2023-11-21 05:07:49.652-08	2023-11-21 05:08:13.225-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3124	848	2023-11-21 05:09:13.423-08	2023-11-21 05:12:11.202-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3125	848	2023-11-21 05:12:11.452-08	2023-11-21 05:15:40.38-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3126	849	2023-11-21 05:07:49.902-08	2023-11-21 05:08:22.24-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3127	849	2023-11-21 05:09:14.428-08	2023-11-21 05:12:11.202-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3128	849	2023-11-21 05:12:11.452-08	2023-11-21 05:15:40.38-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3129	850	2023-11-21 05:09:13.503-08	2023-11-21 05:12:10.528-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3130	850	2023-11-21 05:12:10.782-08	2023-11-21 05:15:41.466-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3131	850	2023-11-21 05:16:00.546-08	2023-11-21 05:18:39.245-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
3132	851	2023-11-21 05:12:10.658-08	2023-11-21 05:15:41.346-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3133	851	2023-11-21 05:16:00.426-08	2023-11-21 05:18:39.375-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
3134	851	2023-11-21 05:19:15.538-08	2023-11-21 05:19:51.22-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3135	852	2023-11-21 05:15:24.542-08	2023-11-21 05:18:39.145-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3136	852	2023-11-21 05:19:15.558-08	2023-11-21 05:19:51.24-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3137	852	2023-11-21 05:19:51.49-08	2023-11-21 05:22:14.667-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3138	853	2023-11-21 05:15:59.261-08	2023-11-21 05:18:39.215-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
3139	853	2023-11-21 05:19:15.628-08	2023-11-21 05:19:51.057-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3140	853	2023-11-21 05:19:51.31-08	2023-11-21 05:22:57.682-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3141	854	2023-11-21 05:19:15.648-08	2023-11-21 05:19:51.08-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3142	854	2023-11-21 05:19:51.33-08	2023-11-21 05:22:57.702-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3143	855	2023-11-21 05:19:15.408-08	2023-11-21 05:19:47.069-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3144	855	2023-11-21 05:19:47.319-08	2023-11-21 05:22:58.464-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3145	855	2023-11-21 05:24:00.725-08	2023-11-21 05:26:08.778-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
3146	856	2023-11-21 05:19:15.438-08	2023-11-21 05:19:45.838-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3147	856	2023-11-21 05:19:46.093-08	2023-11-21 05:22:58.494-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3148	856	2023-11-21 05:24:00.755-08	2023-11-21 05:26:08.808-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
3149	857	2023-11-21 05:19:15.468-08	2023-11-21 05:19:51.149-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3150	857	2023-11-21 05:19:51.399-08	2023-11-21 05:22:57.522-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3151	857	2023-11-21 05:24:00.785-08	2023-11-21 05:26:08.588-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 20}	2	baseline	normal	140	decrease	20	\N
3152	857	2023-11-21 05:27:11.619-08	2023-11-21 05:28:24.468-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3153	858	2023-11-21 05:24:00.875-08	2023-11-21 05:26:08.678-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
3155	858	2023-11-21 05:29:11.255-08	2023-11-21 05:30:34.612-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
3156	859	2023-11-21 05:24:00.695-08	2023-11-21 05:26:08.748-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
3157	859	2023-11-21 05:27:11.529-08	2023-11-21 05:28:24.378-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3158	859	2023-11-21 05:29:09.566-08	2023-11-21 05:32:17.131-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
3159	860	2023-11-21 05:24:00.755-08	2023-11-21 05:26:08.808-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
3160	860	2023-11-21 05:27:11.339-08	2023-11-21 05:28:24.188-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3161	860	2023-11-21 05:29:09.626-08	2023-11-21 05:33:11.683-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
3162	860	2023-11-21 05:33:11.683-08	2023-11-21 05:34:05.171-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3163	861	2023-11-21 05:27:11.339-08	2023-11-21 05:28:24.188-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3164	861	2023-11-21 05:29:09.626-08	2023-11-21 05:33:11.683-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
3165	861	2023-11-21 05:33:11.683-08	2023-11-21 05:34:05.171-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3166	862	2023-11-21 05:27:11.599-08	2023-11-21 05:28:24.448-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3167	862	2023-11-21 05:29:11.395-08	2023-11-21 05:33:11.693-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
3168	862	2023-11-21 05:33:11.693-08	2023-11-21 05:34:05.181-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3169	862	2023-11-21 05:35:14.24-08	2023-11-21 05:36:10.598-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3170	863	2023-11-21 05:29:11.415-08	2023-11-21 05:33:11.713-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
3171	863	2023-11-21 05:33:11.713-08	2023-11-21 05:34:05.201-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3172	863	2023-11-21 05:35:14.26-08	2023-11-21 05:36:10.618-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3173	864	2023-11-21 05:29:09.676-08	2023-11-21 05:33:11.733-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
3174	864	2023-11-21 05:33:11.733-08	2023-11-21 05:34:05.229-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3175	864	2023-11-21 05:35:15.043-08	2023-11-21 05:35:53.858-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3176	864	2023-11-21 05:36:22.708-08	2023-11-21 05:37:51.617-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
3177	865	2023-11-21 05:33:11.783-08	2023-11-21 05:34:05.279-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3178	865	2023-11-21 05:35:15.093-08	2023-11-21 05:35:53.908-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3179	865	2023-11-21 05:36:22.508-08	2023-11-21 05:37:51.667-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
3180	866	2023-11-21 05:33:11.823-08	2023-11-21 05:34:04.56-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3181	866	2023-11-21 05:35:16.378-08	2023-11-21 05:35:51.443-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3182	866	2023-11-21 05:36:22.308-08	2023-11-21 05:38:31.66-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
3183	866	2023-11-21 05:40:51.286-08	2023-11-21 05:42:43.05-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3184	867	2023-11-21 05:34:46.557-08	2023-11-21 05:35:33.455-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
3185	867	2023-11-21 05:36:22.368-08	2023-11-21 05:38:31.72-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
3186	867	2023-11-21 05:40:51.351-08	2023-11-21 05:42:43.11-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3187	867	2023-11-21 05:43:43.891-08	2023-11-21 05:44:00.211-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3188	868	2023-11-21 05:36:22.688-08	2023-11-21 05:37:51.597-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
3189	868	2023-11-21 05:40:44.892-08	2023-11-21 05:42:43.18-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3190	868	2023-11-21 05:43:43.461-08	2023-11-21 05:44:00.281-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3191	868	2023-11-21 05:44:04.804-08	2023-11-21 05:45:59.826-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 15}	2	baseline	normal	155	decrease	15	\N
3192	868	2023-11-21 05:45:59.826-08	2023-11-21 05:46:40.756-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3193	869	2023-11-21 05:40:44.872-08	2023-11-21 05:42:43.16-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3194	869	2023-11-21 05:43:43.441-08	2023-11-21 05:44:00.261-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3195	869	2023-11-21 05:44:04.784-08	2023-11-21 05:45:59.806-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 15}	2	baseline	normal	155	decrease	15	\N
3196	869	2023-11-21 05:45:59.806-08	2023-11-21 05:46:40.736-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3197	869	2023-11-21 05:46:50.284-08	2023-11-21 05:47:26.22-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3198	869	2023-11-21 05:48:15.156-08	2023-11-21 05:48:50.807-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3199	870	2023-11-21 05:40:44.972-08	2023-11-21 05:42:43.26-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3200	870	2023-11-21 05:43:43.291-08	2023-11-21 05:44:00.111-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3201	870	2023-11-21 05:44:04.884-08	2023-11-21 05:45:59.906-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 15}	2	baseline	normal	155	decrease	15	\N
3202	870	2023-11-21 05:45:59.906-08	2023-11-21 05:46:40.836-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3203	870	2023-11-21 05:48:15.006-08	2023-11-21 05:48:50.658-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3204	871	2023-11-21 05:43:43.82-08	2023-11-21 05:44:00.141-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3205	871	2023-11-21 05:44:04.664-08	2023-11-21 05:45:59.936-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 20}	2	baseline	normal	155	decrease	20	\N
3206	871	2023-11-21 05:45:59.936-08	2023-11-21 05:46:40.866-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3207	871	2023-11-21 05:48:15.036-08	2023-11-21 05:48:50.688-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3208	872	2023-11-21 05:44:04.694-08	2023-11-21 05:45:59.966-08	{"Risk": 2, "Baseline-NORMAL": 155, "BaselineVariability-DECREASE": 20}	2	baseline	normal	155	decrease	20	\N
3209	872	2023-11-21 05:45:59.966-08	2023-11-21 05:46:40.896-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3210	872	2023-11-21 05:48:15.076-08	2023-11-21 05:48:50.728-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3211	873	2023-11-21 05:45:59.846-08	2023-11-21 05:46:41.026-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3212	873	2023-11-21 05:48:15.206-08	2023-11-21 05:48:50.858-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3213	873	2023-11-21 05:53:03.94-08	2023-11-21 05:53:25.033-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3214	874	2023-11-21 05:48:15.206-08	2023-11-21 05:48:50.608-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3215	874	2023-11-21 05:51:46.884-08	2023-11-21 05:53:17.494-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3216	874	2023-11-21 05:54:55.178-08	2023-11-21 05:55:19.21-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3217	874	2023-11-21 05:55:19.21-08	2023-11-21 05:56:07.249-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3218	875	2023-11-21 05:48:15.056-08	2023-11-21 05:48:50.708-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3219	875	2023-11-21 05:50:53.78-08	2023-11-21 05:51:19.111-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3220	875	2023-11-21 05:51:43.218-08	2023-11-21 05:53:17.594-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3221	875	2023-11-21 05:55:44.558-08	2023-11-21 05:56:28.19-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3222	876	2023-11-21 05:48:15.106-08	2023-11-21 05:48:50.758-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3223	876	2023-11-21 05:51:46.779-08	2023-11-21 05:53:17.394-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3224	876	2023-11-21 05:54:55.078-08	2023-11-21 05:55:19.11-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3225	876	2023-11-21 05:55:19.11-08	2023-11-21 05:56:07.149-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3226	876	2023-11-21 05:56:07.399-08	2023-11-21 05:58:05.153-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
3227	877	2023-11-21 05:51:41.308-08	2023-11-21 05:53:17.454-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3228	877	2023-11-21 05:54:23.737-08	2023-11-21 05:55:08.357-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
3229	877	2023-11-21 05:55:42.659-08	2023-11-21 05:56:28.3-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3230	877	2023-11-21 05:56:30.813-08	2023-11-21 05:58:30.073-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3231	878	2023-11-21 05:51:45.176-08	2023-11-21 05:53:17.544-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3232	878	2023-11-21 05:54:56.718-08	2023-11-21 05:55:42.296-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3233	878	2023-11-21 05:55:48.573-08	2023-11-21 05:56:28.432-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3234	878	2023-11-21 05:56:30.943-08	2023-11-21 05:58:30.203-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3235	879	2023-11-21 05:51:42.978-08	2023-11-21 05:53:17.594-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3236	879	2023-11-21 05:54:53.767-08	2023-11-21 05:55:39.55-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3237	879	2023-11-21 05:55:47.577-08	2023-11-21 05:56:28.2-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3238	879	2023-11-21 05:56:33.975-08	2023-11-21 05:58:30.223-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3239	879	2023-11-21 06:00:20.167-08	2023-11-21 06:01:12.162-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3240	880	2023-11-21 05:54:23.448-08	2023-11-21 05:55:07.114-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
3241	880	2023-11-21 05:55:08.364-08	2023-11-21 05:55:30.899-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
3242	880	2023-11-21 05:55:45.463-08	2023-11-21 05:56:28.34-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3243	880	2023-11-21 05:56:33.866-08	2023-11-21 05:58:30.363-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3244	880	2023-11-21 06:00:03.267-08	2023-11-21 06:00:56.269-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3245	880	2023-11-21 06:01:12.846-08	2023-11-21 06:02:15.52-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3246	881	2023-11-21 05:54:53.697-08	2023-11-21 05:55:39.48-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3247	881	2023-11-21 05:55:47.507-08	2023-11-21 05:56:28.13-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3248	881	2023-11-21 05:56:33.906-08	2023-11-21 05:58:30.403-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3249	881	2023-11-21 06:00:20.347-08	2023-11-21 06:01:12.093-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3250	881	2023-11-21 06:01:12.093-08	2023-11-21 06:02:15.005-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3251	882	2023-11-21 05:55:47.647-08	2023-11-21 05:56:28.27-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3252	882	2023-11-21 05:56:30.783-08	2023-11-21 05:58:30.043-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3253	882	2023-11-21 06:00:22.753-08	2023-11-21 06:01:11.983-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3254	882	2023-11-21 06:01:11.983-08	2023-11-21 06:02:14.895-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3255	882	2023-11-21 06:03:55.541-08	2023-11-21 06:05:29.728-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 15}	2	baseline	normal	145	decrease	15	\N
3256	883	2023-11-21 05:56:30.773-08	2023-11-21 05:58:30.033-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3257	883	2023-11-21 06:00:09.467-08	2023-11-21 06:00:56.409-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3258	883	2023-11-21 06:01:17.494-08	2023-11-21 06:02:15.15-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3259	883	2023-11-21 06:03:55.541-08	2023-11-21 06:07:12.44-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
3260	884	2023-11-21 06:00:02.587-08	2023-11-21 06:00:56.299-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3261	884	2023-11-21 06:01:11.873-08	2023-11-21 06:02:15.075-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3262	884	2023-11-21 06:03:55.471-08	2023-11-21 06:07:12.37-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
3263	885	2023-11-21 06:00:20.146-08	2023-11-21 06:01:12.143-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3264	885	2023-11-21 06:01:12.143-08	2023-11-21 06:02:15.055-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3265	885	2023-11-21 06:03:55.191-08	2023-11-21 06:07:12.59-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
3266	885	2023-11-21 06:07:59.058-08	2023-11-21 06:10:59.85-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3267	886	2023-11-21 06:03:55.301-08	2023-11-21 06:07:12.705-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
3268	886	2023-11-21 06:07:58.918-08	2023-11-21 06:12:39.907-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
3269	887	2023-11-21 06:07:59.178-08	2023-11-21 06:12:39.667-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
3270	887	2023-11-21 06:13:45.447-08	2023-11-21 06:14:38.948-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3271	888	2023-11-21 06:09:47.962-08	2023-11-21 06:12:39.737-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 5}	2	baseline	normal	130	decrease	5	\N
3272	888	2023-11-21 06:13:45.517-08	2023-11-21 06:14:39.018-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3273	888	2023-11-21 06:14:48.566-08	2023-11-21 06:17:17.724-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
3274	889	2023-11-21 06:07:59.018-08	2023-11-21 06:12:39.757-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
3275	889	2023-11-21 06:13:45.537-08	2023-11-21 06:14:39.295-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3276	889	2023-11-21 06:14:48.836-08	2023-11-21 06:16:43.1-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
3277	889	2023-11-21 06:17:08.962-08	2023-11-21 06:17:27.507-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
3278	890	2023-11-21 06:13:45.607-08	2023-11-21 06:14:39.365-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3279	890	2023-11-21 06:14:48.906-08	2023-11-21 06:16:43.17-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
3280	890	2023-11-21 06:17:09.032-08	2023-11-21 06:17:27.577-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
3281	891	2023-11-21 06:13:45.657-08	2023-11-21 06:14:38.908-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3282	891	2023-11-21 06:14:48.705-08	2023-11-21 06:17:18.106-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
3283	892	2023-11-21 06:13:45.467-08	2023-11-21 06:14:38.968-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3284	892	2023-11-21 06:14:48.766-08	2023-11-21 06:16:43.53-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
3285	892	2023-11-21 06:17:09.142-08	2023-11-21 06:17:27.433-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
3286	893	2023-11-21 06:13:45.537-08	2023-11-21 06:14:39.038-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3287	893	2023-11-21 06:14:48.586-08	2023-11-21 06:17:18.236-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
3288	894	2023-11-21 06:14:48.896-08	2023-11-21 06:16:43.16-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 20}	1	baseline	normal	145	normal	20	\N
3289	895	2023-11-21 06:17:08.848-08	2023-11-21 06:17:26.897-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
3290	896	2023-11-21 06:25:49.588-08	2023-11-21 06:26:39.288-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3291	896	2023-11-21 06:26:39.288-08	2023-11-21 06:27:06.674-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3292	897	2023-11-21 06:25:49.338-08	2023-11-21 06:26:39.278-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3293	897	2023-11-21 06:26:39.278-08	2023-11-21 06:27:13.174-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3294	897	2023-11-21 06:27:13.174-08	2023-11-21 06:27:38.027-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3295	898	2023-11-21 06:26:05.549-08	2023-11-21 06:26:39.188-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3296	898	2023-11-21 06:26:39.188-08	2023-11-21 06:27:04.566-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3297	898	2023-11-21 06:27:11.324-08	2023-11-21 06:29:57.038-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3298	899	2023-11-21 06:26:05.629-08	2023-11-21 06:26:39.268-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3299	899	2023-11-21 06:26:39.268-08	2023-11-21 06:27:04.646-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3300	899	2023-11-21 06:27:11.154-08	2023-11-21 06:29:57.118-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3301	899	2023-11-21 06:30:25.243-08	2023-11-21 06:32:40.374-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3302	900	2023-11-21 06:25:28.565-08	2023-11-21 06:26:02.949-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
3303	900	2023-11-21 06:26:06.449-08	2023-11-21 06:26:39.358-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3304	900	2023-11-21 06:26:39.358-08	2023-11-21 06:27:27.043-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3305	900	2023-11-21 06:27:27.299-08	2023-11-21 06:29:56.988-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3306	900	2023-11-21 06:30:25.363-08	2023-11-21 06:32:40.244-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3307	901	2023-11-21 06:25:28.605-08	2023-11-21 06:26:02.989-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
3308	901	2023-11-21 06:26:06.489-08	2023-11-21 06:26:39.398-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3309	901	2023-11-21 06:26:39.398-08	2023-11-21 06:27:26.833-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3310	901	2023-11-21 06:27:27.083-08	2023-11-21 06:29:57.028-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3311	901	2023-11-21 06:30:25.403-08	2023-11-21 06:32:40.284-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3312	902	2023-11-21 06:27:38.271-08	2023-11-21 06:29:57.158-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3313	902	2023-11-21 06:30:25.283-08	2023-11-21 06:32:40.164-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 5}	2	baseline	normal	140	decrease	5	\N
3314	911	2023-11-21 06:50:00.903-08	2023-11-21 06:50:38.074-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3315	912	2023-11-21 06:50:00.903-08	2023-11-21 06:50:38.074-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3316	913	2023-11-21 06:50:00.903-08	2023-11-21 06:50:38.074-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3317	913	2023-11-21 06:51:45.106-08	2023-11-21 06:53:56.672-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3318	913	2023-11-21 06:53:56.672-08	2023-11-21 06:54:46.143-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3319	914	2023-11-21 06:50:00.903-08	2023-11-21 06:50:38.074-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3320	914	2023-11-21 06:51:45.106-08	2023-11-21 06:53:56.672-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3321	914	2023-11-21 06:53:56.672-08	2023-11-21 06:54:46.143-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3322	915	2023-11-21 06:50:00.903-08	2023-11-21 06:50:38.074-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3323	915	2023-11-21 06:51:45.106-08	2023-11-21 06:53:56.672-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3324	915	2023-11-21 06:53:56.672-08	2023-11-21 06:54:46.143-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3325	915	2023-11-21 06:56:56.727-08	2023-11-21 06:58:08.304-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3326	916	2023-11-21 06:50:00.903-08	2023-11-21 06:50:38.074-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3374	929	2023-11-21 07:09:06.174-08	2023-11-21 07:09:31.788-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3327	916	2023-11-21 06:51:45.106-08	2023-11-21 06:53:56.672-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3328	916	2023-11-21 06:53:56.672-08	2023-11-21 06:54:46.143-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3329	916	2023-11-21 06:56:56.727-08	2023-11-21 06:58:08.304-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3330	916	2023-11-21 06:58:08.557-08	2023-11-21 07:00:04.074-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
3331	917	2023-11-21 06:51:44.876-08	2023-11-21 06:53:56.942-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3332	917	2023-11-21 06:53:56.942-08	2023-11-21 06:54:45.912-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3333	917	2023-11-21 06:56:56.747-08	2023-11-21 06:58:08.577-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3334	917	2023-11-21 06:58:08.827-08	2023-11-21 07:00:04.093-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3335	917	2023-11-21 07:00:10.626-08	2023-11-21 07:01:48.334-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
3336	918	2023-11-21 06:53:56.752-08	2023-11-21 06:54:45.973-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3337	918	2023-11-21 06:56:56.807-08	2023-11-21 06:58:08.387-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3338	918	2023-11-21 06:58:08.637-08	2023-11-21 07:00:03.902-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
3339	918	2023-11-21 07:00:08.424-08	2023-11-21 07:02:29.329-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
3340	919	2023-11-21 06:53:56.782-08	2023-11-21 06:54:46.003-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3341	919	2023-11-21 06:56:56.837-08	2023-11-21 06:58:08.417-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3342	919	2023-11-21 06:58:08.667-08	2023-11-21 07:00:03.932-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
3343	919	2023-11-21 07:00:08.454-08	2023-11-21 07:02:29.359-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
3344	920	2023-11-21 06:56:56.877-08	2023-11-21 06:58:08.457-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3345	920	2023-11-21 06:58:08.707-08	2023-11-21 07:00:03.972-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3346	920	2023-11-21 07:00:10.757-08	2023-11-21 07:02:29.149-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
3347	920	2023-11-21 07:02:29.399-08	2023-11-21 07:05:25.872-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
3348	921	2023-11-21 06:56:56.887-08	2023-11-21 06:58:08.467-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3349	921	2023-11-21 06:58:08.717-08	2023-11-21 07:00:03.982-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
3350	921	2023-11-21 07:00:08.254-08	2023-11-21 07:02:29.159-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
3351	921	2023-11-21 07:02:29.409-08	2023-11-21 07:05:26.384-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
3352	922	2023-11-21 07:00:08.294-08	2023-11-21 07:02:29.199-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 5}	2	baseline	normal	135	decrease	5	\N
3353	922	2023-11-21 07:02:29.449-08	2023-11-21 07:05:26.424-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
3354	922	2023-11-21 07:05:46.753-08	2023-11-21 07:08:55.008-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3355	923	2023-11-21 07:02:29.539-08	2023-11-21 07:05:26.264-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
3356	923	2023-11-21 07:05:46.843-08	2023-11-21 07:08:54.845-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3357	923	2023-11-21 07:09:06.144-08	2023-11-21 07:09:31.502-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3358	924	2023-11-21 07:02:29.319-08	2023-11-21 07:05:26.042-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 10}	2	baseline	normal	140	decrease	10	\N
3359	924	2023-11-21 07:05:47.123-08	2023-11-21 07:08:54.625-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3360	924	2023-11-21 07:09:06.174-08	2023-11-21 07:09:31.788-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3361	924	2023-11-21 07:09:38.072-08	2023-11-21 07:12:12.019-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3362	925	2023-11-21 07:04:04.754-08	2023-11-21 07:04:58.223-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3363	925	2023-11-21 07:05:47.167-08	2023-11-21 07:08:54.665-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3364	925	2023-11-21 07:09:06.214-08	2023-11-21 07:09:31.828-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3365	925	2023-11-21 07:09:38.112-08	2023-11-21 07:13:16.599-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3366	926	2023-11-21 07:05:46.743-08	2023-11-21 07:08:54.998-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3367	926	2023-11-21 07:09:06.294-08	2023-11-21 07:09:31.402-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3368	926	2023-11-21 07:09:38.192-08	2023-11-21 07:15:03.447-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3369	927	2023-11-21 07:05:46.873-08	2023-11-21 07:08:54.875-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3370	927	2023-11-21 07:09:06.174-08	2023-11-21 07:09:31.532-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3371	927	2023-11-21 07:09:38.072-08	2023-11-21 07:15:03.327-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3372	928	2023-11-21 07:09:06.174-08	2023-11-21 07:09:31.532-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3373	928	2023-11-21 07:09:38.072-08	2023-11-21 07:15:03.327-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3375	929	2023-11-21 07:09:38.072-08	2023-11-21 07:15:03.327-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3376	929	2023-11-21 07:15:55.533-08	2023-11-21 07:17:25.211-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3377	930	2023-11-21 07:09:38.072-08	2023-11-21 07:15:03.327-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 10}	2	baseline	normal	135	decrease	10	\N
3378	930	2023-11-21 07:15:55.533-08	2023-11-21 07:17:25.211-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3379	930	2023-11-21 07:17:25.211-08	2023-11-21 07:18:47.829-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3380	931	2023-11-21 07:15:55.533-08	2023-11-21 07:17:25.211-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3381	931	2023-11-21 07:17:25.211-08	2023-11-21 07:18:47.829-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3382	932	2023-11-21 07:15:55.293-08	2023-11-21 07:17:25.221-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3383	932	2023-11-21 07:17:25.221-08	2023-11-21 07:18:47.589-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3384	933	2023-11-21 07:15:55.363-08	2023-11-21 07:17:25.041-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3385	933	2023-11-21 07:17:25.041-08	2023-11-21 07:18:47.659-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3386	933	2023-11-21 07:21:52.968-08	2023-11-21 07:24:45.282-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
3387	934	2023-11-21 07:17:25.291-08	2023-11-21 07:18:47.909-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3388	934	2023-11-21 07:21:52.718-08	2023-11-21 07:24:45.532-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
3389	935	2023-11-21 07:21:52.708-08	2023-11-21 07:24:45.522-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
3390	936	2023-11-21 07:21:52.828-08	2023-11-21 07:24:45.392-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
3391	937	2023-11-21 07:21:52.858-08	2023-11-21 07:24:45.422-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 20}	2	baseline	normal	125	decrease	20	\N
3392	937	2023-11-21 07:30:24.968-08	2023-11-21 07:31:43.297-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3393	938	2023-11-21 07:30:24.958-08	2023-11-21 07:31:43.287-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3394	938	2023-11-21 07:31:43.287-08	2023-11-21 07:32:20.205-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3395	939	2023-11-21 07:30:25.008-08	2023-11-21 07:31:43.337-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3396	939	2023-11-21 07:31:43.337-08	2023-11-21 07:32:20.255-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3397	940	2023-11-21 07:30:24.808-08	2023-11-21 07:31:43.386-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3398	940	2023-11-21 07:31:43.386-08	2023-11-21 07:32:20.055-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3399	940	2023-11-21 07:34:09.299-08	2023-11-21 07:35:39.227-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3400	940	2023-11-21 07:36:24.673-08	2023-11-21 07:36:55.574-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3401	941	2023-11-21 07:30:24.828-08	2023-11-21 07:31:43.406-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3402	941	2023-11-21 07:31:43.406-08	2023-11-21 07:32:20.075-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3403	941	2023-11-21 07:34:09.319-08	2023-11-21 07:35:39.247-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3404	941	2023-11-21 07:36:24.693-08	2023-11-21 07:36:55.594-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3405	942	2023-11-21 07:30:24.978-08	2023-11-21 07:31:43.307-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3406	942	2023-11-21 07:31:43.307-08	2023-11-21 07:32:20.225-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3407	942	2023-11-21 07:34:09.215-08	2023-11-21 07:35:39.147-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3408	942	2023-11-21 07:36:24.843-08	2023-11-21 07:36:55.494-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3409	943	2023-11-21 07:31:43.457-08	2023-11-21 07:32:20.125-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3410	943	2023-11-21 07:34:09.115-08	2023-11-21 07:35:39.297-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3411	943	2023-11-21 07:36:24.743-08	2023-11-21 07:36:55.644-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3412	943	2023-11-21 07:40:18.795-08	2023-11-21 07:40:45.63-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3413	944	2023-11-21 07:34:09.429-08	2023-11-21 07:35:39.357-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3414	944	2023-11-21 07:36:24.803-08	2023-11-21 07:36:55.454-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3415	945	2023-11-21 07:36:24.833-08	2023-11-21 07:36:55.484-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3416	945	2023-11-21 07:45:05.299-08	2023-11-21 07:45:50.991-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3417	946	2023-11-21 07:45:05.269-08	2023-11-21 07:45:50.961-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3418	947	2023-11-21 07:40:18.665-08	2023-11-21 07:40:46.003-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3419	947	2023-11-21 07:43:40.676-08	2023-11-21 07:45:05.549-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3420	947	2023-11-21 07:48:24.176-08	2023-11-21 07:49:10.104-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3421	948	2023-11-21 07:40:18.725-08	2023-11-21 07:41:01.878-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3422	948	2023-11-21 07:45:05.389-08	2023-11-21 07:45:51.081-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3423	948	2023-11-21 07:48:22.216-08	2023-11-21 07:49:09.904-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3424	948	2023-11-21 07:49:09.904-08	2023-11-21 07:49:51.827-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3425	949	2023-11-21 07:48:21.583-08	2023-11-21 07:49:10.024-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3426	949	2023-11-21 07:49:10.024-08	2023-11-21 07:49:51.697-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3427	949	2023-11-21 07:50:01.99-08	2023-11-21 07:50:47.205-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3428	950	2023-11-21 07:45:05.329-08	2023-11-21 07:45:51.021-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3429	950	2023-11-21 07:48:29.433-08	2023-11-21 07:49:08.34-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3430	950	2023-11-21 07:49:10.093-08	2023-11-21 07:49:51.767-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3431	950	2023-11-21 07:50:01.81-08	2023-11-21 07:50:47.275-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3432	951	2023-11-21 07:48:21.664-08	2023-11-21 07:49:10.104-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3433	951	2023-11-21 07:49:10.104-08	2023-11-21 07:49:51.777-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3434	951	2023-11-21 07:50:01.82-08	2023-11-21 07:50:47.285-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3435	951	2023-11-21 07:54:17.693-08	2023-11-21 07:55:21.485-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3436	952	2023-11-21 07:48:21.484-08	2023-11-21 07:49:09.924-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3437	952	2023-11-21 07:49:09.924-08	2023-11-21 07:49:51.597-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3438	952	2023-11-21 07:50:01.889-08	2023-11-21 07:50:47.355-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3439	952	2023-11-21 07:54:17.763-08	2023-11-21 07:55:21.555-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3440	953	2023-11-21 07:50:01.85-08	2023-11-21 07:50:47.315-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3441	953	2023-11-21 07:54:17.723-08	2023-11-21 07:55:21.515-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3442	953	2023-11-21 07:57:44.929-08	2023-11-21 07:59:52.512-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 20}	1	baseline	normal	140	normal	20	\N
3443	954	2023-11-21 07:54:05.768-08	2023-11-21 07:54:30.397-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
3444	954	2023-11-21 07:57:45.039-08	2023-11-21 08:01:21.761-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
3445	955	2023-11-21 07:54:05.859-08	2023-11-21 07:54:30.234-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
3446	955	2023-11-21 07:57:45.129-08	2023-11-21 08:01:21.6-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
3447	956	2023-11-21 07:57:44.909-08	2023-11-21 08:01:21.631-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
3448	956	2023-11-21 08:05:28.745-08	2023-11-21 08:05:56.626-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
3449	957	2023-11-21 07:57:45.009-08	2023-11-21 08:01:21.731-08	{"Risk": 1, "Baseline-NORMAL": 140, "BaselineVariability-NORMAL": 25}	1	baseline	normal	140	normal	25	\N
3450	957	2023-11-21 08:05:28.845-08	2023-11-21 08:06:52.991-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
3451	957	2023-11-21 08:06:57.263-08	2023-11-21 08:07:48.422-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
3452	958	2023-11-21 08:05:30.913-08	2023-11-21 08:06:52.551-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
3453	958	2023-11-21 08:06:56.569-08	2023-11-21 08:07:45.208-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
3454	958	2023-11-21 08:07:57.259-08	2023-11-21 08:08:23.865-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3455	959	2023-11-21 08:05:30.913-08	2023-11-21 08:06:53.051-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
3456	959	2023-11-21 08:06:57.069-08	2023-11-21 08:07:47.562-08	{"Risk": 2, "Deceleration-LOW_VD": null}	2	deceleration	\N	\N	\N	\N	low_vd
3457	960	2023-11-21 08:08:26.212-08	2023-11-21 08:08:55.818-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3458	961	2023-11-21 08:07:30.081-08	2023-11-21 08:07:57.159-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3459	961	2023-11-21 08:10:45.085-08	2023-11-21 08:11:30.26-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3460	961	2023-11-21 08:12:53.857-08	2023-11-21 08:13:45.575-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3461	962	2023-11-21 08:07:34.452-08	2023-11-21 08:07:57.019-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3462	962	2023-11-21 08:10:47.257-08	2023-11-21 08:11:30.18-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3463	962	2023-11-21 08:12:54.057-08	2023-11-21 08:13:45.525-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3464	963	2023-11-21 08:07:30.191-08	2023-11-21 08:07:57.269-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3465	963	2023-11-21 08:10:44.945-08	2023-11-21 08:11:30.12-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3466	963	2023-11-21 08:12:53.967-08	2023-11-21 08:13:45.685-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3467	963	2023-11-21 08:14:54.997-08	2023-11-21 08:15:54.262-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3468	964	2023-11-21 08:07:57.339-08	2023-11-21 08:08:35.717-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3469	964	2023-11-21 08:10:44.51-08	2023-11-21 08:11:30.19-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3470	964	2023-11-21 08:12:54.027-08	2023-11-21 08:13:45.239-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3471	964	2023-11-21 08:14:54.018-08	2023-11-21 08:15:54.282-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3472	964	2023-11-21 08:17:08.561-08	2023-11-21 08:18:00.261-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3473	965	2023-11-21 08:10:44.207-08	2023-11-21 08:11:30.139-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3474	965	2023-11-21 08:12:54.017-08	2023-11-21 08:13:45.735-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3475	965	2023-11-21 08:14:55.047-08	2023-11-21 08:15:54.312-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3476	965	2023-11-21 08:17:18.585-08	2023-11-21 08:18:00.291-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3477	966	2023-11-21 08:12:54.007-08	2023-11-21 08:13:45.219-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3478	966	2023-11-21 08:14:55.037-08	2023-11-21 08:15:54.302-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3479	966	2023-11-21 08:17:16.322-08	2023-11-21 08:18:00.281-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3480	967	2023-11-21 08:14:54.912-08	2023-11-21 08:15:54.179-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3481	967	2023-11-21 08:17:16.452-08	2023-11-21 08:18:00.411-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3482	967	2023-11-21 08:20:42.885-08	2023-11-21 08:24:07.066-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3483	968	2023-11-21 08:17:08.586-08	2023-11-21 08:18:00.301-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3484	968	2023-11-21 08:19:44.27-08	2023-11-21 08:20:07.12-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
3485	968	2023-11-21 08:20:42.525-08	2023-11-21 08:24:06.706-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3486	969	2023-11-21 08:19:44.44-08	2023-11-21 08:20:07.04-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
3487	969	2023-11-21 08:20:42.945-08	2023-11-21 08:24:06.876-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3488	969	2023-11-21 08:26:29.224-08	2023-11-21 08:26:59.359-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3489	969	2023-11-21 08:27:10.162-08	2023-11-21 08:27:49.323-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3490	970	2023-11-21 08:19:31.162-08	2023-11-21 08:19:51.248-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3491	970	2023-11-21 08:19:44.47-08	2023-11-21 08:20:06.82-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
3492	970	2023-11-21 08:20:42.975-08	2023-11-21 08:24:06.906-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3493	970	2023-11-21 08:26:29.254-08	2023-11-21 08:26:59.389-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3494	970	2023-11-21 08:27:10.192-08	2023-11-21 08:27:49.353-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3495	971	2023-11-21 08:20:42.515-08	2023-11-21 08:24:06.696-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariability-DECREASE": 10}	2	baseline	normal	145	decrease	10	\N
3496	971	2023-11-21 08:26:29.294-08	2023-11-21 08:26:59.179-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3497	971	2023-11-21 08:27:09.978-08	2023-11-21 08:27:49.393-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3498	971	2023-11-21 08:28:58.953-08	2023-11-21 08:29:24.277-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3499	972	2023-11-21 08:26:29.144-08	2023-11-21 08:26:59.529-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3500	972	2023-11-21 08:27:10.078-08	2023-11-21 08:27:49.242-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3501	972	2023-11-21 08:28:59.303-08	2023-11-21 08:29:31.916-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3502	972	2023-11-21 08:30:47.272-08	2023-11-21 08:31:28.2-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3503	973	2023-11-21 08:27:10.212-08	2023-11-21 08:27:49.373-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3504	973	2023-11-21 08:28:59.433-08	2023-11-21 08:29:29.283-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3505	973	2023-11-21 08:30:47.406-08	2023-11-21 08:31:27.576-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3506	974	2023-11-21 08:27:10.133-08	2023-11-21 08:27:49.292-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3507	974	2023-11-21 08:29:16.639-08	2023-11-21 08:29:38.749-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3508	974	2023-11-21 08:33:14.72-08	2023-11-21 08:34:55.945-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
3509	975	2023-11-21 08:26:29.294-08	2023-11-21 08:26:59.179-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
3510	975	2023-11-21 08:27:09.978-08	2023-11-21 08:27:49.393-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3511	975	2023-11-21 08:29:18.04-08	2023-11-21 08:29:59.444-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3512	975	2023-11-21 08:30:47.172-08	2023-11-21 08:31:27.096-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3513	975	2023-11-21 08:31:19.819-08	2023-11-21 08:31:40.164-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
3514	975	2023-11-21 08:33:14.32-08	2023-11-21 08:35:48.53-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
3515	976	2023-11-21 08:28:44.668-08	2023-11-21 08:29:24.305-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
3516	976	2023-11-21 08:31:19.849-08	2023-11-21 08:31:39.398-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
3517	976	2023-11-21 08:33:14.56-08	2023-11-21 08:35:48.52-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
3518	977	2023-11-21 08:31:34.98-08	2023-11-21 08:32:08.374-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3519	977	2023-11-21 08:33:14.66-08	2023-11-21 08:35:48.62-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
3520	977	2023-11-21 08:38:12.33-08	2023-11-21 08:38:56.509-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3521	978	2023-11-21 08:30:47.336-08	2023-11-21 08:31:28.516-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3522	978	2023-11-21 08:31:21.735-08	2023-11-21 08:31:39.784-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
3523	978	2023-11-21 08:33:14.69-08	2023-11-21 08:35:48.649-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
3524	978	2023-11-21 08:38:12.36-08	2023-11-21 08:38:56.289-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3525	979	2023-11-21 08:33:14.42-08	2023-11-21 08:35:48.379-08	{"Risk": 2, "Baseline-NORMAL": 150, "BaselineVariability-DECREASE": 10}	2	baseline	normal	150	decrease	10	\N
3526	979	2023-11-21 08:38:13.096-08	2023-11-21 08:38:56.519-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3527	980	2023-11-21 08:38:12.996-08	2023-11-21 08:38:56.419-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3528	981	2023-11-21 08:38:12.51-08	2023-11-21 08:38:56.439-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3529	981	2023-11-21 08:44:27.393-08	2023-11-21 08:46:04.297-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3530	982	2023-11-21 08:38:12.5-08	2023-11-21 08:38:56.429-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3531	982	2023-11-21 08:44:27.383-08	2023-11-21 08:46:04.287-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3532	983	2023-11-21 08:44:27.673-08	2023-11-21 08:46:04.074-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3533	984	2023-11-21 08:44:27.363-08	2023-11-21 08:46:04.267-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3534	984	2023-11-21 08:49:46.034-08	2023-11-21 08:50:52.332-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3535	985	2023-11-21 08:44:27.693-08	2023-11-21 08:46:04.094-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3536	985	2023-11-21 08:49:46.616-08	2023-11-21 08:50:52.662-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3537	986	2023-11-21 08:49:46.636-08	2023-11-21 08:50:52.432-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3538	986	2023-11-21 08:52:34.639-08	2023-11-21 08:54:41.178-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariavility-INCREASE": 25}	2	baseline	normal	140	\N	\N	\N
3539	987	2023-11-21 08:49:45.954-08	2023-11-21 08:50:52.252-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3540	987	2023-11-21 08:54:41.248-08	2023-11-21 08:55:47.265-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3541	987	2023-11-21 08:56:41.756-08	2023-11-21 08:57:05.604-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3542	988	2023-11-21 08:49:46.123-08	2023-11-21 08:50:52.422-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3543	988	2023-11-21 08:54:41.168-08	2023-11-21 08:55:47.185-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3544	988	2023-11-21 08:56:41.676-08	2023-11-21 08:57:05.774-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3545	988	2023-11-21 08:58:31.104-08	2023-11-21 08:59:03.497-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3546	989	2023-11-21 08:52:34.519-08	2023-11-21 08:54:41.308-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariavility-INCREASE": 25}	2	baseline	normal	140	\N	\N	\N
3547	989	2023-11-21 08:56:41.566-08	2023-11-21 08:57:05.914-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3548	989	2023-11-21 08:58:31.244-08	2023-11-21 08:59:03.637-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3549	989	2023-11-21 09:01:16.679-08	2023-11-21 09:01:57.326-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3550	990	2023-11-21 08:54:41.268-08	2023-11-21 08:55:47.285-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3551	990	2023-11-21 08:56:41.526-08	2023-11-21 08:57:05.624-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3552	990	2023-11-21 08:58:31.204-08	2023-11-21 08:59:03.343-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3553	990	2023-11-21 09:01:17.831-08	2023-11-21 09:01:57.516-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3554	991	2023-11-21 08:54:41.348-08	2023-11-21 08:55:47.365-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3555	991	2023-11-21 08:56:41.606-08	2023-11-21 08:57:05.704-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3556	991	2023-11-21 08:58:31.034-08	2023-11-21 08:59:03.423-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3557	991	2023-11-21 09:01:17.193-08	2023-11-21 09:01:57.586-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3558	991	2023-11-21 09:02:01.856-08	2023-11-21 09:04:21.433-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariavility-INCREASE": 30}	2	baseline	normal	145	\N	\N	\N
3559	992	2023-11-21 08:56:41.596-08	2023-11-21 08:57:05.944-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3560	992	2023-11-21 09:01:18.115-08	2023-11-21 09:01:57.251-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3561	992	2023-11-21 09:03:34.169-08	2023-11-21 09:03:54.721-08	{"Deceleration-LOW_VD": null}	\N	deceleration	\N	\N	\N	\N	low_vd
3562	992	2023-11-21 09:03:57.991-08	2023-11-21 09:06:09.575-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 15}	2	baseline	normal	140	decrease	15	\N
3563	993	2023-11-21 08:56:41.606-08	2023-11-21 08:57:05.704-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3564	993	2023-11-21 08:58:31.034-08	2023-11-21 08:59:03.423-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3565	993	2023-11-21 09:01:17.193-08	2023-11-21 09:01:57.586-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3566	993	2023-11-21 09:02:01.856-08	2023-11-21 09:05:26.699-08	{"Risk": 2, "Baseline-NORMAL": 145, "BaselineVariavility-INCREASE": 30}	2	baseline	normal	145	\N	\N	\N
3567	994	2023-11-21 08:58:31.024-08	2023-11-21 08:59:03.667-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3568	994	2023-11-21 09:01:16.429-08	2023-11-21 09:01:57.326-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3569	994	2023-11-21 09:03:38.006-08	2023-11-21 09:05:26.439-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 25}	1	baseline	normal	145	normal	25	\N
3570	994	2023-11-21 09:06:13.158-08	2023-11-21 09:09:15.681-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3571	995	2023-11-21 09:01:16.478-08	2023-11-21 09:01:57.626-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3572	995	2023-11-21 09:03:56.103-08	2023-11-21 09:07:26.023-08	{"Risk": 2, "Baseline-NORMAL": 140, "BaselineVariability-DECREASE": 20}	2	baseline	normal	140	decrease	20	\N
3573	996	2023-11-21 09:03:39.451-08	2023-11-21 09:05:26.379-08	{"Risk": 1, "Baseline-NORMAL": 145, "BaselineVariability-NORMAL": 25}	1	baseline	normal	145	normal	25	\N
3574	996	2023-11-21 09:06:13.098-08	2023-11-21 09:09:15.871-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3575	996	2023-11-21 09:12:04.872-08	2023-11-21 09:12:53.621-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3576	997	2023-11-21 09:06:13.128-08	2023-11-21 09:09:15.901-08	{"Risk": 2, "Baseline-NORMAL": 135, "BaselineVariability-DECREASE": 15}	2	baseline	normal	135	decrease	15	\N
3577	997	2023-11-21 09:12:04.902-08	2023-11-21 09:12:53.651-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3578	998	2023-11-21 09:12:04.972-08	2023-11-21 09:12:53.721-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3579	999	2023-11-21 09:12:05.062-08	2023-11-21 09:12:53.811-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3580	1000	2023-11-21 09:12:04.872-08	2023-11-21 09:12:53.621-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3581	1001	2023-11-21 09:12:04.942-08	2023-11-21 09:12:53.691-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3582	1008	2023-11-21 09:27:23.529-08	2023-11-21 09:28:06.091-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3583	1010	2023-11-21 09:32:04.319-08	2023-11-21 09:34:41.776-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
3584	1011	2023-11-21 09:32:04.319-08	2023-11-21 09:36:08.934-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
3585	1012	2023-11-21 09:32:04.319-08	2023-11-21 09:36:08.934-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
3586	1013	2023-11-21 09:32:04.119-08	2023-11-21 09:36:08.734-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
3587	1013	2023-11-21 09:36:08.984-08	2023-11-21 09:38:26.074-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
3588	1014	2023-11-21 09:32:04.228-08	2023-11-21 09:36:08.843-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
3589	1014	2023-11-21 09:36:09.093-08	2023-11-21 09:38:25.934-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
3590	1015	2023-11-21 09:36:08.994-08	2023-11-21 09:38:26.083-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
3591	1015	2023-11-21 09:39:58.238-08	2023-11-21 09:42:56.849-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
3592	1016	2023-11-21 09:36:09.134-08	2023-11-21 09:38:25.974-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 10}	2	baseline	normal	125	decrease	10	\N
3593	1016	2023-11-21 09:39:58.128-08	2023-11-21 09:44:03.029-08	{"Risk": 2, "Baseline-NORMAL": 125, "BaselineVariability-DECREASE": 15}	2	baseline	normal	125	decrease	15	\N
3594	1017	2023-11-21 09:39:58.228-08	2023-11-21 09:44:50.605-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
3595	1018	2023-11-21 09:39:58.128-08	2023-11-21 09:44:50.505-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
3596	1018	2023-11-21 09:44:50.505-08	2023-11-21 09:45:21.12-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3597	1019	2023-11-21 09:39:58.178-08	2023-11-21 09:44:50.555-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
3598	1019	2023-11-21 09:44:50.555-08	2023-11-21 09:45:20.939-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3599	1019	2023-11-21 09:45:20.939-08	2023-11-21 09:46:11.144-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3600	1020	2023-11-21 09:39:58.208-08	2023-11-21 09:44:50.585-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 15}	2	baseline	normal	130	decrease	15	\N
3601	1020	2023-11-21 09:44:50.585-08	2023-11-21 09:45:20.968-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3602	1020	2023-11-21 09:45:20.968-08	2023-11-21 09:46:11.174-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3603	1020	2023-11-21 09:49:31.353-08	2023-11-21 09:50:03.001-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3604	1021	2023-11-21 09:42:13.841-08	2023-11-21 09:44:50.565-08	{"Risk": 2, "Baseline-NORMAL": 130, "BaselineVariability-DECREASE": 10}	2	baseline	normal	130	decrease	10	\N
3605	1021	2023-11-21 09:44:50.565-08	2023-11-21 09:45:20.194-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3606	1021	2023-11-21 09:49:31.573-08	2023-11-21 09:50:02.971-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3607	1022	2023-11-21 09:44:50.635-08	2023-11-21 09:45:20.746-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3608	1022	2023-11-21 09:45:20.746-08	2023-11-21 09:46:11.214-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3609	1023	2023-11-22 17:58:28.169-08	2023-11-22 17:58:43.704-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3610	1023	2023-11-22 18:00:22.376-08	2023-11-22 18:00:56.653-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3611	1023	2023-11-22 18:02:12.467-08	2023-11-22 18:06:35.91-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
3612	1024	2023-11-22 18:00:45.694-08	2023-11-22 18:01:32.097-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3613	1024	2023-11-22 18:02:12.517-08	2023-11-22 18:06:35.71-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
3614	1025	2023-11-22 18:02:12.537-08	2023-11-22 18:07:14.153-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
3615	1025	2023-11-22 18:07:26.711-08	2023-11-22 18:08:10.764-08	{"Risk": 5, "Deceleration-HI_LD": null}	5	deceleration	\N	\N	\N	\N	high_ld
3616	1025	2023-11-22 18:08:52.202-08	2023-11-22 18:11:27.652-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3617	1026	2023-11-22 18:02:12.497-08	2023-11-22 18:06:35.69-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
3618	1026	2023-11-22 18:08:52.202-08	2023-11-22 18:12:43.241-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3619	1027	2023-11-22 18:07:35.171-08	2023-11-22 18:08:09.225-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
3620	1027	2023-11-22 18:08:52.172-08	2023-11-22 18:13:38.739-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3621	1028	2023-11-22 18:08:52.302-08	2023-11-22 18:15:26.766-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3622	1029	2023-11-22 18:07:25.801-08	2023-11-22 18:08:09.135-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
3623	1029	2023-11-22 18:08:52.332-08	2023-11-22 18:12:42.866-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3624	1029	2023-11-22 18:13:52.644-08	2023-11-22 18:16:21.54-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3625	1030	2023-11-22 18:09:32.055-08	2023-11-22 18:16:21.841-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3626	1030	2023-11-22 18:16:22.091-08	2023-11-22 18:18:31.404-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3627	1031	2023-11-22 18:16:25.539-08	2023-11-22 18:20:26.406-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3628	1032	2023-11-22 18:13:52.634-08	2023-11-22 18:19:02.984-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3629	1033	2023-11-22 18:13:52.654-08	2023-11-22 18:19:03.004-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3630	1033	2023-11-22 18:20:07.889-08	2023-11-22 18:23:27.481-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3631	1034	2023-11-22 18:19:22.159-08	2023-11-22 18:20:12.955-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3632	1034	2023-11-22 18:20:13.205-08	2023-11-22 18:25:14.264-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	105	decrease	10	\N
3633	1035	2023-11-22 18:20:14.67-08	2023-11-22 18:25:10.707-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	105	decrease	10	\N
3634	1036	2023-11-22 18:20:10.033-08	2023-11-22 18:28:50.83-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	105	decrease	10	\N
3635	1037	2023-11-22 18:20:07.889-08	2023-11-22 18:24:45.825-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3636	1037	2023-11-22 18:25:46.053-08	2023-11-22 18:26:29.82-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
3637	1037	2023-11-22 18:26:31.575-08	2023-11-22 18:29:47.691-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3638	1038	2023-12-23 17:59:08.261-08	2023-12-23 18:03:45.362-08	{"Risk": 2, "Baseline-DECELERATION": 110, "BaselineVariavility-INCREASE": 30}	2	baseline	deceleration	110	\N	\N	\N
3639	1038	2023-12-23 18:03:45.362-08	2023-12-23 18:04:15.916-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3640	1038	2023-12-23 18:04:19.701-08	2023-12-23 18:04:59.483-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3641	1039	2023-12-23 17:59:08.231-08	2023-12-23 18:03:13.153-08	{"Risk": 2, "Baseline-DECELERATION": 110, "BaselineVariavility-INCREASE": 25}	2	baseline	deceleration	110	\N	\N	\N
3642	1039	2023-12-23 18:04:26.937-08	2023-12-23 18:04:58.238-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3643	1039	2023-12-23 18:04:58.488-08	2023-12-23 18:06:55.679-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
3644	1040	2023-12-23 17:59:08.372-08	2023-12-23 18:03:51.236-08	{"Risk": 2, "Baseline-DECELERATION": 110, "BaselineVariavility-INCREASE": 30}	2	baseline	deceleration	110	\N	\N	\N
3645	1040	2023-12-23 18:04:24.801-08	2023-12-23 18:05:01.106-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3646	1040	2023-12-23 18:05:01.356-08	2023-12-23 18:06:55.779-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3647	1041	2023-12-23 17:59:08.312-08	2023-12-23 18:03:52.932-08	{"Risk": 2, "Baseline-DECELERATION": 110, "BaselineVariavility-INCREASE": 25}	2	baseline	deceleration	110	\N	\N	\N
3648	1041	2023-12-23 18:04:20.267-08	2023-12-23 18:05:01.304-08	{"Risk": 3, "Deceleration-LOW_VD": null}	3	deceleration	\N	\N	\N	\N	low_vd
3649	1041	2023-12-23 18:05:01.554-08	2023-12-23 18:06:55.729-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3650	1041	2023-12-23 18:07:14.102-08	2023-12-23 18:07:41.975-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
3651	1042	2023-12-23 18:04:17.846-08	2023-12-23 18:05:01.974-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3652	1042	2023-12-23 18:05:02.224-08	2023-12-23 18:06:55.639-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3653	1042	2023-12-23 18:07:43.869-08	2023-12-23 18:10:14.517-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
3654	1043	2023-12-23 18:03:48.48-08	2023-12-23 18:04:16.016-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3655	1043	2023-12-23 18:04:46.557-08	2023-12-23 18:06:55.529-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	110	decrease	10	\N
3656	1043	2023-12-23 18:07:43.779-08	2023-12-23 18:10:13.171-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	110	decrease	5	\N
3657	1043	2023-12-23 18:10:38.47-08	2023-12-23 18:11:25.093-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
3658	1044	2023-12-23 18:03:45.452-08	2023-12-23 18:04:15.256-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3659	1044	2023-12-23 18:04:19.541-08	2023-12-23 18:04:59.573-08	{"Acceleration": null}	\N	acceleration	\N	\N	\N	\N	\N
3660	1044	2023-12-23 18:04:59.823-08	2023-12-23 18:06:55.499-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 5}	4	baseline	deceleration	105	decrease	5	\N
3661	1044	2023-12-23 18:10:40.737-08	2023-12-23 18:11:17.04-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
3662	1044	2023-12-23 18:11:17.547-08	2023-12-23 18:13:20.212-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	110	decrease	10	\N
3663	1045	2023-12-23 18:04:55.239-08	2023-12-23 18:06:55.699-08	{"Risk": 4, "Baseline-DECELERATION": 110, "BaselineVariability-DECREASE": 10}	4	baseline	deceleration	110	decrease	10	\N
3664	1045	2023-12-23 18:07:12.312-08	2023-12-23 18:07:41.685-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
3665	1045	2023-12-23 18:10:41.69-08	2023-12-23 18:11:17.257-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
3666	1046	2023-12-23 18:10:46.11-08	2023-12-23 18:11:17.167-08	{"Risk": 4, "Deceleration-LOW_VD": null}	4	deceleration	\N	\N	\N	\N	low_vd
3667	1046	2023-12-23 18:11:17.667-08	2023-12-23 18:15:59.695-08	{"Risk": 4, "Baseline-DECELERATION": 105, "BaselineVariability-DECREASE": 15}	4	baseline	deceleration	105	decrease	15	\N
\.


--
-- Data for Name: doctor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor (id, hospital_id, login_id, password, token_version, topic, name, created_at, modified_at) FROM stdin;
2	1	doctor0002	1e517803804ca81368ed57c3e393efbf6ca70746c42e89194ec707850e8fd923	token-0002	1e6bb023-ee1a-4dc1-a939-6c1c36751cfd	Doctor No.2	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
4	2	doctor0004	6eca09a790ba3801ef7973ab6cf51dad1a9724580c433d63218aeb1cdd784bf1	token-0004	5f09eba1-8722-4c78-bd25-9181a2658545	Doctor No.4	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
5	2	doctor0005	d2fe36843382abe662828c60822d492b541770eb720f41e5f51ba31115d2b342	token-0005	62c1bd05-8cd0-48b5-88d7-6746de3ac915	Doctor No.5	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
6	2	doctor0006	29552b539fe7dd40ce67ffa948b7a2517903e1b7dacfe01e364bd2d45c117a8b	token-0006	3d2b4b57-71a3-4da8-b9f2-f716f484e576	Doctor No.6	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
1	1	doctor0001	5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8	token-0001	a38714ca-df40-4596-a6b2-7f965287ad94	Doctor No.1	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
3	1	doctor0003	4ae0096b03456ba4c0645aa454be105c15765a74c00f7c75a596a6546a39e2a9	token-0003	24baf5c9-7b44-40b2-bd04-6d4ef03d6e33	Doctor No.3	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
8	1	testdata-doctor	810ff2fb242a5dee4220f2cb0e6a519891fb67f2f828a6cab4ef8894633b1f50	95ceb725-0700-4afd-8bf1-fe466b85bac7	90aae102-921d-4fa1-858f-5194457e039d	Doctor for testdata	2023-11-07 05:33:40.234571-08	2023-11-07 05:33:40.234571-08
\.


--
-- Data for Name: event_alert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_alert (computed_event_id, annotator_id, risk, memo, created_at, modified_at) FROM stdin;
\.


--
-- Data for Name: event_annotation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_annotation (id, computed_event_id, annotator_id, risk, memo, created_at, modified_at) FROM stdin;
\.


--
-- Data for Name: hospital; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hospital (id, uuid, topic, name, memo, created_at, modified_at) FROM stdin;
1	7070b4fd-18c1-4bed-aefe-85e8f31b1ab9	afb4c6af-aa68-4573-8728-19f8d17c5f69	Hospital No.1		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
2	828e0779-2f57-483f-8004-c2ff0ffb04ee	34395acc-55f8-4d26-9762-2e57ef84299f	Hospital No.2		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
3	ecb683b0-52a5-43ae-96e1-ab06e29af515	fca27086-8cdf-4d07-b138-f5f3115a9d78	Hospital No.3		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
5	aab5e439-2947-4def-9df7-e8fbe1cad07f	test	Test data hospital		2023-11-07 05:33:40.234102-08	2023-11-07 05:33:40.234102-08
\.


--
-- Data for Name: labor_condition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.labor_condition (id, measurement_id, annotator_id, temperature, blood_pressure, maternal_heart_rate, cervical_dilatation, head_descent, molding, contractions_10_min, memo, observed_at, created_at, modified_at) FROM stdin;
\.


--
-- Data for Name: measurement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.measurement (id, code, patient_id, terminal_id, first_time, last_time, created_at, modified_at, is_closed, closing_memo, closed_at, maternal_outcome) FROM stdin;
1	EDAN#0001-%!s(int=1)-20211001070000	1	1	2021-10-01 00:00:00-07	2021-10-01 01:00:00-07	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07	f	\N	\N	\N
2	EDAN#0002-%!s(int=2)-20211001070000	2	2	2021-10-01 00:00:00-07	2021-10-01 01:00:00-07	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07	f	\N	\N	\N
3	EDAN#0003-%!s(int=3)-20211001090000	3	3	2021-10-01 02:00:00-07	2021-10-01 03:00:00-07	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07	f	\N	\N	\N
4	EDAN#0001-%!s(int=4)-20211001093000	4	1	2021-10-01 02:30:00-07	2021-10-01 03:30:00-07	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07	f	\N	\N	\N
5	EDAN#0001-%!s(int=5)-20211001110000	5	1	2021-10-01 04:00:00-07	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07	f	\N	\N	\N
6	EDAN#0006-%!s(int=6)-20211001070000	6	6	2021-10-01 00:00:00-07	2021-10-01 01:00:00-07	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07	f	\N	\N	\N
7	EDAN#0007-%!s(int=7)-20211001070000	7	7	2021-10-01 00:00:00-07	2021-10-01 01:00:00-07	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07	f	\N	\N	\N
8	EDAN#0008-%!s(int=8)-20211001090000	8	8	2021-10-01 02:00:00-07	2021-10-01 03:00:00-07	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07	f	\N	\N	\N
9	EDAN#0006-%!s(int=9)-20211001093000	9	6	2021-10-01 02:30:00-07	2021-10-01 03:30:00-07	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07	f	\N	\N	\N
10	EDAN#0006-%!s(int=10)-20211001110000	10	6	2021-10-01 04:00:00-07	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07	2021-10-01 05:00:00-07	f	\N	\N	\N
82	test#m-0001-patient#0001	82	11	2023-11-09 13:24:57.448-08	2023-11-09 15:24:57.198-08	2023-11-09 14:59:58.014785-08	2023-11-09 14:59:58.014785-08	f	\N	\N	\N
83	test#m-0001-patient#0002	83	11	2023-11-09 13:04:57.448-08	2023-11-09 15:04:57.198-08	2023-11-09 14:59:58.860502-08	2023-11-09 14:59:58.860502-08	f	\N	\N	\N
84	test#m-0001-patient#0003	84	11	2023-11-09 12:44:57.448-08	2023-11-09 14:44:57.198-08	2023-11-09 14:59:59.734733-08	2023-11-09 14:59:59.734733-08	f	\N	\N	\N
85	test#m-0002-patient#0001	85	12	2023-11-09 13:09:57.448-08	2023-11-09 15:09:57.198-08	2023-11-09 15:00:00.9624-08	2023-11-09 15:00:00.9624-08	f	\N	\N	\N
86	test#m-0002-patient#0002	86	12	2023-11-09 12:49:57.448-08	2023-11-09 14:49:57.198-08	2023-11-09 15:00:01.861136-08	2023-11-09 15:00:01.861136-08	f	\N	\N	\N
87	test#m-0002-patient#0003	87	12	2023-11-09 12:29:57.448-08	2023-11-09 14:29:57.198-08	2023-11-09 15:00:02.815062-08	2023-11-09 15:00:02.815062-08	f	\N	\N	\N
111	DEMO_1306150001_02c70fd9	111	17	2023-11-17 06:39:39.49-08	2023-11-17 07:15:22.314-08	2023-11-17 06:39:44.625658-08	2023-11-17 07:15:27.630423-08	f	\N	\N	\N
103	DEMO_0942010001_1f2a6a38	103	16	2023-11-13 16:49:52.839-08	2023-11-13 17:13:22.92-08	2023-11-13 16:49:57.953868-08	2023-11-13 17:13:30.884684-08	f	\N	\N	\N
94	DEMO_2202280716_d2d22245	94	13	2023-11-10 06:29:46.479-08	2023-11-10 07:00:07.714-08	2023-11-10 06:34:45.204798-08	2023-11-10 07:00:11.359619-08	f	\N	\N	\N
97	DEMO_2203301100S_ea2fb945	97	14	2023-11-12 17:16:52.257-08	2023-11-12 17:41:21.618-08	2023-11-12 17:16:57.368261-08	2023-11-12 17:41:29.908771-08	f	\N	\N	\N
95	DEMO_2202280716_8c331c3c	95	13	2023-11-10 07:50:29.537-08	2023-11-10 08:14:14.874-08	2023-11-10 07:50:34.64866-08	2023-11-10 08:14:19.150228-08	f	\N	\N	\N
91	DEMO_1306150004_0ccd9e60	91	13	2023-11-10 01:10:33.09-08	2023-11-10 01:22:42.301-08	2023-11-10 01:10:37.98302-08	2023-11-10 01:22:49.488367-08	f	\N	\N	\N
101	DEMO_1306150003_1e80ff92	101	15	2023-11-13 09:33:01.34-08	2023-11-13 09:45:05.539-08	2023-11-13 09:33:06.425371-08	2023-11-13 09:45:07.69109-08	f	\N	\N	\N
90	DEMO_1306150003_09d74350	90	13	2023-11-10 00:20:27.623-08	2023-11-10 00:32:31.79-08	2023-11-10 00:20:32.747952-08	2023-11-10 00:32:34.165594-08	f	\N	\N	\N
99	DEMO_1306150001_cccb544b	99	14	2023-11-13 08:37:40.215-08	2023-11-13 08:39:05.227-08	2023-11-13 08:37:45.324053-08	2023-11-13 08:39:06.03814-08	f	\N	\N	\N
104	DEMO_2202240541_4d030eb2	104	16	2023-11-13 18:13:18.759-08	2023-11-13 18:22:20.037-08	2023-11-13 18:13:23.678643-08	2023-11-13 18:22:24.944452-08	f	\N	\N	\N
35	DEMO_2203300510_f3423073	35	13	2023-11-09 05:51:22.333-08	2023-11-09 05:52:17.083-08	2023-11-09 05:51:27.435827-08	2023-11-09 05:52:17.737666-08	f	\N	\N	\N
122	DEMO_2202280716_42219805	122	19	2023-11-20 02:17:46.214-08	2023-11-20 02:47:51.678-08	2023-11-20 02:17:51.370511-08	2023-11-20 02:47:55.495706-08	f	\N	\N	\N
89	DEMO_1306150002_6181f07d	89	13	2023-11-09 23:54:52.055-08	2023-11-10 00:07:02.806-08	2023-11-09 23:54:57.243276-08	2023-11-10 00:07:09.575116-08	f	\N	\N	\N
69	DEMO_2108201702S_8a6f7799	69	13	2023-11-09 14:48:47.115-08	2023-11-09 21:46:20.912-08	2023-11-09 14:48:52.389699-08	2023-11-09 21:46:21.606784-08	f	\N	\N	\N
119	DEMO_1306150004_ea505f67	119	19	2023-11-20 00:36:35.917-08	2023-11-20 00:48:40.213-08	2023-11-20 00:36:41.051979-08	2023-11-20 00:48:42.291099-08	f	\N	\N	\N
113	DEMO_1306150002_d10e5c05	113	17	2023-11-17 08:42:58.909-08	2023-11-17 08:55:00.896-08	2023-11-17 08:43:04.05121-08	2023-11-17 08:55:05.317865-08	f	\N	\N	\N
106	DEMO_2202280716_85e63cca	106	16	2023-11-13 18:51:48.246-08	2023-11-13 19:15:20.093-08	2023-11-13 18:51:53.281721-08	2023-11-13 19:15:26.148569-08	f	\N	\N	\N
88	DEMO_1306150001_912f235a	88	13	2023-11-09 22:48:32.098-08	2023-11-09 23:24:31.939-08	2023-11-09 22:48:37.201095-08	2023-11-09 23:24:33.239224-08	t		2023-11-09 23:21:47.489362-08	normal_delivery
96	DEMO_2203300510_8f2a8ec3	96	14	2023-11-12 16:40:56.902-08	2023-11-12 17:11:47.942-08	2023-11-12 16:41:02.006713-08	2023-11-12 17:16:12.581109-08	t		2023-11-12 17:16:12.581109-08	
36	DEMO_2203301100S_dbf28f45	36	13	2023-11-09 06:00:30.421-08	2023-11-09 06:25:10.57-08	2023-11-09 06:00:35.517839-08	2023-11-09 06:25:19.127398-08	f	\N	\N	\N
117	DEMO_1306150004_882f2f15	117	18	2023-11-19 17:49:44.517-08	2023-11-19 18:01:47.093-08	2023-11-19 17:49:49.657826-08	2023-11-19 18:01:50.950419-08	f	\N	\N	\N
93	DEMO_2202240541_939f306c	93	13	2023-11-10 04:53:38.842-08	2023-11-10 05:23:42.019-08	2023-11-10 04:53:43.983655-08	2023-11-10 05:23:47.480101-08	f	\N	\N	\N
100	DEMO_1306150002_7d2a447b	100	15	2023-11-13 08:49:49.245-08	2023-11-13 09:01:59.545-08	2023-11-13 08:49:54.475585-08	2023-11-13 09:02:06.002591-08	f	\N	\N	\N
105	DEMO_2202280716_0545c643	105	16	2023-11-13 18:22:43.904-08	2023-11-13 18:52:47.24-08	2023-11-13 18:22:48.94902-08	2023-11-13 18:52:52.278863-08	f	\N	\N	\N
92	DEMO_0942010001_b68e84fa	92	13	2023-11-10 04:25:01.14-08	2023-11-10 04:48:27.38-08	2023-11-10 04:25:06.27033-08	2023-11-10 04:48:28.96161-08	f	\N	\N	\N
121	DEMO_2202240541_f2a9a09f	121	19	2023-11-20 01:31:16.565-08	2023-11-20 02:01:20.24-08	2023-11-20 01:31:21.696173-08	2023-11-20 02:01:25.266538-08	f	\N	\N	\N
102	DEMO_1306150004_186c3e5d	102	16	2023-11-13 16:25:43.655-08	2023-11-13 16:37:56.077-08	2023-11-13 16:25:49.056991-08	2023-11-13 16:38:01.077017-08	f	\N	\N	\N
107	DEMO_2203300510_4052f75e	107	16	2023-11-13 19:52:13.721-08	2023-11-13 20:22:41.53-08	2023-11-13 19:52:18.850616-08	2023-11-13 20:22:42.941466-08	f	\N	\N	\N
98	DEMO_2108201702S_e8954ebb	98	14	2023-11-12 17:43:28.517-08	2023-11-13 03:43:36.572-08	2023-11-12 17:43:33.552491-08	2023-11-13 03:43:44.696754-08	f	\N	\N	\N
108	DEMO_2203301100S_a7617f45	108	16	2023-11-13 19:52:38.327-08	2023-11-13 20:17:03.599-08	2023-11-13 19:52:43.462634-08	2023-11-13 20:17:06.678864-08	f	\N	\N	\N
115	DEMO_1306150003_e0b2d2bc	115	18	2023-11-19 17:14:04.563-08	2023-11-19 17:26:18.016-08	2023-11-19 17:14:12.628884-08	2023-11-19 17:26:24.570589-08	f	\N	\N	\N
109	DEMO_2108201702S_5a499d96	109	16	2023-11-13 20:21:16.589-08	2023-11-14 03:10:05.764-08	2023-11-13 20:21:21.600213-08	2023-11-14 03:10:06.381715-08	f	\N	\N	\N
110	DEMO_1306150001_a3d17902	110	17	2023-11-17 06:30:33.624-08	2023-11-17 06:30:36.667-08	2023-11-17 06:30:38.900026-08	2023-11-17 06:30:38.900026-08	f	\N	\N	\N
114	DEMO_1306150002_c506883f	114	17	2023-11-17 08:57:21.93-08	2023-11-17 09:09:24.782-08	2023-11-17 08:57:27.075729-08	2023-11-17 09:09:28.614882-08	f	\N	\N	\N
112	DEMO_1306150001_8793f376	112	17	2023-11-17 07:54:28.589-08	2023-11-17 08:30:07.703-08	2023-11-17 07:54:33.728477-08	2023-11-17 08:30:17.519089-08	f	\N	\N	\N
124	DEMO_2203300510_457de12c	124	19	2023-11-20 04:12:34.726-08	2023-11-20 04:43:11.249-08	2023-11-20 04:12:39.870954-08	2023-11-20 04:43:16.503527-08	f	\N	\N	\N
116	DEMO_1306150004_b9b13468	116	18	2023-11-19 17:32:12.579-08	2023-11-19 17:44:17.503-08	2023-11-19 17:32:17.711468-08	2023-11-19 17:44:18.999908-08	f	\N	\N	\N
120	DEMO_0942010001_2a3a120a	120	19	2023-11-20 00:59:28.398-08	2023-11-20 01:22:51.846-08	2023-11-20 00:59:33.529246-08	2023-11-20 01:22:55.891277-08	f	\N	\N	\N
118	DEMO_1306150004_5dfb43c7	118	19	2023-11-20 00:13:33.327-08	2023-11-20 00:25:42.864-08	2023-11-20 00:13:38.601937-08	2023-11-20 00:25:51.112959-08	f	\N	\N	\N
123	DEMO_2202280716_a5d5c1f9	123	19	2023-11-20 03:44:15.251-08	2023-11-20 04:07:47.759-08	2023-11-20 03:44:20.373943-08	2023-11-20 04:07:54.118211-08	f	\N	\N	\N
127	DEMO_2203301100S_fbab7691	127	20	2023-11-20 22:45:29.332-08	2023-11-20 23:09:57.318-08	2023-11-20 22:45:34.444843-08	2023-11-20 23:10:07.212026-08	f	\N	\N	\N
125	DEMO_2203300510_fa1d741a	125	20	2023-11-20 18:33:08.056-08	2023-11-20 19:04:01.971-08	2023-11-20 18:33:13.263986-08	2023-11-20 19:04:10.516255-08	f	\N	\N	\N
126	DEMO_2203300510_d1e9fdb3	126	20	2023-11-20 19:14:19.091-08	2023-11-20 19:44:54.878-08	2023-11-20 19:14:24.220999-08	2023-11-20 19:44:57.663668-08	f	\N	\N	\N
128	DEMO_2203301100S_09af571a	128	20	2023-11-20 23:42:02.651-08	2023-11-21 00:06:28.972-08	2023-11-20 23:42:07.788095-08	2023-11-21 00:06:30.546584-08	f	\N	\N	\N
129	DEMO_2203301100S_30a4594c	129	20	2023-11-21 00:08:07.845-08	2023-11-21 00:32:34.965-08	2023-11-21 00:08:12.985602-08	2023-11-21 00:32:36.613301-08	f	\N	\N	\N
130	DEMO_2108201702S_b98a54f8	130	20	2023-11-21 02:05:53.631-08	2023-11-21 09:59:06.451-08	2023-11-21 02:05:58.664143-08	2023-11-21 09:59:06.634532-08	f	\N	\N	\N
131	DEMO_1306150003_fdecf620	131	21	2023-11-22 17:12:12.353-08	2023-11-22 17:24:24.663-08	2023-11-22 17:12:17.589971-08	2023-11-22 17:24:29.929044-08	f	\N	\N	\N
132	DEMO_1306150003_e5a44e85	132	21	2023-11-22 17:36:03.074-08	2023-11-22 17:48:06.815-08	2023-11-22 17:36:08.201316-08	2023-11-22 17:48:09.418137-08	f	\N	\N	\N
133	DEMO_1306150001_705b0c9e	133	21	2023-11-22 17:54:52.809-08	2023-11-22 18:30:30.873-08	2023-11-22 17:54:57.850203-08	2023-11-22 18:30:31.519106-08	f	\N	\N	\N
134	DEMO_1306150002_3b77d307	134	21	2023-11-22 18:34:37.275-08	2023-11-22 18:46:39.597-08	2023-11-22 18:34:42.396523-08	2023-11-22 18:46:43.758221-08	f	\N	\N	\N
135	DEMO_1306150003_e8be4973	135	22	2023-11-23 18:37:59.756-08	2023-11-23 18:50:09.513-08	2023-11-23 18:38:04.919743-08	2023-11-23 18:50:17.347029-08	f	\N	\N	\N
136	DEMO_0942010001_c368014e	136	23	2023-12-23 17:53:00.109-08	2023-12-23 18:16:41.658-08	2023-12-23 17:53:05.283645-08	2023-12-23 18:16:49.710616-08	f	\N	\N	\N
\.


--
-- Data for Name: measurement_alert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.measurement_alert (measurement_id, silent_from, silent_until, memo, created_at, modified_at) FROM stdin;
\.


--
-- Data for Name: measurement_terminal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.measurement_terminal (id, hospital_id, code, display_order, memo, created_at, modified_at) FROM stdin;
1	1	EDAN#0001	0		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
2	1	EDAN#0002	0		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
3	1	EDAN#0003	0		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
4	1	EDAN#0004	0		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
5	1	EDAN#0005	0		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
6	2	EDAN#0006	0		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
7	2	EDAN#0007	0		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
8	2	EDAN#0008	0		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
9	2	EDAN#0009	0		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
10	2	EDAN#0010	0		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
11	5	test#m-0001	0		2023-11-07 05:33:40.666369-08	2023-11-07 05:33:40.666369-08
12	5	test#m-0002	0		2023-11-07 05:33:43.099751-08	2023-11-07 05:33:43.099751-08
13	1	receiver-7862	0		2023-11-09 05:51:27.435827-08	2023-11-09 05:51:27.435827-08
14	1	receiver-4261	0		2023-11-12 16:41:02.006713-08	2023-11-12 16:41:02.006713-08
15	1	receiver-2745	0		2023-11-13 08:49:54.475585-08	2023-11-13 08:49:54.475585-08
16	1	receiver-3748	0		2023-11-13 16:25:49.056991-08	2023-11-13 16:25:49.056991-08
17	1	receiver-7916	0		2023-11-17 06:30:38.900026-08	2023-11-17 06:30:38.900026-08
18	1	receiver-8533	0		2023-11-19 17:14:12.628884-08	2023-11-19 17:14:12.628884-08
19	1	receiver-5504	0		2023-11-20 00:13:38.601937-08	2023-11-20 00:13:38.601937-08
20	1	receiver-2090	0		2023-11-20 18:33:13.263986-08	2023-11-20 18:33:13.263986-08
21	1	receiver-8218	0		2023-11-22 17:12:17.589971-08	2023-11-22 17:12:17.589971-08
22	1	receiver-515	0		2023-11-23 18:38:04.919743-08	2023-11-23 18:38:04.919743-08
23	1	receiver-9080	0		2023-12-23 17:53:05.283645-08	2023-12-23 17:53:05.283645-08
\.


--
-- Data for Name: medical_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medical_event (id, measurement_id, doctor_id, is_intervention, intervention_kind, uterus_ostium, memo, range_from, range_until, created_at, modified_at) FROM stdin;
1	96	8	t	iv_fluid	5	start test for simulation	2023-11-12 16:56:27-08	2023-11-13 16:56:00-08	2023-11-12 17:09:30.381638-08	2023-11-12 17:09:30.381638-08
\.


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patient (id, hospital_id, name, age, num_children, cesarean_scar, delivery_time, blood_loss, birth_weight, birth_datetime, gestational_days, apgar_score_1_min, apgar_score_5_min, umbilical_blood, emergency_cesarean, instrumental_labor, memo, created_at, modified_at) FROM stdin;
1	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
2	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
3	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
4	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
5	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
6	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
7	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
8	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
9	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
10	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2021-10-01 05:00:00-07	2021-10-01 05:00:00-07
11	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-07 05:33:40.666369-08	2023-11-07 05:33:40.666369-08
12	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-07 05:33:41.553395-08	2023-11-07 05:33:41.553395-08
13	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-07 05:33:42.363462-08	2023-11-07 05:33:42.363462-08
14	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-07 05:33:43.099751-08	2023-11-07 05:33:43.099751-08
15	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-07 05:33:43.868441-08	2023-11-07 05:33:43.868441-08
16	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-07 05:33:44.709669-08	2023-11-07 05:33:44.709669-08
17	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 05:06:24.42107-08	2023-11-08 05:06:24.42107-08
18	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 05:06:25.54748-08	2023-11-08 05:06:25.54748-08
19	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 05:06:26.257152-08	2023-11-08 05:06:26.257152-08
20	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 05:06:26.952311-08	2023-11-08 05:06:26.952311-08
21	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 05:06:27.721292-08	2023-11-08 05:06:27.721292-08
22	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 05:06:28.49261-08	2023-11-08 05:06:28.49261-08
23	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 17:30:44.263561-08	2023-11-08 17:30:44.263561-08
24	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 17:30:45.42649-08	2023-11-08 17:30:45.42649-08
25	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 17:30:46.267231-08	2023-11-08 17:30:46.267231-08
26	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 17:30:47.136081-08	2023-11-08 17:30:47.136081-08
27	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 17:30:48.288492-08	2023-11-08 17:30:48.288492-08
28	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 17:30:49.2365-08	2023-11-08 17:30:49.2365-08
29	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 18:53:23.314195-08	2023-11-08 18:53:23.314195-08
30	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 18:53:24.120573-08	2023-11-08 18:53:24.120573-08
31	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 18:53:24.738373-08	2023-11-08 18:53:24.738373-08
32	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 18:53:25.407862-08	2023-11-08 18:53:25.407862-08
33	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 18:53:26.010622-08	2023-11-08 18:53:26.010622-08
34	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-08 18:53:26.609192-08	2023-11-08 18:53:26.609192-08
35	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 05:51:27.435827-08	2023-11-09 05:51:27.435827-08
36	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 06:00:35.517839-08	2023-11-09 06:00:35.517839-08
37	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:00:25.538914-08	2023-11-09 07:00:25.538914-08
38	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:00:26.816687-08	2023-11-09 07:00:26.816687-08
39	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:00:27.823619-08	2023-11-09 07:00:27.823619-08
40	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:00:28.9727-08	2023-11-09 07:00:28.9727-08
41	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:00:29.907488-08	2023-11-09 07:00:29.907488-08
42	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:00:30.923203-08	2023-11-09 07:00:30.923203-08
43	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:01:02.876564-08	2023-11-09 07:01:02.876564-08
44	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:01:03.930797-08	2023-11-09 07:01:03.930797-08
45	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:01:04.94605-08	2023-11-09 07:01:04.94605-08
46	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:01:05.875957-08	2023-11-09 07:01:05.875957-08
47	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:01:07.064859-08	2023-11-09 07:01:07.064859-08
48	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:01:08.173391-08	2023-11-09 07:01:08.173391-08
49	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:17:13.727377-08	2023-11-09 07:17:13.727377-08
50	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:17:14.698614-08	2023-11-09 07:17:14.698614-08
51	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:17:15.665474-08	2023-11-09 07:17:15.665474-08
52	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:17:16.808417-08	2023-11-09 07:17:16.808417-08
53	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:17:17.809181-08	2023-11-09 07:17:17.809181-08
54	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:17:18.689884-08	2023-11-09 07:17:18.689884-08
55	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:37:35.791037-08	2023-11-09 07:37:35.791037-08
56	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:37:37.067131-08	2023-11-09 07:37:37.067131-08
57	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:37:38.254869-08	2023-11-09 07:37:38.254869-08
58	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:37:39.417199-08	2023-11-09 07:37:39.417199-08
59	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:37:40.364204-08	2023-11-09 07:37:40.364204-08
60	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 07:37:41.522299-08	2023-11-09 07:37:41.522299-08
63	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 08:03:29.743322-08	2023-11-09 08:03:29.743322-08
64	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 08:03:30.737899-08	2023-11-09 08:03:30.737899-08
65	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 08:03:31.845064-08	2023-11-09 08:03:31.845064-08
66	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 08:03:32.954289-08	2023-11-09 08:03:32.954289-08
67	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 08:03:33.959396-08	2023-11-09 08:03:33.959396-08
68	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 08:03:35.06905-08	2023-11-09 08:03:35.06905-08
69	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 14:48:52.389699-08	2023-11-09 14:48:52.389699-08
76	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 14:51:56.330343-08	2023-11-09 14:51:56.330343-08
77	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 14:51:57.087722-08	2023-11-09 14:51:57.087722-08
78	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 14:51:58.000679-08	2023-11-09 14:51:58.000679-08
79	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 14:51:58.821222-08	2023-11-09 14:51:58.821222-08
80	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 14:51:59.67113-08	2023-11-09 14:51:59.67113-08
81	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 14:52:00.523453-08	2023-11-09 14:52:00.523453-08
82	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 14:59:58.014785-08	2023-11-09 14:59:58.014785-08
83	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 14:59:58.860502-08	2023-11-09 14:59:58.860502-08
84	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 14:59:59.734733-08	2023-11-09 14:59:59.734733-08
85	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 15:00:00.9624-08	2023-11-09 15:00:00.9624-08
86	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 15:00:01.861136-08	2023-11-09 15:00:01.861136-08
87	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 15:00:02.815062-08	2023-11-09 15:00:02.815062-08
88	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 22:48:37.201095-08	2023-11-09 22:48:37.201095-08
89	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-09 23:54:57.243276-08	2023-11-09 23:54:57.243276-08
90	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-10 00:20:32.747952-08	2023-11-10 00:20:32.747952-08
91	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-10 01:10:37.98302-08	2023-11-10 01:10:37.98302-08
92	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-10 04:25:06.27033-08	2023-11-10 04:25:06.27033-08
93	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-10 04:53:43.983655-08	2023-11-10 04:53:43.983655-08
94	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-10 06:34:45.204798-08	2023-11-10 06:34:45.204798-08
95	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-10 07:50:34.64866-08	2023-11-10 07:50:34.64866-08
96	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-12 16:41:02.006713-08	2023-11-12 16:41:02.006713-08
97	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-12 17:16:57.368261-08	2023-11-12 17:16:57.368261-08
98	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-12 17:43:33.552491-08	2023-11-12 17:43:33.552491-08
99	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-13 08:37:45.324053-08	2023-11-13 08:37:45.324053-08
100	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-13 08:49:54.475585-08	2023-11-13 08:49:54.475585-08
101	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-13 09:33:06.425371-08	2023-11-13 09:33:06.425371-08
102	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-13 16:25:49.056991-08	2023-11-13 16:25:49.056991-08
103	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-13 16:49:57.953868-08	2023-11-13 16:49:57.953868-08
104	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-13 18:13:23.678643-08	2023-11-13 18:13:23.678643-08
105	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-13 18:22:48.94902-08	2023-11-13 18:22:48.94902-08
106	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-13 18:51:53.281721-08	2023-11-13 18:51:53.281721-08
107	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-13 19:52:18.850616-08	2023-11-13 19:52:18.850616-08
108	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-13 19:52:43.462634-08	2023-11-13 19:52:43.462634-08
109	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-13 20:21:21.600213-08	2023-11-13 20:21:21.600213-08
110	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-17 06:30:38.900026-08	2023-11-17 06:30:38.900026-08
111	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-17 06:39:44.625658-08	2023-11-17 06:39:44.625658-08
112	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-17 07:54:33.728477-08	2023-11-17 07:54:33.728477-08
113	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-17 08:43:04.05121-08	2023-11-17 08:43:04.05121-08
114	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-17 08:57:27.075729-08	2023-11-17 08:57:27.075729-08
115	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-19 17:14:12.628884-08	2023-11-19 17:14:12.628884-08
116	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-19 17:32:17.711468-08	2023-11-19 17:32:17.711468-08
117	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-19 17:49:49.657826-08	2023-11-19 17:49:49.657826-08
118	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-20 00:13:38.601937-08	2023-11-20 00:13:38.601937-08
119	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-20 00:36:41.051979-08	2023-11-20 00:36:41.051979-08
120	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-20 00:59:33.529246-08	2023-11-20 00:59:33.529246-08
121	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-20 01:31:21.696173-08	2023-11-20 01:31:21.696173-08
122	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-20 02:17:51.370511-08	2023-11-20 02:17:51.370511-08
123	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-20 03:44:20.373943-08	2023-11-20 03:44:20.373943-08
124	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-20 04:12:39.870954-08	2023-11-20 04:12:39.870954-08
125	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-20 18:33:13.263986-08	2023-11-20 18:33:13.263986-08
126	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-20 19:14:24.220999-08	2023-11-20 19:14:24.220999-08
127	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-20 22:45:34.444843-08	2023-11-20 22:45:34.444843-08
128	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-20 23:42:07.788095-08	2023-11-20 23:42:07.788095-08
129	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-21 00:08:12.985602-08	2023-11-21 00:08:12.985602-08
130	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-21 02:05:58.664143-08	2023-11-21 02:05:58.664143-08
131	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-22 17:12:17.589971-08	2023-11-22 17:12:17.589971-08
132	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-22 17:36:08.201316-08	2023-11-22 17:36:08.201316-08
133	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-22 17:54:57.850203-08	2023-11-22 17:54:57.850203-08
134	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-22 18:34:42.396523-08	2023-11-22 18:34:42.396523-08
135	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-11-23 18:38:04.919743-08	2023-11-23 18:38:04.919743-08
136	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		2023-12-23 17:53:05.283645-08	2023-12-23 17:53:05.283645-08
\.


--
-- Data for Name: patient_of_doctor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patient_of_doctor (doctor_id, patient_id, created_at) FROM stdin;
\.


--
-- Data for Name: postnatal_patient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.postnatal_patient (patient_id, partus_kind, gestational_days, birth_weight, apgar_score_1_min, apgar_score_5_min, cord_blood, created_at, modified_at) FROM stdin;
\.


--
-- Name: administrator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.administrator_id_seq', 2, true);


--
-- Name: annotated_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.annotated_event_id_seq', 1, false);


--
-- Name: annotator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.annotator_id_seq', 2, true);


--
-- Name: computed_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.computed_event_id_seq', 1350, true);


--
-- Name: ctg_authentication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ctg_authentication_id_seq', 3, true);


--
-- Name: diagnosis_algorithm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diagnosis_algorithm_id_seq', 3, true);


--
-- Name: diagnosis_authentication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diagnosis_authentication_id_seq', 1, false);


--
-- Name: diagnosis_content_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diagnosis_content_id_seq', 3667, true);


--
-- Name: diagnosis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.diagnosis_id_seq', 1046, true);


--
-- Name: doctor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctor_id_seq', 8, true);


--
-- Name: event_annotation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_annotation_id_seq', 1, false);


--
-- Name: hospital_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hospital_id_seq', 5, true);


--
-- Name: labor_condition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.labor_condition_id_seq', 1, false);


--
-- Name: measurement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.measurement_id_seq', 136, true);


--
-- Name: measurement_terminal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.measurement_terminal_id_seq', 23, true);


--
-- Name: medical_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medical_event_id_seq', 1, true);


--
-- Name: patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patient_id_seq', 136, true);


--
-- Name: administrator administrator_login_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT administrator_login_id_key UNIQUE (login_id);


--
-- Name: administrator administrator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT administrator_pkey PRIMARY KEY (id);


--
-- Name: annotated_event annotated_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotated_event
    ADD CONSTRAINT annotated_event_pkey PRIMARY KEY (id);


--
-- Name: annotator annotator_login_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotator
    ADD CONSTRAINT annotator_login_id_key UNIQUE (login_id);


--
-- Name: annotator annotator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotator
    ADD CONSTRAINT annotator_pkey PRIMARY KEY (id);


--
-- Name: antenatal_patient antenatal_patient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.antenatal_patient
    ADD CONSTRAINT antenatal_patient_pkey PRIMARY KEY (patient_id);


--
-- Name: computed_diagnosis computed_diagnosis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.computed_diagnosis
    ADD CONSTRAINT computed_diagnosis_pkey PRIMARY KEY (diagnosis_id);


--
-- Name: computed_event computed_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.computed_event
    ADD CONSTRAINT computed_event_pkey PRIMARY KEY (id);


--
-- Name: ctg_authentication ctg_authentication_api_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ctg_authentication
    ADD CONSTRAINT ctg_authentication_api_key_key UNIQUE (api_key);


--
-- Name: ctg_authentication ctg_authentication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ctg_authentication
    ADD CONSTRAINT ctg_authentication_pkey PRIMARY KEY (id);


--
-- Name: diagnosis_algorithm diagnosis_algorithm_name_version_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diagnosis_algorithm
    ADD CONSTRAINT diagnosis_algorithm_name_version_key UNIQUE (name, version);


--
-- Name: diagnosis_algorithm diagnosis_algorithm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diagnosis_algorithm
    ADD CONSTRAINT diagnosis_algorithm_pkey PRIMARY KEY (id);


--
-- Name: diagnosis_authentication diagnosis_authentication_api_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diagnosis_authentication
    ADD CONSTRAINT diagnosis_authentication_api_key_key UNIQUE (api_key);


--
-- Name: diagnosis_authentication diagnosis_authentication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diagnosis_authentication
    ADD CONSTRAINT diagnosis_authentication_pkey PRIMARY KEY (id);


--
-- Name: diagnosis_content diagnosis_content_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diagnosis_content
    ADD CONSTRAINT diagnosis_content_pkey PRIMARY KEY (id);


--
-- Name: diagnosis diagnosis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diagnosis
    ADD CONSTRAINT diagnosis_pkey PRIMARY KEY (id);


--
-- Name: doctor doctor_login_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_login_id_key UNIQUE (login_id);


--
-- Name: doctor doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (id);


--
-- Name: doctor doctor_topic_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_topic_key UNIQUE (topic);


--
-- Name: event_alert event_alert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_alert
    ADD CONSTRAINT event_alert_pkey PRIMARY KEY (computed_event_id);


--
-- Name: event_annotation event_annotation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_annotation
    ADD CONSTRAINT event_annotation_pkey PRIMARY KEY (id);


--
-- Name: hospital hospital_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital
    ADD CONSTRAINT hospital_pkey PRIMARY KEY (id);


--
-- Name: hospital hospital_topic_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital
    ADD CONSTRAINT hospital_topic_key UNIQUE (topic);


--
-- Name: hospital hospital_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hospital
    ADD CONSTRAINT hospital_uuid_key UNIQUE (uuid);


--
-- Name: labor_condition labor_condition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.labor_condition
    ADD CONSTRAINT labor_condition_pkey PRIMARY KEY (id);


--
-- Name: measurement measurement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurement
    ADD CONSTRAINT measurement_pkey PRIMARY KEY (id);


--
-- Name: measurement_terminal measurement_terminal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurement_terminal
    ADD CONSTRAINT measurement_terminal_pkey PRIMARY KEY (id);


--
-- Name: medical_event medical_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_event
    ADD CONSTRAINT medical_event_pkey PRIMARY KEY (id);


--
-- Name: patient_of_doctor patient_of_doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_of_doctor
    ADD CONSTRAINT patient_of_doctor_pkey PRIMARY KEY (doctor_id, patient_id);


--
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);


--
-- Name: postnatal_patient postnatal_patient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postnatal_patient
    ADD CONSTRAINT postnatal_patient_pkey PRIMARY KEY (patient_id);


--
-- Name: annotated_event annotated_event_annotator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotated_event
    ADD CONSTRAINT annotated_event_annotator_id_fkey FOREIGN KEY (annotator_id) REFERENCES public.annotator(id) ON DELETE SET NULL;


--
-- Name: annotated_event annotated_event_computed_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotated_event
    ADD CONSTRAINT annotated_event_computed_event_id_fkey FOREIGN KEY (computed_event_id) REFERENCES public.computed_event(id) ON DELETE SET NULL;


--
-- Name: annotated_event annotated_event_measurement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotated_event
    ADD CONSTRAINT annotated_event_measurement_id_fkey FOREIGN KEY (measurement_id) REFERENCES public.measurement(id) ON DELETE CASCADE;


--
-- Name: antenatal_patient antenatal_patient_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.antenatal_patient
    ADD CONSTRAINT antenatal_patient_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patient(id) ON DELETE CASCADE;


--
-- Name: computed_diagnosis computed_diagnosis_algorithm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.computed_diagnosis
    ADD CONSTRAINT computed_diagnosis_algorithm_id_fkey FOREIGN KEY (algorithm_id) REFERENCES public.diagnosis_algorithm(id) ON DELETE CASCADE;


--
-- Name: computed_diagnosis computed_diagnosis_diagnosis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.computed_diagnosis
    ADD CONSTRAINT computed_diagnosis_diagnosis_id_fkey FOREIGN KEY (diagnosis_id) REFERENCES public.diagnosis(id) ON DELETE CASCADE;


--
-- Name: computed_event computed_event_measurement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.computed_event
    ADD CONSTRAINT computed_event_measurement_id_fkey FOREIGN KEY (measurement_id) REFERENCES public.measurement(id) ON DELETE CASCADE;


--
-- Name: ctg_authentication ctg_authentication_hospital_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ctg_authentication
    ADD CONSTRAINT ctg_authentication_hospital_id_fkey FOREIGN KEY (hospital_id) REFERENCES public.hospital(id) ON DELETE CASCADE;


--
-- Name: diagnosis_content diagnosis_content_diagnosis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diagnosis_content
    ADD CONSTRAINT diagnosis_content_diagnosis_id_fkey FOREIGN KEY (diagnosis_id) REFERENCES public.diagnosis(id) ON DELETE CASCADE;


--
-- Name: diagnosis diagnosis_measurement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.diagnosis
    ADD CONSTRAINT diagnosis_measurement_id_fkey FOREIGN KEY (measurement_id) REFERENCES public.measurement(id) ON DELETE CASCADE;


--
-- Name: doctor doctor_hospital_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_hospital_id_fkey FOREIGN KEY (hospital_id) REFERENCES public.hospital(id) ON DELETE CASCADE;


--
-- Name: event_alert event_alert_annotator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_alert
    ADD CONSTRAINT event_alert_annotator_id_fkey FOREIGN KEY (annotator_id) REFERENCES public.annotator(id) ON DELETE SET NULL;


--
-- Name: event_alert event_alert_computed_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_alert
    ADD CONSTRAINT event_alert_computed_event_id_fkey FOREIGN KEY (computed_event_id) REFERENCES public.computed_event(id) ON DELETE CASCADE;


--
-- Name: event_annotation event_annotation_annotator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_annotation
    ADD CONSTRAINT event_annotation_annotator_id_fkey FOREIGN KEY (annotator_id) REFERENCES public.annotator(id) ON DELETE SET NULL;


--
-- Name: event_annotation event_annotation_computed_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_annotation
    ADD CONSTRAINT event_annotation_computed_event_id_fkey FOREIGN KEY (computed_event_id) REFERENCES public.computed_event(id) ON DELETE CASCADE;


--
-- Name: labor_condition labor_condition_annotator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.labor_condition
    ADD CONSTRAINT labor_condition_annotator_id_fkey FOREIGN KEY (annotator_id) REFERENCES public.annotator(id) ON DELETE SET NULL;


--
-- Name: labor_condition labor_condition_measurement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.labor_condition
    ADD CONSTRAINT labor_condition_measurement_id_fkey FOREIGN KEY (measurement_id) REFERENCES public.measurement(id) ON DELETE CASCADE;


--
-- Name: measurement_alert measurement_alert_measurement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurement_alert
    ADD CONSTRAINT measurement_alert_measurement_id_fkey FOREIGN KEY (measurement_id) REFERENCES public.measurement(id) ON DELETE CASCADE;


--
-- Name: measurement measurement_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurement
    ADD CONSTRAINT measurement_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patient(id) ON DELETE CASCADE;


--
-- Name: measurement_terminal measurement_terminal_hospital_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurement_terminal
    ADD CONSTRAINT measurement_terminal_hospital_id_fkey FOREIGN KEY (hospital_id) REFERENCES public.hospital(id) ON DELETE CASCADE;


--
-- Name: measurement measurement_terminal_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.measurement
    ADD CONSTRAINT measurement_terminal_id_fkey FOREIGN KEY (terminal_id) REFERENCES public.measurement_terminal(id) ON DELETE CASCADE;


--
-- Name: medical_event medical_event_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_event
    ADD CONSTRAINT medical_event_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctor(id) ON DELETE SET NULL;


--
-- Name: medical_event medical_event_measurement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_event
    ADD CONSTRAINT medical_event_measurement_id_fkey FOREIGN KEY (measurement_id) REFERENCES public.measurement(id) ON DELETE CASCADE;


--
-- Name: patient patient_hospital_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_hospital_id_fkey FOREIGN KEY (hospital_id) REFERENCES public.hospital(id) ON DELETE CASCADE;


--
-- Name: patient_of_doctor patient_of_doctor_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_of_doctor
    ADD CONSTRAINT patient_of_doctor_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctor(id) ON DELETE CASCADE;


--
-- Name: patient_of_doctor patient_of_doctor_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient_of_doctor
    ADD CONSTRAINT patient_of_doctor_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patient(id) ON DELETE CASCADE;


--
-- Name: postnatal_patient postnatal_patient_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postnatal_patient
    ADD CONSTRAINT postnatal_patient_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patient(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

