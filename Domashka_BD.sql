--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

-- Started on 2020-10-04 19:54:29

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
-- TOC entry 204 (class 1259 OID 16571)
-- Name: films; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.films (
    title text NOT NULL,
    id integer NOT NULL,
    country text NOT NULL,
    box_office bigint NOT NULL,
    release_date date NOT NULL
);


ALTER TABLE public.films OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16536)
-- Name: persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persons (
    id integer,
    fio text
);


ALTER TABLE public.persons OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16522)
-- Name: persons2content; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persons2content (
    person_id integer NOT NULL,
    film_id integer NOT NULL,
    person_type text
);


ALTER TABLE public.persons2content OWNER TO postgres;

--
-- TOC entry 2829 (class 0 OID 16571)
-- Dependencies: 204
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.films (title, id, country, box_office, release_date) FROM stdin;
Остров проклятых	1	США	29484195	2010-02-13
Аватар	2	США	2744336793	2009-12-10
Леон	3	Франция	19552639	1994-09-14
Господин Никто	4	Бельгия	2903622	2009-09-11
Красотка	5	США	463406268	1990-03-23
\.


--
-- TOC entry 2828 (class 0 OID 16536)
-- Dependencies: 203
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persons (id, fio) FROM stdin;
1	Брэдли Дж. Фишер
2	Роберт Ридчансон
3	Леонардо ДиКаприо
4	Джеймс Кэмерон
5	Мауро Фиоре
6	Сэм Уортингтон
7	Клод Бессон
8	Тьерри Арбогаст
9	Жан Рено
10	Филипп Годо
11	Кристоф Бокарн
12	Джарет Лето
13	Арнон Милчен
14	Чарльз Мински
15	Ричард Гир
\.


--
-- TOC entry 2827 (class 0 OID 16522)
-- Dependencies: 202
-- Data for Name: persons2content; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persons2content (person_id, film_id, person_type) FROM stdin;
1	1	продюсер
2	1	оператор
3	1	актер
4	2	продюсер
5	2	оператор
6	2	актер
7	3	продюсер
8	3	оператор
9	3	актер
10	4	продюсер
11	4	оператор
12	4	актер
13	5	продюсер
14	5	оператор
15	5	актер
\.


--
-- TOC entry 2697 (class 2606 OID 16529)
-- Name: persons2content films_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons2content
    ADD CONSTRAINT films_pkey PRIMARY KEY (person_id);


--
-- TOC entry 2699 (class 2606 OID 16578)
-- Name: films films_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.films
    ADD CONSTRAINT films_pkey1 PRIMARY KEY (title);


--
-- TOC entry 2700 (class 2606 OID 16542)
-- Name: persons persons_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_id_fkey FOREIGN KEY (id) REFERENCES public.persons2content(person_id);


-- Completed on 2020-10-04 19:54:29

--
-- PostgreSQL database dump complete
--

