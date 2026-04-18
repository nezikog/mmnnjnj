--
-- PostgreSQL database dump
--

\restrict W160L7BSn0vpltPdsPp17yHwtdhNEWcAUXHYezbBaxecf63ZzJLH5Suk5Angtbd

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

-- Started on 2026-04-18 21:46:30 MSK

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
-- TOC entry 215 (class 1259 OID 16843)
-- Name: activity_time; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity_time (
    id integer NOT NULL,
    "time" integer NOT NULL
);


ALTER TABLE public.activity_time OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16846)
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
-- TOC entry 217 (class 1259 OID 16847)
-- Name: balls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.balls (
    id integer NOT NULL,
    balls integer NOT NULL
);


ALTER TABLE public.balls OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16850)
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
-- TOC entry 219 (class 1259 OID 16851)
-- Name: class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class (
    id integer NOT NULL,
    number integer NOT NULL
);


ALTER TABLE public.class OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16854)
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
-- TOC entry 221 (class 1259 OID 16855)
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
-- TOC entry 222 (class 1259 OID 16860)
-- Name: course_class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course_class (
    id integer NOT NULL,
    class_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.course_class OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16863)
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
-- TOC entry 224 (class 1259 OID 16864)
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
-- TOC entry 225 (class 1259 OID 16865)
-- Name: dedline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dedline (
    id integer NOT NULL,
    dedline integer NOT NULL
);


ALTER TABLE public.dedline OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16868)
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
-- TOC entry 227 (class 1259 OID 16869)
-- Name: test; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test (
    id integer NOT NULL,
    course_id integer NOT NULL,
    questions text NOT NULL,
    answer character varying NOT NULL,
    difficulty integer DEFAULT 1 NOT NULL,
    class_id integer DEFAULT 1 NOT NULL,
    subject character varying DEFAULT '""'::character varying NOT NULL
);


ALTER TABLE public.test OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16875)
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
-- TOC entry 229 (class 1259 OID 16876)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    class_id integer
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16886)
-- Name: user_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_activity (
    user_id integer NOT NULL,
    course_id integer NOT NULL,
    seconds integer DEFAULT 0 NOT NULL,
    last_update timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.user_activity OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16990)
-- Name: user_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_activity ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16881)
-- Name: user_course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_course (
    id integer NOT NULL,
    user_id integer NOT NULL,
    course_id integer NOT NULL,
    class_id integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.user_course OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16884)
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
-- TOC entry 234 (class 1259 OID 16892)
-- Name: user_deadline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_deadline (
    user_id integer NOT NULL,
    course_id integer NOT NULL,
    deadline_date timestamp without time zone NOT NULL,
    completed boolean DEFAULT false NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.user_deadline OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16997)
-- Name: user_deadline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.user_deadline ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_deadline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 232 (class 1259 OID 16885)
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
-- TOC entry 3494 (class 0 OID 16843)
-- Dependencies: 215
-- Data for Name: activity_time; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.activity_time OVERRIDING SYSTEM VALUE VALUES (1, 1);


--
-- TOC entry 3496 (class 0 OID 16847)
-- Dependencies: 217
-- Data for Name: balls; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.balls OVERRIDING SYSTEM VALUE VALUES (1, 1);
INSERT INTO public.balls OVERRIDING SYSTEM VALUE VALUES (2, 2);
INSERT INTO public.balls OVERRIDING SYSTEM VALUE VALUES (3, 3);


--
-- TOC entry 3498 (class 0 OID 16851)
-- Dependencies: 219
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (1, 7);
INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (2, 8);
INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (3, 9);
INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (4, 10);
INSERT INTO public.class OVERRIDING SYSTEM VALUE VALUES (5, 11);


--
-- TOC entry 3500 (class 0 OID 16855)
-- Dependencies: 221
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.course OVERRIDING SYSTEM VALUE VALUES (2, 'Геометрия', '/', '/');
INSERT INTO public.course OVERRIDING SYSTEM VALUE VALUES (3, 'Информатика', '/', '/');
INSERT INTO public.course OVERRIDING SYSTEM VALUE VALUES (1, 'Алгебра', '/', '/');


--
-- TOC entry 3501 (class 0 OID 16860)
-- Dependencies: 222
-- Data for Name: course_class; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3504 (class 0 OID 16865)
-- Dependencies: 225
-- Data for Name: dedline; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3506 (class 0 OID 16869)
-- Dependencies: 227
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (1, 1, '2+2', '4', 1, 1, '""');
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (2, 1, '3+3', '6', 2, 1, '""');
INSERT INTO public.test OVERRIDING SYSTEM VALUE VALUES (3, 1, '6+6', '12', 3, 1, '""');


--
-- TOC entry 3508 (class 0 OID 16876)
-- Dependencies: 229
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."user" OVERRIDING SYSTEM VALUE VALUES (1, 'Тестовый пользователь', 'test@example.com', 'password123', 3);
INSERT INTO public."user" OVERRIDING SYSTEM VALUE VALUES (2, 'Kirill', 'k@mail.ru', 'A6xnQhbz4Vx2HuGl4lXwZ5U2I8iziLRFnhP5eNfIRvQ=', 3);


--
-- TOC entry 3512 (class 0 OID 16886)
-- Dependencies: 233
-- Data for Name: user_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_activity OVERRIDING SYSTEM VALUE VALUES (2, 1, 10, '2026-04-18 20:05:37.883059', 15);


--
-- TOC entry 3509 (class 0 OID 16881)
-- Dependencies: 230
-- Data for Name: user_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_course OVERRIDING SYSTEM VALUE VALUES (12, 2, 1, 1);


--
-- TOC entry 3513 (class 0 OID 16892)
-- Dependencies: 234
-- Data for Name: user_deadline; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_deadline OVERRIDING SYSTEM VALUE VALUES (2, 1, '2026-05-18 16:10:00', false, 4);


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 216
-- Name: activity_time_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_time_id_seq', 1, true);


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 218
-- Name: balls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.balls_id_seq', 3, true);


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 220
-- Name: class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.class_id_seq', 5, true);


--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 223
-- Name: course_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_class_id_seq', 1, false);


--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 224
-- Name: course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_id_seq', 3, true);


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 226
-- Name: dedline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dedline_id_seq', 1, false);


--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 228
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.test_id_seq', 3, true);


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 235
-- Name: user_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_activity_id_seq', 15, true);


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 231
-- Name: user_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_course_id_seq', 12, true);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 236
-- Name: user_deadline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_deadline_id_seq', 4, true);


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 232
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 2, true);


--
-- TOC entry 3309 (class 2606 OID 16898)
-- Name: activity_time activity_time_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_time
    ADD CONSTRAINT activity_time_pk PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 16900)
-- Name: balls balls_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.balls
    ADD CONSTRAINT balls_pk PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 16902)
-- Name: class class_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pk PRIMARY KEY (id);


--
-- TOC entry 3317 (class 2606 OID 16904)
-- Name: course_class course_class_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_class
    ADD CONSTRAINT course_class_pk PRIMARY KEY (id);


--
-- TOC entry 3315 (class 2606 OID 16906)
-- Name: course course_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pk PRIMARY KEY (id);


--
-- TOC entry 3319 (class 2606 OID 16908)
-- Name: dedline dedline_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dedline
    ADD CONSTRAINT dedline_pk PRIMARY KEY (id);


--
-- TOC entry 3321 (class 2606 OID 16910)
-- Name: test test_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pk PRIMARY KEY (id);


--
-- TOC entry 3329 (class 2606 OID 16914)
-- Name: user_activity unique_user_course_activity; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activity
    ADD CONSTRAINT unique_user_course_activity UNIQUE (user_id, course_id);


--
-- TOC entry 3333 (class 2606 OID 16918)
-- Name: user_deadline unique_user_course_deadline; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_deadline
    ADD CONSTRAINT unique_user_course_deadline UNIQUE (user_id, course_id);


--
-- TOC entry 3331 (class 2606 OID 16996)
-- Name: user_activity user_activity_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activity
    ADD CONSTRAINT user_activity_pk PRIMARY KEY (id);


--
-- TOC entry 3327 (class 2606 OID 16920)
-- Name: user_course user_course_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_course
    ADD CONSTRAINT user_course_pk PRIMARY KEY (id);


--
-- TOC entry 3335 (class 2606 OID 17003)
-- Name: user_deadline user_deadline_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_deadline
    ADD CONSTRAINT user_deadline_pk PRIMARY KEY (id);


--
-- TOC entry 3323 (class 2606 OID 16922)
-- Name: user user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- TOC entry 3325 (class 2606 OID 16924)
-- Name: user user_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_unique UNIQUE (email);


--
-- TOC entry 3336 (class 2606 OID 16925)
-- Name: activity_time activity_time_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_time
    ADD CONSTRAINT activity_time_id FOREIGN KEY ("time") REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3340 (class 2606 OID 16930)
-- Name: test balls_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT balls_id FOREIGN KEY (difficulty) REFERENCES public.balls(id) ON DELETE CASCADE;


--
-- TOC entry 3337 (class 2606 OID 16935)
-- Name: course_class class_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_class
    ADD CONSTRAINT class_id FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE CASCADE;


--
-- TOC entry 3338 (class 2606 OID 16940)
-- Name: course_class course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course_class
    ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3341 (class 2606 OID 16945)
-- Name: test course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3344 (class 2606 OID 16950)
-- Name: user_course course_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_course
    ADD CONSTRAINT course_id FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3339 (class 2606 OID 16955)
-- Name: dedline dedline_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dedline
    ADD CONSTRAINT dedline_id FOREIGN KEY (dedline) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3342 (class 2606 OID 17023)
-- Name: test test_class_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_class_fk FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE CASCADE;


--
-- TOC entry 3347 (class 2606 OID 16970)
-- Name: user_activity user_activity_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activity
    ADD CONSTRAINT user_activity_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3348 (class 2606 OID 16965)
-- Name: user_activity user_activity_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_activity
    ADD CONSTRAINT user_activity_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- TOC entry 3343 (class 2606 OID 16960)
-- Name: user user_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE SET NULL;


--
-- TOC entry 3345 (class 2606 OID 17030)
-- Name: user_course user_course_class_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_course
    ADD CONSTRAINT user_course_class_fk FOREIGN KEY (class_id) REFERENCES public.class(id) ON DELETE CASCADE;


--
-- TOC entry 3349 (class 2606 OID 16980)
-- Name: user_deadline user_deadline_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_deadline
    ADD CONSTRAINT user_deadline_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(id) ON DELETE CASCADE;


--
-- TOC entry 3350 (class 2606 OID 16975)
-- Name: user_deadline user_deadline_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_deadline
    ADD CONSTRAINT user_deadline_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- TOC entry 3346 (class 2606 OID 16985)
-- Name: user_course user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_course
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public."user"(id) ON DELETE CASCADE;


-- Completed on 2026-04-18 21:46:30 MSK

--
-- PostgreSQL database dump complete
--

\unrestrict W160L7BSn0vpltPdsPp17yHwtdhNEWcAUXHYezbBaxecf63ZzJLH5Suk5Angtbd

