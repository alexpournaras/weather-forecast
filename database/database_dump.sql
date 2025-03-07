--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: action_events; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.action_events (
    id bigint NOT NULL,
    batch_id character(36) NOT NULL,
    user_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    actionable_type character varying(255) NOT NULL,
    actionable_id bigint NOT NULL,
    target_type character varying(255) NOT NULL,
    target_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint,
    fields text NOT NULL,
    status character varying(25) DEFAULT 'running'::character varying NOT NULL,
    exception text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    original text,
    changes text
);


ALTER TABLE public.action_events OWNER TO admin;

--
-- Name: action_events_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.action_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_events_id_seq OWNER TO admin;

--
-- Name: action_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.action_events_id_seq OWNED BY public.action_events.id;


--
-- Name: cache; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO admin;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO admin;

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.failed_jobs OWNER TO admin;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO admin;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.job_batches OWNER TO admin;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: admin
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


ALTER TABLE public.jobs OWNER TO admin;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO admin;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    latitude numeric(10,6) NOT NULL,
    longitude numeric(10,6) NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.locations OWNER TO admin;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locations_id_seq OWNER TO admin;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO admin;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO admin;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: nova_field_attachments; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.nova_field_attachments (
    id integer NOT NULL,
    attachable_type character varying(255) NOT NULL,
    attachable_id bigint NOT NULL,
    attachment character varying(255) NOT NULL,
    disk character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.nova_field_attachments OWNER TO admin;

--
-- Name: nova_field_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.nova_field_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nova_field_attachments_id_seq OWNER TO admin;

--
-- Name: nova_field_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.nova_field_attachments_id_seq OWNED BY public.nova_field_attachments.id;


--
-- Name: nova_notifications; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.nova_notifications (
    id uuid NOT NULL,
    type character varying(255) NOT NULL,
    notifiable_type character varying(255) NOT NULL,
    notifiable_id bigint NOT NULL,
    data text NOT NULL,
    read_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.nova_notifications OWNER TO admin;

--
-- Name: nova_pending_field_attachments; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.nova_pending_field_attachments (
    id integer NOT NULL,
    draft_id character varying(255) NOT NULL,
    attachment character varying(255) NOT NULL,
    disk character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.nova_pending_field_attachments OWNER TO admin;

--
-- Name: nova_pending_field_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.nova_pending_field_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nova_pending_field_attachments_id_seq OWNER TO admin;

--
-- Name: nova_pending_field_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.nova_pending_field_attachments_id_seq OWNED BY public.nova_pending_field_attachments.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO admin;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO admin;

--
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    two_factor_secret text,
    two_factor_recovery_codes text,
    two_factor_confirmed_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: weather_daily_forecasts; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.weather_daily_forecasts (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    location_id bigint NOT NULL,
    forecast_date date NOT NULL,
    temperature_max double precision NOT NULL,
    temperature_min double precision NOT NULL,
    precipitation_sum double precision NOT NULL,
    forecast_source character varying(255) NOT NULL
);


ALTER TABLE public.weather_daily_forecasts OWNER TO admin;

--
-- Name: weather_daily_forecasts_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.weather_daily_forecasts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.weather_daily_forecasts_id_seq OWNER TO admin;

--
-- Name: weather_daily_forecasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.weather_daily_forecasts_id_seq OWNED BY public.weather_daily_forecasts.id;


--
-- Name: weather_hourly_forecasts; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.weather_hourly_forecasts (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    weather_daily_forecast_id bigint NOT NULL,
    forecast_datetime timestamp(0) without time zone NOT NULL,
    temperature double precision NOT NULL,
    precipitation double precision NOT NULL
);


ALTER TABLE public.weather_hourly_forecasts OWNER TO admin;

--
-- Name: weather_hourly_forecasts_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.weather_hourly_forecasts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.weather_hourly_forecasts_id_seq OWNER TO admin;

--
-- Name: weather_hourly_forecasts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.weather_hourly_forecasts_id_seq OWNED BY public.weather_hourly_forecasts.id;


--
-- Name: action_events id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.action_events ALTER COLUMN id SET DEFAULT nextval('public.action_events_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: nova_field_attachments id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nova_field_attachments ALTER COLUMN id SET DEFAULT nextval('public.nova_field_attachments_id_seq'::regclass);


--
-- Name: nova_pending_field_attachments id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nova_pending_field_attachments ALTER COLUMN id SET DEFAULT nextval('public.nova_pending_field_attachments_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: weather_daily_forecasts id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.weather_daily_forecasts ALTER COLUMN id SET DEFAULT nextval('public.weather_daily_forecasts_id_seq'::regclass);


--
-- Name: weather_hourly_forecasts id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.weather_hourly_forecasts ALTER COLUMN id SET DEFAULT nextval('public.weather_hourly_forecasts_id_seq'::regclass);


--
-- Data for Name: action_events; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.action_events (id, batch_id, user_id, name, actionable_type, actionable_id, target_type, target_id, model_type, model_id, fields, status, exception, created_at, updated_at, original, changes) FROM stdin;
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.locations (id, name, latitude, longitude, active, created_at, updated_at) FROM stdin;
1	Thessaloniki	40.643600	22.930900	t	2025-03-07 11:11:54	2025-03-07 11:11:54
2	Rio de Janeiro	-22.906400	-43.182200	t	2025-03-07 11:11:56	2025-03-07 11:11:56
3	Tokyo	35.689500	139.691700	t	2025-03-07 11:11:57	2025-03-07 11:11:57
4	New York	40.712800	-74.006000	t	2025-03-07 11:11:59	2025-03-07 11:11:59
5	Sydney	-33.868800	151.209300	t	2025-03-07 11:12:01	2025-03-07 11:12:01
6	Cape Town	-33.924900	18.424100	f	2025-03-07 11:12:03	2025-03-07 11:12:03
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2018_01_01_000000_create_action_events_table	1
5	2019_05_10_000000_add_fields_to_action_events_table	1
6	2021_08_25_193039_create_nova_notifications_table	1
7	2022_04_26_000000_add_fields_to_nova_notifications_table	1
8	2022_12_19_000000_create_field_attachments_table	1
9	2025_03_04_165322_add_two_factor_columns_to_users_table	1
10	2025_03_04_183740_create_locations_table	1
11	2025_03_05_100455_create_weather_daily_forecasts_table	1
12	2025_03_05_143048_create_weather_hourly_forecasts_table	1
\.


--
-- Data for Name: nova_field_attachments; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.nova_field_attachments (id, attachable_type, attachable_id, attachment, disk, url, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: nova_notifications; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.nova_notifications (id, type, notifiable_type, notifiable_id, data, read_at, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: nova_pending_field_attachments; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.nova_pending_field_attachments (id, draft_id, attachment, disk, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, two_factor_secret, two_factor_recovery_codes, two_factor_confirmed_at) FROM stdin;
1	Admin	admin@gmail.com	\N	$2y$12$.qGU8KQ5E7Apbj2VhLKxuu4yxf78lvT63az4ZPtlB3WDiyHpLrFCC	\N	2025-03-07 11:11:54	2025-03-07 11:11:54	\N	\N	\N
\.


--
-- Data for Name: weather_daily_forecasts; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.weather_daily_forecasts (id, created_at, updated_at, location_id, forecast_date, temperature_max, temperature_min, precipitation_sum, forecast_source) FROM stdin;
1	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07	17	5.3	0	open-meteo
2	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-08	17.4	6.3	0	open-meteo
3	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-09	18	6.9	0	open-meteo
4	2025-03-07 11:11:55	2025-03-07 11:11:55	1	2025-03-07	18	8.6	0	weatherapi
5	2025-03-07 11:11:55	2025-03-07 11:11:55	1	2025-03-08	17.4	8.4	0	weatherapi
6	2025-03-07 11:11:56	2025-03-07 11:11:56	1	2025-03-09	16.7	8.9	0	weatherapi
7	2025-03-07 11:11:56	2025-03-07 11:11:56	2	2025-03-07	31.6	23.2	0.3	open-meteo
8	2025-03-07 11:11:56	2025-03-07 11:11:56	2	2025-03-08	31.5	24.7	4.1	open-meteo
9	2025-03-07 11:11:56	2025-03-07 11:11:56	2	2025-03-09	34.4	24.1	0.3	open-meteo
10	2025-03-07 11:11:57	2025-03-07 11:11:57	2	2025-03-07	29.9	23	0.18	weatherapi
11	2025-03-07 11:11:57	2025-03-07 11:11:57	2	2025-03-08	30	23.4	0.74	weatherapi
12	2025-03-07 11:11:57	2025-03-07 11:11:57	2	2025-03-09	32.5	23	0.23	weatherapi
13	2025-03-07 11:11:58	2025-03-07 11:11:58	3	2025-03-07	9.4	0.4	0	open-meteo
14	2025-03-07 11:11:58	2025-03-07 11:11:58	3	2025-03-08	6.1	0.8	11.6	open-meteo
15	2025-03-07 11:11:58	2025-03-07 11:11:58	3	2025-03-09	11.1	1.5	0	open-meteo
16	2025-03-07 11:11:59	2025-03-07 11:11:59	3	2025-03-07	10.3	4.7	0.27	weatherapi
17	2025-03-07 11:11:59	2025-03-07 11:11:59	3	2025-03-08	7.8	3.1	19.27	weatherapi
18	2025-03-07 11:11:59	2025-03-07 11:11:59	3	2025-03-09	11.7	3.1	1.22	weatherapi
19	2025-03-07 11:11:59	2025-03-07 11:11:59	4	2025-03-07	8.2	-0.2	0	open-meteo
20	2025-03-07 11:11:59	2025-03-07 11:11:59	4	2025-03-08	5.1	1.3	0	open-meteo
21	2025-03-07 11:11:59	2025-03-07 11:11:59	4	2025-03-09	9.7	-0.9	0	open-meteo
22	2025-03-07 11:12:00	2025-03-07 11:12:00	4	2025-03-07	10.6	-2	0	weatherapi
23	2025-03-07 11:12:01	2025-03-07 11:12:01	4	2025-03-08	4.5	-0.2	0	weatherapi
24	2025-03-07 11:12:01	2025-03-07 11:12:01	4	2025-03-09	8.3	-2.9	0	weatherapi
25	2025-03-07 11:12:01	2025-03-07 11:12:01	5	2025-03-07	24.2	17.7	1	open-meteo
26	2025-03-07 11:12:01	2025-03-07 11:12:01	5	2025-03-08	25.5	20	0.6	open-meteo
27	2025-03-07 11:12:01	2025-03-07 11:12:01	5	2025-03-09	22.4	19.2	13.4	open-meteo
28	2025-03-07 11:12:02	2025-03-07 11:12:02	5	2025-03-07	24.2	20.5	2.55	weatherapi
29	2025-03-07 11:12:02	2025-03-07 11:12:02	5	2025-03-08	23.6	20.6	2.5	weatherapi
30	2025-03-07 11:12:02	2025-03-07 11:12:02	5	2025-03-09	24.4	21.3	4.22	weatherapi
\.


--
-- Data for Name: weather_hourly_forecasts; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.weather_hourly_forecasts (id, created_at, updated_at, weather_daily_forecast_id, forecast_datetime, temperature, precipitation) FROM stdin;
1	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 00:00:00	7.1	0
2	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 01:00:00	7.1	0
3	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 02:00:00	7.1	0
4	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 03:00:00	5.9	0
5	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 04:00:00	5.5	0
6	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 05:00:00	5.3	0
7	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 06:00:00	6	0
8	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 07:00:00	9.1	0
9	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 08:00:00	12.2	0
10	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 09:00:00	13.8	0
11	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 10:00:00	15.3	0
12	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 11:00:00	15.9	0
13	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 12:00:00	16.5	0
14	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 13:00:00	17	0
15	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 14:00:00	16.9	0
16	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 15:00:00	16.3	0
17	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 16:00:00	15	0
18	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 17:00:00	13.5	0
19	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 18:00:00	11	0
20	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 19:00:00	9.4	0
21	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 20:00:00	8.5	0
22	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 21:00:00	7.9	0
23	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 22:00:00	7.5	0
24	2025-03-07 11:11:54	2025-03-07 11:11:54	1	2025-03-07 23:00:00	7.1	0
25	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 00:00:00	6.8	0
26	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 01:00:00	6.5	0
27	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 02:00:00	6.6	0
28	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 03:00:00	6.6	0
29	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 04:00:00	6.6	0
30	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 05:00:00	6.3	0
31	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 06:00:00	7.3	0
32	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 07:00:00	10	0
33	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 08:00:00	12.7	0
34	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 09:00:00	14.1	0
35	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 10:00:00	15.3	0
36	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 11:00:00	16.4	0
37	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 12:00:00	17.1	0
38	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 13:00:00	17.4	0
39	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 14:00:00	17.3	0
40	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 15:00:00	16.7	0
41	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 16:00:00	15	0
42	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 17:00:00	13	0
43	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 18:00:00	11.4	0
44	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 19:00:00	11	0
45	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 20:00:00	10.8	0
46	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 21:00:00	10.1	0
47	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 22:00:00	9.6	0
48	2025-03-07 11:11:55	2025-03-07 11:11:55	2	2025-03-08 23:00:00	9.4	0
49	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 00:00:00	8.8	0
50	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 01:00:00	8.1	0
51	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 02:00:00	8.2	0
52	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 03:00:00	7.7	0
53	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 04:00:00	7.2	0
54	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 05:00:00	6.9	0
55	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 06:00:00	7.7	0
56	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 07:00:00	11.1	0
57	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 08:00:00	13.9	0
58	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 09:00:00	14.9	0
59	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 10:00:00	16.1	0
60	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 11:00:00	17.1	0
61	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 12:00:00	17.9	0
62	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 13:00:00	18	0
63	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 14:00:00	17.3	0
64	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 15:00:00	16.5	0
65	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 16:00:00	14.9	0
66	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 17:00:00	12.7	0
67	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 18:00:00	11.6	0
68	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 19:00:00	11.4	0
69	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 20:00:00	11.1	0
70	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 21:00:00	10.5	0
71	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 22:00:00	9.3	0
72	2025-03-07 11:11:55	2025-03-07 11:11:55	3	2025-03-09 23:00:00	8.4	0
73	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 00:00:00	10.8	0
74	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 01:00:00	10.5	0
75	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 02:00:00	10.1	0
76	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 03:00:00	9.8	0
77	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 04:00:00	9.4	0
78	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 05:00:00	9.1	0
79	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 06:00:00	8.9	0
80	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 07:00:00	8.6	0
81	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 08:00:00	9.8	0
82	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 09:00:00	11.9	0
83	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 10:00:00	13.7	0
84	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 11:00:00	15.3	0
85	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 12:00:00	16.7	0
86	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 13:00:00	13.2	0
87	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 14:00:00	17.9	0
88	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 15:00:00	18	0
89	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 16:00:00	17.7	0
90	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 17:00:00	16.8	0
91	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 18:00:00	14.3	0
92	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 19:00:00	12.7	0
93	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 20:00:00	12.1	0
94	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 21:00:00	11.7	0
95	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 22:00:00	11.4	0
96	2025-03-07 11:11:55	2025-03-07 11:11:55	4	2025-03-07 23:00:00	11	0
97	2025-03-07 11:11:55	2025-03-07 11:11:55	5	2025-03-08 00:00:00	10.6	0
98	2025-03-07 11:11:55	2025-03-07 11:11:55	5	2025-03-08 01:00:00	10.2	0
99	2025-03-07 11:11:55	2025-03-07 11:11:55	5	2025-03-08 02:00:00	9.9	0
100	2025-03-07 11:11:55	2025-03-07 11:11:55	5	2025-03-08 03:00:00	9.6	0
101	2025-03-07 11:11:55	2025-03-07 11:11:55	5	2025-03-08 04:00:00	9.2	0
102	2025-03-07 11:11:55	2025-03-07 11:11:55	5	2025-03-08 05:00:00	8.8	0
103	2025-03-07 11:11:55	2025-03-07 11:11:55	5	2025-03-08 06:00:00	8.5	0
104	2025-03-07 11:11:55	2025-03-07 11:11:55	5	2025-03-08 07:00:00	8.4	0
105	2025-03-07 11:11:55	2025-03-07 11:11:55	5	2025-03-08 08:00:00	9.7	0
106	2025-03-07 11:11:55	2025-03-07 11:11:55	5	2025-03-08 09:00:00	11.6	0
107	2025-03-07 11:11:56	2025-03-07 11:11:56	5	2025-03-08 10:00:00	13.1	0
108	2025-03-07 11:11:56	2025-03-07 11:11:56	5	2025-03-08 11:00:00	14.5	0
109	2025-03-07 11:11:56	2025-03-07 11:11:56	5	2025-03-08 12:00:00	15.6	0
110	2025-03-07 11:11:56	2025-03-07 11:11:56	5	2025-03-08 13:00:00	16.5	0
111	2025-03-07 11:11:56	2025-03-07 11:11:56	5	2025-03-08 14:00:00	17	0
112	2025-03-07 11:11:56	2025-03-07 11:11:56	5	2025-03-08 15:00:00	17.4	0
113	2025-03-07 11:11:56	2025-03-07 11:11:56	5	2025-03-08 16:00:00	17.4	0
114	2025-03-07 11:11:56	2025-03-07 11:11:56	5	2025-03-08 17:00:00	16.5	0
115	2025-03-07 11:11:56	2025-03-07 11:11:56	5	2025-03-08 18:00:00	14.1	0
116	2025-03-07 11:11:56	2025-03-07 11:11:56	5	2025-03-08 19:00:00	12.5	0
117	2025-03-07 11:11:56	2025-03-07 11:11:56	5	2025-03-08 20:00:00	11.9	0
118	2025-03-07 11:11:56	2025-03-07 11:11:56	5	2025-03-08 21:00:00	11.5	0
119	2025-03-07 11:11:56	2025-03-07 11:11:56	5	2025-03-08 22:00:00	11.3	0
120	2025-03-07 11:11:56	2025-03-07 11:11:56	5	2025-03-08 23:00:00	11	0
121	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 00:00:00	10.7	0
122	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 01:00:00	10.4	0
123	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 02:00:00	10.2	0
124	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 03:00:00	10	0
125	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 04:00:00	9.7	0
126	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 05:00:00	9.4	0
127	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 06:00:00	9.1	0
128	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 07:00:00	8.9	0
129	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 08:00:00	10.3	0
130	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 09:00:00	12	0
131	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 10:00:00	13.4	0
132	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 11:00:00	14.6	0
133	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 12:00:00	15.6	0
134	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 13:00:00	16.3	0
135	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 14:00:00	16.7	0
136	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 15:00:00	16.5	0
137	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 16:00:00	16	0
138	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 17:00:00	15	0
139	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 18:00:00	13.4	0
140	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 19:00:00	11.9	0
141	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 20:00:00	11.4	0
142	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 21:00:00	11	0
143	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 22:00:00	10.6	0
144	2025-03-07 11:11:56	2025-03-07 11:11:56	6	2025-03-09 23:00:00	10.4	0
145	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 00:00:00	26.3	0
146	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 01:00:00	25.8	0
147	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 02:00:00	25.5	0
148	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 03:00:00	25	0
149	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 04:00:00	24.7	0
150	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 05:00:00	24.4	0
151	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 06:00:00	24.3	0
152	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 07:00:00	23.8	0
153	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 08:00:00	23.5	0
154	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 09:00:00	23.2	0
155	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 10:00:00	24.1	0
156	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 11:00:00	26.2	0
157	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 12:00:00	27.9	0
158	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 13:00:00	29.5	0
159	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 14:00:00	31	0
160	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 15:00:00	31.4	0
161	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 16:00:00	31.6	0
162	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 17:00:00	31.6	0
163	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 18:00:00	31.4	0
164	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 19:00:00	30.4	0.1
165	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 20:00:00	28.9	0.1
166	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 21:00:00	27.8	0.1
167	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 22:00:00	26.7	0
168	2025-03-07 11:11:56	2025-03-07 11:11:56	7	2025-03-07 23:00:00	26	0
169	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 00:00:00	25.7	0
170	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 01:00:00	25.5	0.1
171	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 02:00:00	25.4	0.1
172	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 03:00:00	25.2	0.1
173	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 04:00:00	25	0.3
174	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 05:00:00	24.8	0.3
175	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 06:00:00	24.7	0.3
176	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 07:00:00	24.7	0.3
177	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 08:00:00	24.7	0.1
178	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 09:00:00	24.9	0
179	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 10:00:00	25.3	0
180	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 11:00:00	25.8	0.1
181	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 12:00:00	27	0
182	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 13:00:00	28.6	0
183	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 14:00:00	29.9	0
184	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 15:00:00	30.9	0
185	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 16:00:00	31.5	0.1
186	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 17:00:00	31.5	0.3
187	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 18:00:00	30.7	0.5
188	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 19:00:00	29.8	0.4
189	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 20:00:00	28.8	0.3
190	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 21:00:00	27.6	0.7
191	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 22:00:00	26.8	0.1
192	2025-03-07 11:11:56	2025-03-07 11:11:56	8	2025-03-08 23:00:00	26.2	0
193	2025-03-07 11:11:56	2025-03-07 11:11:56	9	2025-03-09 00:00:00	25.8	0
194	2025-03-07 11:11:56	2025-03-07 11:11:56	9	2025-03-09 01:00:00	25.6	0
195	2025-03-07 11:11:56	2025-03-07 11:11:56	9	2025-03-09 02:00:00	25.4	0
196	2025-03-07 11:11:56	2025-03-07 11:11:56	9	2025-03-09 03:00:00	25.2	0
197	2025-03-07 11:11:56	2025-03-07 11:11:56	9	2025-03-09 04:00:00	25.1	0
198	2025-03-07 11:11:56	2025-03-07 11:11:56	9	2025-03-09 05:00:00	25.1	0
199	2025-03-07 11:11:56	2025-03-07 11:11:56	9	2025-03-09 06:00:00	25.2	0
200	2025-03-07 11:11:56	2025-03-07 11:11:56	9	2025-03-09 07:00:00	24.9	0
201	2025-03-07 11:11:56	2025-03-07 11:11:56	9	2025-03-09 08:00:00	24.4	0
202	2025-03-07 11:11:56	2025-03-07 11:11:56	9	2025-03-09 09:00:00	24.1	0
203	2025-03-07 11:11:56	2025-03-07 11:11:56	9	2025-03-09 10:00:00	24.5	0
204	2025-03-07 11:11:57	2025-03-07 11:11:57	9	2025-03-09 11:00:00	26.1	0
205	2025-03-07 11:11:57	2025-03-07 11:11:57	9	2025-03-09 12:00:00	28	0
206	2025-03-07 11:11:57	2025-03-07 11:11:57	9	2025-03-09 13:00:00	29.8	0
207	2025-03-07 11:11:57	2025-03-07 11:11:57	9	2025-03-09 14:00:00	31.5	0
208	2025-03-07 11:11:57	2025-03-07 11:11:57	9	2025-03-09 15:00:00	33	0
209	2025-03-07 11:11:57	2025-03-07 11:11:57	9	2025-03-09 16:00:00	34.4	0
210	2025-03-07 11:11:57	2025-03-07 11:11:57	9	2025-03-09 17:00:00	34.3	0
211	2025-03-07 11:11:57	2025-03-07 11:11:57	9	2025-03-09 18:00:00	33.8	0
212	2025-03-07 11:11:57	2025-03-07 11:11:57	9	2025-03-09 19:00:00	32.3	0.2
213	2025-03-07 11:11:57	2025-03-07 11:11:57	9	2025-03-09 20:00:00	31.4	0.1
214	2025-03-07 11:11:57	2025-03-07 11:11:57	9	2025-03-09 21:00:00	30.3	0
215	2025-03-07 11:11:57	2025-03-07 11:11:57	9	2025-03-09 22:00:00	28.8	0
216	2025-03-07 11:11:57	2025-03-07 11:11:57	9	2025-03-09 23:00:00	28	0
217	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 00:00:00	24.1	0
218	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 01:00:00	23.7	0
219	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 02:00:00	23.4	0
220	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 03:00:00	23.2	0
221	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 04:00:00	23.1	0
222	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 05:00:00	23	0
223	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 06:00:00	24.2	0
224	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 07:00:00	26.2	0
225	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 08:00:00	26.2	0
226	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 09:00:00	28.8	0
227	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 10:00:00	29.4	0
228	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 11:00:00	29.9	0
229	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 12:00:00	29.9	0
230	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 13:00:00	29.6	0
231	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 14:00:00	29.4	0
232	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 15:00:00	28.7	0
233	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 16:00:00	27.7	0
234	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 17:00:00	26.7	0
235	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 18:00:00	26.2	0.03
236	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 19:00:00	25.9	0.04
237	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 20:00:00	25.6	0
238	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 21:00:00	25.4	0.03
239	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 22:00:00	25.1	0.08
240	2025-03-07 11:11:57	2025-03-07 11:11:57	10	2025-03-07 23:00:00	24.7	0
241	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 00:00:00	24.2	0
242	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 01:00:00	24	0
243	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 02:00:00	23.8	0
244	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 03:00:00	23.6	0
245	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 04:00:00	23.5	0
246	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 05:00:00	23.4	0
247	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 06:00:00	24.5	0
248	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 07:00:00	26.5	0
249	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 08:00:00	28.3	0
250	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 09:00:00	29.3	0
251	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 10:00:00	29.8	0
252	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 11:00:00	29.9	0
253	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 12:00:00	30	0.01
254	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 13:00:00	29.8	0.03
255	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 14:00:00	29.4	0.02
256	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 15:00:00	28.9	0.4
257	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 16:00:00	27	0.25
258	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 17:00:00	25.8	0.02
259	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 18:00:00	25.5	0
260	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 19:00:00	25.3	0
261	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 20:00:00	25.1	0
262	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 21:00:00	24.8	0
263	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 22:00:00	24.5	0
264	2025-03-07 11:11:57	2025-03-07 11:11:57	11	2025-03-08 23:00:00	24.2	0
265	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 00:00:00	23.9	0
266	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 01:00:00	23.7	0
267	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 02:00:00	23.4	0
268	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 03:00:00	23.3	0
269	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 04:00:00	23.2	0
270	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 05:00:00	23	0
271	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 06:00:00	24	0
272	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 07:00:00	26.3	0
273	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 08:00:00	28.5	0
274	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 09:00:00	30.4	0
275	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 10:00:00	31.6	0
276	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 11:00:00	32.1	0
277	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 12:00:00	32.5	0
278	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 13:00:00	32.2	0
279	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 14:00:00	31.1	0
280	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 15:00:00	30.5	0
281	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 16:00:00	29.1	0
282	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 17:00:00	27.4	0.06
283	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 18:00:00	26.2	0.17
284	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 19:00:00	25.4	0
285	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 20:00:00	25.4	0
286	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 21:00:00	25.2	0
287	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 22:00:00	24.8	0
288	2025-03-07 11:11:57	2025-03-07 11:11:57	12	2025-03-09 23:00:00	24.5	0
289	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 00:00:00	6.6	0
290	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 01:00:00	7.6	0
291	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 02:00:00	8.4	0
292	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 03:00:00	9.2	0
293	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 04:00:00	9.4	0
294	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 05:00:00	9.1	0
295	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 06:00:00	9.2	0
296	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 07:00:00	8.2	0
297	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 08:00:00	6.6	0
298	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 09:00:00	5.1	0
299	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 10:00:00	4	0
300	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 11:00:00	3.2	0
301	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 12:00:00	2.6	0
302	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 13:00:00	2.1	0
303	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 14:00:00	1.7	0
304	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 15:00:00	1.4	0
305	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 16:00:00	1	0
306	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 17:00:00	0.7	0
307	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 18:00:00	0.4	0
308	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 19:00:00	0.5	0
309	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 20:00:00	0.6	0
310	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 21:00:00	0.4	0
311	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 22:00:00	0.8	0
312	2025-03-07 11:11:58	2025-03-07 11:11:58	13	2025-03-07 23:00:00	1.5	0
313	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 00:00:00	2.5	0
314	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 01:00:00	3.5	0
315	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 02:00:00	4.2	0
316	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 03:00:00	4.9	0
317	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 04:00:00	5.4	0
318	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 05:00:00	5.8	0
319	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 06:00:00	5.8	0
320	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 07:00:00	6.1	0
321	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 08:00:00	5.6	0
322	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 09:00:00	3.2	0.4
323	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 10:00:00	2.6	0.9
324	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 11:00:00	2	1.3
325	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 12:00:00	0.9	1.9
326	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 13:00:00	0.9	1.6
327	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 14:00:00	0.8	1.3
328	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 15:00:00	0.8	1.4
329	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 16:00:00	0.8	1.2
330	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 17:00:00	0.9	0.8
331	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 18:00:00	0.9	0.5
332	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 19:00:00	0.9	0.2
333	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 20:00:00	0.9	0
334	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 21:00:00	1.1	0
335	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 22:00:00	1.8	0.1
336	2025-03-07 11:11:58	2025-03-07 11:11:58	14	2025-03-08 23:00:00	2.5	0
337	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 00:00:00	4.2	0
338	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 01:00:00	6.2	0
339	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 02:00:00	7.9	0
340	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 03:00:00	9.2	0
341	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 04:00:00	10.1	0
342	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 05:00:00	10.8	0
343	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 06:00:00	11.1	0
344	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 07:00:00	11.1	0
345	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 08:00:00	10.5	0
346	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 09:00:00	8.9	0
347	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 10:00:00	8.1	0
348	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 11:00:00	7	0
349	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 12:00:00	6.1	0
350	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 13:00:00	5.4	0
351	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 14:00:00	4.8	0
352	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 15:00:00	4.4	0
353	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 16:00:00	4	0
354	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 17:00:00	3.2	0
355	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 18:00:00	2.7	0
356	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 19:00:00	2.1	0
357	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 20:00:00	1.8	0
358	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 21:00:00	1.5	0
359	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 22:00:00	2.2	0
360	2025-03-07 11:11:58	2025-03-07 11:11:58	15	2025-03-09 23:00:00	4	0
361	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 00:00:00	6.7	0.06
362	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 01:00:00	6.4	0.08
363	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 02:00:00	6	0.07
364	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 03:00:00	6.1	0.03
365	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 04:00:00	5.9	0.01
366	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 05:00:00	5.9	0.01
367	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 06:00:00	5.7	0
368	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 07:00:00	5.6	0
369	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 08:00:00	6.3	0
370	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 09:00:00	6.9	0
371	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 10:00:00	7.7	0
372	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 11:00:00	8.6	0
373	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 12:00:00	9.6	0
374	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 13:00:00	10.1	0
375	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 14:00:00	10.3	0
376	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 15:00:00	10.1	0
377	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 16:00:00	9.6	0
378	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 17:00:00	8.8	0
379	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 18:00:00	7.8	0
380	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 19:00:00	6.9	0
381	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 20:00:00	6.4	0
382	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 21:00:00	5.7	0
383	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 22:00:00	5.2	0
384	2025-03-07 11:11:59	2025-03-07 11:11:59	16	2025-03-07 23:00:00	4.7	0
385	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 00:00:00	4.3	0
386	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 01:00:00	4.2	0
387	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 02:00:00	4	0
388	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 03:00:00	3.8	0
389	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 04:00:00	3.7	0
390	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 05:00:00	3.6	0
391	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 06:00:00	3.6	0
392	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 07:00:00	3.7	0
393	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 08:00:00	4	0
394	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 09:00:00	4.4	0
395	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 10:00:00	4.9	0
396	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 11:00:00	5.7	0
397	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 12:00:00	6.3	0
398	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 13:00:00	6.7	0
399	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 14:00:00	7.4	0
400	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 15:00:00	7.8	0.13
401	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 16:00:00	6.8	0.72
402	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 17:00:00	5.8	1.47
403	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 18:00:00	4.9	3.18
404	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 19:00:00	4.3	2.85
405	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 20:00:00	3.9	3.08
406	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 21:00:00	3.4	3.88
407	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 22:00:00	3.2	2.51
408	2025-03-07 11:11:59	2025-03-07 11:11:59	17	2025-03-08 23:00:00	3.1	1.44
409	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 00:00:00	3.1	0.63
410	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 01:00:00	3.2	0.41
411	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 02:00:00	3.3	0.13
412	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 03:00:00	3.3	0.03
413	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 04:00:00	3.4	0.02
414	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 05:00:00	3.5	0.01
415	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 06:00:00	3.9	0
416	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 07:00:00	4.1	0
417	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 08:00:00	4.9	0
418	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 09:00:00	6.1	0
419	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 10:00:00	7.3	0
420	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 11:00:00	8.5	0
421	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 12:00:00	9.5	0
422	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 13:00:00	10.4	0
423	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 14:00:00	11.1	0
424	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 15:00:00	11.6	0
425	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 16:00:00	11.7	0
426	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 17:00:00	11.6	0
427	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 18:00:00	11.5	0
428	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 19:00:00	10.7	0
429	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 20:00:00	9.6	0
430	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 21:00:00	9.2	0
431	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 22:00:00	8.9	0
432	2025-03-07 11:11:59	2025-03-07 11:11:59	18	2025-03-09 23:00:00	8.4	0
433	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 00:00:00	5.7	0
434	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 01:00:00	3.8	0
435	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 02:00:00	2.1	0
436	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 03:00:00	0.9	0
437	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 04:00:00	0.9	0
438	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 05:00:00	0.9	0
439	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 06:00:00	1	0
440	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 07:00:00	0.7	0
441	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 08:00:00	0.6	0
442	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 09:00:00	0.4	0
443	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 10:00:00	-0.1	0
444	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 11:00:00	-0.2	0
445	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 12:00:00	0.1	0
446	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 13:00:00	1.9	0
447	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 14:00:00	3.4	0
448	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 15:00:00	5	0
449	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 16:00:00	6.3	0
450	2025-03-07 11:11:59	2025-03-07 11:11:59	19	2025-03-07 17:00:00	7.2	0
451	2025-03-07 11:12:00	2025-03-07 11:12:00	19	2025-03-07 18:00:00	7.6	0
452	2025-03-07 11:12:00	2025-03-07 11:12:00	19	2025-03-07 19:00:00	8.1	0
453	2025-03-07 11:12:00	2025-03-07 11:12:00	19	2025-03-07 20:00:00	8.2	0
454	2025-03-07 11:12:00	2025-03-07 11:12:00	19	2025-03-07 21:00:00	8	0
455	2025-03-07 11:12:00	2025-03-07 11:12:00	19	2025-03-07 22:00:00	7.5	0
456	2025-03-07 11:12:00	2025-03-07 11:12:00	19	2025-03-07 23:00:00	5.9	0
457	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 00:00:00	5.1	0
458	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 01:00:00	4.5	0
459	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 02:00:00	3.9	0
460	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 03:00:00	3.7	0
461	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 04:00:00	3.3	0
462	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 05:00:00	3.1	0
463	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 06:00:00	2.8	0
464	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 07:00:00	2.5	0
465	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 08:00:00	2.3	0
466	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 09:00:00	2.1	0
467	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 10:00:00	1.9	0
468	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 11:00:00	1.5	0
469	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 12:00:00	1.8	0
470	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 13:00:00	3.5	0
471	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 14:00:00	3.6	0
472	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 15:00:00	2.6	0
473	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 16:00:00	2.3	0
474	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 17:00:00	3	0
475	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 18:00:00	3.4	0
476	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 19:00:00	3.6	0
477	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 20:00:00	3.6	0
478	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 21:00:00	3.2	0
479	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 22:00:00	2.6	0
480	2025-03-07 11:12:00	2025-03-07 11:12:00	20	2025-03-08 23:00:00	1.3	0
481	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 00:00:00	0.4	0
482	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 01:00:00	-0.4	0
483	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 02:00:00	-0.8	0
484	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 03:00:00	-0.7	0
485	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 04:00:00	-0.9	0
486	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 05:00:00	-0.8	0
487	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 06:00:00	-0.8	0
488	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 07:00:00	0.1	0
489	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 08:00:00	-0	0
490	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 09:00:00	-0.2	0
491	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 10:00:00	-0.3	0
492	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 11:00:00	-0.2	0
493	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 12:00:00	-0.1	0
494	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 13:00:00	0.5	0
495	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 14:00:00	1.4	0
496	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 15:00:00	2.7	0
497	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 16:00:00	4.2	0
498	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 17:00:00	5.9	0
499	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 18:00:00	7.4	0
500	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 19:00:00	8.8	0
501	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 20:00:00	9.3	0
502	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 21:00:00	9.7	0
503	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 22:00:00	9.7	0
504	2025-03-07 11:12:00	2025-03-07 11:12:00	21	2025-03-09 23:00:00	8.8	0
505	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 00:00:00	-0.9	0
506	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 01:00:00	-1.3	0
507	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 02:00:00	-1.5	0
508	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 03:00:00	-1.6	0
509	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 04:00:00	-1.7	0
510	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 05:00:00	-1.8	0
511	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 06:00:00	1.1	0
512	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 07:00:00	-1.8	0
513	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 08:00:00	-0.7	0
514	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 09:00:00	0.7	0
515	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 10:00:00	2.2	0
516	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 11:00:00	5.2	0
517	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 12:00:00	7.1	0
518	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 13:00:00	7.4	0
519	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 14:00:00	8.9	0
520	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 15:00:00	9.8	0
521	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 16:00:00	9.1	0
522	2025-03-07 11:12:00	2025-03-07 11:12:00	22	2025-03-07 17:00:00	8.4	0
523	2025-03-07 11:12:01	2025-03-07 11:12:01	22	2025-03-07 18:00:00	8.1	0
524	2025-03-07 11:12:01	2025-03-07 11:12:01	22	2025-03-07 19:00:00	6.6	0
525	2025-03-07 11:12:01	2025-03-07 11:12:01	22	2025-03-07 20:00:00	5.8	0
526	2025-03-07 11:12:01	2025-03-07 11:12:01	22	2025-03-07 21:00:00	5.4	0
527	2025-03-07 11:12:01	2025-03-07 11:12:01	22	2025-03-07 22:00:00	4.7	0
528	2025-03-07 11:12:01	2025-03-07 11:12:01	22	2025-03-07 23:00:00	4.2	0
529	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 00:00:00	4	0
530	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 01:00:00	3.5	0
531	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 02:00:00	2.9	0
532	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 03:00:00	2.4	0
533	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 04:00:00	1.9	0
534	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 05:00:00	1.5	0
535	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 06:00:00	1.2	0
536	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 07:00:00	0.9	0
537	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 08:00:00	1.6	0
538	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 09:00:00	2.4	0
539	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 10:00:00	3.3	0
540	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 11:00:00	3.7	0
541	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 12:00:00	3.8	0
542	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 13:00:00	3.9	0
543	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 14:00:00	4.1	0
544	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 15:00:00	4.2	0
545	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 16:00:00	4.4	0
546	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 17:00:00	3.5	0
547	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 18:00:00	2.7	0
548	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 19:00:00	1.8	0
549	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 20:00:00	1	0
550	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 21:00:00	0.4	0
551	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 22:00:00	1.1	0
552	2025-03-07 11:12:01	2025-03-07 11:12:01	23	2025-03-08 23:00:00	0.1	0
553	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 00:00:00	-0.4	0
554	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 01:00:00	-0.8	0
555	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 02:00:00	-1.4	0
556	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 03:00:00	-1.9	0
557	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 04:00:00	-2.3	0
558	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 05:00:00	-2.5	0
559	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 06:00:00	-2.7	0
560	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 07:00:00	-2.8	0
561	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 08:00:00	-1.2	0
562	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 09:00:00	0.4	0
563	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 10:00:00	2.1	0
564	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 11:00:00	3.5	0
565	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 12:00:00	4.6	0
566	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 13:00:00	5.4	0
567	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 14:00:00	6.4	0
568	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 15:00:00	7.1	0
569	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 16:00:00	7.7	0
570	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 17:00:00	7.6	0
571	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 18:00:00	7.3	0
572	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 19:00:00	7	0
573	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 20:00:00	6.5	0
574	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 21:00:00	6.1	0
575	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 22:00:00	2.8	0
576	2025-03-07 11:12:01	2025-03-07 11:12:01	24	2025-03-09 23:00:00	3.7	0
577	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 00:00:00	23	0
578	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 01:00:00	23.4	0
579	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 02:00:00	23.9	0
580	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 03:00:00	24.2	0
581	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 04:00:00	24.2	0
582	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 05:00:00	24	0
583	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 06:00:00	23.6	0
584	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 07:00:00	22.9	0
585	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 08:00:00	22	0
586	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 09:00:00	21.1	0
587	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 10:00:00	20.5	0
588	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 11:00:00	20.2	0
589	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 12:00:00	19.8	0
590	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 13:00:00	19.5	0
591	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 14:00:00	18.9	0
592	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 15:00:00	18.4	0
593	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 16:00:00	18	0
594	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 17:00:00	17.7	0
595	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 18:00:00	17.7	0.1
596	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 19:00:00	17.7	0.1
597	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 20:00:00	18	0.3
598	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 21:00:00	18.9	0.3
599	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 22:00:00	21	0.2
600	2025-03-07 11:12:01	2025-03-07 11:12:01	25	2025-03-07 23:00:00	22.8	0
601	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 00:00:00	23.6	0
602	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 01:00:00	24.3	0
603	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 02:00:00	25	0
604	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 03:00:00	25.5	0
605	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 04:00:00	24.8	0
606	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 05:00:00	24	0
607	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 06:00:00	23.4	0
608	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 07:00:00	23.1	0
609	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 08:00:00	22.5	0
610	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 09:00:00	21.5	0
611	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 10:00:00	21.3	0
612	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 11:00:00	21	0
613	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 12:00:00	20.8	0
614	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 13:00:00	20.5	0
615	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 14:00:00	20.3	0
616	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 15:00:00	20.3	0.3
617	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 16:00:00	20.3	0.2
618	2025-03-07 11:12:01	2025-03-07 11:12:01	26	2025-03-08 17:00:00	20.3	0.1
619	2025-03-07 11:12:02	2025-03-07 11:12:02	26	2025-03-08 18:00:00	20.2	0
620	2025-03-07 11:12:02	2025-03-07 11:12:02	26	2025-03-08 19:00:00	20	0
621	2025-03-07 11:12:02	2025-03-07 11:12:02	26	2025-03-08 20:00:00	20	0
622	2025-03-07 11:12:02	2025-03-07 11:12:02	26	2025-03-08 21:00:00	20.5	0
623	2025-03-07 11:12:02	2025-03-07 11:12:02	26	2025-03-08 22:00:00	21.4	0
624	2025-03-07 11:12:02	2025-03-07 11:12:02	26	2025-03-08 23:00:00	21.9	0
625	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 00:00:00	22.1	0.1
626	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 01:00:00	22.4	0
627	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 02:00:00	22.4	0.1
628	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 03:00:00	22	0.2
629	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 04:00:00	21.9	0.1
630	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 05:00:00	22.1	0
631	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 06:00:00	21.3	0.1
632	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 07:00:00	20.8	0.2
633	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 08:00:00	20.7	0
634	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 09:00:00	20.4	0
635	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 10:00:00	20.3	0.1
636	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 11:00:00	20	0.8
637	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 12:00:00	19.8	1
638	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 13:00:00	19.7	0.8
639	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 14:00:00	19.7	0.6
640	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 15:00:00	19.7	0.3
641	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 16:00:00	19.6	0.4
642	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 17:00:00	19.5	2.1
643	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 18:00:00	19.4	2.6
644	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 19:00:00	19.3	1.6
645	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 20:00:00	19.2	1.1
646	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 21:00:00	19.3	0.3
647	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 22:00:00	19.5	0.2
648	2025-03-07 11:12:02	2025-03-07 11:12:02	27	2025-03-09 23:00:00	19.8	0.7
649	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 00:00:00	20.5	0.09
650	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 01:00:00	20.6	0.04
651	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 02:00:00	20.5	0.17
652	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 03:00:00	20.7	0.22
653	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 04:00:00	21	0.08
654	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 05:00:00	21.1	0.07
655	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 06:00:00	21.1	0.1
656	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 07:00:00	21.7	0.2
657	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 08:00:00	22.1	0.12
658	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 09:00:00	22.8	0.04
659	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 10:00:00	23.5	0.06
660	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 11:00:00	23.6	0.02
661	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 12:00:00	23.8	0.02
662	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 13:00:00	24.2	0.01
663	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 14:00:00	24.1	0.06
664	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 15:00:00	23.7	0.12
665	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 16:00:00	23.2	0.13
666	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 17:00:00	22.8	0.2
667	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 18:00:00	22.1	0.19
668	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 19:00:00	21.7	0.16
669	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 20:00:00	21.7	0.1
670	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 21:00:00	21.6	0.13
671	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 22:00:00	23.4	0.13
672	2025-03-07 11:12:02	2025-03-07 11:12:02	28	2025-03-07 23:00:00	21.3	0.08
673	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 00:00:00	21.2	0.04
674	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 01:00:00	20.9	0.04
675	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 02:00:00	20.8	0.01
676	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 03:00:00	20.8	0
677	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 04:00:00	20.8	0
678	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 05:00:00	20.6	0
679	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 06:00:00	20.6	0
680	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 07:00:00	21.5	0.01
681	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 08:00:00	22.2	0.02
682	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 09:00:00	22.8	0.09
683	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 10:00:00	23.2	0.2
684	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 11:00:00	23.3	0.34
685	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 12:00:00	23	0.36
686	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 13:00:00	23.2	0.21
687	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 14:00:00	23.5	0.1
688	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 15:00:00	23.6	0.11
689	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 16:00:00	23	0.13
690	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 17:00:00	22.7	0.14
691	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 18:00:00	22.1	0.14
692	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 19:00:00	21.8	0.11
693	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 20:00:00	21.8	0.06
694	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 21:00:00	21.7	0.06
695	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 22:00:00	21.6	0.12
696	2025-03-07 11:12:02	2025-03-07 11:12:02	29	2025-03-08 23:00:00	21.6	0.19
697	2025-03-07 11:12:02	2025-03-07 11:12:02	30	2025-03-09 00:00:00	21.4	0.19
698	2025-03-07 11:12:02	2025-03-07 11:12:02	30	2025-03-09 01:00:00	21.5	0.23
699	2025-03-07 11:12:02	2025-03-07 11:12:02	30	2025-03-09 02:00:00	21.7	0.24
700	2025-03-07 11:12:02	2025-03-07 11:12:02	30	2025-03-09 03:00:00	21.4	0.35
701	2025-03-07 11:12:02	2025-03-07 11:12:02	30	2025-03-09 04:00:00	21.3	0.33
702	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 05:00:00	21.3	0.27
703	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 06:00:00	21.3	0.32
704	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 07:00:00	21.7	0.38
705	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 08:00:00	22.1	0.29
706	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 09:00:00	22.6	0.31
707	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 10:00:00	23.3	0.23
708	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 11:00:00	23.5	0.16
709	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 12:00:00	24.2	0.09
710	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 13:00:00	24.4	0.12
711	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 14:00:00	24.3	0.07
712	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 15:00:00	23.8	0.01
713	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 16:00:00	23.3	0.02
714	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 17:00:00	22.9	0.09
715	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 18:00:00	22.4	0.09
716	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 19:00:00	22.4	0.02
717	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 20:00:00	22.3	0.02
718	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 21:00:00	22.3	0.05
719	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 22:00:00	22.1	0.11
720	2025-03-07 11:12:03	2025-03-07 11:12:03	30	2025-03-09 23:00:00	21.7	0.23
\.


--
-- Name: action_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.action_events_id_seq', 1, false);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.locations_id_seq', 6, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.migrations_id_seq', 12, true);


--
-- Name: nova_field_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.nova_field_attachments_id_seq', 1, false);


--
-- Name: nova_pending_field_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.nova_pending_field_attachments_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: weather_daily_forecasts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.weather_daily_forecasts_id_seq', 30, true);


--
-- Name: weather_hourly_forecasts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.weather_hourly_forecasts_id_seq', 720, true);


--
-- Name: action_events action_events_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.action_events
    ADD CONSTRAINT action_events_pkey PRIMARY KEY (id);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: nova_field_attachments nova_field_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nova_field_attachments
    ADD CONSTRAINT nova_field_attachments_pkey PRIMARY KEY (id);


--
-- Name: nova_notifications nova_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nova_notifications
    ADD CONSTRAINT nova_notifications_pkey PRIMARY KEY (id);


--
-- Name: nova_pending_field_attachments nova_pending_field_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.nova_pending_field_attachments
    ADD CONSTRAINT nova_pending_field_attachments_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: weather_daily_forecasts weather_daily_forecasts_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.weather_daily_forecasts
    ADD CONSTRAINT weather_daily_forecasts_pkey PRIMARY KEY (id);


--
-- Name: weather_hourly_forecasts weather_hourly_forecasts_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.weather_hourly_forecasts
    ADD CONSTRAINT weather_hourly_forecasts_pkey PRIMARY KEY (id);


--
-- Name: action_events_actionable_type_actionable_id_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX action_events_actionable_type_actionable_id_index ON public.action_events USING btree (actionable_type, actionable_id);


--
-- Name: action_events_batch_id_model_type_model_id_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX action_events_batch_id_model_type_model_id_index ON public.action_events USING btree (batch_id, model_type, model_id);


--
-- Name: action_events_target_type_target_id_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX action_events_target_type_target_id_index ON public.action_events USING btree (target_type, target_id);


--
-- Name: action_events_user_id_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX action_events_user_id_index ON public.action_events USING btree (user_id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: nova_field_attachments_attachable_type_attachable_id_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX nova_field_attachments_attachable_type_attachable_id_index ON public.nova_field_attachments USING btree (attachable_type, attachable_id);


--
-- Name: nova_field_attachments_url_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX nova_field_attachments_url_index ON public.nova_field_attachments USING btree (url);


--
-- Name: nova_notifications_notifiable_type_notifiable_id_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX nova_notifications_notifiable_type_notifiable_id_index ON public.nova_notifications USING btree (notifiable_type, notifiable_id);


--
-- Name: nova_pending_field_attachments_draft_id_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX nova_pending_field_attachments_draft_id_index ON public.nova_pending_field_attachments USING btree (draft_id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- PostgreSQL database dump complete
--

