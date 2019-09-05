--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.15
-- Dumped by pg_dump version 9.6.0

-- Started on 2019-09-05 13:00:25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2236 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 16947)
-- Name: certificate; Type: TABLE; Schema: public; Owner: resume
--

CREATE TABLE certificate (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    name character varying(50) NOT NULL,
    large_url character varying(255) NOT NULL,
    small_url character varying(255) NOT NULL
);


ALTER TABLE certificate OWNER TO resume;

--
-- TOC entry 186 (class 1259 OID 16953)
-- Name: certificate_seq; Type: SEQUENCE; Schema: public; Owner: resume
--

CREATE SEQUENCE certificate_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE certificate_seq OWNER TO resume;

--
-- TOC entry 187 (class 1259 OID 16955)
-- Name: course; Type: TABLE; Schema: public; Owner: resume
--

CREATE TABLE course (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    name character varying(60) NOT NULL,
    school character varying(60) NOT NULL,
    finish_date date
);


ALTER TABLE course OWNER TO resume;

--
-- TOC entry 188 (class 1259 OID 16958)
-- Name: course_seq; Type: SEQUENCE; Schema: public; Owner: resume
--

CREATE SEQUENCE course_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE course_seq OWNER TO resume;

--
-- TOC entry 189 (class 1259 OID 16960)
-- Name: education; Type: TABLE; Schema: public; Owner: resume
--

CREATE TABLE education (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    summary character varying(100) NOT NULL,
    begin_year integer NOT NULL,
    finish_year integer,
    university text NOT NULL,
    faculty character varying(255) NOT NULL
);


ALTER TABLE education OWNER TO resume;

--
-- TOC entry 190 (class 1259 OID 16966)
-- Name: education_seq; Type: SEQUENCE; Schema: public; Owner: resume
--

CREATE SEQUENCE education_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE education_seq OWNER TO resume;

--
-- TOC entry 191 (class 1259 OID 16968)
-- Name: hobby; Type: TABLE; Schema: public; Owner: resume
--

CREATE TABLE hobby (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE hobby OWNER TO resume;

--
-- TOC entry 192 (class 1259 OID 16971)
-- Name: hobby_seq; Type: SEQUENCE; Schema: public; Owner: resume
--

CREATE SEQUENCE hobby_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hobby_seq OWNER TO resume;

--
-- TOC entry 193 (class 1259 OID 16973)
-- Name: language; Type: TABLE; Schema: public; Owner: resume
--

CREATE TABLE language (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    name character varying(30) NOT NULL,
    level character varying(18) NOT NULL,
    type character varying(7) DEFAULT 0 NOT NULL
);


ALTER TABLE language OWNER TO resume;

--
-- TOC entry 194 (class 1259 OID 16977)
-- Name: language_seq; Type: SEQUENCE; Schema: public; Owner: resume
--

CREATE SEQUENCE language_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE language_seq OWNER TO resume;

--
-- TOC entry 195 (class 1259 OID 16979)
-- Name: persistent_logins; Type: TABLE; Schema: public; Owner: resume
--

CREATE TABLE persistent_logins (
    username character varying(64) NOT NULL,
    series character varying(64) NOT NULL,
    token character varying(64) NOT NULL,
    last_used timestamp without time zone NOT NULL
);


ALTER TABLE persistent_logins OWNER TO resume;

--
-- TOC entry 196 (class 1259 OID 16982)
-- Name: practic; Type: TABLE; Schema: public; Owner: resume
--

CREATE TABLE practic (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    "position" character varying(100) NOT NULL,
    company character varying(100) NOT NULL,
    begin_date date NOT NULL,
    finish_date date,
    responsibilities text NOT NULL,
    demo character varying(255),
    src character varying(255)
);


ALTER TABLE practic OWNER TO resume;

--
-- TOC entry 197 (class 1259 OID 16988)
-- Name: practic_seq; Type: SEQUENCE; Schema: public; Owner: resume
--

CREATE SEQUENCE practic_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE practic_seq OWNER TO resume;

--
-- TOC entry 198 (class 1259 OID 16990)
-- Name: profile; Type: TABLE; Schema: public; Owner: resume
--

CREATE TABLE profile (
    id bigint NOT NULL,
    uid character varying(100) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    birth_day date,
    phone character varying(20),
    email character varying(100),
    country character varying(60),
    city character varying(100),
    objective text,
    summary text,
    large_photo character varying(255),
    small_photo character varying(255),
    info text,
    password character varying(255) NOT NULL,
    completed boolean NOT NULL,
    created timestamp(0) without time zone DEFAULT now() NOT NULL,
    skype character varying(80),
    vkontakte character varying(255),
    facebook character varying(255),
    linkedin character varying(255),
    github character varying(255),
    stackoverflow character varying(255)
);


ALTER TABLE profile OWNER TO resume;

--
-- TOC entry 199 (class 1259 OID 16997)
-- Name: profile_restore; Type: TABLE; Schema: public; Owner: resume
--

CREATE TABLE profile_restore (
    id bigint NOT NULL,
    token character varying(255) NOT NULL
);


ALTER TABLE profile_restore OWNER TO resume;

--
-- TOC entry 200 (class 1259 OID 17000)
-- Name: profile_seq; Type: SEQUENCE; Schema: public; Owner: resume
--

CREATE SEQUENCE profile_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE profile_seq OWNER TO resume;

--
-- TOC entry 201 (class 1259 OID 17002)
-- Name: skill; Type: TABLE; Schema: public; Owner: resume
--

CREATE TABLE skill (
    id bigint NOT NULL,
    id_profile bigint NOT NULL,
    category character varying(50) NOT NULL,
    value text NOT NULL
);


ALTER TABLE skill OWNER TO resume;

--
-- TOC entry 202 (class 1259 OID 17008)
-- Name: skill_category; Type: TABLE; Schema: public; Owner: resume
--

CREATE TABLE skill_category (
    id bigint NOT NULL,
    category character varying(50) NOT NULL
);


ALTER TABLE skill_category OWNER TO resume;

--
-- TOC entry 203 (class 1259 OID 17011)
-- Name: skill_seq; Type: SEQUENCE; Schema: public; Owner: resume
--

CREATE SEQUENCE skill_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skill_seq OWNER TO resume;

--
-- TOC entry 2064 (class 2606 OID 17014)
-- Name: certificate certificate_pkey; Type: CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY certificate
    ADD CONSTRAINT certificate_pkey PRIMARY KEY (id);


--
-- TOC entry 2068 (class 2606 OID 17016)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY course
    ADD CONSTRAINT course_pkey PRIMARY KEY (id);


--
-- TOC entry 2072 (class 2606 OID 17018)
-- Name: education education_pkey; Type: CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY education
    ADD CONSTRAINT education_pkey PRIMARY KEY (id);


--
-- TOC entry 2075 (class 2606 OID 17020)
-- Name: hobby hobbi_pkey; Type: CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY hobby
    ADD CONSTRAINT hobbi_pkey PRIMARY KEY (id);


--
-- TOC entry 2078 (class 2606 OID 17022)
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);


--
-- TOC entry 2080 (class 2606 OID 17024)
-- Name: persistent_logins persistent_logins_pkey; Type: CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY persistent_logins
    ADD CONSTRAINT persistent_logins_pkey PRIMARY KEY (series);


--
-- TOC entry 2084 (class 2606 OID 17026)
-- Name: practic practic_pkey; Type: CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY practic
    ADD CONSTRAINT practic_pkey PRIMARY KEY (id);


--
-- TOC entry 2086 (class 2606 OID 17028)
-- Name: profile profile_email_key; Type: CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_email_key UNIQUE (email);


--
-- TOC entry 2088 (class 2606 OID 17030)
-- Name: profile profile_phone_key; Type: CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_phone_key UNIQUE (phone);


--
-- TOC entry 2090 (class 2606 OID 17032)
-- Name: profile profile_pkey; Type: CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);


--
-- TOC entry 2094 (class 2606 OID 17034)
-- Name: profile_restore profile_restore_pkey; Type: CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY profile_restore
    ADD CONSTRAINT profile_restore_pkey PRIMARY KEY (id);


--
-- TOC entry 2096 (class 2606 OID 17036)
-- Name: profile_restore profile_restore_uid_key; Type: CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY profile_restore
    ADD CONSTRAINT profile_restore_uid_key UNIQUE (token);


--
-- TOC entry 2092 (class 2606 OID 17038)
-- Name: profile profile_uid_key; Type: CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_uid_key UNIQUE (uid);


--
-- TOC entry 2101 (class 2606 OID 17040)
-- Name: skill_category skill_category_category_key; Type: CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY skill_category
    ADD CONSTRAINT skill_category_category_key UNIQUE (category);


--
-- TOC entry 2103 (class 2606 OID 17042)
-- Name: skill_category skill_category_pkey; Type: CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY skill_category
    ADD CONSTRAINT skill_category_pkey PRIMARY KEY (id);


--
-- TOC entry 2099 (class 2606 OID 17044)
-- Name: skill skill_pkey; Type: CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY skill
    ADD CONSTRAINT skill_pkey PRIMARY KEY (id);


--
-- TOC entry 2062 (class 1259 OID 17045)
-- Name: certificate_idx; Type: INDEX; Schema: public; Owner: resume
--

CREATE INDEX certificate_idx ON public.certificate USING btree (id_profile);


--
-- TOC entry 2065 (class 1259 OID 17046)
-- Name: course_idx; Type: INDEX; Schema: public; Owner: resume
--

CREATE INDEX course_idx ON public.course USING btree (finish_date);


--
-- TOC entry 2066 (class 1259 OID 17047)
-- Name: course_idx1; Type: INDEX; Schema: public; Owner: resume
--

CREATE INDEX course_idx1 ON public.course USING btree (id_profile);


--
-- TOC entry 2069 (class 1259 OID 17048)
-- Name: education_idx; Type: INDEX; Schema: public; Owner: resume
--

CREATE INDEX education_idx ON public.education USING btree (id_profile);


--
-- TOC entry 2070 (class 1259 OID 17049)
-- Name: education_idx1; Type: INDEX; Schema: public; Owner: resume
--

CREATE INDEX education_idx1 ON public.education USING btree (finish_year);


--
-- TOC entry 2073 (class 1259 OID 17050)
-- Name: hobbi_idx; Type: INDEX; Schema: public; Owner: resume
--

CREATE INDEX hobbi_idx ON public.hobby USING btree (id_profile);


--
-- TOC entry 2076 (class 1259 OID 17051)
-- Name: language_idx; Type: INDEX; Schema: public; Owner: resume
--

CREATE INDEX language_idx ON public.language USING btree (id_profile);


--
-- TOC entry 2081 (class 1259 OID 17052)
-- Name: practic_idx; Type: INDEX; Schema: public; Owner: resume
--

CREATE INDEX practic_idx ON public.practic USING btree (id_profile);


--
-- TOC entry 2082 (class 1259 OID 17053)
-- Name: practic_idx1; Type: INDEX; Schema: public; Owner: resume
--

CREATE INDEX practic_idx1 ON public.practic USING btree (finish_date);


--
-- TOC entry 2097 (class 1259 OID 17054)
-- Name: skill_idx; Type: INDEX; Schema: public; Owner: resume
--

CREATE INDEX skill_idx ON public.skill USING btree (id_profile);


--
-- TOC entry 2104 (class 2606 OID 17055)
-- Name: certificate certificate_fk; Type: FK CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY certificate
    ADD CONSTRAINT certificate_fk FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2105 (class 2606 OID 17060)
-- Name: course course_fk; Type: FK CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY course
    ADD CONSTRAINT course_fk FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2106 (class 2606 OID 17065)
-- Name: education education_fk; Type: FK CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY education
    ADD CONSTRAINT education_fk FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2107 (class 2606 OID 17070)
-- Name: hobby hobby_fk; Type: FK CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY hobby
    ADD CONSTRAINT hobby_fk FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2108 (class 2606 OID 17075)
-- Name: language language_fk; Type: FK CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY language
    ADD CONSTRAINT language_fk FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2109 (class 2606 OID 17080)
-- Name: persistent_logins persistent_logins_fk; Type: FK CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY persistent_logins
    ADD CONSTRAINT persistent_logins_fk FOREIGN KEY (username) REFERENCES profile(uid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2110 (class 2606 OID 17085)
-- Name: practic practic_fk; Type: FK CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY practic
    ADD CONSTRAINT practic_fk FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2111 (class 2606 OID 17090)
-- Name: profile_restore profile_restore_fk; Type: FK CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY profile_restore
    ADD CONSTRAINT profile_restore_fk FOREIGN KEY (id) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2112 (class 2606 OID 17095)
-- Name: skill skill_fk; Type: FK CONSTRAINT; Schema: public; Owner: resume
--

ALTER TABLE ONLY skill
    ADD CONSTRAINT skill_fk FOREIGN KEY (id_profile) REFERENCES profile(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2019-09-05 13:00:26

--
-- PostgreSQL database dump complete
--

