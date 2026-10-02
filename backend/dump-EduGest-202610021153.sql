--
-- PostgreSQL database dump
--

\restrict Lq8g7DPp0MSeExeudSaNGGAmOtls3qAoOXhs7vsf0rjymwNOlP5spjLAu8Lg7R4

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-02 11:53:11

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
-- TOC entry 5257 (class 1262 OID 16388)
-- Name: EduGest; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "EduGest" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';


ALTER DATABASE "EduGest" OWNER TO postgres;

\unrestrict Lq8g7DPp0MSeExeudSaNGGAmOtls3qAoOXhs7vsf0rjymwNOlP5spjLAu8Lg7R4
\connect "EduGest"
\restrict Lq8g7DPp0MSeExeudSaNGGAmOtls3qAoOXhs7vsf0rjymwNOlP5spjLAu8Lg7R4

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
-- TOC entry 916 (class 1247 OID 16404)
-- Name: cuatrimestre; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.cuatrimestre AS ENUM (
    'PRIMERO',
    'SEGUNDO',
    'ANUAL'
);


ALTER TYPE public.cuatrimestre OWNER TO postgres;

--
-- TOC entry 919 (class 1247 OID 16412)
-- Name: estado_academico; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_academico AS ENUM (
    'ACTIVO',
    'DE_LICENCIA',
    'EGRESADO'
);


ALTER TYPE public.estado_academico OWNER TO postgres;

--
-- TOC entry 922 (class 1247 OID 16420)
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
-- TOC entry 925 (class 1247 OID 16430)
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
-- TOC entry 928 (class 1247 OID 16440)
-- Name: estado_documento; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_documento AS ENUM (
    'PENDIENTE',
    'APROBADO',
    'RECHAZADO'
);


ALTER TYPE public.estado_documento OWNER TO postgres;

--
-- TOC entry 931 (class 1247 OID 16448)
-- Name: estado_firma; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_firma AS ENUM (
    'PENDIENTE',
    'FIRMADA'
);


ALTER TYPE public.estado_firma OWNER TO postgres;

--
-- TOC entry 934 (class 1247 OID 16454)
-- Name: estado_inscripcion_evento; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_inscripcion_evento AS ENUM (
    'INSCRIPTO',
    'CANCELADO',
    'ASISTIO'
);


ALTER TYPE public.estado_inscripcion_evento OWNER TO postgres;

--
-- TOC entry 937 (class 1247 OID 16462)
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
-- TOC entry 940 (class 1247 OID 16472)
-- Name: estado_lectura; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_lectura AS ENUM (
    'LEIDA',
    'NO_LEIDA'
);


ALTER TYPE public.estado_lectura OWNER TO postgres;

--
-- TOC entry 943 (class 1247 OID 16478)
-- Name: estado_licencia; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_licencia AS ENUM (
    'PENDIENTE',
    'APROBADA',
    'RECHAZADA'
);


ALTER TYPE public.estado_licencia OWNER TO postgres;

--
-- TOC entry 946 (class 1247 OID 16486)
-- Name: estado_preinscripcion; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_preinscripcion AS ENUM (
    'PENDIENTE',
    'APROBADA',
    'RECHAZADA'
);


ALTER TYPE public.estado_preinscripcion OWNER TO postgres;

--
-- TOC entry 949 (class 1247 OID 16494)
-- Name: estado_publicacion; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.estado_publicacion AS ENUM (
    'ACTIVA',
    'CERRADA',
    'ELIMINADA'
);


ALTER TYPE public.estado_publicacion OWNER TO postgres;

--
-- TOC entry 952 (class 1247 OID 16502)
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
-- TOC entry 955 (class 1247 OID 16512)
-- Name: tipo_chat; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_chat AS ENUM (
    'CURSO',
    'PRIVADO',
    'ADMINISTRATIVO'
);


ALTER TYPE public.tipo_chat OWNER TO postgres;

--
-- TOC entry 958 (class 1247 OID 16520)
-- Name: tipo_correlatividad; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipo_correlatividad AS ENUM (
    'PARA_CURSAR',
    'PARA_RENDIR'
);


ALTER TYPE public.tipo_correlatividad OWNER TO postgres;

--
-- TOC entry 961 (class 1247 OID 16526)
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
-- TOC entry 964 (class 1247 OID 16538)
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
-- TOC entry 967 (class 1247 OID 16548)
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
-- TOC entry 970 (class 1247 OID 16558)
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
-- TOC entry 219 (class 1259 OID 16571)
-- Name: acta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.acta (
    id bigint NOT NULL,
    tipo public.tipo_acta NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    contenido text NOT NULL,
    creada_por_usuario_id bigint NOT NULL
);


ALTER TABLE public.acta OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16582)
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
-- TOC entry 5258 (class 0 OID 0)
-- Dependencies: 220
-- Name: acta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.acta_id_seq OWNED BY public.acta.id;


--
-- TOC entry 221 (class 1259 OID 16583)
-- Name: asistencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asistencia (
    id bigint NOT NULL,
    fecha date NOT NULL,
    estado public.estado_asistencia NOT NULL,
    observaciones text,
    estudiante_id bigint NOT NULL,
    curso_id bigint NOT NULL,
    registrada_por_usuario_id bigint NOT NULL
);


ALTER TABLE public.asistencia OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16594)
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
-- TOC entry 5259 (class 0 OID 0)
-- Dependencies: 222
-- Name: asistencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asistencia_id_seq OWNED BY public.asistencia.id;


--
-- TOC entry 223 (class 1259 OID 16595)
-- Name: carrera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carrera (
    id bigint NOT NULL,
    nombre character varying(150) NOT NULL,
    titulo_otorgado character varying(150),
    duracion_anios integer,
    institucion_id bigint
);


ALTER TABLE public.carrera OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16600)
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
-- TOC entry 5260 (class 0 OID 0)
-- Dependencies: 224
-- Name: carrera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrera_id_seq OWNED BY public.carrera.id;


--
-- TOC entry 225 (class 1259 OID 16601)
-- Name: chat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat (
    id bigint NOT NULL,
    tipo public.tipo_chat NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    curso_id bigint
);


ALTER TABLE public.chat OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16608)
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
-- TOC entry 5261 (class 0 OID 0)
-- Dependencies: 226
-- Name: chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_id_seq OWNED BY public.chat.id;


--
-- TOC entry 227 (class 1259 OID 16609)
-- Name: consulta_chatbot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consulta_chatbot (
    id bigint NOT NULL,
    pregunta text NOT NULL,
    respuesta text,
    fecha_hora timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    resuelta boolean DEFAULT false,
    consultante_usuario_id bigint NOT NULL,
    derivada_a_usuario_id bigint
);


ALTER TABLE public.consulta_chatbot OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16620)
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
-- TOC entry 5262 (class 0 OID 0)
-- Dependencies: 228
-- Name: consulta_chatbot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consulta_chatbot_id_seq OWNED BY public.consulta_chatbot.id;


--
-- TOC entry 229 (class 1259 OID 16621)
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
-- TOC entry 230 (class 1259 OID 16628)
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
-- TOC entry 5263 (class 0 OID 0)
-- Dependencies: 230
-- Name: correlatividad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.correlatividad_id_seq OWNED BY public.correlatividad.id;


--
-- TOC entry 231 (class 1259 OID 16629)
-- Name: curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curso (
    id bigint NOT NULL,
    anio_lectivo integer NOT NULL,
    cuatrimestre public.cuatrimestre NOT NULL,
    horario character varying(100),
    aula character varying(50),
    materia_id bigint NOT NULL
);


ALTER TABLE public.curso OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16636)
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
-- TOC entry 5264 (class 0 OID 0)
-- Dependencies: 232
-- Name: curso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curso_id_seq OWNED BY public.curso.id;


--
-- TOC entry 233 (class 1259 OID 16637)
-- Name: director; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.director (
    id bigint NOT NULL,
    numero_empleado character varying(50)
);


ALTER TABLE public.director OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16641)
-- Name: docente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docente (
    id bigint NOT NULL,
    numero_docente character varying(50),
    titulo character varying(150),
    estado public.estado_academico DEFAULT 'ACTIVO'::public.estado_academico
);


ALTER TABLE public.docente OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16646)
-- Name: docente_curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docente_curso (
    curso_id bigint NOT NULL,
    docente_id bigint NOT NULL
);


ALTER TABLE public.docente_curso OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16651)
-- Name: docente_mesa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docente_mesa (
    mesa_examen_id bigint NOT NULL,
    docente_id bigint NOT NULL
);


ALTER TABLE public.docente_mesa OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16656)
-- Name: documento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documento (
    id bigint NOT NULL,
    nombre_archivo character varying(255) NOT NULL,
    url text NOT NULL,
    tipo_documento public.tipo_documento NOT NULL,
    fecha_subida timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    estado public.estado_documento DEFAULT 'PENDIENTE'::public.estado_documento,
    licencia_id bigint,
    legajo_id bigint,
    subido_por_usuario_id bigint NOT NULL,
    revisado_por_preceptor_id bigint
);


ALTER TABLE public.documento OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16669)
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
-- TOC entry 5265 (class 0 OID 0)
-- Dependencies: 238
-- Name: documento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documento_id_seq OWNED BY public.documento.id;


--
-- TOC entry 239 (class 1259 OID 16670)
-- Name: estudiante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiante (
    id bigint NOT NULL,
    numero_estudiante character varying(50),
    estado public.estado_academico DEFAULT 'ACTIVO'::public.estado_academico
);


ALTER TABLE public.estudiante OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16675)
-- Name: evento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evento (
    id bigint NOT NULL,
    nombre character varying(150) NOT NULL,
    descripcion text,
    fecha timestamp without time zone NOT NULL,
    lugar character varying(255),
    institucion_id bigint
);


ALTER TABLE public.evento OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16683)
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
-- TOC entry 5266 (class 0 OID 0)
-- Dependencies: 241
-- Name: evento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evento_id_seq OWNED BY public.evento.id;


--
-- TOC entry 242 (class 1259 OID 16684)
-- Name: firma_acta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.firma_acta (
    id bigint NOT NULL,
    estado public.estado_firma DEFAULT 'PENDIENTE'::public.estado_firma,
    fecha_firma timestamp without time zone,
    acta_id bigint NOT NULL,
    firmante_usuario_id bigint NOT NULL
);


ALTER TABLE public.firma_acta OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16691)
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
-- TOC entry 5267 (class 0 OID 0)
-- Dependencies: 243
-- Name: firma_acta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.firma_acta_id_seq OWNED BY public.firma_acta.id;


--
-- TOC entry 244 (class 1259 OID 16692)
-- Name: foro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.foro (
    id bigint NOT NULL,
    nombre character varying(150) NOT NULL,
    tipo public.tipo_foro NOT NULL,
    institucion_id bigint,
    carrera_id bigint,
    materia_id bigint
);


ALTER TABLE public.foro OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16698)
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
-- TOC entry 5268 (class 0 OID 0)
-- Dependencies: 245
-- Name: foro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.foro_id_seq OWNED BY public.foro.id;


--
-- TOC entry 246 (class 1259 OID 16699)
-- Name: inscripcion_curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripcion_curso (
    id bigint NOT NULL,
    fecha_inscripcion date DEFAULT CURRENT_DATE NOT NULL,
    estado_cursada public.estado_cursada DEFAULT 'CURSANDO'::public.estado_cursada,
    estudiante_id bigint NOT NULL,
    curso_id bigint NOT NULL
);


ALTER TABLE public.inscripcion_curso OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16708)
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
-- TOC entry 5269 (class 0 OID 0)
-- Dependencies: 247
-- Name: inscripcion_curso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripcion_curso_id_seq OWNED BY public.inscripcion_curso.id;


--
-- TOC entry 248 (class 1259 OID 16709)
-- Name: inscripcion_evento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripcion_evento (
    id bigint NOT NULL,
    fecha_inscripcion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    estado public.estado_inscripcion_evento DEFAULT 'INSCRIPTO'::public.estado_inscripcion_evento,
    evento_id bigint NOT NULL,
    estudiante_id bigint NOT NULL
);


ALTER TABLE public.inscripcion_evento OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16718)
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
-- TOC entry 5270 (class 0 OID 0)
-- Dependencies: 249
-- Name: inscripcion_evento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripcion_evento_id_seq OWNED BY public.inscripcion_evento.id;


--
-- TOC entry 250 (class 1259 OID 16719)
-- Name: inscripcion_mesa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripcion_mesa (
    id bigint NOT NULL,
    fecha_inscripcion date DEFAULT CURRENT_DATE NOT NULL,
    estado public.estado_inscripcion_mesa DEFAULT 'INSCRIPTO'::public.estado_inscripcion_mesa,
    nota numeric(4,2),
    estudiante_id bigint NOT NULL,
    mesa_examen_id bigint NOT NULL
);


ALTER TABLE public.inscripcion_mesa OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16728)
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
-- TOC entry 5271 (class 0 OID 0)
-- Dependencies: 251
-- Name: inscripcion_mesa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripcion_mesa_id_seq OWNED BY public.inscripcion_mesa.id;


--
-- TOC entry 252 (class 1259 OID 16729)
-- Name: institucion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.institucion (
    id bigint NOT NULL,
    nombre character varying(150) NOT NULL,
    cuit character varying(20),
    direccion character varying(255),
    telefono character varying(50)
);


ALTER TABLE public.institucion OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 16734)
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
-- TOC entry 5272 (class 0 OID 0)
-- Dependencies: 253
-- Name: institucion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.institucion_id_seq OWNED BY public.institucion.id;


--
-- TOC entry 254 (class 1259 OID 16735)
-- Name: lectura_mensaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lectura_mensaje (
    id bigint NOT NULL,
    fecha_lectura timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    mensaje_id bigint NOT NULL,
    usuario_id bigint NOT NULL
);


ALTER TABLE public.lectura_mensaje OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 16743)
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
-- TOC entry 5273 (class 0 OID 0)
-- Dependencies: 255
-- Name: lectura_mensaje_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lectura_mensaje_id_seq OWNED BY public.lectura_mensaje.id;


--
-- TOC entry 256 (class 1259 OID 16744)
-- Name: legajo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.legajo (
    id bigint NOT NULL,
    fecha_creacion date DEFAULT CURRENT_DATE NOT NULL,
    usuario_id bigint NOT NULL
);


ALTER TABLE public.legajo OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 16751)
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
-- TOC entry 5274 (class 0 OID 0)
-- Dependencies: 257
-- Name: legajo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.legajo_id_seq OWNED BY public.legajo.id;


--
-- TOC entry 258 (class 1259 OID 16752)
-- Name: licencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.licencia (
    id bigint NOT NULL,
    fecha_solicitud date DEFAULT CURRENT_DATE NOT NULL,
    periodo_desde date NOT NULL,
    periodo_hasta date NOT NULL,
    motivo text,
    estado public.estado_licencia DEFAULT 'PENDIENTE'::public.estado_licencia,
    solicita_usuario_id bigint NOT NULL,
    aprobada_por_secretario_id bigint
);


ALTER TABLE public.licencia OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 16764)
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
-- TOC entry 5275 (class 0 OID 0)
-- Dependencies: 259
-- Name: licencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.licencia_id_seq OWNED BY public.licencia.id;


--
-- TOC entry 260 (class 1259 OID 16765)
-- Name: materia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materia (
    id bigint NOT NULL,
    nombre character varying(150) NOT NULL,
    anio_del_plan integer,
    carga_horaria integer,
    carrera_id bigint
);


ALTER TABLE public.materia OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 16770)
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
-- TOC entry 5276 (class 0 OID 0)
-- Dependencies: 261
-- Name: materia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materia_id_seq OWNED BY public.materia.id;


--
-- TOC entry 262 (class 1259 OID 16771)
-- Name: mensaje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mensaje (
    id bigint NOT NULL,
    contenido text NOT NULL,
    fecha_hora timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    chat_id bigint NOT NULL,
    autor_usuario_id bigint NOT NULL
);


ALTER TABLE public.mensaje OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 16782)
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
-- TOC entry 5277 (class 0 OID 0)
-- Dependencies: 263
-- Name: mensaje_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mensaje_id_seq OWNED BY public.mensaje.id;


--
-- TOC entry 264 (class 1259 OID 16783)
-- Name: mesa_examen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mesa_examen (
    id bigint NOT NULL,
    fecha date NOT NULL,
    horario character varying(100),
    aula character varying(50),
    llamado integer,
    materia_id bigint NOT NULL
);


ALTER TABLE public.mesa_examen OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 16789)
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
-- TOC entry 5278 (class 0 OID 0)
-- Dependencies: 265
-- Name: mesa_examen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mesa_examen_id_seq OWNED BY public.mesa_examen.id;


--
-- TOC entry 266 (class 1259 OID 16790)
-- Name: nota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nota (
    id bigint NOT NULL,
    tipo public.tipo_nota NOT NULL,
    valor numeric(4,2) NOT NULL,
    fecha date DEFAULT CURRENT_DATE NOT NULL,
    observaciones text,
    inscripcion_curso_id bigint NOT NULL
);


ALTER TABLE public.nota OWNER TO postgres;

--
-- TOC entry 267 (class 1259 OID 16801)
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
-- TOC entry 5279 (class 0 OID 0)
-- Dependencies: 267
-- Name: nota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nota_id_seq OWNED BY public.nota.id;


--
-- TOC entry 268 (class 1259 OID 16802)
-- Name: notificacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notificacion (
    id bigint NOT NULL,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    titulo character varying(255) NOT NULL,
    contenido text NOT NULL,
    estado_lectura public.estado_lectura DEFAULT 'NO_LEIDA'::public.estado_lectura,
    tipo public.tipo_notificacion NOT NULL,
    emisor_usuario_id bigint,
    destinatario_usuario_id bigint NOT NULL
);


ALTER TABLE public.notificacion OWNER TO postgres;

--
-- TOC entry 269 (class 1259 OID 16815)
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
-- TOC entry 5280 (class 0 OID 0)
-- Dependencies: 269
-- Name: notificacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notificacion_id_seq OWNED BY public.notificacion.id;


--
-- TOC entry 270 (class 1259 OID 16816)
-- Name: participante_chat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.participante_chat (
    id bigint NOT NULL,
    fecha_ingreso timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    chat_id bigint NOT NULL,
    usuario_id bigint NOT NULL
);


ALTER TABLE public.participante_chat OWNER TO postgres;

--
-- TOC entry 271 (class 1259 OID 16824)
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
-- TOC entry 5281 (class 0 OID 0)
-- Dependencies: 271
-- Name: participante_chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.participante_chat_id_seq OWNED BY public.participante_chat.id;


--
-- TOC entry 272 (class 1259 OID 16825)
-- Name: preceptor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.preceptor (
    id bigint NOT NULL,
    numero_empleado character varying(50)
);


ALTER TABLE public.preceptor OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 16829)
-- Name: preinscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.preinscripcion (
    id bigint NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    dni character varying(20) NOT NULL,
    email character varying(150) NOT NULL,
    fecha_solicitud date DEFAULT CURRENT_DATE NOT NULL,
    estado public.estado_preinscripcion DEFAULT 'PENDIENTE'::public.estado_preinscripcion,
    institucion_id bigint,
    carrera_id bigint,
    preceptor_gestor_id bigint
);


ALTER TABLE public.preinscripcion OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 16840)
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
-- TOC entry 5282 (class 0 OID 0)
-- Dependencies: 274
-- Name: preinscripcion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.preinscripcion_id_seq OWNED BY public.preinscripcion.id;


--
-- TOC entry 275 (class 1259 OID 16841)
-- Name: publicacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publicacion (
    id bigint NOT NULL,
    titulo character varying(255) NOT NULL,
    contenido text NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    destacada boolean DEFAULT false,
    estado public.estado_publicacion DEFAULT 'ACTIVA'::public.estado_publicacion,
    foro_id bigint NOT NULL,
    autor_usuario_id bigint NOT NULL
);


ALTER TABLE public.publicacion OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 16855)
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
-- TOC entry 5283 (class 0 OID 0)
-- Dependencies: 276
-- Name: publicacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.publicacion_id_seq OWNED BY public.publicacion.id;


--
-- TOC entry 277 (class 1259 OID 16856)
-- Name: respuesta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.respuesta (
    id bigint NOT NULL,
    contenido text NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    publicacion_id bigint NOT NULL,
    autor_usuario_id bigint NOT NULL
);


ALTER TABLE public.respuesta OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 16867)
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
-- TOC entry 5284 (class 0 OID 0)
-- Dependencies: 278
-- Name: respuesta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.respuesta_id_seq OWNED BY public.respuesta.id;


--
-- TOC entry 279 (class 1259 OID 16868)
-- Name: secretario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.secretario (
    id bigint NOT NULL,
    numero_empleado character varying(50)
);


ALTER TABLE public.secretario OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 16872)
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
-- TOC entry 281 (class 1259 OID 16883)
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
-- TOC entry 5285 (class 0 OID 0)
-- Dependencies: 281
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 282 (class 1259 OID 16884)
-- Name: usuario_institucion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario_institucion (
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    institucion_id bigint NOT NULL,
    carrera_id bigint,
    fecha_desde date NOT NULL,
    fecha_hasta date,
    activo boolean DEFAULT true
);


ALTER TABLE public.usuario_institucion OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 16892)
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
-- TOC entry 5286 (class 0 OID 0)
-- Dependencies: 283
-- Name: usuario_institucion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_institucion_id_seq OWNED BY public.usuario_institucion.id;


--
-- TOC entry 4980 (class 2604 OID 16893)
-- Name: acta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acta ALTER COLUMN id SET DEFAULT nextval('public.acta_id_seq'::regclass);


--
-- TOC entry 4982 (class 2604 OID 16894)
-- Name: asistencia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asistencia ALTER COLUMN id SET DEFAULT nextval('public.asistencia_id_seq'::regclass);


--
-- TOC entry 4983 (class 2604 OID 16895)
-- Name: carrera id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera ALTER COLUMN id SET DEFAULT nextval('public.carrera_id_seq'::regclass);


--
-- TOC entry 4984 (class 2604 OID 16896)
-- Name: chat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat ALTER COLUMN id SET DEFAULT nextval('public.chat_id_seq'::regclass);


--
-- TOC entry 4986 (class 2604 OID 16897)
-- Name: consulta_chatbot id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consulta_chatbot ALTER COLUMN id SET DEFAULT nextval('public.consulta_chatbot_id_seq'::regclass);


--
-- TOC entry 4989 (class 2604 OID 16898)
-- Name: correlatividad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.correlatividad ALTER COLUMN id SET DEFAULT nextval('public.correlatividad_id_seq'::regclass);


--
-- TOC entry 4990 (class 2604 OID 16899)
-- Name: curso id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso ALTER COLUMN id SET DEFAULT nextval('public.curso_id_seq'::regclass);


--
-- TOC entry 4992 (class 2604 OID 16900)
-- Name: documento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documento ALTER COLUMN id SET DEFAULT nextval('public.documento_id_seq'::regclass);


--
-- TOC entry 4996 (class 2604 OID 16901)
-- Name: evento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento ALTER COLUMN id SET DEFAULT nextval('public.evento_id_seq'::regclass);


--
-- TOC entry 4997 (class 2604 OID 16902)
-- Name: firma_acta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firma_acta ALTER COLUMN id SET DEFAULT nextval('public.firma_acta_id_seq'::regclass);


--
-- TOC entry 4999 (class 2604 OID 16903)
-- Name: foro id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foro ALTER COLUMN id SET DEFAULT nextval('public.foro_id_seq'::regclass);


--
-- TOC entry 5000 (class 2604 OID 16904)
-- Name: inscripcion_curso id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion_curso ALTER COLUMN id SET DEFAULT nextval('public.inscripcion_curso_id_seq'::regclass);


--
-- TOC entry 5003 (class 2604 OID 16905)
-- Name: inscripcion_evento id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion_evento ALTER COLUMN id SET DEFAULT nextval('public.inscripcion_evento_id_seq'::regclass);


--
-- TOC entry 5006 (class 2604 OID 16906)
-- Name: inscripcion_mesa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripcion_mesa ALTER COLUMN id SET DEFAULT nextval('public.inscripcion_mesa_id_seq'::regclass);


--
-- TOC entry 5009 (class 2604 OID 16907)
-- Name: institucion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.institucion ALTER COLUMN id SET DEFAULT nextval('public.institucion_id_seq'::regclass);


--
-- TOC entry 5010 (class 2604 OID 16908)
-- Name: lectura_mensaje id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectura_mensaje ALTER COLUMN id SET DEFAULT nextval('public.lectura_mensaje_id_seq'::regclass);


--
-- TOC entry 5012 (class 2604 OID 16909)
-- Name: legajo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.legajo ALTER COLUMN id SET DEFAULT nextval('public.legajo_id_seq'::regclass);


--
-- TOC entry 5014 (class 2604 OID 16910)
-- Name: licencia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licencia ALTER COLUMN id SET DEFAULT nextval('public.licencia_id_seq'::regclass);


--
-- TOC entry 5017 (class 2604 OID 16911)
-- Name: materia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materia ALTER COLUMN id SET DEFAULT nextval('public.materia_id_seq'::regclass);


--
-- TOC entry 5018 (class 2604 OID 16912)
-- Name: mensaje id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mensaje ALTER COLUMN id SET DEFAULT nextval('public.mensaje_id_seq'::regclass);


--
-- TOC entry 5020 (class 2604 OID 16913)
-- Name: mesa_examen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mesa_examen ALTER COLUMN id SET DEFAULT nextval('public.mesa_examen_id_seq'::regclass);


--
-- TOC entry 5021 (class 2604 OID 16914)
-- Name: nota id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nota ALTER COLUMN id SET DEFAULT nextval('public.nota_id_seq'::regclass);


--
-- TOC entry 5023 (class 2604 OID 16915)
-- Name: notificacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificacion ALTER COLUMN id SET DEFAULT nextval('public.notificacion_id_seq'::regclass);


--
-- TOC entry 5026 (class 2604 OID 16916)
-- Name: participante_chat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participante_chat ALTER COLUMN id SET DEFAULT nextval('public.participante_chat_id_seq'::regclass);


--
-- TOC entry 5028 (class 2604 OID 16917)
-- Name: preinscripcion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preinscripcion ALTER COLUMN id SET DEFAULT nextval('public.preinscripcion_id_seq'::regclass);


--
-- TOC entry 5031 (class 2604 OID 16918)
-- Name: publicacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publicacion ALTER COLUMN id SET DEFAULT nextval('public.publicacion_id_seq'::regclass);


--
-- TOC entry 5035 (class 2604 OID 16919)
-- Name: respuesta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respuesta ALTER COLUMN id SET DEFAULT nextval('public.respuesta_id_seq'::regclass);


--
-- TOC entry 5037 (class 2604 OID 16920)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 5038 (class 2604 OID 16921)
-- Name: usuario_institucion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario_institucion ALTER COLUMN id SET DEFAULT nextval('public.usuario_institucion_id_seq'::regclass);


--
-- TOC entry 5187 (class 0 OID 16571)
-- Dependencies: 219
-- Data for Name: acta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.acta (id, tipo, fecha_creacion, contenido, creada_por_usuario_id) FROM stdin;
1	EXAMEN	2026-07-10 20:00:00	Acta de examen final Bases de Datos...	5
2	REUNION	2026-03-10 10:00:00	Acta de reunión docente inicio de ciclo...	4
\.


--
-- TOC entry 5189 (class 0 OID 16583)
-- Dependencies: 221
-- Data for Name: asistencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asistencia (id, fecha, estado, observaciones, estudiante_id, curso_id, registrada_por_usuario_id) FROM stdin;
1	2026-03-20	PRESENTE		1	1	2
2	2026-03-20	AUSENTE	Falta sin aviso	3	1	2
\.


--
-- TOC entry 5191 (class 0 OID 16595)
-- Dependencies: 223
-- Data for Name: carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carrera (id, nombre, titulo_otorgado, duracion_anios, institucion_id) FROM stdin;
1	Tecnicatura en Desarrollo de Software	Técnico Superior en Desarrollo de Software	3	1
2	Informática	Técnico en Informática	6	2
3	Tecnicatura en Desarrollo de Software	Técnico Superior en Desarrollo de Software	3	1
4	Informática	Técnico en Informática	6	2
5	Tecnicatura en Desarrollo de Software	Técnico Superior en Desarrollo de Software	3	1
6	Informática	Técnico en Informática	6	2
\.


--
-- TOC entry 5193 (class 0 OID 16601)
-- Dependencies: 225
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat (id, tipo, fecha_creacion, curso_id) FROM stdin;
1	CURSO	2026-10-02 11:09:10.149523	1
2	PRIVADO	2026-10-02 11:09:10.149523	\N
\.


--
-- TOC entry 5195 (class 0 OID 16609)
-- Dependencies: 227
-- Data for Name: consulta_chatbot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consulta_chatbot (id, pregunta, respuesta, fecha_hora, resuelta, consultante_usuario_id, derivada_a_usuario_id) FROM stdin;
1	¿Cómo pido un certificado de alumno regular?	Podés hacerlo desde la pestaña trámites.	2026-10-02 11:09:10.166254	t	3	\N
2	Tengo un problema con el SIU	\N	2026-10-02 11:09:10.166254	f	1	6
\.


--
-- TOC entry 5197 (class 0 OID 16621)
-- Dependencies: 229
-- Data for Name: correlatividad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.correlatividad (id, materia_id, materia_requerida_id, tipo) FROM stdin;
1	1	2	PARA_CURSAR
2	3	2	PARA_RENDIR
\.


--
-- TOC entry 5199 (class 0 OID 16629)
-- Dependencies: 231
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curso (id, anio_lectivo, cuatrimestre, horario, aula, materia_id) FROM stdin;
1	2026	PRIMERO	Turno Noche	Laboratorio 1	1
2	2026	PRIMERO	Turno Noche	Aula 4	2
3	2026	PRIMERO	Turno Noche	Laboratorio 1	1
4	2026	PRIMERO	Turno Noche	Aula 4	2
5	2026	PRIMERO	Turno Noche	Laboratorio 1	1
6	2026	PRIMERO	Turno Noche	Aula 4	2
\.


--
-- TOC entry 5201 (class 0 OID 16637)
-- Dependencies: 233
-- Data for Name: director; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.director (id, numero_empleado) FROM stdin;
4	DIR-001
\.


--
-- TOC entry 5202 (class 0 OID 16641)
-- Dependencies: 234
-- Data for Name: docente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.docente (id, numero_docente, titulo, estado) FROM stdin;
2	DOC-050	Ingeniera en Sistemas	ACTIVO
2	DOC-050	Ingeniera en Sistemas	ACTIVO
2	DOC-050	Ingeniera en Sistemas	ACTIVO
7	DOC-051	Licenciado en Ciencias de la Computación	ACTIVO
\.


--
-- TOC entry 5203 (class 0 OID 16646)
-- Dependencies: 235
-- Data for Name: docente_curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.docente_curso (curso_id, docente_id) FROM stdin;
1	2
2	7
\.


--
-- TOC entry 5204 (class 0 OID 16651)
-- Dependencies: 236
-- Data for Name: docente_mesa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.docente_mesa (mesa_examen_id, docente_id) FROM stdin;
1	7
2	7
\.


--
-- TOC entry 5205 (class 0 OID 16656)
-- Dependencies: 237
-- Data for Name: documento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documento (id, nombre_archivo, url, tipo_documento, fecha_subida, estado, licencia_id, legajo_id, subido_por_usuario_id, revisado_por_preceptor_id) FROM stdin;
1	certificado_medico.pdf	/docs/cert1.pdf	CERTIFICADO_MEDICO	2026-10-02 11:09:10.141251	APROBADO	1	\N	1	6
2	analitico_secundario.pdf	/docs/analitico3.pdf	ANALITICO	2026-10-02 11:09:10.141251	PENDIENTE	\N	2	3	\N
\.


--
-- TOC entry 5207 (class 0 OID 16670)
-- Dependencies: 239
-- Data for Name: estudiante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiante (id, numero_estudiante, estado) FROM stdin;
1	LEG-220-001	ACTIVO
3	LEG-220-002	ACTIVO
1	LEG-220-001	ACTIVO
3	LEG-220-002	ACTIVO
1	LEG-220-001	ACTIVO
3	LEG-220-002	ACTIVO
\.


--
-- TOC entry 5208 (class 0 OID 16675)
-- Dependencies: 240
-- Data for Name: evento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evento (id, nombre, descripcion, fecha, lugar, institucion_id) FROM stdin;
1	Visita Animar Mocap	Visita educativa a los estudios de animación y captura de movimiento	2026-07-03 10:00:00	Buenos Aires	1
2	Visita Ford Pacheco	Recorrida industrial por la planta	2026-09-18 09:00:00	Pacheco	1
3	Visita Animar Mocap	Visita educativa a los estudios de animación y captura de movimiento	2026-07-03 10:00:00	Buenos Aires	1
4	Visita Ford Pacheco	Recorrida industrial por la planta	2026-09-18 09:00:00	Pacheco	1
5	Visita Animar Mocap	Visita educativa a estudios de animación	2026-07-03 10:00:00	Buenos Aires	1
6	Visita Ford Pacheco	Recorrida industrial por la planta	2026-09-18 09:00:00	Pacheco	1
\.


--
-- TOC entry 5210 (class 0 OID 16684)
-- Dependencies: 242
-- Data for Name: firma_acta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.firma_acta (id, estado, fecha_firma, acta_id, firmante_usuario_id) FROM stdin;
1	FIRMADA	2026-07-10 20:30:00	1	7
2	PENDIENTE	\N	2	2
\.


--
-- TOC entry 5212 (class 0 OID 16692)
-- Dependencies: 244
-- Data for Name: foro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.foro (id, nombre, tipo, institucion_id, carrera_id, materia_id) FROM stdin;
1	Foro de Consultas Generales ISFT	INSTITUCIONAL	1	\N	\N
2	Dudas sobre Proyecto Final	MATERIA	1	\N	\N
3	Foro de Consultas Generales ISFT	INSTITUCIONAL	1	\N	\N
4	Dudas sobre Proyecto Final	MATERIA	1	\N	\N
5	Consultas Generales ISFT	INSTITUCIONAL	1	\N	\N
6	Proyecto Final Hoshino	MATERIA	1	\N	\N
\.


--
-- TOC entry 5214 (class 0 OID 16699)
-- Dependencies: 246
-- Data for Name: inscripcion_curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripcion_curso (id, fecha_inscripcion, estado_cursada, estudiante_id, curso_id) FROM stdin;
1	2026-03-16	CURSANDO	1	1
2	2026-03-16	CURSANDO	1	2
3	2026-03-16	CURSANDO	3	1
4	2026-03-16	CURSANDO	1	1
5	2026-03-16	CURSANDO	1	2
6	2026-03-16	CURSANDO	3	1
7	2026-03-16	CURSANDO	1	1
8	2026-03-16	CURSANDO	1	2
9	2026-03-16	REGULAR	3	2
\.


--
-- TOC entry 5216 (class 0 OID 16709)
-- Dependencies: 248
-- Data for Name: inscripcion_evento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripcion_evento (id, fecha_inscripcion, estado, evento_id, estudiante_id) FROM stdin;
1	2026-06-25 14:30:00	ASISTIO	1	1
2	2026-09-01 10:15:00	INSCRIPTO	2	1
3	2026-06-25 14:30:00	ASISTIO	1	1
4	2026-09-01 10:15:00	INSCRIPTO	2	1
5	2026-10-02 11:09:10.14403	ASISTIO	1	1
6	2026-10-02 11:09:10.14403	INSCRIPTO	2	1
\.


--
-- TOC entry 5218 (class 0 OID 16719)
-- Dependencies: 250
-- Data for Name: inscripcion_mesa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripcion_mesa (id, fecha_inscripcion, estado, nota, estudiante_id, mesa_examen_id) FROM stdin;
1	2026-07-01	INSCRIPTO	\N	3	1
2	2026-07-01	APROBADO	8.00	1	1
\.


--
-- TOC entry 5220 (class 0 OID 16729)
-- Dependencies: 252
-- Data for Name: institucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.institucion (id, nombre, cuit, direccion, telefono) FROM stdin;
1	ISFT 220	30-11111111-1	Munro	1122334455
2	EEST 2	30-22222222-2	Munro	1155667788
3	ISFT 220	30-11111111-1	Munro	1122334455
4	EEST 2	30-22222222-2	Munro	1155667788
5	ISFT 220	30-11111111-1	Munro	1122334455
6	EEST 2	30-22222222-2	Munro	1155667788
\.


--
-- TOC entry 5222 (class 0 OID 16735)
-- Dependencies: 254
-- Data for Name: lectura_mensaje; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lectura_mensaje (id, fecha_lectura, mensaje_id, usuario_id) FROM stdin;
1	2026-10-02 11:09:10.155097	1	1
2	2026-10-02 11:09:10.155097	3	6
\.


--
-- TOC entry 5224 (class 0 OID 16744)
-- Dependencies: 256
-- Data for Name: legajo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.legajo (id, fecha_creacion, usuario_id) FROM stdin;
1	2024-03-01	1
2	2025-03-01	3
\.


--
-- TOC entry 5226 (class 0 OID 16752)
-- Dependencies: 258
-- Data for Name: licencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.licencia (id, fecha_solicitud, periodo_desde, periodo_hasta, motivo, estado, solicita_usuario_id, aprobada_por_secretario_id) FROM stdin;
1	2026-04-10	2026-04-12	2026-04-15	Enfermedad	APROBADA	1	5
2	2026-05-01	2026-05-02	2026-05-05	Viaje	PENDIENTE	3	\N
\.


--
-- TOC entry 5228 (class 0 OID 16765)
-- Dependencies: 260
-- Data for Name: materia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materia (id, nombre, anio_del_plan, carga_horaria, carrera_id) FROM stdin;
1	Prácticas Profesionalizantes	3	120	1
2	Bases de Datos	2	90	1
3	Prácticas Profesionalizantes	3	120	1
4	Bases de Datos	2	90	1
5	Prácticas Profesionalizantes	3	120	1
6	Bases de Datos	2	90	1
7	Programación Web	2	100	1
\.


--
-- TOC entry 5230 (class 0 OID 16771)
-- Dependencies: 262
-- Data for Name: mensaje; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mensaje (id, contenido, fecha_hora, chat_id, autor_usuario_id) FROM stdin;
1	Hola a todos, bienvenidos al curso.	2026-10-02 11:09:10.153468	1	2
2	Profe, dejé la maqueta en GitHub.	2026-10-02 11:09:10.153468	1	1
3	Hola Sofía, te envié el certificado médico.	2026-10-02 11:09:10.153468	2	1
\.


--
-- TOC entry 5232 (class 0 OID 16783)
-- Dependencies: 264
-- Data for Name: mesa_examen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mesa_examen (id, fecha, horario, aula, llamado, materia_id) FROM stdin;
1	2026-07-10	18:00	Aula 5	1	2
2	2026-07-24	18:00	Aula 5	2	2
\.


--
-- TOC entry 5234 (class 0 OID 16790)
-- Dependencies: 266
-- Data for Name: nota; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nota (id, tipo, valor, fecha, observaciones, inscripcion_curso_id) FROM stdin;
1	TRABAJO_PRACTICO	8.50	2026-04-20	Entrega del TP1	1
2	PARCIAL	9.00	2026-05-15	Primer Parcial	2
3	TRABAJO_PRACTICO	8.50	2026-04-20	Entrega del TP1	1
4	PARCIAL	9.00	2026-05-15	Primer Parcial	2
5	TRABAJO_PRACTICO	8.50	2026-04-20	Entrega de maqueta React con TSX	1
6	PARCIAL	9.00	2026-05-15	Primer Parcial de BD	2
\.


--
-- TOC entry 5236 (class 0 OID 16802)
-- Dependencies: 268
-- Data for Name: notificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notificacion (id, fecha, titulo, contenido, estado_lectura, tipo, emisor_usuario_id, destinatario_usuario_id) FROM stdin;
1	2026-10-02 11:09:10.162971	Licencia Aprobada	Tu licencia ha sido aprobada.	NO_LEIDA	ADMINISTRATIVA	5	1
2	2026-10-02 11:09:10.162971	Nueva Respuesta	Hay una nueva respuesta en el foro.	LEIDA	ACADEMICA	\N	1
\.


--
-- TOC entry 5238 (class 0 OID 16816)
-- Dependencies: 270
-- Data for Name: participante_chat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.participante_chat (id, fecha_ingreso, chat_id, usuario_id) FROM stdin;
1	2026-10-02 11:09:10.15117	1	1
2	2026-10-02 11:09:10.15117	1	2
3	2026-10-02 11:09:10.15117	1	3
4	2026-10-02 11:09:10.15117	2	1
5	2026-10-02 11:09:10.15117	2	6
\.


--
-- TOC entry 5240 (class 0 OID 16825)
-- Dependencies: 272
-- Data for Name: preceptor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.preceptor (id, numero_empleado) FROM stdin;
6	PRE-001
\.


--
-- TOC entry 5241 (class 0 OID 16829)
-- Dependencies: 273
-- Data for Name: preinscripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.preinscripcion (id, nombre, apellido, dni, email, fecha_solicitud, estado, institucion_id, carrera_id, preceptor_gestor_id) FROM stdin;
1	Lucas	Silva	99887766	lsilva@gmail.com	2026-02-10	PENDIENTE	1	1	6
2	Marta	Díaz	66778899	mdiaz@gmail.com	2026-02-12	APROBADA	1	1	6
\.


--
-- TOC entry 5243 (class 0 OID 16841)
-- Dependencies: 275
-- Data for Name: publicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publicacion (id, titulo, contenido, fecha_creacion, destacada, estado, foro_id, autor_usuario_id) FROM stdin;
1	Fechas de finales	Las fechas están subidas al SIU Guaraní...	2026-10-02 11:09:10.146663	t	ACTIVA	1	5
2	Duda MongoDB	¿Cómo estructurar el inventario en NoSQL?	2026-10-02 11:09:10.146663	f	ACTIVA	2	1
\.


--
-- TOC entry 5245 (class 0 OID 16856)
-- Dependencies: 277
-- Data for Name: respuesta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.respuesta (id, contenido, fecha_creacion, publicacion_id, autor_usuario_id) FROM stdin;
1	Revisá la documentación de subdocumentos	2026-10-02 11:09:10.14823	2	2
2	¡Gracias, ya lo resolví!	2026-10-02 11:09:10.14823	2	1
\.


--
-- TOC entry 5247 (class 0 OID 16868)
-- Dependencies: 279
-- Data for Name: secretario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.secretario (id, numero_empleado) FROM stdin;
5	SEC-001
\.


--
-- TOC entry 5248 (class 0 OID 16872)
-- Dependencies: 280
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id, dni, nombre, apellido, email, password_hash, telefono, fecha_nacimiento) FROM stdin;
1	47257342	Agustin Tomas	Casal	agustincasalt2@gmail.com	123123	1139030915	2006-05-06
2	12345678	Pedro	Gómez	pedro@isft220.edu.ar	hash_123	1144556677	2001-05-14
3	87654321	María	López	mlopez@isft220.edu.ar	hash_456	1199887766	1985-10-20
4	11223344	Carlos	Martínez	cmartinez@isft220.edu.ar	hash_789	1155443322	1990-03-10
5	12345678	Pedro	Gómez	pedro@isft220.edu.ar	hash_123	1144556677	2001-05-14
6	87654321	María	López	mlopez@isft220.edu.ar	hash_456	1199887766	1985-10-20
7	11223344	Carlos	Martínez	cmartinez@isft220.edu.ar	hash_789	1155443322	1990-03-10
8	12345678	Pedro	Gómez	pedro@isft220.edu.ar	hash_123	1144556677	2001-05-14
9	87654321	María	López	mlopez@isft220.edu.ar	hash_456	1199887766	1985-10-20
10	11223344	Carlos	Martínez	cmartinez@isft220.edu.ar	hash_789	1155443322	1990-03-10
11	22334455	Ana	Torres	atorres@isft220.edu.ar	hash_321	1122112211	1975-08-22
12	33445566	Luis	Fernández	lfernandez@isft220.edu.ar	hash_654	1133223322	1980-12-05
13	44556677	Sofía	Ruiz	sruiz@isft220.edu.ar	hash_987	1144334433	1992-07-15
14	55667788	Jorge	Almada	jalmada@isft220.edu.ar	hash_abc	1155445544	1988-02-28
\.


--
-- TOC entry 5250 (class 0 OID 16884)
-- Dependencies: 282
-- Data for Name: usuario_institucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario_institucion (id, usuario_id, institucion_id, carrera_id, fecha_desde, fecha_hasta, activo) FROM stdin;
1	1	1	1	2024-03-01	\N	t
2	2	1	1	2020-02-15	\N	t
\.


--
-- TOC entry 5287 (class 0 OID 0)
-- Dependencies: 220
-- Name: acta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.acta_id_seq', 2, true);


--
-- TOC entry 5288 (class 0 OID 0)
-- Dependencies: 222
-- Name: asistencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asistencia_id_seq', 2, true);


--
-- TOC entry 5289 (class 0 OID 0)
-- Dependencies: 224
-- Name: carrera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrera_id_seq', 6, true);


--
-- TOC entry 5290 (class 0 OID 0)
-- Dependencies: 226
-- Name: chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_id_seq', 2, true);


--
-- TOC entry 5291 (class 0 OID 0)
-- Dependencies: 228
-- Name: consulta_chatbot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consulta_chatbot_id_seq', 2, true);


--
-- TOC entry 5292 (class 0 OID 0)
-- Dependencies: 230
-- Name: correlatividad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.correlatividad_id_seq', 2, true);


--
-- TOC entry 5293 (class 0 OID 0)
-- Dependencies: 232
-- Name: curso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curso_id_seq', 6, true);


--
-- TOC entry 5294 (class 0 OID 0)
-- Dependencies: 238
-- Name: documento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documento_id_seq', 2, true);


--
-- TOC entry 5295 (class 0 OID 0)
-- Dependencies: 241
-- Name: evento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evento_id_seq', 6, true);


--
-- TOC entry 5296 (class 0 OID 0)
-- Dependencies: 243
-- Name: firma_acta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.firma_acta_id_seq', 2, true);


--
-- TOC entry 5297 (class 0 OID 0)
-- Dependencies: 245
-- Name: foro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.foro_id_seq', 6, true);


--
-- TOC entry 5298 (class 0 OID 0)
-- Dependencies: 247
-- Name: inscripcion_curso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripcion_curso_id_seq', 9, true);


--
-- TOC entry 5299 (class 0 OID 0)
-- Dependencies: 249
-- Name: inscripcion_evento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripcion_evento_id_seq', 6, true);


--
-- TOC entry 5300 (class 0 OID 0)
-- Dependencies: 251
-- Name: inscripcion_mesa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripcion_mesa_id_seq', 2, true);


--
-- TOC entry 5301 (class 0 OID 0)
-- Dependencies: 253
-- Name: institucion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.institucion_id_seq', 6, true);


--
-- TOC entry 5302 (class 0 OID 0)
-- Dependencies: 255
-- Name: lectura_mensaje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lectura_mensaje_id_seq', 2, true);


--
-- TOC entry 5303 (class 0 OID 0)
-- Dependencies: 257
-- Name: legajo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.legajo_id_seq', 2, true);


--
-- TOC entry 5304 (class 0 OID 0)
-- Dependencies: 259
-- Name: licencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.licencia_id_seq', 2, true);


--
-- TOC entry 5305 (class 0 OID 0)
-- Dependencies: 261
-- Name: materia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materia_id_seq', 7, true);


--
-- TOC entry 5306 (class 0 OID 0)
-- Dependencies: 263
-- Name: mensaje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mensaje_id_seq', 3, true);


--
-- TOC entry 5307 (class 0 OID 0)
-- Dependencies: 265
-- Name: mesa_examen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mesa_examen_id_seq', 2, true);


--
-- TOC entry 5308 (class 0 OID 0)
-- Dependencies: 267
-- Name: nota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nota_id_seq', 6, true);


--
-- TOC entry 5309 (class 0 OID 0)
-- Dependencies: 269
-- Name: notificacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notificacion_id_seq', 2, true);


--
-- TOC entry 5310 (class 0 OID 0)
-- Dependencies: 271
-- Name: participante_chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.participante_chat_id_seq', 5, true);


--
-- TOC entry 5311 (class 0 OID 0)
-- Dependencies: 274
-- Name: preinscripcion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.preinscripcion_id_seq', 2, true);


--
-- TOC entry 5312 (class 0 OID 0)
-- Dependencies: 276
-- Name: publicacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.publicacion_id_seq', 2, true);


--
-- TOC entry 5313 (class 0 OID 0)
-- Dependencies: 278
-- Name: respuesta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.respuesta_id_seq', 2, true);


--
-- TOC entry 5314 (class 0 OID 0)
-- Dependencies: 281
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 14, true);


--
-- TOC entry 5315 (class 0 OID 0)
-- Dependencies: 283
-- Name: usuario_institucion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_institucion_id_seq', 2, true);


-- Completed on 2026-10-02 11:53:11

--
-- PostgreSQL database dump complete
--

\unrestrict Lq8g7DPp0MSeExeudSaNGGAmOtls3qAoOXhs7vsf0rjymwNOlP5spjLAu8Lg7R4

