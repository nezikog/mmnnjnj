--
-- PostgreSQL database dump
--

\restrict rMpQzBcDePfEwvniys732WtET5SRPazdJdlRM7NGEkbfDqOkzDeoopMKPZedEYV

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

-- Started on 2026-04-18 12:12:58 MSK

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
-- TOC entry 230 (class 1259 OID 16653)
-- Name: activity_time; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity_time (
    id integer NOT NULL,
    "time" integer NOT NULL
);


ALTER TABLE public.activity_time OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16652)
-- Name: activity_time_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.activity_time ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.activity_time_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 215 (class 1259 OID 16571)
-- Name: balls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.balls (
    id integer NOT NULL,
    balls integer NOT NULL
);


ALTER TABLE public.balls OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16574)
-- Name: balls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.balls ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.balls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 16575)
-- Name: class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class (
    id integer NOT NULL,
    number integer NOT NULL
);


ALTER TABLE public.class OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16578)
-- Name: class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.class ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16579)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    id integer NOT NULL,
    name character varying NOT NULL,
    path character varying NOT NULL,
    img character varying
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16584)
-- Name: course_class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_class (
    id integer NOT NULL,
    class_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.course_class OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16587)
-- Name: course_class_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.course_class ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.course_class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16588)
-- Name: course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.course ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 16659)
-- Name: dedline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dedline (
    id integer NOT NULL,
    dedline integer NOT NULL
);


ALTER TABLE public.dedline OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16658)
-- Name: dedline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.dedline ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.dedline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16589)
-- Name: test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test (
    id integer NOT NULL,
    course_id integer NOT NULL,
    questions text NOT NULL,
    answer character varying NOT NULL,
    difficulty integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.test OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16595)
-- Name: test_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.test ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 16596)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16601)
-- Name: user_course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_course (
    id integer NOT NULL,
    user_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.user_course OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16604)
-- Name: user_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_course ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16605)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."user" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3478 (class 0 OID 16653)
-- Dependencies: 230
-- Data for Name: activity_time; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3463 (class 0 OID 16571)
-- Dependencies: 215
-- Data for Name: balls; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.balls OVERRIDING SYSTEM VALUE VALUES (1, 1);
INSERT INTO public.balls OVERRIDING SYSTEM VALUE VALUES (2, 2);
INSERT INTO public.balls OVERRIDING SYSTEM VALUE VALUES (3, 3);


--
-- TOC entry 3465 (class 0 OID 16575)
-- Dependencies: 217
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (1, 7);
INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (2, 8);
INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (3, 9);
INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (4, 10);
INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (5, 11);


--
-- TOC entry 3467 (class 0 OID 16579)
-- Dependencies: 219
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.course OVERRIDING SYSTEM VALUE VALUES (2, 'Геометрия', '/', '/');
INSERT INTO public.course OVERRIDING SYSTEM VALUE VALUES (3, 'Информатика', '/', '/');
INSERT INTO public.course OVERRIDING SYSTEM VALUE VALUES (1, 'Алгебра', '/', '/');


--
-- TOC entry 3468 (class 0 OID 16584)
-- Dependencies: 220
-- Data for Name: course_class; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3480 (class 0 OID 16659)
-- Dependencies: 232
-- Data for Name: dedline; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3471 (class 0 OID 16589)
-- Dependencies: 223
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (1, 1, '2+2', '4', 1);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (2, 1, '3+3', '6', 2);
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (3, 1, '6+6', '12', 3);


--
-- TOC entry 3473 (class 0 OID 16596)
-- Dependencies: 225
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3474 (class 0 OID 16601)
-- Dependencies: 226
-- Data for Name: user_course; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 229
-- Name: activity_time_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_time_id_seq', 1, false);


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 216
-- Name: balls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.balls_id_seq', 3, true);


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 218
-- Name: class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.class_id_seq', 5, true);


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 221
-- Name: course_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_class_id_seq', 1, false);


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 222
-- Name: course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_id_seq', 3, true);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 231
-- Name: dedline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dedline_id_seq', 1, false);


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 224
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.test_id_seq', 3, true);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 227
-- Name: user_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_course_id_seq', 1, false);


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 228
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- TOC entry 3309 (class 2606 OID 16657)
-- Name: activity_time activity_time_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_time
    ADD CONSTRAINT activity_time_pk PRIMARY KEY (id);


--
-- TOC entry 3293 (class 2606 OID 16607)
-- Name: balls balls_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.balls
    ADD CONSTRAINT balls_pk PRIMARY KEY (id);


--
-- TOC entry 3295 (class 2606 OID 16609)
-- Name: class class_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pk PRIMARY KEY (id);


--
-- TOC entry 3299 (class 2606 OID 16611)
-- Name: course_class course_class_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_class
    ADD CONSTRAINT course_class_pk PRIMARY KEY (id);


--
-- TOC entry 3297 (class 2606 OID 16613)
-- Name: course course_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pk PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 16663)
-- Name: dedline dedline_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dedline
    ADD CONSTRAINT dedline_pk PRIMARY KEY (id);


--
-- TOC entry 3301 (class 2606 OID 16615)
-- Name: test test_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pk PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 16617)
-- Name: user_course user_course_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_course
    ADD CONSTRAINT user_course_pk PRIMARY KEY (id);


--
-- TOC entry 3303 (class 2606 OID 16619)
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- TOC entry 3305 (class 2606 OID 16621)
-- Name: user user_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_unique UNIQUE (email);


--
-- TOC entry 3318 (class 2606 OID 16679)
-- Name: activity_time activity_time_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_time
    ADD CONSTRAINT activity_time_id FOREIGN KEY ("time") REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3314 (class 2606 OID 16622)
-- Name: test balls_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT balls_id FOREIGN KEY (difficulty) REFERENCES public.balls(id) ON DELETE CASCADE;


--
-- TOC entry 3312 (class 2606 OID 16627)
-- Name: course_class class_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_class
    ADD CONSTRAINT class_id FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE CASCADE;


--
-- TOC entry 3313 (class 2606 OID 16632)
-- Name: course_class course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_class
    ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3315 (class 2606 OID 16637)
-- Name: test course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3316 (class 2606 OID 16642)
-- Name: user_course course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_course
    ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3319 (class 2606 OID 16684)
-- Name: dedline dedline_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dedline
    ADD CONSTRAINT dedline_id FOREIGN KEY (dedline) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3317 (class 2606 OID 16647)
-- Name: user_course user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_course
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


-- Completed on 2026-04-18 12:12:58 MSK

--
-- PostgreSQL database dump complete
--

\unrestrict rMpQzBcDePfEwvniys732WtET5SRPazdJdlRM7NGEkbfDqOkzDeoopMKPZedEYV

