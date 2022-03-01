--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

-- Started on 2021-10-26 13:59:30

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
-- TOC entry 210 (class 1259 OID 16678)
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    name character varying(225) NOT NULL,
    email character varying(225) NOT NULL,
    phone character(191) DEFAULT NULL::bpchar,
    avatar character varying(225) DEFAULT NULL::character varying,
    active smallint DEFAULT 1 NOT NULL,
    password character varying(225) NOT NULL,
    remember_token character varying(100) DEFAULT NULL::character varying,
    address character varying(30) DEFAULT NULL::character varying,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    CONSTRAINT admins_id_check CHECK ((id > 0))
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16677)
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO postgres;

--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 209
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- TOC entry 212 (class 1259 OID 16693)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    cname character varying(225) NOT NULL,
    cslug character varying(225) NOT NULL,
    cicon character(191) DEFAULT NULL::bpchar,
    cactive smallint DEFAULT 1 NOT NULL,
    ctitleseo character varying(225) DEFAULT NULL::character varying,
    cdescriptionseo character varying(225) DEFAULT NULL::character varying,
    ckeywordseo character varying(225) DEFAULT NULL::character varying,
    chome smallint DEFAULT 0 NOT NULL,
    createdat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updatedat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    CONSTRAINT categories_id_check CHECK ((id > 0))
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16692)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 211
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 214 (class 1259 OID 16709)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    ortransactionid integer NOT NULL,
    orproductid integer DEFAULT 0 NOT NULL,
    orqty smallint DEFAULT 0 NOT NULL,
    orprice integer DEFAULT 0 NOT NULL,
    orsale smallint DEFAULT 0 NOT NULL,
    createdat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updatedat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    CONSTRAINT orders_id_check CHECK ((id > 0)),
    CONSTRAINT orders_orproductid_check CHECK ((orproductid > 0)),
    CONSTRAINT orders_ortransactionid_check CHECK ((ortransactionid > 0))
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16708)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 213
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 216 (class 1259 OID 16723)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    ptransactionid integer,
    puserid integer,
    pmoney integer,
    pnote character varying(225) DEFAULT NULL::character varying,
    pvnpresponsecode character varying(255) DEFAULT NULL::character varying,
    pcodevnp character varying(255) DEFAULT NULL::character varying,
    pcodebank character varying(255) DEFAULT NULL::character varying,
    ptime timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    ptransactioncode character varying(30) DEFAULT NULL::character varying,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updatedat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    CONSTRAINT payments_id_check CHECK ((id > 0)),
    CONSTRAINT payments_ptransactionid_check CHECK ((ptransactionid > 0)),
    CONSTRAINT payments_puserid_check CHECK ((puserid > 0))
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16722)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payments_id_seq OWNER TO postgres;

--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 215
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- TOC entry 218 (class 1259 OID 16741)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    proname character varying(225) DEFAULT NULL::character varying,
    proslug character varying(225) NOT NULL,
    procategoryid integer DEFAULT 0 NOT NULL,
    proprice integer DEFAULT 0 NOT NULL,
    proauthorid integer DEFAULT 0 NOT NULL,
    prosale smallint DEFAULT 0 NOT NULL,
    proactive smallint DEFAULT 1 NOT NULL,
    prohot smallint DEFAULT 0 NOT NULL,
    proview integer DEFAULT 0 NOT NULL,
    prodescription character varying(225) DEFAULT NULL::character varying,
    proavatar character varying(225) DEFAULT NULL::character varying,
    prodescriptionseo character varying(225) DEFAULT NULL::character varying,
    prokeywordseo character varying(225) DEFAULT NULL::character varying,
    protitleseo character varying(225) DEFAULT NULL::character varying,
    procontent text,
    propay smallint DEFAULT 0 NOT NULL,
    pronumber smallint DEFAULT 0 NOT NULL,
    prototalrating integer DEFAULT 0 NOT NULL,
    prototalnumber integer DEFAULT 0 NOT NULL,
    createdat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updatedat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    CONSTRAINT products_id_check CHECK ((id > 0)),
    CONSTRAINT products_procategoryid_check CHECK ((procategoryid > 0))
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16740)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 217
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 220 (class 1259 OID 16778)
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    id integer NOT NULL,
    truserid integer DEFAULT 0 NOT NULL,
    trtotal integer DEFAULT 0 NOT NULL,
    trnote character varying(225) DEFAULT NULL::character varying,
    traddress character varying(225) DEFAULT NULL::character varying,
    trphone character varying(225) DEFAULT NULL::character varying,
    trstatus smallint DEFAULT 0 NOT NULL,
    trpayment smallint DEFAULT 0 NOT NULL,
    createdat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updatedat timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    CONSTRAINT transactions_id_check CHECK ((id > 0)),
    CONSTRAINT transactions_truserid_check CHECK ((truserid > 0))
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16777)
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_id_seq OWNER TO postgres;

--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 219
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- TOC entry 222 (class 1259 OID 16796)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(225) NOT NULL,
    email character varying(225) NOT NULL,
    phone character(191) DEFAULT NULL::bpchar,
    avatar character varying(225) DEFAULT NULL::character varying,
    active smallint DEFAULT 1 NOT NULL,
    password character varying(225) NOT NULL,
    remember_token character varying(100) DEFAULT NULL::character varying,
    total_pay integer DEFAULT 0 NOT NULL,
    address character varying(225) DEFAULT NULL::character varying,
    provider character varying(225) DEFAULT NULL::character varying,
    provider_id character varying(225) DEFAULT NULL::character varying,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    CONSTRAINT users_id_check CHECK ((id > 0))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16795)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 221
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3194 (class 2604 OID 16681)
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 16696)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 16712)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 16726)
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 16744)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3257 (class 2604 OID 16781)
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 16799)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3282 (class 2606 OID 16814)
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- TOC entry 3284 (class 2606 OID 16816)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3286 (class 2606 OID 16818)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3288 (class 2606 OID 16820)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 3290 (class 2606 OID 16822)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3292 (class 2606 OID 16824)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 3294 (class 2606 OID 16826)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 16827)
-- Name: orders orders_ibfk_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_ibfk_3 FOREIGN KEY (ortransactionid) REFERENCES public.transactions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3296 (class 2606 OID 16832)
-- Name: orders orders_ibfk_4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_ibfk_4 FOREIGN KEY (orproductid) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3297 (class 2606 OID 16837)
-- Name: payments payments_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_ibfk_1 FOREIGN KEY (ptransactionid) REFERENCES public.transactions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3298 (class 2606 OID 16842)
-- Name: payments payments_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_ibfk_2 FOREIGN KEY (puserid) REFERENCES public.users(id);


--
-- TOC entry 3299 (class 2606 OID 16847)
-- Name: products products_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_ibfk_1 FOREIGN KEY (procategoryid) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2021-10-26 13:59:31

--
-- PostgreSQL database dump complete
--

