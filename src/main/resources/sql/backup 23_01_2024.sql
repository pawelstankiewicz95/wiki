--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-01-23 23:59:40

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
-- TOC entry 215 (class 1259 OID 16589)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255),
    program_id bigint
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16592)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 216
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 217 (class 1259 OID 16593)
-- Name: program; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.program (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.program OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16596)
-- Name: program_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.program_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.program_id_seq OWNER TO postgres;

--
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 218
-- Name: program_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.program_id_seq OWNED BY public.program.id;


--
-- TOC entry 219 (class 1259 OID 16597)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(255),
    user_id bigint
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16600)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_id_seq OWNER TO postgres;

--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 220
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- TOC entry 221 (class 1259 OID 16601)
-- Name: solution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solution (
    id integer NOT NULL,
    user_id bigint,
    subject_id bigint,
    description text,
    time_created timestamp without time zone,
    time_updated timestamp without time zone
);


ALTER TABLE public.solution OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16606)
-- Name: solution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solution_id_seq OWNER TO postgres;

--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 222
-- Name: solution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solution_id_seq OWNED BY public.solution.id;


--
-- TOC entry 223 (class 1259 OID 16607)
-- Name: subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject (
    id integer NOT NULL,
    user_id bigint,
    title character varying(255),
    time_created timestamp without time zone,
    time_updated timestamp without time zone,
    category_id bigint
);


ALTER TABLE public.subject OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16610)
-- Name: subject_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subject_id_seq OWNER TO postgres;

--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 224
-- Name: subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subject_id_seq OWNED BY public.subject.id;


--
-- TOC entry 225 (class 1259 OID 16611)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255),
    password character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16616)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 226
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4659 (class 2604 OID 16617)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 4660 (class 2604 OID 16618)
-- Name: program id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.program ALTER COLUMN id SET DEFAULT nextval('public.program_id_seq'::regclass);


--
-- TOC entry 4661 (class 2604 OID 16619)
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 4662 (class 2604 OID 16620)
-- Name: solution id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solution ALTER COLUMN id SET DEFAULT nextval('public.solution_id_seq'::regclass);


--
-- TOC entry 4663 (class 2604 OID 16621)
-- Name: subject id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject ALTER COLUMN id SET DEFAULT nextval('public.subject_id_seq'::regclass);


--
-- TOC entry 4664 (class 2604 OID 16622)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4826 (class 0 OID 16589)
-- Dependencies: 215
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name, program_id) FROM stdin;
1	Kategoria 1	1
6	Kategoria 5	1
7	Kategoria 4	1
8	Kategoria 3	1
9	Kategoria 2	1
2	Kategoria Drugiego Programu	2
3	Kategoria Trzeciego Programu	3
4	Kategoria Czwartego programu	4
5	Kategoria Piątego Programu	5
\.


--
-- TOC entry 4828 (class 0 OID 16593)
-- Dependencies: 217
-- Data for Name: program; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.program (id, name) FROM stdin;
1	AC
2	FK
3	Sellitem
4	Logifact
5	EDI
\.


--
-- TOC entry 4830 (class 0 OID 16597)
-- Dependencies: 219
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, name, user_id) FROM stdin;
\.


--
-- TOC entry 4832 (class 0 OID 16601)
-- Dependencies: 221
-- Data for Name: solution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solution (id, user_id, subject_id, description, time_created, time_updated) FROM stdin;
1	1	1	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non lorem iaculis, dictum turpis sed, eleifend odio. Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. Nunc lacinia nunc vel aliquet ultricies. Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
2	2	2	Integer pellentesque commodo tortor a consectetur. Proin sit amet vestibulum felis. Ut in metus nec ipsum bibendum consectetur vitae eu nulla. Ut imperdiet risus quis eros blandit aliquet. Nullam faucibus metus in tincidunt laoreet. Integer et pulvinar erat. Cras laoreet elit imperdiet velit mattis consectetur. Proin non tincidunt nunc, ut consequat massa. Quisque risus felis, rutrum posuere felis eu, ornare lacinia enim.	\N	\N
3	3	3	Quisque sed leo orci. Vestibulum in elementum nibh, et cursus leo. Nunc eget augue varius, luctus massa nec, ultrices mi. Aliquam a convallis dui. Aenean ut tincidunt nisl. Nunc dolor nulla, tincidunt in elementum vel, malesuada at neque. In ut nisl magna. Pellentesque at molestie risus, et viverra neque. Cras elementum leo in odio mollis suscipit. Pellentesque sodales eget quam id posuere. Nam fermentum nisl nec lectus consectetur consequat. Nullam venenatis efficitur ante nec auctor. Etiam vitae bibendum dolor, in porta nulla. Aenean imperdiet in urna vitae vehicula.	\N	\N
4	4	4	Nulla vitae lectus quam. Sed ut elit felis. Sed vitae nulla varius, laoreet lectus at, laoreet tellus. Vestibulum congue ultrices turpis, eu vestibulum massa tempor eget. Integer at vulputate lectus, vitae tincidunt felis. Aenean at ipsum vel est convallis congue at in orci. Integer vestibulum pulvinar finibus. Vivamus et diam dolor. Fusce a risus at lectus posuere bibendum. Aenean vel neque tincidunt, sodales magna in, consequat orci. Nam eleifend mi ac elit cursus, at malesuada neque consequat.	\N	\N
5	5	5	Suspendisse semper, elit lacinia molestie dictum, tortor justo auctor justo, at laoreet justo lacus vel libero. Sed facilisis odio tortor, vitae convallis mauris blandit in. Mauris a purus ornare, faucibus lacus ac, bibendum justo. Mauris quis sagittis tellus. Vivamus eget tellus rhoncus, aliquet nunc a, eleifend urna. Duis sit amet euismod purus. Aenean semper condimentum odio eu viverra. Phasellus nec ante diam.	\N	\N
6	\N	66	66Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
7	\N	67	67Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
8	\N	68	68Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
9	\N	69	69Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
10	\N	70	70Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
11	\N	71	71Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
12	\N	72	72Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
13	\N	73	73Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
14	\N	74	74Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
15	\N	75	75Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
16	\N	76	76Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
17	\N	77	77Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
18	\N	78	78Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
19	\N	79	79Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
20	\N	80	80Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
21	\N	81	81Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
22	\N	82	82Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
23	\N	83	83Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
24	\N	84	84Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
25	\N	85	85Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
26	\N	86	86Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
27	\N	87	87Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
28	\N	88	88Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
29	\N	89	89Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
30	\N	90	90Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
31	\N	91	91Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
32	\N	92	92Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
33	\N	93	93Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
34	\N	94	94Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
35	\N	95	95Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
36	\N	96	96Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
37	\N	97	97Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
38	\N	98	98Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
39	\N	99	99Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
40	\N	100	100Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
41	\N	101	101Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
42	\N	102	102Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
43	\N	103	103Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
44	\N	104	104Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
45	\N	105	105Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
46	\N	106	106Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
47	\N	107	107Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
48	\N	108	108Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
49	\N	109	109Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
50	\N	110	110Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n  Donec non lorem iaculis, dictum turpis sed, eleifend odio. \n  Integer nibh nisl, finibus at enim a, scelerisque fringilla nunc. \n  Nunc lacinia nunc vel aliquet ultricies. \n  Sed bibendum, est eu tristique posuere, neque velit rhoncus eros, eget hendrerit mi massa ut velit. \n  Mauris ut nisl sem. Mauris aliquet tincidunt felis, ac ultrices risus hendrerit viverra. \n  Nam porttitor, metus eget dictum feugiat, libero risus eleifend urna, in viverra leo tellus et nunc. \n  Curabitur varius eget massa ac pulvinar. Vivamus ut suscipit sapien, eu laoreet purus. \n  Cras fringilla leo euismod risus iaculis suscipit. Etiam tempus ut turpis nec efficitur. \n  Praesent dapibus odio at turpis gravida, non hendrerit risus convallis. Cras a fermentum elit.	\N	\N
\.


--
-- TOC entry 4834 (class 0 OID 16607)
-- Dependencies: 223
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subject (id, user_id, title, time_created, time_updated, category_id) FROM stdin;
66	\N	Temat Przykładowy 1	\N	\N	1
67	\N	Temat Przykładowy 2	\N	\N	1
68	\N	Temat Przykładowy 3	\N	\N	1
69	\N	Temat Przykładowy 4	\N	\N	1
70	\N	Temat Przykładowy 5	\N	\N	1
4	4	"Jak zrobić to i to"	\N	\N	4
5	5	"Jak zrobić to i to"	\N	\N	5
71	\N	Temat Przykładowy 6	\N	\N	2
72	\N	Temat Przykładowy 7	\N	\N	2
1	1	Rozwiązanie Kategori Pierwszej	\N	\N	1
2	2	"Rozwiązanie Kategori Pierwszej"	\N	\N	2
3	3	Rozwiązanie Trzeciej Kategorii	\N	\N	3
6	1	"Rozwiązanie Kategori Pierwszej"	\N	\N	1
7	1	"Rozwiązanie Kategori Pierwszej"	\N	\N	1
8	1	"Rozwiązanie Kategori Pierwszej"	\N	\N	1
9	1	"Rozwiązanie Kategori Pierwszej"	\N	\N	1
10	1	"Rozwiązanie Kategori Pierwszej"	\N	\N	1
11	1	Rozwiązanie Kategori Drugiej	\N	\N	2
12	1	Rozwiązanie Kategori Drugiej	\N	\N	2
13	1	Rozwiązanie Kategori Drugiej	\N	\N	2
14	1	Rozwiązanie Kategori Drugiej	\N	\N	2
15	1	Rozwiązanie Trzeciej Kategorii	\N	\N	3
73	\N	Temat Przykładowy 8	\N	\N	2
74	\N	Temat Przykładowy 9	\N	\N	2
75	\N	Temat Przykładowy 10	\N	\N	2
76	\N	Temat Przykładowy 11	\N	\N	3
77	\N	Temat Przykładowy 12	\N	\N	3
78	\N	Temat Przykładowy 13	\N	\N	3
79	\N	Temat Przykładowy 14	\N	\N	3
80	\N	Temat Przykładowy 15	\N	\N	3
81	\N	Temat Przykładowy 16	\N	\N	4
82	\N	Temat Przykładowy 17	\N	\N	4
83	\N	Temat Przykładowy 18	\N	\N	4
84	\N	Temat Przykładowy 19	\N	\N	4
85	\N	Temat Przykładowy 20	\N	\N	4
86	\N	Temat Przykładowy 21	\N	\N	5
87	\N	Temat Przykładowy 22	\N	\N	5
88	\N	Temat Przykładowy 23	\N	\N	5
89	\N	Temat Przykładowy 24	\N	\N	5
90	\N	Temat Przykładowy 25	\N	\N	5
91	\N	Temat Przykładowy 26	\N	\N	6
92	\N	Temat Przykładowy 27	\N	\N	6
93	\N	Temat Przykładowy 28	\N	\N	6
94	\N	Temat Przykładowy 29	\N	\N	6
95	\N	Temat Przykładowy 30	\N	\N	6
96	\N	Temat Przykładowy 31	\N	\N	7
97	\N	Temat Przykładowy 32	\N	\N	7
98	\N	Temat Przykładowy 33	\N	\N	7
99	\N	Temat Przykładowy 34	\N	\N	7
100	\N	Temat Przykładowy 35	\N	\N	7
101	\N	Temat Przykładowy 36	\N	\N	8
102	\N	Temat Przykładowy 37	\N	\N	8
103	\N	Temat Przykładowy 38	\N	\N	8
104	\N	Temat Przykładowy 39	\N	\N	8
105	\N	Temat Przykładowy 40	\N	\N	8
106	\N	Temat Przykładowy 41	\N	\N	9
107	\N	Temat Przykładowy 42	\N	\N	9
108	\N	Temat Przykładowy 43	\N	\N	9
109	\N	Temat Przykładowy 44	\N	\N	9
110	\N	Temat Przykładowy 45	\N	\N	9
\.


--
-- TOC entry 4836 (class 0 OID 16611)
-- Dependencies: 225
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, password) FROM stdin;
1	User1	Password1
2	User2	Password2
3	User3	Password3
4	User4	Password4
5	User5	Password5
\.


--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 216
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 21, true);


--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 218
-- Name: program_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.program_id_seq', 5, true);


--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 220
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 1, false);


--
-- TOC entry 4853 (class 0 OID 0)
-- Dependencies: 222
-- Name: solution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solution_id_seq', 50, true);


--
-- TOC entry 4854 (class 0 OID 0)
-- Dependencies: 224
-- Name: subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subject_id_seq', 110, true);


--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 226
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- TOC entry 4666 (class 2606 OID 16624)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 4668 (class 2606 OID 16626)
-- Name: program program_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_pkey PRIMARY KEY (id);


--
-- TOC entry 4670 (class 2606 OID 16628)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 4672 (class 2606 OID 16630)
-- Name: solution solution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solution
    ADD CONSTRAINT solution_pkey PRIMARY KEY (id);


--
-- TOC entry 4674 (class 2606 OID 16632)
-- Name: subject subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);


--
-- TOC entry 4676 (class 2606 OID 16634)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4677 (class 2606 OID 16635)
-- Name: category category_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.program(id);


--
-- TOC entry 4681 (class 2606 OID 16640)
-- Name: subject fk_subject_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT fk_subject_category FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 4678 (class 2606 OID 16645)
-- Name: role role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4679 (class 2606 OID 16650)
-- Name: solution solution_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solution
    ADD CONSTRAINT solution_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(id);


--
-- TOC entry 4680 (class 2606 OID 16655)
-- Name: solution solution_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solution
    ADD CONSTRAINT solution_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4682 (class 2606 OID 16660)
-- Name: subject subject_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2024-01-23 23:59:40

--
-- PostgreSQL database dump complete
--

