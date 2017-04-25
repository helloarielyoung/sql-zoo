--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE customers (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE customers OWNER TO vagrant;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customer_id_seq OWNER TO vagrant;

--
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE customer_id_seq OWNED BY customers.id;


--
-- Name: orderlines; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE orderlines (
    id integer NOT NULL,
    orderid integer,
    productid integer
);


ALTER TABLE orderlines OWNER TO vagrant;

--
-- Name: order_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE order_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_detail_id_seq OWNER TO vagrant;

--
-- Name: order_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE order_detail_id_seq OWNED BY orderlines.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE orders (
    id integer NOT NULL,
    customerid integer,
    order_date date
);


ALTER TABLE orders OWNER TO vagrant;

--
-- Name: order_headers_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE order_headers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_headers_id_seq OWNER TO vagrant;

--
-- Name: order_headers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE order_headers_id_seq OWNED BY orders.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY orderlines ALTER COLUMN id SET DEFAULT nextval('order_detail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('order_headers_id_seq'::regclass);


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('customer_id_seq', 3, true);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY customers (id, name) FROM stdin;
1	Joe
2	Sam
3	mary
\.


--
-- Name: order_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('order_detail_id_seq', 1, true);


--
-- Name: order_headers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('order_headers_id_seq', 2, true);


--
-- Data for Name: orderlines; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY orderlines (id, orderid, productid) FROM stdin;
1	1	1000
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY orders (id, customerid, order_date) FROM stdin;
1	1	2017-01-01
2	2	2017-01-01
\.


--
-- Name: customer_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: order_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY orderlines
    ADD CONSTRAINT order_detail_pkey PRIMARY KEY (id);


--
-- Name: order_headers_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT order_headers_pkey PRIMARY KEY (id);


--
-- Name: order_detail_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY orderlines
    ADD CONSTRAINT order_detail_order_id_fkey FOREIGN KEY (orderid) REFERENCES orders(id);


--
-- Name: order_headers_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT order_headers_customer_id_fkey FOREIGN KEY (customerid) REFERENCES customers(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

