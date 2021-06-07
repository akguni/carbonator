--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: carbonator
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO carbonator;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: carbonator
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO carbonator;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carbonator
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: carbonator
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO carbonator;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: carbonator
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO carbonator;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carbonator
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: carbonator
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO carbonator;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: carbonator
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO carbonator;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carbonator
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: carbonator_appliance; Type: TABLE; Schema: public; Owner: carbonator
--

CREATE TABLE public.carbonator_appliance (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    watts numeric(6,2) NOT NULL,
    "typicalDuration" integer NOT NULL
);


ALTER TABLE public.carbonator_appliance OWNER TO carbonator;

--
-- Name: carbonator_appliance_id_seq; Type: SEQUENCE; Schema: public; Owner: carbonator
--

CREATE SEQUENCE public.carbonator_appliance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carbonator_appliance_id_seq OWNER TO carbonator;

--
-- Name: carbonator_appliance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carbonator
--

ALTER SEQUENCE public.carbonator_appliance_id_seq OWNED BY public.carbonator_appliance.id;


--
-- Name: carbonator_cost; Type: TABLE; Schema: public; Owner: carbonator
--

CREATE TABLE public.carbonator_cost (
    id integer NOT NULL,
    money numeric(8,4) NOT NULL,
    "moneyUnit" character varying(16) NOT NULL,
    co2e numeric(12,2) NOT NULL,
    trees numeric(10,4) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.carbonator_cost OWNER TO carbonator;

--
-- Name: carbonator_cost_id_seq; Type: SEQUENCE; Schema: public; Owner: carbonator
--

CREATE SEQUENCE public.carbonator_cost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carbonator_cost_id_seq OWNER TO carbonator;

--
-- Name: carbonator_cost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carbonator
--

ALTER SEQUENCE public.carbonator_cost_id_seq OWNED BY public.carbonator_cost.id;


--
-- Name: carbonator_saving; Type: TABLE; Schema: public; Owner: carbonator
--

CREATE TABLE public.carbonator_saving (
    id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    "energySaved" numeric(12,2) NOT NULL,
    appliance_id integer NOT NULL,
    saver_id integer NOT NULL,
    "deleteFlag" boolean NOT NULL
);


ALTER TABLE public.carbonator_saving OWNER TO carbonator;

--
-- Name: carbonator_saving_id_seq; Type: SEQUENCE; Schema: public; Owner: carbonator
--

CREATE SEQUENCE public.carbonator_saving_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carbonator_saving_id_seq OWNER TO carbonator;

--
-- Name: carbonator_saving_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carbonator
--

ALTER SEQUENCE public.carbonator_saving_id_seq OWNED BY public.carbonator_saving.id;


--
-- Name: carbonator_user; Type: TABLE; Schema: public; Owner: carbonator
--

CREATE TABLE public.carbonator_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.carbonator_user OWNER TO carbonator;

--
-- Name: carbonator_user_groups; Type: TABLE; Schema: public; Owner: carbonator
--

CREATE TABLE public.carbonator_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.carbonator_user_groups OWNER TO carbonator;

--
-- Name: carbonator_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: carbonator
--

CREATE SEQUENCE public.carbonator_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carbonator_user_groups_id_seq OWNER TO carbonator;

--
-- Name: carbonator_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carbonator
--

ALTER SEQUENCE public.carbonator_user_groups_id_seq OWNED BY public.carbonator_user_groups.id;


--
-- Name: carbonator_user_id_seq; Type: SEQUENCE; Schema: public; Owner: carbonator
--

CREATE SEQUENCE public.carbonator_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carbonator_user_id_seq OWNER TO carbonator;

--
-- Name: carbonator_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carbonator
--

ALTER SEQUENCE public.carbonator_user_id_seq OWNED BY public.carbonator_user.id;


--
-- Name: carbonator_user_user_permissions; Type: TABLE; Schema: public; Owner: carbonator
--

CREATE TABLE public.carbonator_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.carbonator_user_user_permissions OWNER TO carbonator;

--
-- Name: carbonator_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: carbonator
--

CREATE SEQUENCE public.carbonator_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carbonator_user_user_permissions_id_seq OWNER TO carbonator;

--
-- Name: carbonator_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carbonator
--

ALTER SEQUENCE public.carbonator_user_user_permissions_id_seq OWNED BY public.carbonator_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: carbonator
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO carbonator;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: carbonator
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO carbonator;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carbonator
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: carbonator
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO carbonator;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: carbonator
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO carbonator;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carbonator
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: carbonator
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO carbonator;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: carbonator
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO carbonator;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carbonator
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: carbonator
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO carbonator;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: carbonator_appliance id; Type: DEFAULT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_appliance ALTER COLUMN id SET DEFAULT nextval('public.carbonator_appliance_id_seq'::regclass);


--
-- Name: carbonator_cost id; Type: DEFAULT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_cost ALTER COLUMN id SET DEFAULT nextval('public.carbonator_cost_id_seq'::regclass);


--
-- Name: carbonator_saving id; Type: DEFAULT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_saving ALTER COLUMN id SET DEFAULT nextval('public.carbonator_saving_id_seq'::regclass);


--
-- Name: carbonator_user id; Type: DEFAULT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_user ALTER COLUMN id SET DEFAULT nextval('public.carbonator_user_id_seq'::regclass);


--
-- Name: carbonator_user_groups id; Type: DEFAULT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_user_groups ALTER COLUMN id SET DEFAULT nextval('public.carbonator_user_groups_id_seq'::regclass);


--
-- Name: carbonator_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.carbonator_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: carbonator
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: carbonator
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: carbonator
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add appliance	7	add_appliance
26	Can change appliance	7	change_appliance
27	Can delete appliance	7	delete_appliance
28	Can view appliance	7	view_appliance
29	Can add saving	8	add_saving
30	Can change saving	8	change_saving
31	Can delete saving	8	delete_saving
32	Can view saving	8	view_saving
33	Can add cost	9	add_cost
34	Can change cost	9	change_cost
35	Can delete cost	9	delete_cost
36	Can view cost	9	view_cost
\.


--
-- Data for Name: carbonator_appliance; Type: TABLE DATA; Schema: public; Owner: carbonator
--

COPY public.carbonator_appliance (id, name, watts, "typicalDuration") FROM stdin;
1	LED Light	10.00	30
2	Kettle	2400.00	4
3	TV LED 70"	180.00	60
4	Dishwasher	1000.00	90
5	Toaster	750.00	3
6	Dehumidifier	1500.00	60
7	Microwave	800.00	5
8	Oven	2400.00	30
9	Hob Cooker Induction	2000.00	15
10	Washing Machine	1000.00	60
11	Dryer	3000.00	90
12	Laptop Computer	30.00	60
13	Desktop Computer	60.00	60
14	Generic Appliance	1000.00	60
\.


--
-- Data for Name: carbonator_cost; Type: TABLE DATA; Schema: public; Owner: carbonator
--

COPY public.carbonator_cost (id, money, "moneyUnit", co2e, trees, user_id) FROM stdin;
1	0.3150	Euro	0.40	0.0025	4
\.


--
-- Data for Name: carbonator_saving; Type: TABLE DATA; Schema: public; Owner: carbonator
--

COPY public.carbonator_saving (id, "timestamp", "energySaved", appliance_id, saver_id, "deleteFlag") FROM stdin;
336	2021-05-10 08:45:51.132+00	0.00	1	2	f
337	2021-05-10 08:46:58.728+00	0.00	1	2	f
338	2021-05-10 08:49:01.821+00	0.00	1	2	f
339	2021-05-10 08:50:27.232+00	0.00	1	2	f
340	2021-05-10 08:52:26.617+00	0.00	1	2	f
341	2021-05-10 08:53:24.567+00	0.00	1	2	f
342	2021-05-10 08:53:33.296+00	0.00	1	2	f
343	2021-05-10 08:53:37.687+00	1.50	4	2	f
345	2021-05-10 08:55:08.516+00	1.50	4	2	f
347	2021-05-10 08:57:38.837+00	1.50	4	2	f
348	2021-05-10 08:57:42.984+00	1.50	4	2	f
349	2021-05-10 08:59:39.069+00	1.50	4	2	f
350	2021-05-10 09:00:09.315+00	1.50	6	2	f
351	2021-05-10 09:00:57.799+00	1.50	6	2	f
352	2021-05-10 09:01:25.361+00	1.50	6	2	f
353	2021-05-10 09:04:43.358+00	1.50	6	2	f
354	2021-05-10 09:04:59.633+00	0.00	1	2	f
355	2021-05-10 09:05:01.766+00	0.00	1	2	f
356	2021-05-10 09:05:31.156+00	0.00	1	2	f
357	2021-05-10 09:05:33.465+00	0.00	1	2	f
358	2021-05-10 09:05:34.528+00	0.00	1	2	f
359	2021-05-10 09:05:35.2+00	0.00	1	2	f
360	2021-05-10 09:05:35.782+00	0.00	1	2	f
361	2021-05-10 09:05:36.704+00	0.00	1	2	f
362	2021-05-10 09:05:40.215+00	0.04	5	2	f
363	2021-05-10 09:05:41.213+00	0.04	5	2	f
365	2021-05-10 09:05:43.111+00	0.04	5	2	f
366	2021-05-10 09:05:43.968+00	0.04	5	2	f
367	2021-05-10 09:05:46.711+00	0.04	5	2	f
368	2021-05-10 09:05:47.801+00	0.04	5	2	f
369	2021-05-10 09:05:48.39+00	0.04	5	2	f
370	2021-05-10 09:05:49.503+00	0.04	5	2	f
371	2021-05-10 09:06:11.623+00	0.04	5	2	f
372	2021-05-10 09:06:13.748+00	0.04	5	2	f
373	2021-05-10 09:06:14.595+00	0.04	5	2	f
374	2021-05-10 09:06:19.616+00	0.04	5	2	f
375	2021-05-10 09:06:20.152+00	0.04	5	2	f
376	2021-05-10 09:06:20.664+00	0.04	5	2	f
377	2021-05-10 09:06:25.758+00	1.20	8	2	f
378	2021-05-10 09:06:27.4+00	1.20	8	2	f
379	2021-05-10 09:06:28.017+00	1.20	8	2	f
380	2021-05-10 09:06:29.683+00	1.20	8	2	f
382	2021-05-10 09:06:31.861+00	1.20	8	2	f
383	2021-05-10 09:06:33.136+00	1.20	8	2	f
384	2021-05-10 09:06:33.694+00	1.20	8	2	f
385	2021-05-10 09:06:48.339+00	1.20	8	2	f
386	2021-05-10 09:06:50.035+00	1.20	8	2	f
387	2021-05-10 09:06:50.631+00	1.20	8	2	f
388	2021-05-10 09:06:53.798+00	1.20	8	2	f
389	2021-05-10 09:07:00.425+00	2.40	8	2	f
390	2021-05-10 09:07:02.118+00	2.40	8	2	f
392	2021-05-10 09:08:22.966+00	0.00	1	2	f
393	2021-05-10 09:08:32.171+00	1.20	7	2	f
394	2021-05-10 09:35:36.782+00	1.20	7	2	f
395	2021-05-10 09:38:13.802+00	1.20	7	2	f
396	2021-05-10 09:38:16.655+00	1.20	7	2	f
397	2021-05-10 09:38:38.01+00	1.20	7	2	f
398	2021-05-10 14:36:17.975+00	1.50	9	2	f
399	2021-05-10 22:05:52.204+00	0.07	7	2	f
400	2021-05-17 09:47:55.737329+00	0.00	1	2	f
401	2021-06-03 16:25:38.855018+00	0.12	13	1	f
402	2021-06-03 16:25:38.873957+00	0.48	2	6	f
403	2021-06-03 16:25:38.880676+00	0.18	3	8	f
404	2021-06-03 16:25:38.887992+00	0.18	13	5	f
405	2021-06-03 16:25:38.894099+00	2.00	10	5	f
406	2021-06-03 16:25:38.901014+00	0.32	2	3	f
407	2021-06-03 16:25:38.90679+00	13.50	11	7	f
408	2021-06-03 16:25:38.911164+00	0.18	13	10	f
409	2021-06-03 16:25:38.917937+00	0.20	7	8	f
410	2021-06-03 16:25:38.92366+00	0.20	7	7	f
411	2021-06-03 16:25:54.777862+00	2.40	8	11	f
412	2021-06-03 16:25:54.807626+00	3.00	6	5	f
413	2021-06-03 16:25:54.821873+00	0.06	13	1	f
414	2021-06-03 16:25:54.83528+00	1.00	9	8	f
415	2021-06-03 16:25:54.845645+00	0.32	2	9	f
416	2021-06-03 16:25:54.855192+00	4.50	4	5	f
417	2021-06-03 16:25:54.866603+00	1.20	8	9	f
418	2021-06-03 16:25:54.879923+00	0.50	9	10	f
419	2021-06-03 16:25:54.894245+00	1.50	6	4	f
420	2021-06-03 16:25:54.905934+00	0.02	1	5	f
421	2021-06-03 16:25:54.91629+00	3.00	10	11	f
422	2021-06-03 16:25:54.927907+00	0.20	7	2	f
423	2021-06-03 16:25:54.939061+00	0.16	2	9	f
424	2021-06-03 16:25:54.948401+00	1.00	9	7	f
425	2021-06-03 16:25:54.958436+00	0.00	1	2	f
426	2021-06-03 16:25:54.968726+00	0.11	5	2	f
427	2021-06-03 16:25:54.983397+00	0.36	3	8	f
428	2021-06-03 16:25:54.99339+00	0.20	7	10	f
429	2021-06-03 16:25:55.006361+00	0.06	12	2	f
430	2021-06-03 16:25:55.016107+00	0.16	2	10	f
431	2021-06-03 16:25:55.027739+00	3.60	8	11	f
432	2021-06-03 16:25:55.040089+00	4.50	4	9	f
433	2021-06-03 16:25:55.0527+00	3.00	6	5	f
434	2021-06-03 16:25:55.063536+00	1.00	9	2	f
435	2021-06-03 16:25:55.074244+00	0.50	9	7	f
436	2021-06-03 16:25:55.085359+00	4.50	11	11	f
437	2021-06-03 16:25:55.096777+00	1.00	9	6	f
438	2021-06-03 16:25:55.106023+00	0.48	2	11	f
439	2021-06-03 16:25:55.111972+00	0.48	2	11	f
440	2021-06-03 16:25:55.117731+00	0.09	12	1	f
441	2021-06-03 16:25:55.123785+00	3.00	6	5	f
442	2021-06-03 16:25:55.128948+00	0.02	1	1	f
443	2021-06-03 16:25:55.134516+00	3.60	8	11	f
444	2021-06-03 16:25:55.139959+00	0.06	12	10	f
445	2021-06-03 16:25:55.145054+00	13.50	11	11	f
446	2021-06-03 16:25:55.151541+00	0.03	12	2	f
447	2021-06-03 16:25:55.158276+00	0.20	7	2	f
448	2021-06-03 16:25:55.164523+00	0.06	12	8	f
449	2021-06-03 16:25:55.170561+00	0.18	3	3	f
450	2021-06-03 16:25:55.176571+00	3.00	6	1	f
451	2021-06-03 16:25:55.182382+00	1.00	10	7	f
452	2021-06-03 16:25:55.188216+00	2.00	10	4	f
453	2021-06-03 16:25:55.193981+00	0.09	12	10	f
454	2021-06-03 16:25:55.20778+00	4.50	11	3	f
455	2021-06-03 16:25:55.216343+00	0.06	13	1	f
456	2021-06-03 16:25:55.223559+00	0.12	13	7	f
457	2021-06-03 16:25:55.228647+00	3.60	8	8	f
458	2021-06-03 16:25:55.235232+00	1.20	8	2	f
459	2021-06-03 16:25:55.242006+00	0.12	13	7	f
460	2021-06-03 16:25:55.247234+00	1.20	8	11	f
461	2021-06-03 16:25:55.25467+00	0.32	2	9	f
462	2021-06-03 16:25:55.260369+00	1.00	9	8	f
463	2021-06-03 16:25:55.267382+00	3.60	8	10	f
464	2021-06-03 16:25:55.273301+00	4.50	11	6	f
465	2021-06-03 16:25:55.278593+00	1.00	9	9	f
466	2021-06-03 16:25:55.284999+00	0.06	12	5	f
467	2021-06-03 16:25:55.290217+00	13.50	11	10	f
468	2021-06-03 16:25:55.295253+00	1.50	6	11	f
469	2021-06-03 16:25:55.301116+00	3.60	8	2	f
470	2021-06-03 16:25:55.306971+00	0.01	1	11	f
471	2021-06-03 16:25:55.311636+00	0.11	5	5	f
472	2021-06-03 16:25:55.320302+00	3.00	6	5	f
473	2021-06-03 16:25:55.327192+00	0.06	13	1	f
474	2021-06-03 16:25:55.334737+00	0.48	2	8	f
475	2021-06-03 16:25:55.340189+00	1.00	10	2	f
476	2021-06-03 16:25:55.346412+00	4.50	4	6	f
477	2021-06-03 16:25:55.351947+00	0.18	3	5	f
478	2021-06-03 16:25:55.357851+00	1.00	10	2	f
479	2021-06-03 16:25:55.36511+00	3.00	4	9	f
480	2021-06-03 16:25:55.370473+00	0.06	13	10	f
481	2021-06-03 16:25:55.376933+00	9.00	11	6	f
482	2021-06-03 16:25:55.383092+00	0.36	3	3	f
483	2021-06-03 16:25:55.389153+00	0.20	7	9	f
484	2021-06-03 16:25:55.408947+00	0.07	7	4	f
485	2021-06-03 16:25:55.425541+00	0.03	12	10	f
486	2021-06-03 16:25:55.434158+00	2.40	8	11	f
487	2021-06-03 16:25:55.442889+00	0.11	5	5	f
488	2021-06-03 16:25:55.4508+00	1.20	8	6	f
489	2021-06-03 16:25:55.458042+00	0.02	1	9	f
490	2021-06-03 16:25:55.463743+00	9.00	11	6	f
491	2021-06-03 16:25:55.481518+00	0.00	1	11	f
492	2021-06-03 16:25:55.495598+00	0.36	3	2	f
493	2021-06-03 16:25:55.503827+00	0.13	7	11	f
494	2021-06-03 16:25:55.509961+00	1.20	8	1	f
495	2021-06-03 16:25:55.51708+00	0.18	3	4	f
496	2021-06-03 16:25:55.523938+00	1.50	9	1	f
497	2021-06-03 16:25:55.529322+00	0.11	5	9	f
498	2021-06-03 16:25:55.536986+00	4.50	11	4	f
499	2021-06-03 16:25:55.54367+00	3.00	4	5	f
500	2021-06-03 16:25:55.551626+00	0.06	13	2	f
501	2021-06-03 16:25:55.557053+00	0.13	7	1	f
502	2021-06-03 16:25:55.56334+00	1.50	9	2	f
503	2021-06-03 16:25:55.57076+00	0.36	3	1	f
504	2021-06-03 16:25:55.575796+00	0.04	5	8	f
505	2021-06-03 16:25:55.582846+00	0.11	5	8	f
506	2021-06-03 16:25:55.604115+00	0.08	5	7	f
507	2021-06-03 16:25:55.614513+00	3.00	6	1	f
508	2021-06-03 16:25:55.624164+00	2.40	8	10	f
509	2021-06-03 16:25:55.630226+00	1.00	9	7	f
510	2021-06-03 16:25:55.636109+00	1.50	6	2	f
511	2021-06-07 15:03:54.635075+00	1.00	14	4	f
\.


--
-- Data for Name: carbonator_user; Type: TABLE DATA; Schema: public; Owner: carbonator
--

COPY public.carbonator_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
5	pbkdf2_sha256$216000$ob79iFrVefbX$U0LwyIvDsnQuCylNLm8JG02IS1N7tAs+ObWnU523aLk=	2021-05-04 08:53:59.125+00	f	delta			delta@mail.com	f	t	2021-05-04 08:53:58.96+00
6	pbkdf2_sha256$216000$LZRpuxEt8d3c$Ig+qEsjgaVw2YybhlMhi8mrB4xrK2b2+DDzgMvrwC/M=	2021-05-06 12:20:20.796+00	f	epsilon			epsilon@mail.com	f	t	2021-05-04 08:54:23.482+00
7	pbkdf2_sha256$216000$846XixUeOOh8$7lriJ8RuMEOLA7J3OuSEaTGdrBtdzMhy1X7LHzQfUs8=	2021-05-05 08:08:59.946+00	f	zeta			zeta@mail.com	f	t	2021-05-04 08:54:53.021+00
8	pbkdf2_sha256$216000$7wndM1uT6020$kiskxqsf04SPuZ4MQ3iv5J8dJqRxJ3pa7VvXxRaVBUU=	2021-05-04 08:55:13.264+00	f	eta			eta@mail.com	f	t	2021-05-04 08:55:13.119+00
9	pbkdf2_sha256$216000$bJcJ8GRKGVXW$DcVrV/TkB1usm3DkxcQJLziU/nQshpo6YBTy2+bmaMA=	2021-05-04 08:55:28.367+00	f	iota			iota@mail.com	f	t	2021-05-04 08:55:28.152+00
10	pbkdf2_sha256$216000$3BDueSoovL3y$de+EVr51b4oOikTQ7TIBfvmxs6A5tSX5bSlwnIChcX4=	2021-05-04 10:24:35.612+00	f	kappa			kappa@mail.com	f	t	2021-05-04 09:06:05.44+00
11	pbkdf2_sha256$216000$z8gHYDadRpQ9$Ha0JGh2g8VJORTy6bMfwbM530L4uPzGdt/LX+3fBxdM=	2021-05-04 10:09:24.968+00	f	lambda			lambda@mail.com	f	t	2021-05-04 10:09:24.823+00
3	pbkdf2_sha256$216000$nAs9Wl2dL4FK$8dbluwrjULCElxiuzaiaqMhN3MeL6xnnwUj47rGq+y0=	2021-06-04 14:55:53.059104+00	f	beta			beta@mail.com	f	t	2021-04-30 08:39:04.756+00
2	pbkdf2_sha256$216000$AD8q5986iOKs$Ij7SG421eaPuOOQsxUOvfMfCmzKWKz/jHwDLmePgC5Q=	2021-06-04 15:26:25.857605+00	f	alpha			alpha@mail.com	f	t	2021-04-21 07:57:09.739+00
1	pbkdf2_sha256$216000$3ftFUz4BcXXf$jieJj4NKyJZTro7T//Ucwfyk0K6wsQKIvav4pBl/Gf4=	2021-06-07 14:46:29.737784+00	t	superduper				t	t	2021-04-21 07:43:22.769+00
4	pbkdf2_sha256$216000$CFtxbrXLGRWq$pLg9+IxBQst5LmK286r5uN8jyw7pkT1poVgY6hr9gf4=	2021-06-07 14:47:38.853473+00	f	gamma			gamma@mail.com	f	t	2021-05-03 05:28:46.171+00
\.


--
-- Data for Name: carbonator_user_groups; Type: TABLE DATA; Schema: public; Owner: carbonator
--

COPY public.carbonator_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: carbonator_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: carbonator
--

COPY public.carbonator_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: carbonator
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-04-21 07:53:40.227+00	1	Kettle 2000 w 4 min	1	[{"added": {}}]	7	1
2	2021-04-21 07:54:03.447+00	2	LED Light 10 w 1 min	1	[{"added": {}}]	7	1
3	2021-04-21 08:01:27.173+00	1	Kettle 2400.00 w 4 min	2	[{"changed": {"fields": ["Watts"]}}]	7	1
4	2021-04-21 08:01:57.188+00	1	LED Light 10 w 30 min	2	[{"changed": {"fields": ["Name", "Watts", "TypicalDuration"]}}]	7	1
5	2021-04-21 08:02:12.181+00	2	Kettle 2400 w 4 min	2	[{"changed": {"fields": ["Name", "Watts", "TypicalDuration"]}}]	7	1
6	2021-05-03 10:33:08.308+00	1	Cost object (1)	1	[{"added": {}}]	9	1
7	2021-05-03 10:53:18.639+00	2	Cost object (2)	1	[{"added": {}}]	9	1
8	2021-05-03 10:53:45.834+00	2	Cost object (2)	3		9	1
9	2021-05-04 08:15:21.746+00	3	LED TV 70" 180 w 60 min	1	[{"added": {}}]	7	1
10	2021-05-04 08:18:50.876+00	4	Dishwasher 1000 w 90 min	1	[{"added": {}}]	7	1
11	2021-05-04 08:19:35.463+00	5	Toaster 750 w 3 min	1	[{"added": {}}]	7	1
12	2021-05-04 08:20:57.074+00	6	Dehumidifier 1500 w 60 min	1	[{"added": {}}]	7	1
13	2021-05-04 08:21:28.805+00	3	TV LED 70" 180.00 w 60 min	2	[{"changed": {"fields": ["Name"]}}]	7	1
14	2021-05-04 08:22:32.751+00	7	Microwave 800 w 5 min	1	[{"added": {}}]	7	1
15	2021-05-04 08:23:40.639+00	8	Oven 2400 w 30 min	1	[{"added": {}}]	7	1
16	2021-05-04 08:26:22.785+00	9	Hob Cooker Induction 2000 w 15 min	1	[{"added": {}}]	7	1
17	2021-05-04 08:32:32.484+00	10	Washing Machine 1000 w 60 min	1	[{"added": {}}]	7	1
18	2021-05-04 08:40:35.845+00	11	Dryer 3000 w 90 min	1	[{"added": {}}]	7	1
19	2021-05-04 08:44:00.714+00	12	Laptop Computer 30 w 60 min	1	[{"added": {}}]	7	1
20	2021-05-04 08:44:12.762+00	13	Desktop Computer 60 w 60 min	1	[{"added": {}}]	7	1
21	2021-05-04 10:11:57.934+00	122	10800.00 kwh on 2021-05-04 12:10:40.485880 Laptop Computer	3		8	1
22	2021-05-04 10:11:57.938+00	121	64800.00 kwh on 2021-05-04 12:10:40.478018 TV LED 70"	3		8	1
23	2021-05-04 10:11:57.941+00	120	28800.00 kwh on 2021-05-04 12:10:40.469443 Desktop Computer	3		8	1
24	2021-05-04 10:11:57.945+00	119	16200.00 kwh on 2021-05-04 12:10:40.461825 Laptop Computer	3		8	1
25	2021-05-04 10:11:57.947+00	118	270000.00 kwh on 2021-05-04 12:10:40.454742 Dryer	3		8	1
26	2021-05-04 10:11:57.95+00	117	18000.00 kwh on 2021-05-04 12:10:40.447625 Toaster	3		8	1
27	2021-05-04 10:11:57.953+00	116	600000.00 kwh on 2021-05-04 12:10:40.438309 Washing Machine	3		8	1
28	2021-05-04 10:11:57.955+00	115	900.00 kwh on 2021-05-04 12:10:40.431269 LED Light	3		8	1
29	2021-05-04 10:11:57.958+00	114	67200.00 kwh on 2021-05-04 12:10:40.424634 Kettle	3		8	1
30	2021-05-04 10:11:57.961+00	113	14400.00 kwh on 2021-05-04 12:10:40.407283 Laptop Computer	3		8	1
31	2021-05-04 10:11:57.965+00	112	40000.00 kwh on 2021-05-04 12:10:02.016619 Microwave	3		8	1
32	2021-05-04 10:11:57.967+00	111	120000.00 kwh on 2021-05-04 12:10:02.009522 Hob Cooker Induction	3		8	1
33	2021-05-04 10:11:57.97+00	110	360000.00 kwh on 2021-05-04 12:10:02.005135 Oven	3		8	1
34	2021-05-04 10:11:57.975+00	109	810000.00 kwh on 2021-05-04 12:10:02.000783 Dehumidifier	3		8	1
35	2021-05-04 10:11:57.978+00	108	22500.00 kwh on 2021-05-04 12:10:01.992935 Toaster	3		8	1
36	2021-05-04 10:11:57.985+00	107	86400.00 kwh on 2021-05-04 12:10:01.983853 TV LED 70"	3		8	1
37	2021-05-04 10:11:57.994+00	106	10800.00 kwh on 2021-05-04 12:10:01.974142 Laptop Computer	3		8	1
38	2021-05-04 10:11:57.997+00	105	1500.00 kwh on 2021-05-04 12:10:01.966659 LED Light	3		8	1
39	2021-05-04 10:11:57.999+00	104	9000.00 kwh on 2021-05-04 12:10:01.950870 Toaster	3		8	1
40	2021-05-04 10:11:58.003+00	103	90000.00 kwh on 2021-05-04 12:10:01.916826 Dehumidifier	3		8	1
41	2021-05-04 10:11:58.01+00	102	9000.00 kwh on 2021-05-04 12:09:57.967977 Laptop Computer	3		8	1
42	2021-05-04 10:11:58.017+00	101	9000.00 kwh on 2021-05-04 12:09:57.963598 Laptop Computer	3		8	1
43	2021-05-04 10:11:58.021+00	100	11250.00 kwh on 2021-05-04 12:09:57.956014 Toaster	3		8	1
44	2021-05-04 10:11:58.026+00	99	90000.00 kwh on 2021-05-04 12:09:57.950536 Hob Cooker Induction	3		8	1
45	2021-05-04 10:11:58.029+00	98	2400.00 kwh on 2021-05-04 12:09:57.945509 LED Light	3		8	1
46	2021-05-04 10:11:58.033+00	97	60000.00 kwh on 2021-05-04 12:09:57.939658 Washing Machine	3		8	1
47	2021-05-04 10:11:58.037+00	96	120000.00 kwh on 2021-05-04 12:09:57.929870 Hob Cooker Induction	3		8	1
48	2021-05-04 10:11:58.042+00	95	64800.00 kwh on 2021-05-04 12:09:57.918179 TV LED 70"	3		8	1
49	2021-05-04 10:11:58.048+00	94	576000.00 kwh on 2021-05-04 12:09:57.903358 Oven	3		8	1
50	2021-05-04 10:11:58.054+00	93	1200.00 kwh on 2021-05-04 12:09:57.851370 LED Light	3		8	1
51	2021-05-04 10:11:58.057+00	92	360000.00 kwh on 2021-05-04 12:09:49.313466 Oven	3		8	1
52	2021-05-04 10:11:58.059+00	91	10800.00 kwh on 2021-05-04 12:09:49.309722 Laptop Computer	3		8	1
53	2021-05-04 10:11:58.065+00	90	900.00 kwh on 2021-05-04 12:09:49.301457 LED Light	3		8	1
54	2021-05-04 10:11:58.067+00	89	1800.00 kwh on 2021-05-04 12:09:49.296293 Laptop Computer	3		8	1
55	2021-05-04 10:11:58.072+00	88	72000.00 kwh on 2021-05-04 12:09:49.284065 Oven	3		8	1
56	2021-05-04 10:11:58.076+00	87	360000.00 kwh on 2021-05-04 12:09:49.275436 Oven	3		8	1
57	2021-05-04 10:11:58.082+00	86	120000.00 kwh on 2021-05-04 12:09:49.266232 Washing Machine	3		8	1
58	2021-05-04 10:11:58.085+00	85	2700.00 kwh on 2021-05-04 12:09:49.257634 LED Light	3		8	1
59	2021-05-04 10:11:58.087+00	84	900000.00 kwh on 2021-05-04 12:09:49.252641 Dehumidifier	3		8	1
60	2021-05-04 10:11:58.093+00	83	300000.00 kwh on 2021-05-04 12:09:49.236898 Hob Cooker Induction	3		8	1
61	2021-05-04 10:11:58.094+00	82	600000.00 kwh on 2021-05-04 12:05:35.138417 Washing Machine	3		8	1
62	2021-05-04 10:11:58.097+00	81	180000.00 kwh on 2021-05-04 12:05:35.134131 Hob Cooker Induction	3		8	1
63	2021-05-04 10:11:58.099+00	80	9000.00 kwh on 2021-05-04 12:05:35.129327 Laptop Computer	3		8	1
64	2021-05-04 10:11:58.101+00	79	900000.00 kwh on 2021-05-04 12:05:35.123370 Dehumidifier	3		8	1
65	2021-05-04 10:11:58.107+00	78	86400.00 kwh on 2021-05-04 12:05:35.116192 TV LED 70"	3		8	1
66	2021-05-04 10:11:58.113+00	77	3600.00 kwh on 2021-05-04 12:05:35.110223 Desktop Computer	3		8	1
67	2021-05-04 10:11:58.115+00	76	2400.00 kwh on 2021-05-04 12:05:35.101736 LED Light	3		8	1
68	2021-05-04 10:11:58.118+00	75	8000.00 kwh on 2021-05-04 12:05:35.091850 Microwave	3		8	1
69	2021-05-04 10:11:58.12+00	74	1500.00 kwh on 2021-05-04 12:05:35.078954 LED Light	3		8	1
70	2021-05-04 10:11:58.122+00	73	97200.00 kwh on 2021-05-04 12:05:35.047261 TV LED 70"	3		8	1
71	2021-05-04 10:11:58.125+00	72	64800.00 kwh on 2021-05-04 12:05:29.119798 TV LED 70"	3		8	1
72	2021-05-04 10:11:58.128+00	71	810000.00 kwh on 2021-05-04 12:05:29.112469 Dishwasher	3		8	1
73	2021-05-04 10:11:58.131+00	70	270000.00 kwh on 2021-05-04 12:05:29.105622 Dryer	3		8	1
74	2021-05-04 10:11:58.134+00	69	3000.00 kwh on 2021-05-04 12:05:29.101383 LED Light	3		8	1
75	2021-05-04 10:11:58.136+00	68	360000.00 kwh on 2021-05-04 12:05:29.095581 Washing Machine	3		8	1
76	2021-05-04 10:11:58.14+00	67	420000.00 kwh on 2021-05-04 12:05:29.090672 Washing Machine	3		8	1
77	2021-05-04 10:11:58.142+00	66	75600.00 kwh on 2021-05-04 12:05:29.084459 TV LED 70"	3		8	1
78	2021-05-04 10:11:58.146+00	65	28000.00 kwh on 2021-05-04 12:05:29.079136 Microwave	3		8	1
79	2021-05-04 10:11:58.16+00	64	480000.00 kwh on 2021-05-04 12:05:29.075030 Washing Machine	3		8	1
80	2021-05-04 10:11:58.162+00	63	900000.00 kwh on 2021-05-04 12:05:29.068600 Dehumidifier	3		8	1
81	2021-05-04 10:11:58.163+00	62	16200.00 kwh on 2021-05-04 12:04:41.397043 Laptop Computer	3		8	1
82	2021-05-04 10:11:58.165+00	61	144000.00 kwh on 2021-05-04 12:04:41.391450 Oven	3		8	1
83	2021-05-04 10:11:58.167+00	60	9000.00 kwh on 2021-05-04 12:04:41.378860 Laptop Computer	3		8	1
84	2021-05-04 10:11:58.171+00	59	72000.00 kwh on 2021-05-04 12:04:41.372457 Oven	3		8	1
85	2021-05-04 10:11:58.174+00	58	540000.00 kwh on 2021-05-04 12:04:41.368026 Dehumidifier	3		8	1
86	2021-05-04 10:11:58.178+00	57	1890000.00 kwh on 2021-05-04 12:04:41.352364 Dryer	3		8	1
87	2021-05-04 10:11:58.184+00	56	504000.00 kwh on 2021-05-04 12:04:41.341099 Oven	3		8	1
88	2021-05-04 10:11:58.187+00	55	86400.00 kwh on 2021-05-04 12:04:41.335792 Kettle	3		8	1
89	2021-05-04 10:11:58.188+00	54	630000.00 kwh on 2021-05-04 12:04:41.323996 Dishwasher	3		8	1
90	2021-05-04 10:11:58.191+00	53	540000.00 kwh on 2021-05-04 12:04:41.308111 Washing Machine	3		8	1
91	2021-05-04 10:11:58.193+00	52	1000.00 kwh on 2021-05-04 09:39:59.360088 LED Light	3		8	1
92	2021-05-04 10:11:58.194+00	51	10.00 kwh on 2021-05-03 07:30:49.863461 LED Light	3		8	1
93	2021-05-04 10:11:58.199+00	50	240000.00 kwh on 2021-05-03 07:28:55.106476 Kettle	3		8	1
94	2021-05-04 10:11:58.202+00	49	10.00 kwh on 2021-05-03 07:28:49.098498 LED Light	3		8	1
95	2021-05-04 10:11:58.204+00	48	10.00 kwh on 2021-05-02 14:10:51.729490 LED Light	3		8	1
96	2021-05-04 10:11:58.207+00	46	1500.00 kwh on 2021-05-01 11:43:17.711757 LED Light	3		8	1
97	2021-05-04 10:11:58.209+00	41	10000.00 kwh on 2021-05-01 09:09:20.319708 LED Light	3		8	1
98	2021-05-04 10:11:58.212+00	40	3000.00 kwh on 2021-04-30 22:47:24.466062 LED Light	3		8	1
99	2021-05-04 10:11:58.215+00	38	48000.00 kwh on 2021-04-30 10:39:23.073317 Kettle	3		8	1
100	2021-05-04 10:11:58.218+00	36	500.00 kwh on 2021-04-29 15:11:41.112230 LED Light	3		8	1
101	2021-05-04 10:11:58.221+00	35	200.00 kwh on 2021-04-29 15:11:35.427881 LED Light	3		8	1
102	2021-05-04 10:11:58.225+00	34	200000.00 kwh on 2021-04-29 15:11:31.371800 Kettle	3		8	1
103	2021-05-04 10:11:58.227+00	33	20000.00 kwh on 2021-04-29 15:11:24.127181 LED Light	3		8	1
104	2021-05-04 10:11:58.23+00	32	1000.00 kwh on 2021-04-29 15:11:16.474146 LED Light	3		8	1
105	2021-05-04 10:11:58.235+00	31	610.00 kwh on 2021-04-25 15:07:32.856548 LED Light	3		8	1
106	2021-05-04 10:11:58.237+00	30	1510.00 kwh on 2021-04-25 15:07:29.361776 LED Light	3		8	1
107	2021-05-04 10:11:58.241+00	29	19200.00 kwh on 2021-04-25 15:02:37.057569 Kettle	3		8	1
108	2021-05-04 10:11:58.244+00	27	38400.00 kwh on 2021-04-25 15:02:22.478211 Kettle	3		8	1
109	2021-05-04 10:11:58.25+00	26	36000.00 kwh on 2021-04-25 15:02:07.850312 Kettle	3		8	1
110	2021-05-04 10:11:58.253+00	25	23430.00 kwh on 2021-04-25 15:02:00.238962 LED Light	3		8	1
111	2021-05-04 10:11:58.256+00	23	180.00 kwh on 2021-04-25 15:01:48.488187 LED Light	3		8	1
112	2021-05-04 10:11:58.258+00	21	50400.00 kwh on 2021-04-25 13:37:04.222178 Kettle	3		8	1
113	2021-05-04 10:11:58.26+00	20	55200.00 kwh on 2021-04-22 14:27:38.802451 Kettle	3		8	1
114	2021-05-04 10:11:58.263+00	18	220.00 kwh on 2021-04-22 14:22:54.870055 LED Light	3		8	1
115	2021-05-04 10:11:58.266+00	17	290400.00 kwh on 2021-04-22 14:22:49.338885 Kettle	3		8	1
116	2021-05-04 10:11:58.268+00	16	194400.00 kwh on 2021-04-22 14:22:42.439196 Kettle	3		8	1
117	2021-05-04 10:11:58.271+00	15	56560.00 kwh on 2021-04-22 14:22:37.922077 LED Light	3		8	1
118	2021-05-04 10:11:58.274+00	14	880.00 kwh on 2021-04-22 14:22:32.992063 LED Light	3		8	1
119	2021-05-04 10:11:58.276+00	13	2560.00 kwh on 2021-04-22 14:22:26.494418 LED Light	3		8	1
120	2021-05-04 10:11:58.279+00	9	28800.00 kwh on 2021-04-21 19:28:50.517521 Kettle	3		8	1
121	2021-05-04 10:14:04.395+00	132	22500.00 kwh on 2021-05-04 12:13:10.195629 Dryer	3		8	1
122	2021-05-04 10:14:04.401+00	131	640.00 kwh on 2021-05-04 12:13:10.190327 Kettle	3		8	1
123	2021-05-04 10:14:04.405+00	130	40500.00 kwh on 2021-05-04 12:13:10.186161 Dryer	3		8	1
124	2021-05-04 10:14:04.409+00	129	6000.00 kwh on 2021-05-04 12:13:10.181899 Dishwasher	3		8	1
125	2021-05-04 10:14:04.414+00	128	2500.00 kwh on 2021-05-04 12:13:10.175742 Hob Cooker Induction	3		8	1
126	2021-05-04 10:14:04.418+00	127	3000.00 kwh on 2021-05-04 12:13:10.171834 Dehumidifier	3		8	1
127	2021-05-04 10:14:04.423+00	126	666.67 kwh on 2021-05-04 12:13:10.166458 Microwave	3		8	1
128	2021-05-04 10:14:04.43+00	125	333.33 kwh on 2021-05-04 12:13:10.162361 Microwave	3		8	1
129	2021-05-04 10:14:04.435+00	124	300.00 kwh on 2021-05-04 12:13:10.157537 Toaster	3		8	1
130	2021-05-04 10:14:04.443+00	123	7500.00 kwh on 2021-05-04 12:13:10.151789 Dehumidifier	3		8	1
131	2021-05-04 12:18:59.668+00	7	Microwave 800.00 w 5 min	2	[]	7	1
132	2021-05-10 08:45:16.648+00	335	0.16 kwh on 2021-05-08 00:00:08.405694 Kettle	3		8	1
133	2021-05-10 08:45:16.655+00	334	0.16 kwh on 2021-05-08 00:00:07.592022 Kettle	3		8	1
134	2021-05-10 08:45:16.658+00	333	0.16 kwh on 2021-05-08 00:00:06.414800 Kettle	3		8	1
135	2021-05-10 08:45:16.661+00	332	0.16 kwh on 2021-05-08 00:00:04.091382 Kettle	3		8	1
136	2021-05-10 08:45:16.664+00	331	0.16 kwh on 2021-05-07 18:36:33.203357 Kettle	3		8	1
137	2021-05-10 08:45:16.667+00	330	6.00 kwh on 2021-05-07 18:35:35.485751 Hob Cooker Induction	3		8	1
138	2021-05-10 08:45:16.67+00	329	66.67 kwh on 2021-05-07 16:01:01.565920 Hob Cooker Induction	3		8	1
139	2021-05-10 08:45:16.672+00	328	6.00 kwh on 2021-05-07 16:00:04.428645 Hob Cooker Induction	3		8	1
140	2021-05-10 08:45:16.675+00	327	1.50 kwh on 2021-05-07 15:59:00.614691 Dehumidifier	3		8	1
141	2021-05-10 08:45:16.676+00	326	1.50 kwh on 2021-05-07 15:58:27.948941 Dehumidifier	3		8	1
142	2021-05-10 08:45:16.679+00	325	1.50 kwh on 2021-05-07 15:54:27.856463 Dehumidifier	3		8	1
143	2021-05-10 08:45:16.683+00	324	1.50 kwh on 2021-05-07 15:54:27.151458 Dehumidifier	3		8	1
144	2021-05-10 08:45:16.686+00	323	1.50 kwh on 2021-05-07 15:54:25.771793 Dehumidifier	3		8	1
145	2021-05-10 08:45:16.689+00	322	1.50 kwh on 2021-05-07 15:54:24.115667 Dehumidifier	3		8	1
146	2021-05-10 08:45:16.691+00	321	1.50 kwh on 2021-05-07 15:54:18.778484 Dehumidifier	3		8	1
147	2021-05-10 08:45:16.695+00	320	1.50 kwh on 2021-05-07 15:53:54.294732 Dehumidifier	3		8	1
148	2021-05-10 08:45:16.697+00	319	1.50 kwh on 2021-05-07 15:52:27.730483 Dehumidifier	3		8	1
149	2021-05-10 08:45:16.699+00	318	1.50 kwh on 2021-05-07 15:52:15.609989 Dehumidifier	3		8	1
150	2021-05-10 08:45:16.701+00	317	1.50 kwh on 2021-05-07 15:52:09.022375 Dehumidifier	3		8	1
151	2021-05-10 08:45:16.703+00	316	1.50 kwh on 2021-05-07 15:50:49.630741 Dehumidifier	3		8	1
152	2021-05-10 08:45:16.706+00	315	1.50 kwh on 2021-05-07 15:50:46.693872 Dehumidifier	3		8	1
153	2021-05-10 08:45:16.709+00	314	1.50 kwh on 2021-05-07 15:50:40.963704 Dehumidifier	3		8	1
154	2021-05-10 08:45:16.715+00	313	0.80 kwh on 2021-05-07 15:46:28.581312 Microwave	3		8	1
155	2021-05-10 08:45:16.718+00	312	0.80 kwh on 2021-05-07 15:46:25.621551 Microwave	3		8	1
156	2021-05-10 08:45:16.72+00	311	0.80 kwh on 2021-05-07 15:45:30.866904 Microwave	3		8	1
157	2021-05-10 08:45:16.722+00	310	0.07 kwh on 2021-05-07 15:45:25.390540 Microwave	3		8	1
158	2021-05-10 08:45:16.724+00	309	0.07 kwh on 2021-05-07 15:45:13.195256 Microwave	3		8	1
159	2021-05-10 08:45:16.729+00	308	9.00 kwh on 2021-05-07 15:43:20.686521 Dryer	3		8	1
160	2021-05-10 08:45:16.732+00	307	9.00 kwh on 2021-05-07 15:42:58.036033 Dryer	3		8	1
161	2021-05-10 08:45:16.735+00	306	9.00 kwh on 2021-05-07 15:42:51.319506 Dryer	3		8	1
162	2021-05-10 08:45:16.737+00	305	4.50 kwh on 2021-05-07 15:41:44.462396 Dryer	3		8	1
163	2021-05-10 08:45:16.741+00	304	0.00 kwh on 2021-05-07 15:41:35.532630 LED Light	3		8	1
164	2021-05-10 08:45:16.744+00	303	37.50 kwh on 2021-05-07 15:39:48.902412 Toaster	3		8	1
165	2021-05-10 08:45:16.746+00	302	0.38 kwh on 2021-05-07 15:39:18.985308 Toaster	3		8	1
166	2021-05-10 08:45:16.748+00	301	1.50 kwh on 2021-05-07 15:37:43.952808 Dehumidifier	3		8	1
167	2021-05-10 08:45:16.75+00	300	1.50 kwh on 2021-05-07 15:37:38.879630 Dehumidifier	3		8	1
168	2021-05-10 08:45:16.754+00	299	0.00 kwh on 2021-05-07 15:37:30.871086 LED Light	3		8	1
169	2021-05-10 08:45:16.756+00	298	0.00 kwh on 2021-05-07 13:53:29.387582 LED Light	3		8	1
170	2021-05-10 08:45:16.758+00	297	0.00 kwh on 2021-05-07 13:53:01.466097 LED Light	3		8	1
171	2021-05-10 08:45:16.761+00	296	0.00 kwh on 2021-05-07 13:52:40.314076 LED Light	3		8	1
172	2021-05-10 08:45:16.765+00	295	0.00 kwh on 2021-05-07 13:50:51.722573 LED Light	3		8	1
173	2021-05-10 08:45:16.772+00	294	0.00 kwh on 2021-05-07 13:49:43.866390 LED Light	3		8	1
174	2021-05-10 08:45:16.774+00	293	0.00 kwh on 2021-05-07 13:48:57.358499 LED Light	3		8	1
175	2021-05-10 08:45:16.776+00	292	0.00 kwh on 2021-05-07 13:44:54.212389 LED Light	3		8	1
176	2021-05-10 08:45:16.781+00	291	0.00 kwh on 2021-05-07 13:34:18.676404 LED Light	3		8	1
177	2021-05-10 08:45:16.786+00	290	0.00 kwh on 2021-05-07 13:33:37.060765 LED Light	3		8	1
178	2021-05-10 08:45:16.789+00	289	0.00 kwh on 2021-05-07 13:19:57.069360 LED Light	3		8	1
179	2021-05-10 08:45:16.795+00	288	0.00 kwh on 2021-05-07 13:18:13.708129 LED Light	3		8	1
180	2021-05-10 08:45:16.798+00	287	0.00 kwh on 2021-05-07 00:07:14.628505 LED Light	3		8	1
181	2021-05-10 08:45:16.8+00	286	0.09 kwh on 2021-05-06 22:11:27.129578 Laptop Computer	3		8	1
182	2021-05-10 08:45:16.802+00	285	0.00 kwh on 2021-05-06 22:03:23.718867 LED Light	3		8	1
183	2021-05-10 08:45:16.804+00	284	0.00 kwh on 2021-05-06 21:59:17.273685 LED Light	3		8	1
184	2021-05-10 08:45:16.806+00	283	0.16 kwh on 2021-05-06 21:54:04.693257 Kettle	3		8	1
185	2021-05-10 08:45:16.808+00	282	0.00 kwh on 2021-05-06 21:53:34.691723 LED Light	3		8	1
186	2021-05-10 08:45:16.811+00	281	0.00 kwh on 2021-05-06 21:48:05.154678 LED Light	3		8	1
187	2021-05-10 08:45:16.814+00	280	0.00 kwh on 2021-05-06 21:48:00.561690 LED Light	3		8	1
188	2021-05-10 08:45:16.816+00	279	1.50 kwh on 2021-05-06 21:46:14.392271 Dehumidifier	3		8	1
189	2021-05-10 08:45:16.822+00	278	1.50 kwh on 2021-05-06 21:43:16.589229 Dehumidifier	3		8	1
190	2021-05-10 08:45:16.825+00	277	1.50 kwh on 2021-05-06 21:42:55.602803 Dehumidifier	3		8	1
191	2021-05-10 08:45:16.829+00	276	0.00 kwh on 2021-05-06 21:21:17.995093 LED Light	3		8	1
192	2021-05-10 08:45:16.831+00	275	0.16 kwh on 2021-05-06 19:43:02.232903 Kettle	3		8	1
193	2021-05-10 08:45:16.834+00	274	0.16 kwh on 2021-05-06 19:42:59.599329 Kettle	3		8	1
194	2021-05-10 08:45:16.836+00	273	0.16 kwh on 2021-05-06 19:42:56.913169 Kettle	3		8	1
195	2021-05-10 08:45:16.839+00	272	0.16 kwh on 2021-05-06 19:41:08.920275 Kettle	3		8	1
196	2021-05-10 08:45:16.841+00	271	0.02 kwh on 2021-05-06 15:15:16.182734 LED Light	3		8	1
197	2021-05-10 08:45:16.85+00	270	0.00 kwh on 2021-05-06 15:15:03.976796 LED Light	3		8	1
198	2021-05-10 08:45:16.855+00	269	10.00 kwh on 2021-05-06 15:06:12.576681 LED Light	3		8	1
199	2021-05-10 08:45:16.858+00	268	10.00 kwh on 2021-05-06 14:56:53.242679 LED Light	3		8	1
200	2021-05-10 08:45:16.86+00	267	10.00 kwh on 2021-05-06 14:44:34.851570 LED Light	3		8	1
201	2021-05-10 08:45:16.866+00	266	10.00 kwh on 2021-05-06 14:44:26.122498 LED Light	3		8	1
202	2021-05-10 08:45:16.869+00	265	10.00 kwh on 2021-05-06 14:42:11.517857 LED Light	3		8	1
203	2021-05-10 08:45:16.871+00	264	10.00 kwh on 2021-05-06 14:40:53.038690 LED Light	3		8	1
204	2021-05-10 08:45:16.874+00	263	10.00 kwh on 2021-05-06 14:38:00.269318 LED Light	3		8	1
205	2021-05-10 08:45:16.88+00	262	10.00 kwh on 2021-05-06 14:36:05.770090 LED Light	3		8	1
206	2021-05-10 08:45:16.882+00	261	10.00 kwh on 2021-05-06 14:35:22.571775 LED Light	3		8	1
207	2021-05-10 08:45:16.885+00	260	10.00 kwh on 2021-05-06 14:35:01.075405 LED Light	3		8	1
208	2021-05-10 08:45:16.89+00	259	10.00 kwh on 2021-05-06 14:34:58.470048 LED Light	3		8	1
209	2021-05-10 08:45:16.892+00	258	10.00 kwh on 2021-05-06 14:29:32.437910 LED Light	3		8	1
210	2021-05-10 08:45:16.894+00	256	10.00 kwh on 2021-05-06 14:22:18.168865 LED Light	3		8	1
211	2021-05-10 08:45:16.896+00	254	10.00 kwh on 2021-05-06 14:20:23.696844 LED Light	3		8	1
212	2021-05-10 08:45:16.898+00	253	10.00 kwh on 2021-05-05 16:53:54.520784 LED Light	3		8	1
213	2021-05-10 08:45:16.9+00	252	10.00 kwh on 2021-05-05 14:07:02.950108 LED Light	3		8	1
214	2021-05-10 08:45:16.902+00	251	10.00 kwh on 2021-05-05 14:06:44.819577 LED Light	3		8	1
215	2021-05-10 08:45:16.905+00	250	10.00 kwh on 2021-05-05 14:05:58.888639 LED Light	3		8	1
216	2021-05-10 08:45:16.907+00	249	10.00 kwh on 2021-05-05 11:31:31.754627 LED Light	3		8	1
217	2021-05-10 08:45:16.91+00	248	10.00 kwh on 2021-05-05 10:57:18.951046 LED Light	3		8	1
218	2021-05-10 08:45:16.912+00	247	10.00 kwh on 2021-05-05 10:50:18.373030 LED Light	3		8	1
219	2021-05-10 08:45:16.914+00	246	10.00 kwh on 2021-05-05 10:49:59.243672 LED Light	3		8	1
220	2021-05-10 08:45:16.916+00	245	10.00 kwh on 2021-05-05 10:45:16.030596 LED Light	3		8	1
221	2021-05-10 08:45:16.918+00	244	10.00 kwh on 2021-05-05 10:44:17.249411 LED Light	3		8	1
222	2021-05-10 08:45:16.921+00	243	800.00 kwh on 2021-05-05 10:38:50.522035 Microwave	3		8	1
223	2021-05-10 08:45:16.923+00	242	10.00 kwh on 2021-05-05 10:16:26.601351 LED Light	3		8	1
224	2021-05-10 08:45:16.926+00	241	10.00 kwh on 2021-05-04 19:07:25.873480 LED Light	3		8	1
225	2021-05-10 08:45:16.928+00	238	10.00 kwh on 2021-05-04 18:05:09.793285 LED Light	3		8	1
226	2021-05-10 08:45:16.93+00	235	100.00 kwh on 2021-05-04 17:47:56.064336 LED Light	3		8	1
227	2021-05-10 08:45:16.932+00	232	13500.00 kwh on 2021-05-04 12:15:13.415850 Dryer	3		8	1
228	2021-05-10 08:45:16.934+00	231	15.00 kwh on 2021-05-04 12:15:13.411236 LED Light	3		8	1
229	2021-05-10 08:45:16.936+00	230	15.00 kwh on 2021-05-04 12:15:13.407087 LED Light	3		8	1
230	2021-05-10 08:45:16.939+00	229	360.00 kwh on 2021-05-04 12:15:13.401555 TV LED 70"	3		8	1
231	2021-05-10 08:45:16.941+00	228	3000.00 kwh on 2021-05-04 12:15:13.395475 Dehumidifier	3		8	1
232	2021-05-10 08:45:16.943+00	227	9000.00 kwh on 2021-05-04 12:15:13.389730 Dryer	3		8	1
233	2021-05-10 08:45:16.945+00	226	3000.00 kwh on 2021-05-04 12:15:13.385501 Dishwasher	3		8	1
234	2021-05-10 08:45:16.948+00	225	9000.00 kwh on 2021-05-04 12:15:13.378245 Dryer	3		8	1
235	2021-05-10 08:45:16.95+00	224	10.00 kwh on 2021-05-04 12:15:13.373564 LED Light	3		8	1
236	2021-05-10 08:45:16.952+00	223	30.00 kwh on 2021-05-04 12:15:13.369342 Laptop Computer	3		8	1
237	2021-05-10 08:45:16.956+00	222	60.00 kwh on 2021-05-04 12:15:13.359495 Desktop Computer	3		8	1
238	2021-05-10 08:45:16.961+00	221	1000.00 kwh on 2021-05-04 12:15:13.355137 Hob Cooker Induction	3		8	1
239	2021-05-10 08:45:16.964+00	220	1500.00 kwh on 2021-05-04 12:15:13.350823 Dehumidifier	3		8	1
240	2021-05-10 08:45:16.966+00	219	13500.00 kwh on 2021-05-04 12:15:13.346012 Dryer	3		8	1
241	2021-05-10 08:45:16.968+00	218	1000.00 kwh on 2021-05-04 12:15:13.341467 Washing Machine	3		8	1
242	2021-05-10 08:45:16.97+00	217	160.00 kwh on 2021-05-04 12:15:13.336412 Kettle	3		8	1
243	2021-05-10 08:45:16.972+00	216	3000.00 kwh on 2021-05-04 12:15:13.331250 Washing Machine	3		8	1
244	2021-05-10 08:45:16.988+00	215	480.00 kwh on 2021-05-04 12:15:13.326558 Kettle	3		8	1
245	2021-05-10 08:45:16.99+00	214	37.50 kwh on 2021-05-04 12:15:13.322789 Toaster	3		8	1
246	2021-05-10 08:45:16.992+00	212	3000.00 kwh on 2021-05-04 12:15:13.311773 Dehumidifier	3		8	1
247	2021-05-10 08:45:16.994+00	210	112.50 kwh on 2021-05-04 12:15:13.301738 Toaster	3		8	1
248	2021-05-10 08:45:16.999+00	209	60.00 kwh on 2021-05-04 12:15:13.298057 Laptop Computer	3		8	1
249	2021-05-10 08:45:17.001+00	208	180.00 kwh on 2021-05-04 12:15:13.290898 Desktop Computer	3		8	1
250	2021-05-10 08:45:17.003+00	207	3600.00 kwh on 2021-05-04 12:15:13.285931 Oven	3		8	1
251	2021-05-10 08:45:17.006+00	206	500.00 kwh on 2021-05-04 12:15:13.281842 Hob Cooker Induction	3		8	1
252	2021-05-10 08:45:17.009+00	205	4500.00 kwh on 2021-05-04 12:15:13.276831 Dishwasher	3		8	1
253	2021-05-10 08:45:17.011+00	204	75.00 kwh on 2021-05-04 12:15:13.271240 Toaster	3		8	1
254	2021-05-10 08:45:17.013+00	203	320.00 kwh on 2021-05-04 12:15:13.267371 Kettle	3		8	1
255	2021-05-10 08:45:17.015+00	202	75.00 kwh on 2021-05-04 12:15:13.262848 Toaster	3		8	1
256	2021-05-10 08:45:17.018+00	201	90.00 kwh on 2021-05-04 12:15:13.257264 Laptop Computer	3		8	1
257	2021-05-10 08:45:17.02+00	200	1500.00 kwh on 2021-05-04 12:15:13.250630 Hob Cooker Induction	3		8	1
258	2021-05-10 08:45:17.023+00	199	320.00 kwh on 2021-05-04 12:15:13.245678 Kettle	3		8	1
259	2021-05-10 08:45:17.026+00	198	13500.00 kwh on 2021-05-04 12:15:13.238974 Dryer	3		8	1
260	2021-05-10 08:45:17.029+00	197	5.00 kwh on 2021-05-04 12:15:13.235163 LED Light	3		8	1
261	2021-05-10 08:45:17.032+00	196	1500.00 kwh on 2021-05-04 12:15:13.230954 Dishwasher	3		8	1
262	2021-05-10 08:45:17.034+00	195	1500.00 kwh on 2021-05-04 12:15:13.226960 Dehumidifier	3		8	1
263	2021-05-10 08:45:17.037+00	194	3000.00 kwh on 2021-05-04 12:15:13.221545 Dishwasher	3		8	1
264	2021-05-10 08:45:17.04+00	193	13500.00 kwh on 2021-05-04 12:15:13.217467 Dryer	3		8	1
265	2021-05-10 08:45:17.044+00	192	160.00 kwh on 2021-05-04 12:15:13.213297 Kettle	3		8	1
266	2021-05-10 08:45:17.047+00	191	3000.00 kwh on 2021-05-04 12:15:13.208995 Washing Machine	3		8	1
267	2021-05-10 08:45:17.053+00	190	540.00 kwh on 2021-05-04 12:15:13.203598 TV LED 70"	3		8	1
268	2021-05-10 08:45:17.056+00	189	540.00 kwh on 2021-05-04 12:15:13.198214 TV LED 70"	3		8	1
269	2021-05-10 08:45:17.058+00	188	2000.00 kwh on 2021-05-04 12:15:13.193794 Washing Machine	3		8	1
270	2021-05-10 08:45:17.061+00	186	37.50 kwh on 2021-05-04 12:15:13.184756 Toaster	3		8	1
271	2021-05-10 08:45:17.065+00	185	1500.00 kwh on 2021-05-04 12:15:13.179176 Dehumidifier	3		8	1
272	2021-05-10 08:45:17.067+00	184	15.00 kwh on 2021-05-04 12:15:13.172468 LED Light	3		8	1
273	2021-05-10 08:45:17.07+00	183	1500.00 kwh on 2021-05-04 12:15:13.168484 Dehumidifier	3		8	1
274	2021-05-10 08:45:17.072+00	182	1000.00 kwh on 2021-05-04 12:15:13.163613 Washing Machine	3		8	1
275	2021-05-10 08:45:17.075+00	181	66.67 kwh on 2021-05-04 12:15:13.160010 Microwave	3		8	1
276	2021-05-10 08:45:17.077+00	180	4500.00 kwh on 2021-05-04 12:15:13.155147 Dehumidifier	3		8	1
277	2021-05-10 08:45:17.081+00	179	4500.00 kwh on 2021-05-04 12:15:13.151235 Dryer	3		8	1
278	2021-05-10 08:45:17.083+00	178	3000.00 kwh on 2021-05-04 12:15:13.144216 Dehumidifier	3		8	1
279	2021-05-10 08:45:17.085+00	177	112.50 kwh on 2021-05-04 12:15:13.140237 Toaster	3		8	1
280	2021-05-10 08:45:17.087+00	176	120.00 kwh on 2021-05-04 12:15:13.134855 Desktop Computer	3		8	1
281	2021-05-10 08:45:17.09+00	175	30.00 kwh on 2021-05-04 12:15:13.129404 Laptop Computer	3		8	1
282	2021-05-10 08:45:17.092+00	174	2400.00 kwh on 2021-05-04 12:15:13.124389 Oven	3		8	1
283	2021-05-10 08:45:17.094+00	173	180.00 kwh on 2021-05-04 12:15:13.119029 TV LED 70"	3		8	1
284	2021-05-10 08:45:17.097+00	172	112.50 kwh on 2021-05-04 12:15:13.113003 Toaster	3		8	1
285	2021-05-10 08:45:17.098+00	171	112.50 kwh on 2021-05-04 12:15:13.108248 Toaster	3		8	1
286	2021-05-10 08:45:17.1+00	170	360.00 kwh on 2021-05-04 12:15:13.101940 TV LED 70"	3		8	1
287	2021-05-10 08:45:17.127+00	169	1000.00 kwh on 2021-05-04 12:15:13.095305 Washing Machine	3		8	1
288	2021-05-10 08:45:17.131+00	168	5.00 kwh on 2021-05-04 12:15:13.090536 LED Light	3		8	1
289	2021-05-10 08:45:17.133+00	167	500.00 kwh on 2021-05-04 12:15:13.085136 Hob Cooker Induction	3		8	1
290	2021-05-10 08:45:17.135+00	166	180.00 kwh on 2021-05-04 12:15:13.080257 TV LED 70"	3		8	1
291	2021-05-10 08:45:17.137+00	165	30.00 kwh on 2021-05-04 12:15:13.075720 Laptop Computer	3		8	1
292	2021-05-10 08:45:17.139+00	164	4500.00 kwh on 2021-05-04 12:15:13.069035 Dehumidifier	3		8	1
293	2021-05-10 08:45:17.142+00	163	1500.00 kwh on 2021-05-04 12:15:13.063322 Dishwasher	3		8	1
294	2021-05-10 08:45:17.144+00	162	1500.00 kwh on 2021-05-04 12:15:13.059062 Hob Cooker Induction	3		8	1
295	2021-05-10 08:45:17.146+00	161	320.00 kwh on 2021-05-04 12:15:13.053766 Kettle	3		8	1
296	2021-05-10 08:45:17.149+00	160	60.00 kwh on 2021-05-04 12:15:13.048950 Laptop Computer	3		8	1
297	2021-05-10 08:45:17.151+00	159	3000.00 kwh on 2021-05-04 12:15:13.043208 Dishwasher	3		8	1
298	2021-05-10 08:45:17.157+00	158	1000.00 kwh on 2021-05-04 12:15:13.036210 Washing Machine	3		8	1
299	2021-05-10 08:45:17.165+00	157	120.00 kwh on 2021-05-04 12:15:13.031165 Desktop Computer	3		8	1
300	2021-05-10 08:45:17.168+00	156	4500.00 kwh on 2021-05-04 12:15:13.024585 Dishwasher	3		8	1
301	2021-05-10 08:45:17.17+00	155	180.00 kwh on 2021-05-04 12:15:13.017908 Desktop Computer	3		8	1
302	2021-05-10 08:45:17.173+00	154	180.00 kwh on 2021-05-04 12:15:13.012671 TV LED 70"	3		8	1
303	2021-05-10 08:45:17.176+00	153	10.00 kwh on 2021-05-04 12:15:13.003520 LED Light	3		8	1
304	2021-05-10 08:45:17.178+00	152	4500.00 kwh on 2021-05-04 12:15:12.999766 Dishwasher	3		8	1
305	2021-05-10 08:45:17.196+00	151	3000.00 kwh on 2021-05-04 12:15:12.995725 Dehumidifier	3		8	1
306	2021-05-10 08:45:17.198+00	150	37.50 kwh on 2021-05-04 12:15:12.991618 Toaster	3		8	1
307	2021-05-10 08:45:17.2+00	149	1000.00 kwh on 2021-05-04 12:15:12.987120 Hob Cooker Induction	3		8	1
308	2021-05-10 08:45:17.202+00	148	2000.00 kwh on 2021-05-04 12:15:12.982205 Washing Machine	3		8	1
309	2021-05-10 08:45:17.205+00	147	15.00 kwh on 2021-05-04 12:15:12.977192 LED Light	3		8	1
310	2021-05-10 08:45:17.207+00	146	180.00 kwh on 2021-05-04 12:15:12.972726 TV LED 70"	3		8	1
311	2021-05-10 08:45:17.209+00	145	4500.00 kwh on 2021-05-04 12:15:12.968831 Dryer	3		8	1
312	2021-05-10 08:45:17.211+00	144	13500.00 kwh on 2021-05-04 12:15:12.963791 Dryer	3		8	1
313	2021-05-10 08:45:17.213+00	143	1000.00 kwh on 2021-05-04 12:15:12.959694 Washing Machine	3		8	1
314	2021-05-10 08:45:17.215+00	142	1500.00 kwh on 2021-05-04 12:15:12.954469 Hob Cooker Induction	3		8	1
315	2021-05-10 08:45:17.218+00	141	180.00 kwh on 2021-05-04 12:15:12.949706 TV LED 70"	3		8	1
316	2021-05-10 08:45:17.222+00	140	1000.00 kwh on 2021-05-04 12:15:12.941512 Washing Machine	3		8	1
317	2021-05-10 08:45:17.225+00	139	1000.00 kwh on 2021-05-04 12:15:12.934113 Washing Machine	3		8	1
318	2021-05-10 08:45:17.229+00	138	1200.00 kwh on 2021-05-04 12:15:12.926565 Oven	3		8	1
319	2021-05-10 08:45:17.234+00	137	200.00 kwh on 2021-05-04 12:15:12.918212 Microwave	3		8	1
320	2021-05-10 08:45:17.237+00	136	60.00 kwh on 2021-05-04 12:15:12.909765 Laptop Computer	3		8	1
321	2021-05-10 08:45:17.241+00	135	160.00 kwh on 2021-05-04 12:15:12.903841 Kettle	3		8	1
322	2021-05-10 08:45:17.245+00	134	1200.00 kwh on 2021-05-04 12:15:12.890736 Oven	3		8	1
323	2021-05-10 08:45:17.249+00	133	1500.00 kwh on 2021-05-04 12:15:12.883218 Hob Cooker Induction	3		8	1
324	2021-06-07 10:09:42.51251+00	14	Generic Appliance 1000 w 60 min	1	[{"added": {}}]	7	1
325	2021-06-07 14:44:21.492162+00	1	Cost object (1)	2	[{"changed": {"fields": ["Trees"]}}]	9	1
326	2021-06-07 14:44:30.551001+00	1	Cost object (1)	2	[{"changed": {"fields": ["Trees"]}}]	9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: carbonator
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	carbonator	user
7	carbonator	appliance
8	carbonator	saving
9	carbonator	cost
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: carbonator
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-05-17 09:27:26.609082+00
2	contenttypes	0002_remove_content_type_name	2021-05-17 09:27:26.620328+00
3	auth	0001_initial	2021-05-17 09:27:26.676867+00
4	auth	0002_alter_permission_name_max_length	2021-05-17 09:27:26.719202+00
5	auth	0003_alter_user_email_max_length	2021-05-17 09:27:26.727182+00
6	auth	0004_alter_user_username_opts	2021-05-17 09:27:26.73469+00
7	auth	0005_alter_user_last_login_null	2021-05-17 09:27:26.742007+00
8	auth	0006_require_contenttypes_0002	2021-05-17 09:27:26.752795+00
9	auth	0007_alter_validators_add_error_messages	2021-05-17 09:27:26.76638+00
10	auth	0008_alter_user_username_max_length	2021-05-17 09:27:26.776175+00
11	auth	0009_alter_user_last_name_max_length	2021-05-17 09:27:26.783315+00
12	auth	0010_alter_group_name_max_length	2021-05-17 09:27:26.790862+00
13	auth	0011_update_proxy_permissions	2021-05-17 09:27:26.799764+00
14	auth	0012_alter_user_first_name_max_length	2021-05-17 09:27:26.816288+00
15	carbonator	0001_initial	2021-05-17 09:27:26.894918+00
16	admin	0001_initial	2021-05-17 09:27:26.959855+00
17	admin	0002_logentry_remove_auto_add	2021-05-17 09:27:26.978726+00
18	admin	0003_logentry_add_action_flag_choices	2021-05-17 09:27:26.989532+00
19	carbonator	0002_saving_deleteflag	2021-05-17 09:27:27.004955+00
20	carbonator	0003_cost	2021-05-17 09:27:27.031536+00
21	carbonator	0004_auto_20210503_1433	2021-05-17 09:27:27.053472+00
22	carbonator	0005_auto_20210504_1117	2021-05-17 09:27:27.088236+00
23	carbonator	0006_auto_20210504_1139	2021-05-17 09:27:27.104462+00
24	carbonator	0007_auto_20210517_1127	2021-05-17 09:27:27.119057+00
25	sessions	0001_initial	2021-05-17 09:27:27.14336+00
26	carbonator	0008_auto_20210607_1656	2021-06-07 14:56:47.914591+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: carbonator
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
09qdfs7hkysbo4plpn2z7gzweopxgqhn	.eJxVjMsOwiAQRf-FtSGWNy7d-w1kGAapGkhKuzL-uzTpQrfnnHvfLMC2lrB1WsKc2IVJdvplEfBJdRfpAfXeOLa6LnPke8IP2_mtJXpdj_bvoEAvY511tBpx8gqMM-QFOJW0sIPK6CkqtNa7CdWgWZH12mSUUZ3BaJ1IsM8X4OI3xg:1lf0hD:r0l11itl162iqUELoWZQmV899S-GslSQF09r514hLjg	2021-05-21 13:39:11.013+00
0kqepchgfrlg2x183zekk618t7pxt2xe	.eJxVjMsOwiAQRf-FtSEgb5fu-w1kYAapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKM7MIcO_1uCfKD2g7wDu3Wee5tXebEd4UfdPCpIz2vh_t3UGHUby2CNJSzh4ReCWWUtM4KIX0BcFgQtLKWfDL5XILyJkhlUWdypCFoY9j7A9nxN4M:1leCaZ:awffeAGjD8b1FUWqwh7u38pjhS4sZrq4uqaehc_6hsI	2021-05-19 08:08:59.949+00
1hdd16fxjn6smtmubzz6j69wml5nhisp	.eJxVjMsOwiAQRf-FtSHQkUdduvcbyAwMUjWQlHZl_HfbpAvd3nPOfYuA61LC2nkOUxIXMYjT70YYn1x3kB5Y703GVpd5Irkr8qBd3lri1_Vw_w4K9rLVigF1zMzIzmTMWZvBW_KMLqMj9OYMlEgnD9aCV5C2wtA4kuUMRonPFxuxOMQ:1lbIZx:x4BtRa3u5wF2E1CeFs_-PT4SZOkMOGCt-_TxkWiK7BA	2021-05-11 05:56:21.571+00
1uce2r8bp51am2o1hwolp7qtrdus82j0	.eJxVjMsOwiAQRf-FtSHQkUdduvcbyAwMUjWQlHZl_HfbpAvd3nPOfYuA61LC2nkOUxIXMYjT70YYn1x3kB5Y703GVpd5Irkr8qBd3lri1_Vw_w4K9rLVigF1zMzIzmTMWZvBW_KMLqMj9OYMlEgnD9aCV5C2wtA4kuUMRonPFxuxOMQ:1ldCo4:UAWssOtwjE6LSXktUgc0Wxe96ByjQvJBUaDlmrksHcA	2021-05-16 12:10:48.927+00
2vmcclhylpa2hflew5jhsrn35jm3s3xv	.eJxVjMsOwiAQRf-FtSGWNy7d-w1kGAapGkhKuzL-uzTpQrfnnHvfLMC2lrB1WsKc2IVJdvplEfBJdRfpAfXeOLa6LnPke8IP2_mtJXpdj_bvoEAvY511tBpx8gqMM-QFOJW0sIPK6CkqtNa7CdWgWZH12mSUUZ3BaJ1IsM8X4OI3xg:1lclci:hIJlR9kQ4r-hmAycIfrnM2y9CGrAlGDfHv3P1qsEcfw	2021-05-15 07:09:16.104+00
5nazxe00gd3rn2azr1pudh0kx2wg87hu	.eJxVjMsOwiAQRf-FtSHQkUdduvcbyAwMUjWQlHZl_HfbpAvd3nPOfYuA61LC2nkOUxIXMYjT70YYn1x3kB5Y703GVpd5Irkr8qBd3lri1_Vw_w4K9rLVigF1zMzIzmTMWZvBW_KMLqMj9OYMlEgnD9aCV5C2wtA4kuUMRonPFxuxOMQ:1lZZeO:J_hZXCiSr2I-DGpeUNYx0RfwVunpbNxTHSRh4jCTeKo	2021-05-06 11:45:48.671+00
6m4f7zdc2wud9oy8lts3a0cwj7j74056	.eJxVjMsOwiAQRf-FtSHQkUdduvcbyAwMUjWQlHZl_HfbpAvd3nPOfYuA61LC2nkOUxIXMYjT70YYn1x3kB5Y703GVpd5Irkr8qBd3lri1_Vw_w4K9rLVigF1zMzIzmTMWZvBW_KMLqMj9OYMlEgnD9aCV5C2wtA4kuUMRonPFxuxOMQ:1laewQ:Rx7HHT2HrKSAqARmyogBiQevwFeJhM-rTfZbv3e3sKI	2021-05-09 11:36:54.85+00
94w4xzckug4t5udpmz1wn021msnicj74	.eJxVjMsOwiAQRf-FtSHQkUdduvcbyAwMUjWQlHZl_HfbpAvd3nPOfYuA61LC2nkOUxIXMYjT70YYn1x3kB5Y703GVpd5Irkr8qBd3lri1_Vw_w4K9rLVigF1zMzIzmTMWZvBW_KMLqMj9OYMlEgnD9aCV5C2wtA4kuUMRonPFxuxOMQ:1lh5TS:fVgxhZR_FyiUVXNK_H7CZTjU6BdjSAYpGKVeYn8lC6g	2021-05-27 07:09:34.682+00
9g0eiwjg1jlkpwdm47tinuz68n6kfron	.eJxVjDsOwjAQBe_iGln-xD9K-pwh2vUuOIBsKU4qxN0hUgpo38y8l5hgW8u0dV6mmcRZaHH63RDyg-sO6A711mRudV1mlLsiD9rl2Iifl8P9OyjQy7c2Pl3ZRMNGscnW28CosvJOJ6fQIgzoKKZAJhBpyIkHUMphYiZMLor3B9eAN_8:1ldu0m:tM8iOcWbdJETO7ZqphFt-NLQkLEkzz3pkM93apxDaXo	2021-05-18 12:18:48.427+00
9u3uibj4ywjjpd06al56muq9a5motypj	.eJxVjMsOwiAQRf-FtSHQkUdduvcbyAwMUjWQlHZl_HfbpAvd3nPOfYuA61LC2nkOUxIXMYjT70YYn1x3kB5Y703GVpd5Irkr8qBd3lri1_Vw_w4K9rLVigF1zMzIzmTMWZvBW_KMLqMj9OYMlEgnD9aCV5C2wtA4kuUMRonPFxuxOMQ:1lZ9gm:-OLsBo1Zx2goq_2ILs_Ctxoefjeq1Evsj3YXVDEIguo	2021-05-05 08:02:32.954+00
9yso5d49ztsyvr6newik7ccnrjv8b7mi	.eJxVjMsOwiAQRf-FtSHQkUdduvcbyAwMUjWQlHZl_HfbpAvd3nPOfYuA61LC2nkOUxIXMYjT70YYn1x3kB5Y703GVpd5Irkr8qBd3lri1_Vw_w4K9rLVigF1zMzIzmTMWZvBW_KMLqMj9OYMlEgnD9aCV5C2wtA4kuUMRonPFxuxOMQ:1laNwK:JmatNHTptj4JeqNsHs0qavNwfanbzByMUliPzeRB9uU	2021-05-08 17:27:40.217+00
cofqgfnsfj2u61oiyhzgpq4zgox9wi31	.eJxVjMsOwiAQRf-FtSHQkUdduvcbyAwMUjWQlHZl_HfbpAvd3nPOfYuA61LC2nkOUxIXMYjT70YYn1x3kB5Y703GVpd5Irkr8qBd3lri1_Vw_w4K9rLVigF1zMzIzmTMWZvBW_KMLqMj9OYMlEgnD9aCV5C2wtA4kuUMRonPFxuxOMQ:1lg1Xx:8_Q7KIHiEG9dqSrD3aKUs2-F17nEd3Lthmu2GMia9RA	2021-05-24 08:45:49.031+00
k1vv4eidbmn57mgh5wgizb5144ve8dd6	.eJxVjMsOwiAQRf-FtSGWNy7d-w1kGAapGkhKuzL-uzTpQrfnnHvfLMC2lrB1WsKc2IVJdvplEfBJdRfpAfXeOLa6LnPke8IP2_mtJXpdj_bvoEAvY511tBpx8gqMM-QFOJW0sIPK6CkqtNa7CdWgWZH12mSUUZ3BaJ1IsM8X4OI3xg:1lcQY4:9U2QclhwTB0OBx1RGuW2S1YJGv2G4cEqdAvswFY8Oqk	2021-05-14 08:39:04.918+00
mp78rv1gvjhbtcdnmaf0su95fo8aeykw	.eJxVjMsOwiAQRf-FtSHQkUdduvcbyAwMUjWQlHZl_HfbpAvd3nPOfYuA61LC2nkOUxIXMYjT70YYn1x3kB5Y703GVpd5Irkr8qBd3lri1_Vw_w4K9rLVigF1zMzIzmTMWZvBW_KMLqMj9OYMlEgnD9aCV5C2wtA4kuUMRonPFxuxOMQ:1layNX:WlUQjE85XXF0hYud3Q519iE6YiYGhvzA507NDkncwg4	2021-05-10 08:22:11.202+00
pdeim2hm5xad59jyfqvybq7lpuiyhi78	.eJxVjMsOwiAUBf-FtSFCL7S4dN9vIPdBpWogKe3K-O_apAvdnpkzLxVxW3PcWlriLOqivDr9boT8SGUHcsdyq5prWZeZ9K7ogzY9VknP6-H-BTK2vL8BjYTQg3PkOxEA07O33E3fBlju6Wwnh6ZLQzCAzG4QIxPKYAgoePX-AOzLOF4:1leczM:R-DyNfDQg3Oj-_LPyT5ese1TvB4ncmCo-XdL4srzPPI	2021-05-20 12:20:20.8+00
se0f25lvpk22q2wi29ek12pxu0mhmvkv	.eJxVjMsOwiAQRf-FtSHQkUdduvcbyAwMUjWQlHZl_HfbpAvd3nPOfYuA61LC2nkOUxIXMYjT70YYn1x3kB5Y703GVpd5Irkr8qBd3lri1_Vw_w4K9rLVigF1zMzIzmTMWZvBW_KMLqMj9OYMlEgnD9aCV5C2wtA4kuUMRonPFxuxOMQ:1lc2Qs:KxW0kY0LIaJQTuLEZJa77Z1h_jtkQUacZp_5pmEUJvg	2021-05-13 06:54:02.392+00
tv9xigde3w59tmedlcjw1u9fceqm5son	.eJxVjMsOwiAQRf-FtSHQkUdduvcbyAwMUjWQlHZl_HfbpAvd3nPOfYuA61LC2nkOUxIXMYjT70YYn1x3kB5Y703GVpd5Irkr8qBd3lri1_Vw_w4K9rLVigF1zMzIzmTMWZvBW_KMLqMj9OYMlEgnD9aCV5C2wtA4kuUMRonPFxuxOMQ:1lZpmK:desdrH1FIyt1Ie8tRcpA-9y1WIHfp0vBxW1TEKUMt7c	2021-05-07 04:59:04.809+00
ukis8yq2qcy9pti1hb0n4z41fd43bctg	.eJxVjDsOwjAQBe_iGlnxN2tK-pzBWnsXHEC2FCcV4u4QKQW0b2beS0Tc1hK3zkucSZyFFqffLWF-cN0B3bHemsytrsuc5K7Ig3Y5NeLn5XD_Dgr28q2TUyk7shZdYApuRMeardEIWXlgB9mMCTRrE0B7SMMVg6dAdsgKEMX7A-Z1N-A:1lht5G:EsJprDrbcyPsrs5ZrmiVQy4ui_qLUkpX6syEkIAwItQ	2021-05-29 12:07:54.929+00
w5f0wmm8bngyt04vcia9pwspdp7732ek	.eJxVjE0OwiAYBe_C2hCgINSl-56BfD8gVQNJaVfGu2uTLnT7Zua9RIRtLXHraYkzi4uw4vS7IdAj1R3wHeqtSWp1XWaUuyIP2uXUOD2vh_t3UKCXb604Gx61CgSQARHJcA6MPJ4JdHDWoIbsvEmDQkqZrWE3BJ-tHxxqEu8PJ-U5QA:1lda5d:kB7MNHBZDkPOiH7sqIAPIdC8CrVABIVqdFy5ucIj7gY	2021-05-17 15:02:29.628+00
wx6gp1waw9w4vuzeqj4xzbizidg5xf16	.eJxVjMsOwiAQRf-FtSHQkUdduvcbyAwMUjWQlHZl_HfbpAvd3nPOfYuA61LC2nkOUxIXMYjT70YYn1x3kB5Y703GVpd5Irkr8qBd3lri1_Vw_w4K9rLVigF1zMzIzmTMWZvBW_KMLqMj9OYMlEgnD9aCV5C2wtA4kuUMRonPFxuxOMQ:1lc1AN:Hr-vv4Vej0gfVBgOMxvb2XAG5aBwCLPii30d4C2dwkg	2021-05-13 05:32:55.678+00
eqbhrirgyla1kq2avblgard9zvn1ozcl	.eJxVjMEOwiAQRP-FsyHLoit49O43EJYFqRqalPZk_HfbpAe9zGHem3mrEJe5hqXnKQyiLgrV4bfjmJ65bUAesd1HncY2TwPrTdE77fo2Sn5dd_fvoMZe13UhNB4tMRFnEiRj_dkRnSw5MIkBsECBdCTn14iUisHEGZ1YESD1-QKzEjcR:1lif2Z:W3SQ51dr9x-t4GLmZFxJEi4qgBcAiKYB9--jPfq8bp8	2021-05-31 15:20:19.490132+00
f22u7em2zyh56mb1kqrl3wizvk0fwdpw	.eJxVjMEOwiAQRP-FsyHLoit49O43EJYFqRqalPZk_HfbpAe9zGHem3mrEJe5hqXnKQyiLgrV4bfjmJ65bUAesd1HncY2TwPrTdE77fo2Sn5dd_fvoMZe13UhNB4tMRFnEiRj_dkRnSw5MIkBsECBdCTn14iUisHEGZ1YESD1-QKzEjcR:1liuMm:BayxMF6noqsLY78EOcetIER4iAau90siPQ-wQiLC6y8	2021-06-01 07:42:12.957972+00
ewuapfflcursrz5i1jbv37ivo3n1labo	.eJxVjMEOwiAQRP-FsyHLoit49O43EJYFqRqalPZk_HfbpAe9zGHem3mrEJe5hqXnKQyiLgrV4bfjmJ65bUAesd1HncY2TwPrTdE77fo2Sn5dd_fvoMZe13UhNB4tMRFnEiRj_dkRnSw5MIkBsECBdCTn14iUisHEGZ1YESD1-QKzEjcR:1lorc9:bpgNGzS-9OAz3uiWjxDqH8nzTESHRA4ENvWTDQNq15E	2021-06-17 17:58:41.0948+00
qgdax6jaxen6mbdz7awe6lnhj3mixlz6	.eJxVjE0OwiAYBe_C2hCgINSl-56BfD8gVQNJaVfGu2uTLnT7Zua9RIRtLXHraYkzi4uw4vS7IdAj1R3wHeqtSWp1XWaUuyIP2uXUOD2vh_t3UKCXb604Gx61CgSQARHJcA6MPJ4JdHDWoIbsvEmDQkqZrWE3BJ-tHxxqEu8PJ-U5QA:1lqGXS:R_vYFqC0Uy9HhoKrDPAxjksoYooMQKGIxMoAxLiDYRg	2021-06-21 14:47:38.85659+00
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carbonator
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carbonator
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carbonator
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: carbonator_appliance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carbonator
--

SELECT pg_catalog.setval('public.carbonator_appliance_id_seq', 14, true);


--
-- Name: carbonator_cost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carbonator
--

SELECT pg_catalog.setval('public.carbonator_cost_id_seq', 1, true);


--
-- Name: carbonator_saving_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carbonator
--

SELECT pg_catalog.setval('public.carbonator_saving_id_seq', 513, true);


--
-- Name: carbonator_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carbonator
--

SELECT pg_catalog.setval('public.carbonator_user_groups_id_seq', 1, false);


--
-- Name: carbonator_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carbonator
--

SELECT pg_catalog.setval('public.carbonator_user_id_seq', 11, true);


--
-- Name: carbonator_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carbonator
--

SELECT pg_catalog.setval('public.carbonator_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carbonator
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 326, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carbonator
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carbonator
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 26, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: carbonator_appliance carbonator_appliance_pkey; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_appliance
    ADD CONSTRAINT carbonator_appliance_pkey PRIMARY KEY (id);


--
-- Name: carbonator_cost carbonator_cost_pkey; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_cost
    ADD CONSTRAINT carbonator_cost_pkey PRIMARY KEY (id);


--
-- Name: carbonator_cost carbonator_cost_user_id_24a2d610_uniq; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_cost
    ADD CONSTRAINT carbonator_cost_user_id_24a2d610_uniq UNIQUE (user_id);


--
-- Name: carbonator_saving carbonator_saving_pkey; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_saving
    ADD CONSTRAINT carbonator_saving_pkey PRIMARY KEY (id);


--
-- Name: carbonator_user_groups carbonator_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_user_groups
    ADD CONSTRAINT carbonator_user_groups_pkey PRIMARY KEY (id);


--
-- Name: carbonator_user_groups carbonator_user_groups_user_id_group_id_2ae91110_uniq; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_user_groups
    ADD CONSTRAINT carbonator_user_groups_user_id_group_id_2ae91110_uniq UNIQUE (user_id, group_id);


--
-- Name: carbonator_user carbonator_user_pkey; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_user
    ADD CONSTRAINT carbonator_user_pkey PRIMARY KEY (id);


--
-- Name: carbonator_user_user_permissions carbonator_user_user_per_user_id_permission_id_98dff715_uniq; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_user_user_permissions
    ADD CONSTRAINT carbonator_user_user_per_user_id_permission_id_98dff715_uniq UNIQUE (user_id, permission_id);


--
-- Name: carbonator_user_user_permissions carbonator_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_user_user_permissions
    ADD CONSTRAINT carbonator_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: carbonator_user carbonator_user_username_key; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_user
    ADD CONSTRAINT carbonator_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: carbonator
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: carbonator
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: carbonator
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: carbonator
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: carbonator_saving_appliance_id_6547f560; Type: INDEX; Schema: public; Owner: carbonator
--

CREATE INDEX carbonator_saving_appliance_id_6547f560 ON public.carbonator_saving USING btree (appliance_id);


--
-- Name: carbonator_saving_saver_id_c8b9b32b; Type: INDEX; Schema: public; Owner: carbonator
--

CREATE INDEX carbonator_saving_saver_id_c8b9b32b ON public.carbonator_saving USING btree (saver_id);


--
-- Name: carbonator_user_groups_group_id_6b556ef3; Type: INDEX; Schema: public; Owner: carbonator
--

CREATE INDEX carbonator_user_groups_group_id_6b556ef3 ON public.carbonator_user_groups USING btree (group_id);


--
-- Name: carbonator_user_groups_user_id_0cf90671; Type: INDEX; Schema: public; Owner: carbonator
--

CREATE INDEX carbonator_user_groups_user_id_0cf90671 ON public.carbonator_user_groups USING btree (user_id);


--
-- Name: carbonator_user_user_permissions_permission_id_893761f7; Type: INDEX; Schema: public; Owner: carbonator
--

CREATE INDEX carbonator_user_user_permissions_permission_id_893761f7 ON public.carbonator_user_user_permissions USING btree (permission_id);


--
-- Name: carbonator_user_user_permissions_user_id_60fdb754; Type: INDEX; Schema: public; Owner: carbonator
--

CREATE INDEX carbonator_user_user_permissions_user_id_60fdb754 ON public.carbonator_user_user_permissions USING btree (user_id);


--
-- Name: carbonator_user_username_f03cdf14_like; Type: INDEX; Schema: public; Owner: carbonator
--

CREATE INDEX carbonator_user_username_f03cdf14_like ON public.carbonator_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: carbonator
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: carbonator
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: carbonator
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: carbonator
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carbonator_cost carbonator_cost_user_id_24a2d610_fk_carbonator_user_id; Type: FK CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_cost
    ADD CONSTRAINT carbonator_cost_user_id_24a2d610_fk_carbonator_user_id FOREIGN KEY (user_id) REFERENCES public.carbonator_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carbonator_saving carbonator_saving_appliance_id_6547f560_fk_carbonato; Type: FK CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_saving
    ADD CONSTRAINT carbonator_saving_appliance_id_6547f560_fk_carbonato FOREIGN KEY (appliance_id) REFERENCES public.carbonator_appliance(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carbonator_saving carbonator_saving_saver_id_c8b9b32b_fk_carbonator_user_id; Type: FK CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_saving
    ADD CONSTRAINT carbonator_saving_saver_id_c8b9b32b_fk_carbonator_user_id FOREIGN KEY (saver_id) REFERENCES public.carbonator_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carbonator_user_groups carbonator_user_groups_group_id_6b556ef3_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_user_groups
    ADD CONSTRAINT carbonator_user_groups_group_id_6b556ef3_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carbonator_user_groups carbonator_user_groups_user_id_0cf90671_fk_carbonator_user_id; Type: FK CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_user_groups
    ADD CONSTRAINT carbonator_user_groups_user_id_0cf90671_fk_carbonator_user_id FOREIGN KEY (user_id) REFERENCES public.carbonator_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carbonator_user_user_permissions carbonator_user_user_permission_id_893761f7_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_user_user_permissions
    ADD CONSTRAINT carbonator_user_user_permission_id_893761f7_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carbonator_user_user_permissions carbonator_user_user_user_id_60fdb754_fk_carbonato; Type: FK CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.carbonator_user_user_permissions
    ADD CONSTRAINT carbonator_user_user_user_id_60fdb754_fk_carbonato FOREIGN KEY (user_id) REFERENCES public.carbonator_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_carbonator_user_id; Type: FK CONSTRAINT; Schema: public; Owner: carbonator
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_carbonator_user_id FOREIGN KEY (user_id) REFERENCES public.carbonator_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

