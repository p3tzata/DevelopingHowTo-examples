\connect postgres;
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0

-- Started on 2023-11-17 14:38:53 EET

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
-- TOC entry 6 (class 2615 OID 16395)
-- Name: performance_demo; Type: SCHEMA; Schema: -; Owner: admin
--

CREATE SCHEMA performance_demo;


ALTER SCHEMA performance_demo OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16410)
-- Name: order_lines; Type: TABLE; Schema: performance_demo; Owner: admin
--

CREATE TABLE performance_demo.order_lines (
    order_line_id_pk integer NOT NULL,
    order_id_fk integer,
    order_qtty integer
);


ALTER TABLE performance_demo.order_lines OWNER TO admin;

--
-- TOC entry 216 (class 1259 OID 16396)
-- Name: orders; Type: TABLE; Schema: performance_demo; Owner: admin
--

CREATE TABLE performance_demo.orders (
    order_id_pk integer NOT NULL,
    order_code character varying
);


ALTER TABLE performance_demo.orders OWNER TO admin;

--
-- TOC entry 218 (class 1259 OID 24611)
-- Name: warehouses; Type: TABLE; Schema: performance_demo; Owner: admin
--

CREATE TABLE performance_demo.warehouses (
    warehouse_name character varying,
    warehouse_time timestamp without time zone
);


ALTER TABLE performance_demo.warehouses OWNER TO admin;

--
-- TOC entry 3360 (class 0 OID 16410)
-- Dependencies: 217
-- Data for Name: order_lines; Type: TABLE DATA; Schema: performance_demo; Owner: admin
--



--
-- TOC entry 3359 (class 0 OID 16396)
-- Dependencies: 216
-- Data for Name: orders; Type: TABLE DATA; Schema: performance_demo; Owner: admin
--



--
-- TOC entry 3361 (class 0 OID 24611)
-- Dependencies: 218
-- Data for Name: warehouses; Type: TABLE DATA; Schema: performance_demo; Owner: admin
--



--
-- TOC entry 3214 (class 2606 OID 16433)
-- Name: order_lines order_lines_pk; Type: CONSTRAINT; Schema: performance_demo; Owner: admin
--

ALTER TABLE ONLY performance_demo.order_lines
    ADD CONSTRAINT order_lines_pk PRIMARY KEY (order_line_id_pk);


--
-- TOC entry 3212 (class 2606 OID 16402)
-- Name: orders orders_pk; Type: CONSTRAINT; Schema: performance_demo; Owner: admin
--

ALTER TABLE ONLY performance_demo.orders
    ADD CONSTRAINT orders_pk PRIMARY KEY (order_id_pk);


--
-- TOC entry 3215 (class 2606 OID 16427)
-- Name: order_lines order_lines_fk; Type: FK CONSTRAINT; Schema: performance_demo; Owner: admin
--

ALTER TABLE ONLY performance_demo.order_lines
    ADD CONSTRAINT order_lines_fk FOREIGN KEY (order_id_fk) REFERENCES performance_demo.orders(order_id_pk);


-- Completed on 2023-11-17 14:38:53 EET

--
-- PostgreSQL database dump complete
--

