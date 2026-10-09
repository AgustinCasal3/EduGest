--
-- PostgreSQL database dump
--

\restrict xU6Y3tMy41yVsACrp2FwbjFwaQxbfWtw0ULrlNf7gboAqIgNEVAvgcH56ZYtt9U

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-09 09:25:16

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

DROP DATABASE edugest;
--
-- TOC entry 5386 (class 1262 OID 17813)
-- Name: edugest; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE edugest WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';


ALTER DATABASE edugest OWNER TO postgres;

\unrestrict xU6Y3tMy41yVsACrp2FwbjFwaQxbfWtw0ULrlNf7gboAqIgNEVAvgcH56ZYtt9U
\connect edugest
\restrict xU6Y3tMy41yVsACrp2FwbjFwaQxbfWtw0ULrlNf7gboAqIgNEVAvgcH56ZYtt9U

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

--
-- TOC entry 918 (class 1247 OID 17815)
-- Name: cuatrimestre; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.cuatrimestre AS ENUM (
    'PRIMERO',
    'SEGUNDO',
    'ANUAL'
);


ALTER TYPE public.cuatrimestre OWNER TO postgres;

--
-- TOC entry 921 (class 1247 OID 17822)
-- Name: estado_academico; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_academico AS ENUM (
    'ACTIVO',
    'DE_LICENCIA',
    'EGRESADO'
);


ALTER TYPE public.estado_academico OWNER TO postgres;

--
-- TOC entry 924 (class 1247 OID 17830)
-- Name: estado_asistencia; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_asistencia AS ENUM (
    'PRESENTE',
    'AUSENTE',
    'TARDE',
    'JUSTIFICADO'
);


ALTER TYPE public.estado_asistencia OWNER TO postgres;

--
-- TOC entry 927 (class 1247 OID 17840)
-- Name: estado_cursada; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_cursada AS ENUM (
    'CURSANDO',
    'REGULAR',
    'LIBRE',
    'ABANDONO'
);


ALTER TYPE public.estado_cursada OWNER TO postgres;

--
-- TOC entry 930 (class 1247 OID 17850)
-- Name: estado_documento; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_documento AS ENUM (
    'PENDIENTE',
    'APROBADO',
    'RECHAZADO'
);


ALTER TYPE public.estado_documento OWNER TO postgres;

--
-- TOC entry 933 (class 1247 OID 17858)
-- Name: estado_firma; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_firma AS ENUM (
    'PENDIENTE',
    'FIRMADA'
);


ALTER TYPE public.estado_firma OWNER TO postgres;

--
-- TOC entry 936 (class 1247 OID 17864)
-- Name: estado_inscripcion_evento; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_inscripcion_evento AS ENUM (
    'INSCRIPTO',
    'CANCELADO',
    'ASISTIO'
);


ALTER TYPE public.estado_inscripcion_evento OWNER TO postgres;

--
-- TOC entry 939 (class 1247 OID 17872)
-- Name: estado_inscripcion_mesa; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_inscripcion_mesa AS ENUM (
    'INSCRIPTO',
    'AUSENTE',
    'APROBADO',
    'DESAPROBADO'
);


ALTER TYPE public.estado_inscripcion_mesa OWNER TO postgres;

--
-- TOC entry 942 (class 1247 OID 17882)
-- Name: estado_lectura; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_lectura AS ENUM (
    'LEIDA',
    'NO_LEIDA'
);


ALTER TYPE public.estado_lectura OWNER TO postgres;

--
-- TOC entry 945 (class 1247 OID 17888)
-- Name: estado_licencia; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_licencia AS ENUM (
    'PENDIENTE',
    'APROBADA',
    'RECHAZADA'
);


ALTER TYPE public.estado_licencia OWNER TO postgres;

--
-- TOC entry 948 (class 1247 OID 17896)
-- Name: estado_preinscripcion; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_preinscripcion AS ENUM (
    'PENDIENTE',
    'APROBADA',
    'RECHAZADA'
);


ALTER TYPE public.estado_preinscripcion OWNER TO postgres;

--
-- TOC entry 951 (class 1247 OID 17904)
-- Name: estado_publicacion; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_publicacion AS ENUM (
    'ACTIVA',
    'CERRADA',
    'ELIMINADA'
);


ALTER TYPE public.estado_publicacion OWNER TO postgres;

--
-- TOC entry 954 (class 1247 OID 17912)
-- Name: tipo_acta; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_acta AS ENUM (
    'EXAMEN',
    'REUNION',
    'DISCIPLINARIA',
    'OTRO'
);


ALTER TYPE public.tipo_acta OWNER TO postgres;

--
-- TOC entry 957 (class 1247 OID 17922)
-- Name: tipo_chat; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_chat AS ENUM (
    'CURSO',
    'PRIVADO',
    'ADMINISTRATIVO'
);


ALTER TYPE public.tipo_chat OWNER TO postgres;

--
-- TOC entry 960 (class 1247 OID 17930)
-- Name: tipo_correlatividad; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_correlatividad AS ENUM (
    'PARA_CURSAR',
    'PARA_RENDIR'
);


ALTER TYPE public.tipo_correlatividad OWNER TO postgres;

--
-- TOC entry 963 (class 1247 OID 17936)
-- Name: tipo_documento; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_documento AS ENUM (
    'DNI',
    'CERTIFICADO_MEDICO',
    'ANALITICO',
    'TITULO',
    'OTRO'
);


ALTER TYPE public.tipo_documento OWNER TO postgres;

--
-- TOC entry 966 (class 1247 OID 17948)
-- Name: tipo_foro; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_foro AS ENUM (
    'INSTITUCIONAL',
    'CARRERA',
    'MATERIA',
    'EGRESADOS'
);


ALTER TYPE public.tipo_foro OWNER TO postgres;

--
-- TOC entry 969 (class 1247 OID 17958)
-- Name: tipo_nota; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_nota AS ENUM (
    'PARCIAL',
    'TRABAJO_PRACTICO',
    'FINAL',
    'CONCEPTO'
);


ALTER TYPE public.tipo_nota OWNER TO postgres;

--
-- TOC entry 972 (class 1247 OID 17968)
-- Name: tipo_notificacion; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_notificacion AS ENUM (
    'ACADEMICA',
    'ADMINISTRATIVA',
    'SISTEMA',
    'CHATBOT',
    'EVENTO',
    'OTRA'
);


ALTER TYPE public.tipo_notificacion OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 17981)
-- Name: acta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acta (
    id bigint NOT NULL,
    creada_por_id bigint NOT NULL,
    tipo public.tipo_acta NOT NULL,
    fecha_creacion timestamp without time zone NOT NULL,
    contenido text
);


ALTER TABLE public.acta OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17990)
-- Name: acta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.acta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.acta_id_seq OWNER TO postgres;

--
-- TOC entry 5387 (class 0 OID 0)
-- Dependencies: 220
-- Name: acta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.acta_id_seq OWNED BY public.acta.id;


--
-- TOC entry 221 (class 1259 OID 17991)
-- Name: asistencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asistencia (
    id bigint NOT NULL,
    curso_id bigint NOT NULL,
    estudiante_id bigint NOT NULL,
    registrada_por_id bigint NOT NULL,
    fecha date NOT NULL,
    estado public.estado_asistencia NOT NULL,
    observaciones text
);


ALTER TABLE public.asistencia OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18002)
-- Name: asistencia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asistencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.asistencia_id_seq OWNER TO postgres;

--
-- TOC entry 5388 (class 0 OID 0)
-- Dependencies: 222
-- Name: asistencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asistencia_id_seq OWNED BY public.asistencia.id;


--
-- TOC entry 223 (class 1259 OID 18003)
-- Name: carrera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carrera (
    id bigint NOT NULL,
    institucion_id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    titulo_otorgado character varying(255),
    duracion_anios integer
);


ALTER TABLE public.carrera OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 18011)
-- Name: carrera_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carrera_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carrera_id_seq OWNER TO postgres;

--
-- TOC entry 5389 (class 0 OID 0)
-- Dependencies: 224
-- Name: carrera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrera_id_seq OWNED BY public.carrera.id;


--
-- TOC entry 225 (class 1259 OID 18012)
-- Name: charla; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.charla (
    id bigint NOT NULL,
    foro_id bigint NOT NULL,
    foro_padre_id bigint,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.charla OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 18018)
-- Name: charla_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.charla_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.charla_id_seq OWNER TO postgres;

--
-- TOC entry 5390 (class 0 OID 0)
-- Dependencies: 226
-- Name: charla_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.charla_id_seq OWNED BY public.charla.id;


--
-- TOC entry 227 (class 1259 OID 18019)
-- Name: chat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat (
    id bigint NOT NULL,
    curso_id bigint,
    tipo public.tipo_chat NOT NULL,
    fecha_creacion timestamp without time zone NOT NULL
);


ALTER TABLE public.chat OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 18025)
-- Name: chat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chat_id_seq OWNER TO postgres;

--
-- TOC entry 5391 (class 0 OID 0)
-- Dependencies: 228
-- Name: chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_id_seq OWNED BY public.chat.id;


--
-- TOC entry 229 (class 1259 OID 18026)
-- Name: consulta_chatbot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consulta_chatbot (
    id bigint NOT NULL,
    consultante_id bigint NOT NULL,
    derivada_a_id bigint,
    pregunta text NOT NULL,
    respuesta text,
    fecha timestamp without time zone NOT NULL,
    resuelta boolean DEFAULT false
);


ALTER TABLE public.consulta_chatbot OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 18036)
-- Name: consulta_chatbot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consulta_chatbot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.consulta_chatbot_id_seq OWNER TO postgres;

--
-- TOC entry 5392 (class 0 OID 0)
-- Dependencies: 230
-- Name: consulta_chatbot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consulta_chatbot_id_seq OWNED BY public.consulta_chatbot.id;


--
-- TOC entry 231 (class 1259 OID 18037)
-- Name: correlatividad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.correlatividad (
    id bigint NOT NULL,
    materia_id bigint NOT NULL,
    materia_requerida_id bigint NOT NULL,
    tipo public.tipo_correlatividad NOT NULL
);


ALTER TABLE public.correlatividad OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 18044)
-- Name: correlatividad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.correlatividad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.correlatividad_id_seq OWNER TO postgres;

--
-- TOC entry 5393 (class 0 OID 0)
-- Dependencies: 232
-- Name: correlatividad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.correlatividad_id_seq OWNED BY public.correlatividad.id;


--
-- TOC entry 233 (class 1259 OID 18045)
-- Name: curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curso (
    id bigint NOT NULL,
    materia_id bigint NOT NULL,
    anio_lectivo integer NOT NULL,
    cuatrimestre public.cuatrimestre NOT NULL,
    horario character varying(255),
    aula character varying(100)
);


ALTER TABLE public.curso OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 18052)
-- Name: curso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.curso_id_seq OWNER TO postgres;

--
-- TOC entry 5394 (class 0 OID 0)
-- Dependencies: 234
-- Name: curso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curso_id_seq OWNED BY public.curso.id;


--
-- TOC entry 235 (class 1259 OID 18053)
-- Name: director; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.director (
    id bigint NOT NULL,
    numero_empleado character varying(50) NOT NULL
);


ALTER TABLE public.director OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 18058)
-- Name: docente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docente (
    id bigint NOT NULL,
    numero_docente character varying(50) NOT NULL,
    titulo character varying(255),
    estado public.estado_academico NOT NULL
);


ALTER TABLE public.docente OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 18064)
-- Name: docente_curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docente_curso (
    curso_id bigint NOT NULL,
    docente_id bigint NOT NULL
);


ALTER TABLE public.docente_curso OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 18069)
-- Name: docente_mesa_examen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docente_mesa_examen (
    mesa_examen_id bigint NOT NULL,
    docente_id bigint NOT NULL
);


ALTER TABLE public.docente_mesa_examen OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 18074)
-- Name: documento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documento (
    id bigint NOT NULL,
    subido_por_id bigint NOT NULL,
    revisado_por_id bigint,
    licencia_id bigint,
    legajo_id bigint,
    nombre_archivo character varying(255) NOT NULL,
    url character varying(500) NOT NULL,
    tipo_documento public.tipo_documento NOT NULL,
    fecha_subida timestamp without time zone NOT NULL,
    estado public.estado_documento NOT NULL
);


ALTER TABLE public.documento OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 18086)
-- Name: documento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.documento_id_seq OWNER TO postgres;

--
-- TOC entry 5395 (class 0 OID 0)
-- Dependencies: 240
-- Name: documento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documento_id_seq OWNED BY public.documento.id;


--
-- TOC entry 241 (class 1259 OID 18087)
-- Name: estudiante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiante (
    id bigint NOT NULL,
    numero_estudiante character varying(50) NOT NULL,
    estado public.estado_academico NOT NULL
);


ALTER TABLE public.estudiante OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 18093)
-- Name: evento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evento (
    id bigint NOT NULL,
    institucion_id bigint,
    nombre character varying(255) NOT NULL,
    descripcion text,
    fecha timestamp without time zone NOT NULL,
    lugar character varying(255)
);


ALTER TABLE public.evento OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 18101)
-- Name: evento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.evento_id_seq OWNER TO postgres;

--
-- TOC entry 5396 (class 0 OID 0)
-- Dependencies: 243
-- Name: evento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evento_id_seq OWNED BY public.evento.id;


--
-- TOC entry 244 (class 1259 OID 18102)
-- Name: firma_acta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.firma_acta (
    id bigint NOT NULL,
    acta_id bigint NOT NULL,
    firmante_id bigint NOT NULL,
    estado public.estado_firma NOT NULL,
    fecha_firma timestamp without time zone
);


ALTER TABLE public.firma_acta OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 18109)
-- Name: firma_acta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.firma_acta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.firma_acta_id_seq OWNER TO postgres;

--
-- TOC entry 5397 (class 0 OID 0)
-- Dependencies: 245
-- Name: firma_acta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.firma_acta_id_seq OWNED BY public.firma_acta.id;


--
-- TOC entry 246 (class 1259 OID 18110)
-- Name: foro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.foro (
    id bigint NOT NULL,
    institucion_id bigint,
    carrera_id bigint,
    materia_id bigint,
    nombre character varying(255) NOT NULL,
    tipo public.tipo_foro NOT NULL
);


ALTER TABLE public.foro OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 18116)
-- Name: foro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.foro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.foro_id_seq OWNER TO postgres;

--
-- TOC entry 5398 (class 0 OID 0)
-- Dependencies: 247
-- Name: foro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.foro_id_seq OWNED BY public.foro.id;


--
-- TOC entry 248 (class 1259 OID 18117)
-- Name: inscripcion_curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripcion_curso (
    id bigint NOT NULL,
    curso_id bigint NOT NULL,
    estudiante_id bigint NOT NULL,
    fecha_inscripcion date NOT NULL,
    estado_cursada public.estado_cursada NOT NULL
);


ALTER TABLE public.inscripcion_curso OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 18125)
-- Name: inscripcion_curso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripcion_curso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscripcion_curso_id_seq OWNER TO postgres;

--
-- TOC entry 5399 (class 0 OID 0)
-- Dependencies: 249
-- Name: inscripcion_curso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripcion_curso_id_seq OWNED BY public.inscripcion_curso.id;


--
-- TOC entry 250 (class 1259 OID 18126)
-- Name: inscripcion_evento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripcion_evento (
    id bigint NOT NULL,
    evento_id bigint NOT NULL,
    estudiante_id bigint NOT NULL,
    fecha_inscripcion timestamp without time zone NOT NULL,
    estado public.estado_inscripcion_evento NOT NULL
);


ALTER TABLE public.inscripcion_evento OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 18134)
-- Name: inscripcion_evento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripcion_evento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscripcion_evento_id_seq OWNER TO postgres;

--
-- TOC entry 5400 (class 0 OID 0)
-- Dependencies: 251
-- Name: inscripcion_evento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripcion_evento_id_seq OWNED BY public.inscripcion_evento.id;


--
-- TOC entry 252 (class 1259 OID 18135)
-- Name: inscripcion_mesa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripcion_mesa (
    id bigint NOT NULL,
    mesa_examen_id bigint NOT NULL,
    estudiante_id bigint NOT NULL,
    fecha_inscripcion date NOT NULL,
    estado public.estado_inscripcion_mesa NOT NULL,
    nota double precision
);


ALTER TABLE public.inscripcion_mesa OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 18143)
-- Name: inscripcion_mesa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripcion_mesa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscripcion_mesa_id_seq OWNER TO postgres;

--
-- TOC entry 5401 (class 0 OID 0)
-- Dependencies: 253
-- Name: inscripcion_mesa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripcion_mesa_id_seq OWNED BY public.inscripcion_mesa.id;


--
-- TOC entry 254 (class 1259 OID 18144)
-- Name: institucion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institucion (
    id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    cuit character varying(50),
    direccion character varying(255),
    telefono character varying(50)
);


ALTER TABLE public.institucion OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 18151)
-- Name: institucion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.institucion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.institucion_id_seq OWNER TO postgres;

--
-- TOC entry 5402 (class 0 OID 0)
-- Dependencies: 255
-- Name: institucion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.institucion_id_seq OWNED BY public.institucion.id;


--
-- TOC entry 256 (class 1259 OID 18152)
-- Name: lectura_mensaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lectura_mensaje (
    id bigint NOT NULL,
    mensaje_id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    fecha_lectura timestamp without time zone
);


ALTER TABLE public.lectura_mensaje OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 18158)
-- Name: lectura_mensaje_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lectura_mensaje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lectura_mensaje_id_seq OWNER TO postgres;

--
-- TOC entry 5403 (class 0 OID 0)
-- Dependencies: 257
-- Name: lectura_mensaje_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lectura_mensaje_id_seq OWNED BY public.lectura_mensaje.id;


--
-- TOC entry 258 (class 1259 OID 18159)
-- Name: legajo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.legajo (
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    fecha_creacion date NOT NULL
);


ALTER TABLE public.legajo OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 18165)
-- Name: legajo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.legajo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.legajo_id_seq OWNER TO postgres;

--
-- TOC entry 5404 (class 0 OID 0)
-- Dependencies: 259
-- Name: legajo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.legajo_id_seq OWNED BY public.legajo.id;


--
-- TOC entry 260 (class 1259 OID 18166)
-- Name: licencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.licencia (
    id bigint NOT NULL,
    solicitante_id bigint NOT NULL,
    aprobada_por_id bigint,
    fecha_solicitud date NOT NULL,
    periodo_desde date NOT NULL,
    periodo_hasta date NOT NULL,
    motivo text,
    estado public.estado_licencia NOT NULL
);


ALTER TABLE public.licencia OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 18177)
-- Name: licencia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.licencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.licencia_id_seq OWNER TO postgres;

--
-- TOC entry 5405 (class 0 OID 0)
-- Dependencies: 261
-- Name: licencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.licencia_id_seq OWNED BY public.licencia.id;


--
-- TOC entry 262 (class 1259 OID 18178)
-- Name: materia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materia (
    id bigint NOT NULL,
    carrera_id bigint NOT NULL,
    nombre character varying(255) NOT NULL,
    anio_del_plan integer,
    carga_horaria integer
);


ALTER TABLE public.materia OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 18184)
-- Name: materia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.materia_id_seq OWNER TO postgres;

--
-- TOC entry 5406 (class 0 OID 0)
-- Dependencies: 263
-- Name: materia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materia_id_seq OWNED BY public.materia.id;


--
-- TOC entry 264 (class 1259 OID 18185)
-- Name: mensaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mensaje (
    id bigint NOT NULL,
    chat_id bigint NOT NULL,
    autor_id bigint NOT NULL,
    contenido text NOT NULL,
    fecha_hora timestamp without time zone NOT NULL
);


ALTER TABLE public.mensaje OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 18195)
-- Name: mensaje_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mensaje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mensaje_id_seq OWNER TO postgres;

--
-- TOC entry 5407 (class 0 OID 0)
-- Dependencies: 265
-- Name: mensaje_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mensaje_id_seq OWNED BY public.mensaje.id;


--
-- TOC entry 266 (class 1259 OID 18196)
-- Name: mesa_examen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mesa_examen (
    id bigint NOT NULL,
    materia_id bigint NOT NULL,
    fecha date NOT NULL,
    horario character varying(100),
    aula character varying(100),
    llamado integer
);


ALTER TABLE public.mesa_examen OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 18202)
-- Name: mesa_examen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mesa_examen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mesa_examen_id_seq OWNER TO postgres;

--
-- TOC entry 5408 (class 0 OID 0)
-- Dependencies: 267
-- Name: mesa_examen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mesa_examen_id_seq OWNED BY public.mesa_examen.id;


--
-- TOC entry 268 (class 1259 OID 18203)
-- Name: nota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nota (
    id bigint NOT NULL,
    inscripcion_curso_id bigint NOT NULL,
    tipo public.tipo_nota NOT NULL,
    valor double precision NOT NULL,
    fecha date NOT NULL,
    observaciones text
);


ALTER TABLE public.nota OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 18213)
-- Name: nota_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nota_id_seq OWNER TO postgres;

--
-- TOC entry 5409 (class 0 OID 0)
-- Dependencies: 269
-- Name: nota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nota_id_seq OWNED BY public.nota.id;


--
-- TOC entry 270 (class 1259 OID 18214)
-- Name: notificacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notificacion (
    id bigint NOT NULL,
    emisor_id bigint,
    destinatario_id bigint NOT NULL,
    fecha timestamp without time zone NOT NULL,
    titulo character varying(255) NOT NULL,
    contenido text NOT NULL,
    estado_lectura public.estado_lectura NOT NULL,
    tipo public.tipo_notificacion NOT NULL
);


ALTER TABLE public.notificacion OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 18226)
-- Name: notificacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notificacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notificacion_id_seq OWNER TO postgres;

--
-- TOC entry 5410 (class 0 OID 0)
-- Dependencies: 271
-- Name: notificacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notificacion_id_seq OWNED BY public.notificacion.id;


--
-- TOC entry 272 (class 1259 OID 18227)
-- Name: participante_chat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.participante_chat (
    id bigint NOT NULL,
    chat_id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    fecha_ingreso timestamp without time zone NOT NULL
);


ALTER TABLE public.participante_chat OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 18234)
-- Name: participante_chat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.participante_chat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.participante_chat_id_seq OWNER TO postgres;

--
-- TOC entry 5411 (class 0 OID 0)
-- Dependencies: 273
-- Name: participante_chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.participante_chat_id_seq OWNED BY public.participante_chat.id;


--
-- TOC entry 274 (class 1259 OID 18235)
-- Name: preceptor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.preceptor (
    id bigint NOT NULL,
    numero_empleado character varying(50) NOT NULL
);


ALTER TABLE public.preceptor OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 18240)
-- Name: preinscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.preinscripcion (
    id bigint NOT NULL,
    institucion_id bigint,
    gestionada_por_id bigint,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    dni character varying(20) NOT NULL,
    email character varying(150) NOT NULL,
    fecha_solicitud date NOT NULL,
    estado public.estado_preinscripcion NOT NULL
);


ALTER TABLE public.preinscripcion OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 18250)
-- Name: preinscripcion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.preinscripcion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.preinscripcion_id_seq OWNER TO postgres;

--
-- TOC entry 5412 (class 0 OID 0)
-- Dependencies: 276
-- Name: preinscripcion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.preinscripcion_id_seq OWNED BY public.preinscripcion.id;


--
-- TOC entry 277 (class 1259 OID 18251)
-- Name: publicacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publicacion (
    id bigint NOT NULL,
    charla_id bigint NOT NULL,
    autor_id bigint NOT NULL,
    titulo character varying(255) NOT NULL,
    contenido text NOT NULL,
    fecha_creacion timestamp without time zone NOT NULL,
    destacada boolean DEFAULT false,
    estado public.estado_publicacion NOT NULL
);


ALTER TABLE public.publicacion OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 18264)
-- Name: publicacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.publicacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.publicacion_id_seq OWNER TO postgres;

--
-- TOC entry 5413 (class 0 OID 0)
-- Dependencies: 278
-- Name: publicacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.publicacion_id_seq OWNED BY public.publicacion.id;


--
-- TOC entry 279 (class 1259 OID 18265)
-- Name: respuesta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.respuesta (
    id bigint NOT NULL,
    publicacion_id bigint NOT NULL,
    autor_id bigint NOT NULL,
    contenido text NOT NULL,
    fecha_creacion timestamp without time zone NOT NULL
);


ALTER TABLE public.respuesta OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 18275)
-- Name: respuesta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.respuesta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.respuesta_id_seq OWNER TO postgres;

--
-- TOC entry 5414 (class 0 OID 0)
-- Dependencies: 280
-- Name: respuesta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.respuesta_id_seq OWNED BY public.respuesta.id;


--
-- TOC entry 281 (class 1259 OID 18276)
-- Name: secretario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.secretario (
    id bigint NOT NULL,
    numero_empleado character varying(50) NOT NULL
);


ALTER TABLE public.secretario OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 18281)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id bigint NOT NULL,
    dni character varying(20) NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    password_hash character varying(255) NOT NULL,
    telefono character varying(50),
    fecha_nacimiento date
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 18292)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO postgres;

--
-- TOC entry 5415 (class 0 OID 0)
-- Dependencies: 283
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 284 (class 1259 OID 18293)
-- Name: usuario_institucion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_institucion (
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    institucion_id bigint NOT NULL,
    fecha_desde date,
    fecha_hasta date,
    activo boolean DEFAULT true
);


ALTER TABLE public.usuario_institucion OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 18300)
-- Name: usuario_institucion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_institucion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_institucion_id_seq OWNER TO postgres;

--
-- TOC entry 5416 (class 0 OID 0)
-- Dependencies: 285
-- Name: usuario_institucion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_institucion_id_seq OWNED BY public.usuario_institucion.id;


--
-- TOC entry 4985 (class 2604 OID 18716)
-- Name: acta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acta ALTER COLUMN id SET DEFAULT nextval('public.acta_id_seq'::regclass);


--
-- TOC entry 4986 (class 2604 OID 18717)
-- Name: asistencia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencia ALTER COLUMN id SET DEFAULT nextval('public.asistencia_id_seq'::regclass);


--
-- TOC entry 4987 (class 2604 OID 18718)
-- Name: carrera id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera ALTER COLUMN id SET DEFAULT nextval('public.carrera_id_seq'::regclass);


--
-- TOC entry 4988 (class 2604 OID 18719)
-- Name: charla id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charla ALTER COLUMN id SET DEFAULT nextval('public.charla_id_seq'::regclass);


--
-- TOC entry 4989 (class 2604 OID 18720)
-- Name: chat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat ALTER COLUMN id SET DEFAULT nextval('public.chat_id_seq'::regclass);


--
-- TOC entry 4990 (class 2604 OID 18721)
-- Name: consulta_chatbot id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta_chatbot ALTER COLUMN id SET DEFAULT nextval('public.consulta_chatbot_id_seq'::regclass);


--
-- TOC entry 4992 (class 2604 OID 18722)
-- Name: correlatividad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correlatividad ALTER COLUMN id SET DEFAULT nextval('public.correlatividad_id_seq'::regclass);


--
-- TOC entry 4993 (class 2604 OID 18723)
-- Name: curso id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso ALTER COLUMN id SET DEFAULT nextval('public.curso_id_seq'::regclass);


--
-- TOC entry 4994 (class 2604 OID 18724)
-- Name: documento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento ALTER COLUMN id SET DEFAULT nextval('public.documento_id_seq'::regclass);


--
-- TOC entry 4995 (class 2604 OID 18725)
-- Name: evento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento ALTER COLUMN id SET DEFAULT nextval('public.evento_id_seq'::regclass);


--
-- TOC entry 4996 (class 2604 OID 18726)
-- Name: firma_acta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firma_acta ALTER COLUMN id SET DEFAULT nextval('public.firma_acta_id_seq'::regclass);


--
-- TOC entry 4997 (class 2604 OID 18727)
-- Name: foro id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foro ALTER COLUMN id SET DEFAULT nextval('public.foro_id_seq'::regclass);


--
-- TOC entry 4998 (class 2604 OID 18728)
-- Name: inscripcion_curso id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion_curso ALTER COLUMN id SET DEFAULT nextval('public.inscripcion_curso_id_seq'::regclass);


--
-- TOC entry 4999 (class 2604 OID 18729)
-- Name: inscripcion_evento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion_evento ALTER COLUMN id SET DEFAULT nextval('public.inscripcion_evento_id_seq'::regclass);


--
-- TOC entry 5000 (class 2604 OID 18730)
-- Name: inscripcion_mesa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion_mesa ALTER COLUMN id SET DEFAULT nextval('public.inscripcion_mesa_id_seq'::regclass);


--
-- TOC entry 5001 (class 2604 OID 18731)
-- Name: institucion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institucion ALTER COLUMN id SET DEFAULT nextval('public.institucion_id_seq'::regclass);


--
-- TOC entry 5002 (class 2604 OID 18732)
-- Name: lectura_mensaje id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectura_mensaje ALTER COLUMN id SET DEFAULT nextval('public.lectura_mensaje_id_seq'::regclass);


--
-- TOC entry 5003 (class 2604 OID 18733)
-- Name: legajo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legajo ALTER COLUMN id SET DEFAULT nextval('public.legajo_id_seq'::regclass);


--
-- TOC entry 5004 (class 2604 OID 18734)
-- Name: licencia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licencia ALTER COLUMN id SET DEFAULT nextval('public.licencia_id_seq'::regclass);


--
-- TOC entry 5005 (class 2604 OID 18735)
-- Name: materia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materia ALTER COLUMN id SET DEFAULT nextval('public.materia_id_seq'::regclass);


--
-- TOC entry 5006 (class 2604 OID 18736)
-- Name: mensaje id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensaje ALTER COLUMN id SET DEFAULT nextval('public.mensaje_id_seq'::regclass);


--
-- TOC entry 5007 (class 2604 OID 18737)
-- Name: mesa_examen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesa_examen ALTER COLUMN id SET DEFAULT nextval('public.mesa_examen_id_seq'::regclass);


--
-- TOC entry 5008 (class 2604 OID 18738)
-- Name: nota id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota ALTER COLUMN id SET DEFAULT nextval('public.nota_id_seq'::regclass);


--
-- TOC entry 5009 (class 2604 OID 18739)
-- Name: notificacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificacion ALTER COLUMN id SET DEFAULT nextval('public.notificacion_id_seq'::regclass);


--
-- TOC entry 5010 (class 2604 OID 18740)
-- Name: participante_chat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participante_chat ALTER COLUMN id SET DEFAULT nextval('public.participante_chat_id_seq'::regclass);


--
-- TOC entry 5011 (class 2604 OID 18741)
-- Name: preinscripcion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preinscripcion ALTER COLUMN id SET DEFAULT nextval('public.preinscripcion_id_seq'::regclass);


--
-- TOC entry 5012 (class 2604 OID 18742)
-- Name: publicacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicacion ALTER COLUMN id SET DEFAULT nextval('public.publicacion_id_seq'::regclass);


--
-- TOC entry 5014 (class 2604 OID 18743)
-- Name: respuesta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respuesta ALTER COLUMN id SET DEFAULT nextval('public.respuesta_id_seq'::regclass);


--
-- TOC entry 5015 (class 2604 OID 18744)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 5016 (class 2604 OID 18745)
-- Name: usuario_institucion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_institucion ALTER COLUMN id SET DEFAULT nextval('public.usuario_institucion_id_seq'::regclass);


--
-- TOC entry 5314 (class 0 OID 17981)
-- Dependencies: 219
-- Data for Name: acta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.acta (id, creada_por_id, tipo, fecha_creacion, contenido) FROM stdin;
1	13	EXAMEN	2026-12-15 20:00:00	Acta de examen Metodologías Ágiles.
2	14	REUNION	2026-05-10 12:00:00	Reunión de personal EEST N2.
3	15	DISCIPLINARIA	2026-08-20 14:00:00	Llamado de atención alumno.
\.


--
-- TOC entry 5316 (class 0 OID 17991)
-- Dependencies: 221
-- Data for Name: asistencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asistencia (id, curso_id, estudiante_id, registrada_por_id, fecha, estado, observaciones) FROM stdin;
1	1	1	4	2026-04-10	PRESENTE	
2	1	2	4	2026-04-10	AUSENTE	Faltó sin aviso
3	2	3	5	2026-04-11	TARDE	
\.


--
-- TOC entry 5318 (class 0 OID 18003)
-- Dependencies: 223
-- Data for Name: carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carrera (id, institucion_id, nombre, titulo_otorgado, duracion_anios) FROM stdin;
1	1	Desarrollo de Software	Técnico Superior en Desarrollo de Software	3
2	2	Tecnico en Informatica Personal y Profesional	Técnico en Informática	7
3	3	Especialización en Reactores	Especialista Nuclear	2
\.


--
-- TOC entry 5320 (class 0 OID 18012)
-- Dependencies: 225
-- Data for Name: charla; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.charla (id, foro_id, foro_padre_id, nombre) FROM stdin;
1	1	\N	Institución - Avisos Importantes
2	2	\N	Desarrollo de Software - Consultas Generales
3	2	\N	1.º Año - Sistemas Digitales
4	2	\N	1.º Año - Laboratorio de Hardware
5	2	\N	1.º Año - Administ. y Gestión de Base de Datos
6	2	\N	1.º Año - Introducción a la Programación
7	2	\N	1.º Año - Sistemas Operativos
8	2	\N	1.º Año - Análisis Matemático
9	2	\N	1.º Año - Introducción a las Redes de Datos
10	2	\N	1.º Año - Prácticas Profesionalizantes I
11	2	\N	2.º Año - Inglés Técnico I
12	2	\N	2.º Año - Diseño Web
13	2	\N	2.º Año - Álgebra y Lógica
14	2	\N	2.º Año - Estadística
15	2	\N	2.º Año - Desarrollo de Sist. Orientado a Objetos
16	2	\N	2.º Año - Prácticas Profesionalizantes II
17	2	\N	2.º Año - Desarrollo de Aplicativos Móviles
18	2	\N	2.º Año - Programación
19	2	\N	3.º Año - Gestión de Proyectos
20	2	\N	3.º Año - Inglés Técnico II
21	2	\N	3.º Año - Prácticas Profesionalizantes III
22	2	\N	3.º Año - Ingeniería en Software
23	2	\N	3.º Año - Metodología de Pruebas de Sistemas
24	2	\N	3.º Año - Desarrollo de Sistemas Web
\.


--
-- TOC entry 5322 (class 0 OID 18019)
-- Dependencies: 227
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat (id, curso_id, tipo, fecha_creacion) FROM stdin;
1	1	CURSO	2026-03-10 10:00:00
2	\N	PRIVADO	2026-04-01 12:00:00
3	\N	ADMINISTRATIVO	2026-02-15 09:00:00
\.


--
-- TOC entry 5324 (class 0 OID 18026)
-- Dependencies: 229
-- Data for Name: consulta_chatbot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consulta_chatbot (id, consultante_id, derivada_a_id, pregunta, respuesta, fecha, resuelta) FROM stdin;
1	1	\N	¿Cuándo son las inscripciones?	Las inscripciones son en marzo.	2026-02-10 10:00:00	t
2	2	7	Tengo un problema con mi legajo.	\N	2026-03-05 11:00:00	f
3	3	\N	¿Cómo pido un certificado?	Debes ir a la sección Documentos...	2026-04-12 15:00:00	t
\.


--
-- TOC entry 5326 (class 0 OID 18037)
-- Dependencies: 231
-- Data for Name: correlatividad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.correlatividad (id, materia_id, materia_requerida_id, tipo) FROM stdin;
1	3	2	PARA_CURSAR
2	1	3	PARA_RENDIR
3	1	2	PARA_CURSAR
\.


--
-- TOC entry 5328 (class 0 OID 18045)
-- Dependencies: 233
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curso (id, materia_id, anio_lectivo, cuatrimestre, horario, aula) FROM stdin;
1	1	2026	PRIMERO	18:00 a 22:00	Aula 10 - ISFT 220
2	2	2026	ANUAL	18:00 a 22:00	Aula 5 - ISFT 220
3	4	2026	ANUAL	08:00 a 12:00	Taller 2 - EEST N2
\.


--
-- TOC entry 5330 (class 0 OID 18053)
-- Dependencies: 235
-- Data for Name: director; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.director (id, numero_empleado) FROM stdin;
10	DIR-001
11	DIR-002
12	DIR-003
\.


--
-- TOC entry 5331 (class 0 OID 18058)
-- Dependencies: 236
-- Data for Name: docente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.docente (id, numero_docente, titulo, estado) FROM stdin;
4	DOC-001	Ingeniero en Sistemas	ACTIVO
5	DOC-002	Licenciada en Educación	ACTIVO
6	DOC-003	Técnico Superior en Redes	ACTIVO
\.


--
-- TOC entry 5332 (class 0 OID 18064)
-- Dependencies: 237
-- Data for Name: docente_curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.docente_curso (curso_id, docente_id) FROM stdin;
1	4
2	5
3	6
\.


--
-- TOC entry 5333 (class 0 OID 18069)
-- Dependencies: 238
-- Data for Name: docente_mesa_examen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.docente_mesa_examen (mesa_examen_id, docente_id) FROM stdin;
1	4
2	5
3	6
\.


--
-- TOC entry 5334 (class 0 OID 18074)
-- Dependencies: 239
-- Data for Name: documento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documento (id, subido_por_id, revisado_por_id, licencia_id, legajo_id, nombre_archivo, url, tipo_documento, fecha_subida, estado) FROM stdin;
1	1	7	\N	1	dni_agustin.pdf	/docs/dni1.pdf	DNI	2025-02-20 10:00:00	APROBADO
2	2	7	\N	2	titulo_lucas.pdf	/docs/titulo2.pdf	ANALITICO	2025-02-21 11:00:00	PENDIENTE
3	4	8	\N	3	cv_guido.pdf	/docs/cv_guido.pdf	OTRO	2020-02-15 09:00:00	APROBADO
\.


--
-- TOC entry 5336 (class 0 OID 18087)
-- Dependencies: 241
-- Data for Name: estudiante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiante (id, numero_estudiante, estado) FROM stdin;
1	LEG-001	ACTIVO
2	LEG-002	ACTIVO
3	LEG-003	ACTIVO
\.


--
-- TOC entry 5337 (class 0 OID 18093)
-- Dependencies: 242
-- Data for Name: evento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evento (id, institucion_id, nombre, descripcion, fecha, lugar) FROM stdin;
1	1	Hackathon ISFT 220	Competencia de desarrollo	2026-10-20 09:00:00	Laboratorio 1
2	2	Feria de Ciencias	Exposición anual	2026-11-05 10:00:00	Patio Central
3	3	Seminario Reactores	Charla de seguridad	2026-09-15 14:00:00	Auditorio
\.


--
-- TOC entry 5339 (class 0 OID 18102)
-- Dependencies: 244
-- Data for Name: firma_acta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.firma_acta (id, acta_id, firmante_id, estado, fecha_firma) FROM stdin;
1	1	4	FIRMADA	2026-12-15 20:30:00
2	2	10	FIRMADA	2026-05-10 13:00:00
3	3	1	PENDIENTE	\N
\.


--
-- TOC entry 5341 (class 0 OID 18110)
-- Dependencies: 246
-- Data for Name: foro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.foro (id, institucion_id, carrera_id, materia_id, nombre, tipo) FROM stdin;
1	1	\N	\N	Foro General Institucional ISFT 220	INSTITUCIONAL
3	2	\N	\N	Foro EEST N°2	INSTITUCIONAL
2	1	1	\N	Foro Carrera Desarrollo de Software	CARRERA
\.


--
-- TOC entry 5343 (class 0 OID 18117)
-- Dependencies: 248
-- Data for Name: inscripcion_curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripcion_curso (id, curso_id, estudiante_id, fecha_inscripcion, estado_cursada) FROM stdin;
1	1	1	2026-03-01	REGULAR
2	1	2	2026-03-01	CURSANDO
3	2	3	2026-03-01	LIBRE
\.


--
-- TOC entry 5345 (class 0 OID 18126)
-- Dependencies: 250
-- Data for Name: inscripcion_evento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripcion_evento (id, evento_id, estudiante_id, fecha_inscripcion, estado) FROM stdin;
1	1	1	2026-09-01 10:00:00	INSCRIPTO
2	1	2	2026-09-02 11:00:00	CANCELADO
3	2	3	2026-10-01 09:00:00	ASISTIO
\.


--
-- TOC entry 5347 (class 0 OID 18135)
-- Dependencies: 252
-- Data for Name: inscripcion_mesa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripcion_mesa (id, mesa_examen_id, estudiante_id, fecha_inscripcion, estado, nota) FROM stdin;
1	1	1	2026-12-01	APROBADO	8.5
2	1	2	2026-12-01	INSCRIPTO	\N
3	2	3	2026-12-02	AUSENTE	\N
\.


--
-- TOC entry 5349 (class 0 OID 18144)
-- Dependencies: 254
-- Data for Name: institucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institucion (id, nombre, cuit, direccion, telefono) FROM stdin;
1	ISFT 220	30-11111111-1	Munro	4700-0001
2	EEST N°2	30-22222222-2	Munro	4700-0002
3	CENTRO ATOMICO	30-33333333-3	San Martin	4700-0003
\.


--
-- TOC entry 5351 (class 0 OID 18152)
-- Dependencies: 256
-- Data for Name: lectura_mensaje; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lectura_mensaje (id, mensaje_id, usuario_id, fecha_lectura) FROM stdin;
1	1	1	2026-05-10 18:01:00
2	1	2	2026-05-10 18:10:00
3	3	2	2026-04-01 12:10:00
\.


--
-- TOC entry 5353 (class 0 OID 18159)
-- Dependencies: 258
-- Data for Name: legajo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.legajo (id, usuario_id, fecha_creacion) FROM stdin;
1	1	2025-03-01
2	2	2025-03-01
3	4	2020-03-01
\.


--
-- TOC entry 5355 (class 0 OID 18166)
-- Dependencies: 260
-- Data for Name: licencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.licencia (id, solicitante_id, aprobada_por_id, fecha_solicitud, periodo_desde, periodo_hasta, motivo, estado) FROM stdin;
1	1	13	2026-05-01	2026-05-02	2026-05-10	Enfermedad	APROBADA
2	4	14	2026-06-01	2026-06-05	2026-06-07	Tramites personales	PENDIENTE
3	2	13	2026-08-01	2026-08-01	2026-08-05	Viaje	RECHAZADA
\.


--
-- TOC entry 5357 (class 0 OID 18178)
-- Dependencies: 262
-- Data for Name: materia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materia (id, carrera_id, nombre, anio_del_plan, carga_horaria) FROM stdin;
1	1	Metodologías Ágiles	3	64
2	1	Introducción a la Programación	1	128
3	1	Programación	2	128
4	2	Reparación de PC	4	64
5	3	Física Cuántica Básica	1	96
\.


--
-- TOC entry 5359 (class 0 OID 18185)
-- Dependencies: 264
-- Data for Name: mensaje; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mensaje (id, chat_id, autor_id, contenido, fecha_hora) FROM stdin;
1	1	4	Chicos, no se olviden del TP para mañana.	2026-05-10 18:00:00
2	1	1	Entendido profe.	2026-05-10 18:05:00
3	2	1	Hola Lucas, ¿hacemos el TP juntos?	2026-04-01 12:05:00
\.


--
-- TOC entry 5361 (class 0 OID 18196)
-- Dependencies: 266
-- Data for Name: mesa_examen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mesa_examen (id, materia_id, fecha, horario, aula, llamado) FROM stdin;
1	1	2026-12-15	18:00	Aula 10	1
2	2	2026-12-16	18:00	Aula 5	1
3	4	2026-12-17	08:00	Taller 2	1
\.


--
-- TOC entry 5363 (class 0 OID 18203)
-- Dependencies: 268
-- Data for Name: nota; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nota (id, inscripcion_curso_id, tipo, valor, fecha, observaciones) FROM stdin;
1	1	PARCIAL	9	2026-06-15	Excelente
2	2	PARCIAL	6	2026-06-15	Aprobado justo
3	3	TRABAJO_PRACTICO	4	2026-05-10	Desaprobado
\.


--
-- TOC entry 5365 (class 0 OID 18214)
-- Dependencies: 270
-- Data for Name: notificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notificacion (id, emisor_id, destinatario_id, fecha, titulo, contenido, estado_lectura, tipo) FROM stdin;
1	13	1	2026-05-02 09:00:00	Licencia Aprobada	Tu licencia ha sido aprobada.	NO_LEIDA	ADMINISTRATIVA
2	4	1	2026-06-16 10:00:00	Nota cargada	Se ha subido la nota de tu parcial.	LEIDA	ACADEMICA
3	\N	1	2026-10-18 08:00:00	Recordatorio Hackathon	Faltan 2 días para el evento.	NO_LEIDA	EVENTO
\.


--
-- TOC entry 5367 (class 0 OID 18227)
-- Dependencies: 272
-- Data for Name: participante_chat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.participante_chat (id, chat_id, usuario_id, fecha_ingreso) FROM stdin;
1	1	1	2026-03-10 10:05:00
2	1	4	2026-03-10 10:00:00
3	2	1	2026-04-01 12:00:00
\.


--
-- TOC entry 5369 (class 0 OID 18235)
-- Dependencies: 274
-- Data for Name: preceptor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.preceptor (id, numero_empleado) FROM stdin;
7	PRE-001
8	PRE-002
9	PRE-003
\.


--
-- TOC entry 5370 (class 0 OID 18240)
-- Dependencies: 275
-- Data for Name: preinscripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.preinscripcion (id, institucion_id, gestionada_por_id, nombre, apellido, dni, email, fecha_solicitud, estado) FROM stdin;
1	1	7	Juan	Perez	45111222	juan.perez@mail.com	2026-11-01	PENDIENTE
2	2	8	Camila	Gomez	46222333	cami@mail.com	2026-11-02	APROBADA
3	1	7	Pedro	Ruiz	47333444	pedro@mail.com	2026-11-03	RECHAZADA
\.


--
-- TOC entry 5372 (class 0 OID 18251)
-- Dependencies: 277
-- Data for Name: publicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publicacion (id, charla_id, autor_id, titulo, contenido, fecha_creacion, destacada, estado) FROM stdin;
1	1	10	Bienvenidos al ciclo 2026	Información importante...	2026-03-01 08:00:00	t	ACTIVA
2	2	1	Consulta sobre correlativas	Alguien sabe qué pasa si...	2026-04-10 15:00:00	f	ACTIVA
3	24	4	Material de Metodologías de Pruebas	Les dejo los apuntes...	2026-05-12 10:00:00	f	ACTIVA
\.


--
-- TOC entry 5374 (class 0 OID 18265)
-- Dependencies: 279
-- Data for Name: respuesta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.respuesta (id, publicacion_id, autor_id, contenido, fecha_creacion) FROM stdin;
1	2	7	Tenés que revisar el plan de estudios...	2026-04-10 16:00:00
2	2	2	Gracias por la info!	2026-04-10 17:00:00
3	3	1	Excelente material profe.	2026-05-12 11:00:00
\.


--
-- TOC entry 5376 (class 0 OID 18276)
-- Dependencies: 281
-- Data for Name: secretario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.secretario (id, numero_empleado) FROM stdin;
13	SEC-001
14	SEC-002
15	SEC-003
\.


--
-- TOC entry 5377 (class 0 OID 18281)
-- Dependencies: 282
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id, dni, nombre, apellido, email, password_hash, telefono, fecha_nacimiento) FROM stdin;
6	32666777	Carlos	Ruiz	carlos@mail.com	hash123	1133445568	1988-09-25
7	28777888	Laura	Diaz	laura.p@mail.com	hash123	1144556677	1980-01-10
8	29888999	Diego	Sosa	diego.p@mail.com	hash123	1144556678	1982-02-14
9	30999000	Sofia	Luna	sofia.p@mail.com	hash123	1144556679	1984-11-30
10	20111222	Raul	Perez	raul.d@mail.com	hash123	1155667788	1970-05-05
11	21222333	Marta	Silva	marta.d@mail.com	hash123	1155667789	1972-07-08
12	22333444	Jorge	Rios	jorge.d@mail.com	hash123	1155667790	1975-12-12
13	25444555	Elena	Castro	elena.s@mail.com	hash123	1166778899	1978-03-22
14	26555666	Pablo	Vega	pablo.s@mail.com	hash123	1166778800	1979-06-18
15	27666777	Clara	Molina	clara.s@mail.com	hash123	1166778811	1981-09-24
1	40111222	Agustin	Casal	agustin@mail.com	$2b$10$FP1PsQVXQdS6wsc1tiYj6ecXoVd.LHBlVyn41HUAXjDppCkSKmYYi	1122334455	2000-05-10
2	41222333	Lucas	Martinez	lucas@mail.com	$2b$10$cNKYR9pH3.V2p4QM0O2ICuhcIZLf50lbnOBy.d.oAdl.trVAlLkCi	1122334456	2001-06-15
3	42333444	Mateo	Noba	mateo@mail.com	$2b$10$gzGEVI79iuYwZPrvetrOseuJ/nzcEvtOdPWOjFjyZ9IdxnR5lE4Rm	1122334457	2002-08-20
4	30444555	Guido	Herrera	guido@mail.com	$2b$10$CoNOyBw5RUNHMQm74ovMQ.Vw/o8gjbuy0DBOS3y.P571uUsVJx/Hm	1133445566	1985-03-12
5	31555666	Tobias	Noba	tobias@mail.com	$2b$10$PInmEd2ozKY8Mctho1/5NOjhpEpUrX0B9dPapFymcol0dqRnLoGQa	1133445567	1986-04-18
\.


--
-- TOC entry 5379 (class 0 OID 18293)
-- Dependencies: 284
-- Data for Name: usuario_institucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_institucion (id, usuario_id, institucion_id, fecha_desde, fecha_hasta, activo) FROM stdin;
1	1	1	2025-03-01	\N	t
2	2	1	2025-03-01	\N	t
3	4	1	2020-03-01	\N	t
\.


--
-- TOC entry 5417 (class 0 OID 0)
-- Dependencies: 220
-- Name: acta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.acta_id_seq', 3, true);


--
-- TOC entry 5418 (class 0 OID 0)
-- Dependencies: 222
-- Name: asistencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asistencia_id_seq', 3, true);


--
-- TOC entry 5419 (class 0 OID 0)
-- Dependencies: 224
-- Name: carrera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrera_id_seq', 3, true);


--
-- TOC entry 5420 (class 0 OID 0)
-- Dependencies: 226
-- Name: charla_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.charla_id_seq', 24, true);


--
-- TOC entry 5421 (class 0 OID 0)
-- Dependencies: 228
-- Name: chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_id_seq', 3, true);


--
-- TOC entry 5422 (class 0 OID 0)
-- Dependencies: 230
-- Name: consulta_chatbot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consulta_chatbot_id_seq', 3, true);


--
-- TOC entry 5423 (class 0 OID 0)
-- Dependencies: 232
-- Name: correlatividad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.correlatividad_id_seq', 3, true);


--
-- TOC entry 5424 (class 0 OID 0)
-- Dependencies: 234
-- Name: curso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curso_id_seq', 3, true);


--
-- TOC entry 5425 (class 0 OID 0)
-- Dependencies: 240
-- Name: documento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documento_id_seq', 3, true);


--
-- TOC entry 5426 (class 0 OID 0)
-- Dependencies: 243
-- Name: evento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evento_id_seq', 3, true);


--
-- TOC entry 5427 (class 0 OID 0)
-- Dependencies: 245
-- Name: firma_acta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.firma_acta_id_seq', 3, true);


--
-- TOC entry 5428 (class 0 OID 0)
-- Dependencies: 247
-- Name: foro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.foro_id_seq', 3, true);


--
-- TOC entry 5429 (class 0 OID 0)
-- Dependencies: 249
-- Name: inscripcion_curso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripcion_curso_id_seq', 3, true);


--
-- TOC entry 5430 (class 0 OID 0)
-- Dependencies: 251
-- Name: inscripcion_evento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripcion_evento_id_seq', 3, true);


--
-- TOC entry 5431 (class 0 OID 0)
-- Dependencies: 253
-- Name: inscripcion_mesa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripcion_mesa_id_seq', 3, true);


--
-- TOC entry 5432 (class 0 OID 0)
-- Dependencies: 255
-- Name: institucion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.institucion_id_seq', 3, true);


--
-- TOC entry 5433 (class 0 OID 0)
-- Dependencies: 257
-- Name: lectura_mensaje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lectura_mensaje_id_seq', 3, true);


--
-- TOC entry 5434 (class 0 OID 0)
-- Dependencies: 259
-- Name: legajo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.legajo_id_seq', 3, true);


--
-- TOC entry 5435 (class 0 OID 0)
-- Dependencies: 261
-- Name: licencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.licencia_id_seq', 3, true);


--
-- TOC entry 5436 (class 0 OID 0)
-- Dependencies: 263
-- Name: materia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materia_id_seq', 5, true);


--
-- TOC entry 5437 (class 0 OID 0)
-- Dependencies: 265
-- Name: mensaje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mensaje_id_seq', 3, true);


--
-- TOC entry 5438 (class 0 OID 0)
-- Dependencies: 267
-- Name: mesa_examen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mesa_examen_id_seq', 3, true);


--
-- TOC entry 5439 (class 0 OID 0)
-- Dependencies: 269
-- Name: nota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nota_id_seq', 3, true);


--
-- TOC entry 5440 (class 0 OID 0)
-- Dependencies: 271
-- Name: notificacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notificacion_id_seq', 3, true);


--
-- TOC entry 5441 (class 0 OID 0)
-- Dependencies: 273
-- Name: participante_chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.participante_chat_id_seq', 3, true);


--
-- TOC entry 5442 (class 0 OID 0)
-- Dependencies: 276
-- Name: preinscripcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.preinscripcion_id_seq', 3, true);


--
-- TOC entry 5443 (class 0 OID 0)
-- Dependencies: 278
-- Name: publicacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.publicacion_id_seq', 3, true);


--
-- TOC entry 5444 (class 0 OID 0)
-- Dependencies: 280
-- Name: respuesta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.respuesta_id_seq', 3, true);


--
-- TOC entry 5445 (class 0 OID 0)
-- Dependencies: 283
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 15, true);


--
-- TOC entry 5446 (class 0 OID 0)
-- Dependencies: 285
-- Name: usuario_institucion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_institucion_id_seq', 3, true);


--
-- TOC entry 5019 (class 2606 OID 18332)
-- Name: acta acta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acta
    ADD CONSTRAINT acta_pkey PRIMARY KEY (id);


--
-- TOC entry 5021 (class 2606 OID 18334)
-- Name: asistencia asistencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencia
    ADD CONSTRAINT asistencia_pkey PRIMARY KEY (id);


--
-- TOC entry 5023 (class 2606 OID 18336)
-- Name: carrera carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera
    ADD CONSTRAINT carrera_pkey PRIMARY KEY (id);


--
-- TOC entry 5025 (class 2606 OID 18338)
-- Name: charla charla_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charla
    ADD CONSTRAINT charla_pkey PRIMARY KEY (id);


--
-- TOC entry 5027 (class 2606 OID 18340)
-- Name: chat chat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pkey PRIMARY KEY (id);


--
-- TOC entry 5029 (class 2606 OID 18342)
-- Name: consulta_chatbot consulta_chatbot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta_chatbot
    ADD CONSTRAINT consulta_chatbot_pkey PRIMARY KEY (id);


--
-- TOC entry 5031 (class 2606 OID 18344)
-- Name: correlatividad correlatividad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correlatividad
    ADD CONSTRAINT correlatividad_pkey PRIMARY KEY (id);


--
-- TOC entry 5033 (class 2606 OID 18346)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id);


--
-- TOC entry 5035 (class 2606 OID 18348)
-- Name: director director_numero_empleado_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.director
    ADD CONSTRAINT director_numero_empleado_key UNIQUE (numero_empleado);


--
-- TOC entry 5037 (class 2606 OID 18350)
-- Name: director director_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.director
    ADD CONSTRAINT director_pkey PRIMARY KEY (id);


--
-- TOC entry 5043 (class 2606 OID 18352)
-- Name: docente_curso docente_curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente_curso
    ADD CONSTRAINT docente_curso_pkey PRIMARY KEY (curso_id, docente_id);


--
-- TOC entry 5045 (class 2606 OID 18354)
-- Name: docente_mesa_examen docente_mesa_examen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente_mesa_examen
    ADD CONSTRAINT docente_mesa_examen_pkey PRIMARY KEY (mesa_examen_id, docente_id);


--
-- TOC entry 5039 (class 2606 OID 18356)
-- Name: docente docente_numero_docente_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente
    ADD CONSTRAINT docente_numero_docente_key UNIQUE (numero_docente);


--
-- TOC entry 5041 (class 2606 OID 18358)
-- Name: docente docente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente
    ADD CONSTRAINT docente_pkey PRIMARY KEY (id);


--
-- TOC entry 5047 (class 2606 OID 18360)
-- Name: documento documento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (id);


--
-- TOC entry 5049 (class 2606 OID 18362)
-- Name: estudiante estudiante_numero_estudiante_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_numero_estudiante_key UNIQUE (numero_estudiante);


--
-- TOC entry 5051 (class 2606 OID 18364)
-- Name: estudiante estudiante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_pkey PRIMARY KEY (id);


--
-- TOC entry 5053 (class 2606 OID 18366)
-- Name: evento evento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT evento_pkey PRIMARY KEY (id);


--
-- TOC entry 5055 (class 2606 OID 18368)
-- Name: firma_acta firma_acta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firma_acta
    ADD CONSTRAINT firma_acta_pkey PRIMARY KEY (id);


--
-- TOC entry 5057 (class 2606 OID 18370)
-- Name: foro foro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foro
    ADD CONSTRAINT foro_pkey PRIMARY KEY (id);


--
-- TOC entry 5059 (class 2606 OID 18372)
-- Name: inscripcion_curso inscripcion_curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion_curso
    ADD CONSTRAINT inscripcion_curso_pkey PRIMARY KEY (id);


--
-- TOC entry 5061 (class 2606 OID 18374)
-- Name: inscripcion_evento inscripcion_evento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion_evento
    ADD CONSTRAINT inscripcion_evento_pkey PRIMARY KEY (id);


--
-- TOC entry 5063 (class 2606 OID 18376)
-- Name: inscripcion_mesa inscripcion_mesa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion_mesa
    ADD CONSTRAINT inscripcion_mesa_pkey PRIMARY KEY (id);


--
-- TOC entry 5065 (class 2606 OID 18378)
-- Name: institucion institucion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institucion
    ADD CONSTRAINT institucion_pkey PRIMARY KEY (id);


--
-- TOC entry 5067 (class 2606 OID 18380)
-- Name: lectura_mensaje lectura_mensaje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectura_mensaje
    ADD CONSTRAINT lectura_mensaje_pkey PRIMARY KEY (id);


--
-- TOC entry 5069 (class 2606 OID 18382)
-- Name: legajo legajo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legajo
    ADD CONSTRAINT legajo_pkey PRIMARY KEY (id);


--
-- TOC entry 5071 (class 2606 OID 18384)
-- Name: legajo legajo_usuario_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legajo
    ADD CONSTRAINT legajo_usuario_id_key UNIQUE (usuario_id);


--
-- TOC entry 5073 (class 2606 OID 18386)
-- Name: licencia licencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licencia
    ADD CONSTRAINT licencia_pkey PRIMARY KEY (id);


--
-- TOC entry 5075 (class 2606 OID 18388)
-- Name: materia materia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materia
    ADD CONSTRAINT materia_pkey PRIMARY KEY (id);


--
-- TOC entry 5077 (class 2606 OID 18390)
-- Name: mensaje mensaje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT mensaje_pkey PRIMARY KEY (id);


--
-- TOC entry 5079 (class 2606 OID 18392)
-- Name: mesa_examen mesa_examen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesa_examen
    ADD CONSTRAINT mesa_examen_pkey PRIMARY KEY (id);


--
-- TOC entry 5081 (class 2606 OID 18394)
-- Name: nota nota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota
    ADD CONSTRAINT nota_pkey PRIMARY KEY (id);


--
-- TOC entry 5083 (class 2606 OID 18396)
-- Name: notificacion notificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificacion
    ADD CONSTRAINT notificacion_pkey PRIMARY KEY (id);


--
-- TOC entry 5085 (class 2606 OID 18398)
-- Name: participante_chat participante_chat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participante_chat
    ADD CONSTRAINT participante_chat_pkey PRIMARY KEY (id);


--
-- TOC entry 5087 (class 2606 OID 18400)
-- Name: preceptor preceptor_numero_empleado_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preceptor
    ADD CONSTRAINT preceptor_numero_empleado_key UNIQUE (numero_empleado);


--
-- TOC entry 5089 (class 2606 OID 18402)
-- Name: preceptor preceptor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preceptor
    ADD CONSTRAINT preceptor_pkey PRIMARY KEY (id);


--
-- TOC entry 5091 (class 2606 OID 18404)
-- Name: preinscripcion preinscripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preinscripcion
    ADD CONSTRAINT preinscripcion_pkey PRIMARY KEY (id);


--
-- TOC entry 5093 (class 2606 OID 18406)
-- Name: publicacion publicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicacion
    ADD CONSTRAINT publicacion_pkey PRIMARY KEY (id);


--
-- TOC entry 5095 (class 2606 OID 18408)
-- Name: respuesta respuesta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respuesta
    ADD CONSTRAINT respuesta_pkey PRIMARY KEY (id);


--
-- TOC entry 5097 (class 2606 OID 18410)
-- Name: secretario secretario_numero_empleado_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secretario
    ADD CONSTRAINT secretario_numero_empleado_key UNIQUE (numero_empleado);


--
-- TOC entry 5099 (class 2606 OID 18412)
-- Name: secretario secretario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secretario
    ADD CONSTRAINT secretario_pkey PRIMARY KEY (id);


--
-- TOC entry 5101 (class 2606 OID 18414)
-- Name: usuario usuario_dni_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_dni_key UNIQUE (dni);


--
-- TOC entry 5103 (class 2606 OID 18416)
-- Name: usuario usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_email_key UNIQUE (email);


--
-- TOC entry 5107 (class 2606 OID 18418)
-- Name: usuario_institucion usuario_institucion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_institucion
    ADD CONSTRAINT usuario_institucion_pkey PRIMARY KEY (id);


--
-- TOC entry 5105 (class 2606 OID 18420)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 5108 (class 2606 OID 18421)
-- Name: acta acta_creada_por_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acta
    ADD CONSTRAINT acta_creada_por_id_fkey FOREIGN KEY (creada_por_id) REFERENCES public.usuario(id);


--
-- TOC entry 5109 (class 2606 OID 18426)
-- Name: asistencia asistencia_curso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencia
    ADD CONSTRAINT asistencia_curso_id_fkey FOREIGN KEY (curso_id) REFERENCES public.curso(id);


--
-- TOC entry 5110 (class 2606 OID 18431)
-- Name: asistencia asistencia_estudiante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencia
    ADD CONSTRAINT asistencia_estudiante_id_fkey FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(id);


--
-- TOC entry 5111 (class 2606 OID 18436)
-- Name: asistencia asistencia_registrada_por_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencia
    ADD CONSTRAINT asistencia_registrada_por_id_fkey FOREIGN KEY (registrada_por_id) REFERENCES public.usuario(id);


--
-- TOC entry 5112 (class 2606 OID 18441)
-- Name: carrera carrera_institucion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera
    ADD CONSTRAINT carrera_institucion_id_fkey FOREIGN KEY (institucion_id) REFERENCES public.institucion(id);


--
-- TOC entry 5113 (class 2606 OID 18446)
-- Name: charla charla_foro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charla
    ADD CONSTRAINT charla_foro_id_fkey FOREIGN KEY (foro_id) REFERENCES public.foro(id) ON DELETE CASCADE;


--
-- TOC entry 5114 (class 2606 OID 18451)
-- Name: chat chat_curso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_curso_id_fkey FOREIGN KEY (curso_id) REFERENCES public.curso(id);


--
-- TOC entry 5115 (class 2606 OID 18456)
-- Name: consulta_chatbot consulta_chatbot_consultante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta_chatbot
    ADD CONSTRAINT consulta_chatbot_consultante_id_fkey FOREIGN KEY (consultante_id) REFERENCES public.usuario(id);


--
-- TOC entry 5116 (class 2606 OID 18461)
-- Name: consulta_chatbot consulta_chatbot_derivada_a_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta_chatbot
    ADD CONSTRAINT consulta_chatbot_derivada_a_id_fkey FOREIGN KEY (derivada_a_id) REFERENCES public.usuario(id);


--
-- TOC entry 5117 (class 2606 OID 18466)
-- Name: correlatividad correlatividad_materia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correlatividad
    ADD CONSTRAINT correlatividad_materia_id_fkey FOREIGN KEY (materia_id) REFERENCES public.materia(id);


--
-- TOC entry 5118 (class 2606 OID 18471)
-- Name: correlatividad correlatividad_materia_requerida_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correlatividad
    ADD CONSTRAINT correlatividad_materia_requerida_id_fkey FOREIGN KEY (materia_requerida_id) REFERENCES public.materia(id);


--
-- TOC entry 5119 (class 2606 OID 18476)
-- Name: curso curso_materia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_materia_id_fkey FOREIGN KEY (materia_id) REFERENCES public.materia(id);


--
-- TOC entry 5120 (class 2606 OID 18481)
-- Name: director director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.director
    ADD CONSTRAINT director_id_fkey FOREIGN KEY (id) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- TOC entry 5122 (class 2606 OID 18486)
-- Name: docente_curso docente_curso_curso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente_curso
    ADD CONSTRAINT docente_curso_curso_id_fkey FOREIGN KEY (curso_id) REFERENCES public.curso(id) ON DELETE CASCADE;


--
-- TOC entry 5123 (class 2606 OID 18491)
-- Name: docente_curso docente_curso_docente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente_curso
    ADD CONSTRAINT docente_curso_docente_id_fkey FOREIGN KEY (docente_id) REFERENCES public.docente(id) ON DELETE CASCADE;


--
-- TOC entry 5121 (class 2606 OID 18496)
-- Name: docente docente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente
    ADD CONSTRAINT docente_id_fkey FOREIGN KEY (id) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- TOC entry 5124 (class 2606 OID 18501)
-- Name: docente_mesa_examen docente_mesa_examen_docente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente_mesa_examen
    ADD CONSTRAINT docente_mesa_examen_docente_id_fkey FOREIGN KEY (docente_id) REFERENCES public.docente(id) ON DELETE CASCADE;


--
-- TOC entry 5125 (class 2606 OID 18506)
-- Name: docente_mesa_examen docente_mesa_examen_mesa_examen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docente_mesa_examen
    ADD CONSTRAINT docente_mesa_examen_mesa_examen_id_fkey FOREIGN KEY (mesa_examen_id) REFERENCES public.mesa_examen(id) ON DELETE CASCADE;


--
-- TOC entry 5126 (class 2606 OID 18511)
-- Name: documento documento_legajo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_legajo_id_fkey FOREIGN KEY (legajo_id) REFERENCES public.legajo(id);


--
-- TOC entry 5127 (class 2606 OID 18516)
-- Name: documento documento_licencia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_licencia_id_fkey FOREIGN KEY (licencia_id) REFERENCES public.licencia(id);


--
-- TOC entry 5128 (class 2606 OID 18521)
-- Name: documento documento_revisado_por_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_revisado_por_id_fkey FOREIGN KEY (revisado_por_id) REFERENCES public.preceptor(id);


--
-- TOC entry 5129 (class 2606 OID 18526)
-- Name: documento documento_subido_por_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento
    ADD CONSTRAINT documento_subido_por_id_fkey FOREIGN KEY (subido_por_id) REFERENCES public.usuario(id);


--
-- TOC entry 5130 (class 2606 OID 18531)
-- Name: estudiante estudiante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_id_fkey FOREIGN KEY (id) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- TOC entry 5131 (class 2606 OID 18536)
-- Name: evento evento_institucion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT evento_institucion_id_fkey FOREIGN KEY (institucion_id) REFERENCES public.institucion(id);


--
-- TOC entry 5132 (class 2606 OID 18541)
-- Name: firma_acta firma_acta_acta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firma_acta
    ADD CONSTRAINT firma_acta_acta_id_fkey FOREIGN KEY (acta_id) REFERENCES public.acta(id) ON DELETE CASCADE;


--
-- TOC entry 5133 (class 2606 OID 18546)
-- Name: firma_acta firma_acta_firmante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firma_acta
    ADD CONSTRAINT firma_acta_firmante_id_fkey FOREIGN KEY (firmante_id) REFERENCES public.usuario(id);


--
-- TOC entry 5134 (class 2606 OID 18551)
-- Name: foro foro_carrera_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foro
    ADD CONSTRAINT foro_carrera_id_fkey FOREIGN KEY (carrera_id) REFERENCES public.carrera(id);


--
-- TOC entry 5135 (class 2606 OID 18556)
-- Name: foro foro_institucion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foro
    ADD CONSTRAINT foro_institucion_id_fkey FOREIGN KEY (institucion_id) REFERENCES public.institucion(id);


--
-- TOC entry 5136 (class 2606 OID 18561)
-- Name: foro foro_materia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foro
    ADD CONSTRAINT foro_materia_id_fkey FOREIGN KEY (materia_id) REFERENCES public.materia(id);


--
-- TOC entry 5137 (class 2606 OID 18566)
-- Name: inscripcion_curso inscripcion_curso_curso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion_curso
    ADD CONSTRAINT inscripcion_curso_curso_id_fkey FOREIGN KEY (curso_id) REFERENCES public.curso(id);


--
-- TOC entry 5138 (class 2606 OID 18571)
-- Name: inscripcion_curso inscripcion_curso_estudiante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion_curso
    ADD CONSTRAINT inscripcion_curso_estudiante_id_fkey FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(id);


--
-- TOC entry 5139 (class 2606 OID 18576)
-- Name: inscripcion_evento inscripcion_evento_estudiante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion_evento
    ADD CONSTRAINT inscripcion_evento_estudiante_id_fkey FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(id);


--
-- TOC entry 5140 (class 2606 OID 18581)
-- Name: inscripcion_evento inscripcion_evento_evento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion_evento
    ADD CONSTRAINT inscripcion_evento_evento_id_fkey FOREIGN KEY (evento_id) REFERENCES public.evento(id);


--
-- TOC entry 5141 (class 2606 OID 18586)
-- Name: inscripcion_mesa inscripcion_mesa_estudiante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion_mesa
    ADD CONSTRAINT inscripcion_mesa_estudiante_id_fkey FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(id);


--
-- TOC entry 5142 (class 2606 OID 18591)
-- Name: inscripcion_mesa inscripcion_mesa_mesa_examen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion_mesa
    ADD CONSTRAINT inscripcion_mesa_mesa_examen_id_fkey FOREIGN KEY (mesa_examen_id) REFERENCES public.mesa_examen(id);


--
-- TOC entry 5143 (class 2606 OID 18596)
-- Name: lectura_mensaje lectura_mensaje_mensaje_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectura_mensaje
    ADD CONSTRAINT lectura_mensaje_mensaje_id_fkey FOREIGN KEY (mensaje_id) REFERENCES public.mensaje(id) ON DELETE CASCADE;


--
-- TOC entry 5144 (class 2606 OID 18601)
-- Name: lectura_mensaje lectura_mensaje_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectura_mensaje
    ADD CONSTRAINT lectura_mensaje_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- TOC entry 5145 (class 2606 OID 18606)
-- Name: legajo legajo_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legajo
    ADD CONSTRAINT legajo_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- TOC entry 5146 (class 2606 OID 18611)
-- Name: licencia licencia_aprobada_por_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licencia
    ADD CONSTRAINT licencia_aprobada_por_id_fkey FOREIGN KEY (aprobada_por_id) REFERENCES public.secretario(id);


--
-- TOC entry 5147 (class 2606 OID 18616)
-- Name: licencia licencia_solicitante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licencia
    ADD CONSTRAINT licencia_solicitante_id_fkey FOREIGN KEY (solicitante_id) REFERENCES public.usuario(id);


--
-- TOC entry 5148 (class 2606 OID 18621)
-- Name: materia materia_carrera_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materia
    ADD CONSTRAINT materia_carrera_id_fkey FOREIGN KEY (carrera_id) REFERENCES public.carrera(id) ON DELETE CASCADE;


--
-- TOC entry 5149 (class 2606 OID 18626)
-- Name: mensaje mensaje_autor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT mensaje_autor_id_fkey FOREIGN KEY (autor_id) REFERENCES public.usuario(id);


--
-- TOC entry 5150 (class 2606 OID 18631)
-- Name: mensaje mensaje_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensaje
    ADD CONSTRAINT mensaje_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chat(id) ON DELETE CASCADE;


--
-- TOC entry 5151 (class 2606 OID 18636)
-- Name: mesa_examen mesa_examen_materia_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesa_examen
    ADD CONSTRAINT mesa_examen_materia_id_fkey FOREIGN KEY (materia_id) REFERENCES public.materia(id);


--
-- TOC entry 5152 (class 2606 OID 18641)
-- Name: nota nota_inscripcion_curso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota
    ADD CONSTRAINT nota_inscripcion_curso_id_fkey FOREIGN KEY (inscripcion_curso_id) REFERENCES public.inscripcion_curso(id) ON DELETE CASCADE;


--
-- TOC entry 5153 (class 2606 OID 18646)
-- Name: notificacion notificacion_destinatario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificacion
    ADD CONSTRAINT notificacion_destinatario_id_fkey FOREIGN KEY (destinatario_id) REFERENCES public.usuario(id);


--
-- TOC entry 5154 (class 2606 OID 18651)
-- Name: notificacion notificacion_emisor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificacion
    ADD CONSTRAINT notificacion_emisor_id_fkey FOREIGN KEY (emisor_id) REFERENCES public.usuario(id);


--
-- TOC entry 5155 (class 2606 OID 18656)
-- Name: participante_chat participante_chat_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participante_chat
    ADD CONSTRAINT participante_chat_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chat(id) ON DELETE CASCADE;


--
-- TOC entry 5156 (class 2606 OID 18661)
-- Name: participante_chat participante_chat_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participante_chat
    ADD CONSTRAINT participante_chat_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- TOC entry 5157 (class 2606 OID 18666)
-- Name: preceptor preceptor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preceptor
    ADD CONSTRAINT preceptor_id_fkey FOREIGN KEY (id) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- TOC entry 5158 (class 2606 OID 18671)
-- Name: preinscripcion preinscripcion_gestionada_por_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preinscripcion
    ADD CONSTRAINT preinscripcion_gestionada_por_id_fkey FOREIGN KEY (gestionada_por_id) REFERENCES public.preceptor(id);


--
-- TOC entry 5159 (class 2606 OID 18676)
-- Name: preinscripcion preinscripcion_institucion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preinscripcion
    ADD CONSTRAINT preinscripcion_institucion_id_fkey FOREIGN KEY (institucion_id) REFERENCES public.institucion(id);


--
-- TOC entry 5160 (class 2606 OID 18681)
-- Name: publicacion publicacion_autor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicacion
    ADD CONSTRAINT publicacion_autor_id_fkey FOREIGN KEY (autor_id) REFERENCES public.usuario(id);


--
-- TOC entry 5161 (class 2606 OID 18686)
-- Name: publicacion publicacion_charla_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicacion
    ADD CONSTRAINT publicacion_charla_id_fkey FOREIGN KEY (charla_id) REFERENCES public.charla(id) ON DELETE CASCADE;


--
-- TOC entry 5162 (class 2606 OID 18691)
-- Name: respuesta respuesta_autor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respuesta
    ADD CONSTRAINT respuesta_autor_id_fkey FOREIGN KEY (autor_id) REFERENCES public.usuario(id);


--
-- TOC entry 5163 (class 2606 OID 18696)
-- Name: respuesta respuesta_publicacion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respuesta
    ADD CONSTRAINT respuesta_publicacion_id_fkey FOREIGN KEY (publicacion_id) REFERENCES public.publicacion(id) ON DELETE CASCADE;


--
-- TOC entry 5164 (class 2606 OID 18701)
-- Name: secretario secretario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.secretario
    ADD CONSTRAINT secretario_id_fkey FOREIGN KEY (id) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- TOC entry 5165 (class 2606 OID 18706)
-- Name: usuario_institucion usuario_institucion_institucion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_institucion
    ADD CONSTRAINT usuario_institucion_institucion_id_fkey FOREIGN KEY (institucion_id) REFERENCES public.institucion(id);


--
-- TOC entry 5166 (class 2606 OID 18711)
-- Name: usuario_institucion usuario_institucion_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_institucion
    ADD CONSTRAINT usuario_institucion_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


-- Completed on 2026-10-09 09:25:16

--
-- PostgreSQL database dump complete
--

\unrestrict xU6Y3tMy41yVsACrp2FwbjFwaQxbfWtw0ULrlNf7gboAqIgNEVAvgcH56ZYtt9U

