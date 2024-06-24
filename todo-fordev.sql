--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Postgres.app)
-- Dumped by pg_dump version 16.1

-- Started on 2024-06-23 23:45:24 EDT

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
-- TOC entry 267 (class 1255 OID 17718)
-- Name: handle_delete_dproductoentradas(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_delete_dproductoentradas() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Restar la cantidad del producto en dalmaceninternos
    UPDATE dalmaceninternos
    SET cantidad = cantidad - OLD.cantidad,
        updated_at = NOW()
    WHERE dproductos_id = OLD.dproducto_id
      AND precio = OLD.precio
      AND ialmacens_id = (SELECT nalmacens_id FROM dentradaalmacens WHERE id = OLD.dentradaalmacen_id);

    -- Eliminar el registro si la cantidad es menor o igual a 0
    DELETE FROM dalmaceninternos
    WHERE cantidad <= 0
      AND dproductos_id = OLD.dproducto_id
      AND precio = OLD.precio
      AND ialmacens_id = (SELECT nalmacens_id FROM dentradaalmacens WHERE id = OLD.dentradaalmacen_id);

    RETURN OLD;
END;
$$;


ALTER FUNCTION public.handle_delete_dproductoentradas() OWNER TO postgres;

--
-- TOC entry 271 (class 1255 OID 17727)
-- Name: handle_dproductosalidas_delete(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_dproductosalidas_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_salida dsalidaalmacens%ROWTYPE;
BEGIN
    -- Obtener los detalles de la salida asociada
    SELECT * INTO v_salida FROM dsalidaalmacens WHERE id = OLD.dsalidaalmacen_id;

    -- Restaurar la cantidad en dalmaceninternos
    UPDATE dalmaceninternos
    SET cantidad = cantidad + OLD.cantidad
    WHERE dproductos_id = OLD.dproducto_id
      AND precio = OLD.precio;

    -- Si era una venta, actualizar la cantidad en dalmacenventas
    IF v_salida.esventa THEN
        UPDATE dalmacenventas
        SET cantidad = cantidad - OLD.cantidad
        WHERE dproductos_id = OLD.dproducto_id
          AND precio = OLD.precio;

        -- Eliminar el registro de dalmacenventas si la cantidad llega a cero
        DELETE FROM dalmacenventas
        WHERE dproductos_id = OLD.dproducto_id
          AND precio = OLD.precio
          AND cantidad = 0;
    END IF;

    RETURN OLD;
END;
$$;


ALTER FUNCTION public.handle_dproductosalidas_delete() OWNER TO postgres;

--
-- TOC entry 270 (class 1255 OID 17725)
-- Name: handle_dproductosalidas_insert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_dproductosalidas_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_salida dsalidaalmacens%ROWTYPE;
BEGIN
    -- Obtener los detalles de la salida asociada
    SELECT * INTO v_salida FROM dsalidaalmacens WHERE id = NEW.dsalidaalmacen_id;

    -- Verificar que la cantidad en dalmaceninternos sea suficiente
    IF EXISTS (
        SELECT 1
        FROM dalmaceninternos
        WHERE dproductos_id = NEW.dproducto_id
          AND precio = NEW.precio
          AND cantidad >= NEW.cantidad
    ) THEN
        -- Actualizar la cantidad en dalmaceninternos
        UPDATE dalmaceninternos
        SET cantidad = cantidad - NEW.cantidad
        WHERE dproductos_id = NEW.dproducto_id
          AND precio = NEW.precio;

        -- Si es una venta, actualizar o insertar en dalmacenventas
        IF v_salida.esventa THEN
            IF EXISTS (
                SELECT 1
                FROM dalmacenventas
                WHERE dproductos_id = NEW.dproducto_id
                  AND precio = NEW.precio
            ) THEN
                UPDATE dalmacenventas
                SET cantidad = cantidad + NEW.cantidad
                WHERE dproductos_id = NEW.dproducto_id
                  AND precio = NEW.precio;
            ELSE
                INSERT INTO dalmacenventas (cantidad, precio, valamcens_id, dproductos_id, created_at, updated_at)
                VALUES (NEW.cantidad, NEW.precio, v_salida.nalmacenes_origen_id, NEW.dproducto_id, NOW(), NOW());
            END IF;
        END IF;
    ELSE
        RAISE EXCEPTION 'Cantidad insuficiente para el producto % con precio %', NEW.dproducto_id, NEW.precio;
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.handle_dproductosalidas_insert() OWNER TO postgres;

--
-- TOC entry 255 (class 1255 OID 17741)
-- Name: handle_dproductosalidas_insert_or_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_dproductosalidas_insert_or_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_salida dsalidaalmacens%ROWTYPE;
BEGIN
    -- Obtener los detalles de la salida asociada
    SELECT * INTO v_salida FROM dsalidaalmacens WHERE id = NEW.dsalidaalmacen_id;

    -- Verificar que la cantidad en dalmaceninternos sea suficiente
    IF EXISTS (
        SELECT 1
        FROM dalmaceninternos
        WHERE dproductos_id = NEW.dproducto_id
          AND precio = NEW.precio
          AND cantidad >= NEW.cantidad
    ) THEN
        -- Si es una actualización, revertir los cambios de la versión anterior
        IF TG_OP = 'UPDATE' THEN
            UPDATE dalmaceninternos
            SET cantidad = cantidad + OLD.cantidad
            WHERE dproductos_id = OLD.dproducto_id
              AND precio = OLD.precio;

            IF v_salida.esventa THEN
                UPDATE dalmacenventas
                SET cantidad = cantidad - OLD.cantidad
                WHERE dproductos_id = OLD.dproducto_id
                  AND precio = OLD.precio;
            END IF;
        END IF;

        -- Actualizar la cantidad en dalmaceninternos
        UPDATE dalmaceninternos
        SET cantidad = cantidad - NEW.cantidad
        WHERE dproductos_id = NEW.dproducto_id
          AND precio = NEW.precio;

        -- Si es una venta, actualizar o insertar en dalmacenventas
        IF v_salida.esventa THEN
            IF EXISTS (
                SELECT 1
                FROM dalmacenventas
                WHERE dproductos_id = NEW.dproducto_id
                  AND precio = NEW.precio
            ) THEN
                UPDATE dalmacenventas
                SET cantidad = cantidad + NEW.cantidad
                WHERE dproductos_id = NEW.dproducto_id
                  AND precio = NEW.precio;
            ELSE
                INSERT INTO dalmacenventas (cantidad, precio, valamcens_id, dproductos_id, created_at, updated_at)
                VALUES (NEW.cantidad, NEW.precio, v_salida.nalmacenes_origen_id, NEW.dproducto_id, NOW(), NOW());
            END IF;
        END IF;
    ELSE
        RAISE EXCEPTION 'Cantidad insuficiente para el producto % con precio %', NEW.dproducto_id, NEW.precio;
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.handle_dproductosalidas_insert_or_update() OWNER TO postgres;

--
-- TOC entry 269 (class 1255 OID 17723)
-- Name: handle_dsalidaalmacens_delete(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_dsalidaalmacens_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_producto RECORD;
BEGIN
    -- Iterar sobre los productos asociados a la salida
    FOR v_producto IN SELECT * FROM dproductosalidas WHERE dsalidaalmacen_id = OLD.id LOOP
        -- Restaurar la cantidad en dalmaceninternos
        UPDATE dalmaceninternos
        SET cantidad = cantidad + v_producto.cantidad
        WHERE dproductos_id = v_producto.dproducto_id
          AND precio = v_producto.precio;

        -- Si era una venta, actualizar la cantidad en dalmacenventas
        IF OLD.esventa THEN
            UPDATE dalmacenventas
            SET cantidad = cantidad - v_producto.cantidad
            WHERE dproductos_id = v_producto.dproducto_id
              AND precio = v_producto.precio;

            -- Eliminar el registro de dalmacenventas si la cantidad llega a cero
            DELETE FROM dalmacenventas
            WHERE dproductos_id = v_producto.dproducto_id
              AND precio = v_producto.precio
              AND cantidad = 0;
        END IF;
    END LOOP;

    RETURN OLD;
END;
$$;


ALTER FUNCTION public.handle_dsalidaalmacens_delete() OWNER TO postgres;

--
-- TOC entry 268 (class 1255 OID 17721)
-- Name: handle_dsalidaalmacens_insert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_dsalidaalmacens_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_producto RECORD;
BEGIN
    -- Iterar sobre los productos asociados a la salida
    FOR v_producto IN SELECT * FROM dproductosalidas WHERE dsalidaalmacen_id = NEW.id LOOP
        -- Verificar que la cantidad en dalmaceninternos sea suficiente
        IF EXISTS (
            SELECT 1
            FROM dalmaceninternos
            WHERE dproductos_id = v_producto.dproducto_id
              AND precio = v_producto.precio
              AND cantidad >= v_producto.cantidad
        ) THEN
            -- Actualizar la cantidad en dalmaceninternos
            UPDATE dalmaceninternos
            SET cantidad = cantidad - v_producto.cantidad
            WHERE dproductos_id = v_producto.dproducto_id
              AND precio = v_producto.precio;

            -- Si es una venta, actualizar o insertar en dalmacenventas
            IF NEW.esventa THEN
                IF EXISTS (
                    SELECT 1
                    FROM dalmacenventas
                    WHERE dproductos_id = v_producto.dproducto_id
                      AND precio = v_producto.precio
                ) THEN
                    UPDATE dalmacenventas
                    SET cantidad = cantidad + v_producto.cantidad
                    WHERE dproductos_id = v_producto.dproducto_id
                      AND precio = v_producto.precio;
                ELSE
                    INSERT INTO dalmacenventas (cantidad, precio, valamcens_id, dproductos_id, created_at, updated_at)
                    VALUES (v_producto.cantidad, v_producto.precio, NEW.nalmacenes_origen_id, v_producto.dproducto_id, NOW(), NOW());
                END IF;
            END IF;
        ELSE
            RAISE EXCEPTION 'Cantidad insuficiente para el producto % con precio %', v_producto.dproducto_id, v_producto.precio;
        END IF;
    END LOOP;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.handle_dsalidaalmacens_insert() OWNER TO postgres;

--
-- TOC entry 272 (class 1255 OID 17717)
-- Name: handle_insert_update_dproductoentradas(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.handle_insert_update_dproductoentradas() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        -- Intentar actualizar la cantidad del producto en dalmaceninternos
        UPDATE dalmaceninternos
        SET cantidad = cantidad + NEW.cantidad,
            updated_at = NOW()
        WHERE dproductos_id = NEW.dproducto_id
          AND precio = NEW.precio
          AND ialmacens_id = (SELECT nalmacens_id FROM dentradaalmacens WHERE id = NEW.dentradaalmacen_id);

        -- Si no se actualizó ninguna fila, insertar un nuevo registro
        IF NOT FOUND THEN
            INSERT INTO dalmaceninternos (cantidad, ialmacens_id, dproductos_id, precio, created_at, updated_at, precioventa)
            VALUES (NEW.cantidad,
                    (SELECT nalmacens_id FROM dentradaalmacens WHERE id = NEW.dentradaalmacen_id),
                    NEW.dproducto_id,
                    NEW.precio,
                    NOW(),
                    NOW(),
					(SELECT precioventa FROM dproductos WHERE id = NEW.dproducto_id));
        END IF;
    ELSIF TG_OP = 'UPDATE' THEN
        -- Actualizar la cantidad en dalmaceninternos según la diferencia de cantidad
        UPDATE dalmaceninternos
        SET cantidad = cantidad + (NEW.cantidad - OLD.cantidad),
            updated_at = NOW()
        WHERE dproductos_id = NEW.dproducto_id
          AND precio = NEW.precio
          AND ialmacens_id = (SELECT nalmacens_id FROM dentradaalmacens WHERE id = NEW.dentradaalmacen_id);
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.handle_insert_update_dproductoentradas() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 17488)
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17495)
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17581)
-- Name: dalmaceninternos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dalmaceninternos (
    id bigint NOT NULL,
    cantidad double precision NOT NULL,
    ialmacens_id bigint NOT NULL,
    dproductos_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    precio numeric(19,2) NOT NULL,
    precioventa numeric(19,2)
);


ALTER TABLE public.dalmaceninternos OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17580)
-- Name: dalmaceninternos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dalmaceninternos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dalmaceninternos_id_seq OWNER TO postgres;

--
-- TOC entry 3861 (class 0 OID 0)
-- Dependencies: 238
-- Name: dalmaceninternos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dalmaceninternos_id_seq OWNED BY public.dalmaceninternos.id;


--
-- TOC entry 241 (class 1259 OID 17598)
-- Name: dalmacenventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dalmacenventas (
    id bigint NOT NULL,
    cantidad double precision NOT NULL,
    valamcens_id bigint NOT NULL,
    dproductos_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    precio numeric(19,2),
    preciocosto numeric(19,2)
);


ALTER TABLE public.dalmacenventas OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 17597)
-- Name: dalmacenventas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dalmacenventas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dalmacenventas_id_seq OWNER TO postgres;

--
-- TOC entry 3862 (class 0 OID 0)
-- Dependencies: 240
-- Name: dalmacenventas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dalmacenventas_id_seq OWNED BY public.dalmacenventas.id;


--
-- TOC entry 237 (class 1259 OID 17572)
-- Name: dclienteproveedors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dclienteproveedors (
    id bigint NOT NULL,
    denominacion character varying(255) NOT NULL,
    tipocliente integer NOT NULL,
    esembarazada boolean,
    carnetidentidad character varying(255),
    activo boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.dclienteproveedors OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17571)
-- Name: dclienteproveedors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dclienteproveedors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dclienteproveedors_id_seq OWNER TO postgres;

--
-- TOC entry 3863 (class 0 OID 0)
-- Dependencies: 236
-- Name: dclienteproveedors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dclienteproveedors_id_seq OWNED BY public.dclienteproveedors.id;


--
-- TOC entry 243 (class 1259 OID 17615)
-- Name: dentradaalmacens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dentradaalmacens (
    id bigint NOT NULL,
    factura character varying(255) NOT NULL,
    total double precision NOT NULL,
    nalmacens_id bigint NOT NULL,
    dproveedor_origen_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    estado integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.dentradaalmacens OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17614)
-- Name: dentradaalmacens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dentradaalmacens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dentradaalmacens_id_seq OWNER TO postgres;

--
-- TOC entry 3864 (class 0 OID 0)
-- Dependencies: 242
-- Name: dentradaalmacens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dentradaalmacens_id_seq OWNED BY public.dentradaalmacens.id;


--
-- TOC entry 247 (class 1259 OID 17654)
-- Name: dproductoentradas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dproductoentradas (
    id bigint NOT NULL,
    cantidad double precision NOT NULL,
    dproducto_id bigint NOT NULL,
    dentradaalmacen_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    precio numeric(19,2),
    precioventa numeric(19,2)
);


ALTER TABLE public.dproductoentradas OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 17653)
-- Name: dproductoentradas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dproductoentradas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dproductoentradas_id_seq OWNER TO postgres;

--
-- TOC entry 3865 (class 0 OID 0)
-- Dependencies: 246
-- Name: dproductoentradas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dproductoentradas_id_seq OWNED BY public.dproductoentradas.id;


--
-- TOC entry 235 (class 1259 OID 17558)
-- Name: dproductos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dproductos (
    id bigint NOT NULL,
    denominacion character varying(255) NOT NULL,
    preciocosto double precision NOT NULL,
    codigocup character varying(255) NOT NULL,
    codigoproducto character varying(255) NOT NULL,
    dtipogiros_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    nunidadmedida_id numeric(19,0),
    precioventa numeric(19,2)
);


ALTER TABLE public.dproductos OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 17557)
-- Name: dproductos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dproductos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dproductos_id_seq OWNER TO postgres;

--
-- TOC entry 3866 (class 0 OID 0)
-- Dependencies: 234
-- Name: dproductos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dproductos_id_seq OWNED BY public.dproductos.id;


--
-- TOC entry 249 (class 1259 OID 17671)
-- Name: dproductosalidas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dproductosalidas (
    id bigint NOT NULL,
    cantidad double precision NOT NULL,
    dproducto_id bigint NOT NULL,
    dsalidaalmacen_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    precio numeric(19,2) NOT NULL,
    precioventa numeric(19,2)
);


ALTER TABLE public.dproductosalidas OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 17670)
-- Name: dproductosalidas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dproductosalidas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dproductosalidas_id_seq OWNER TO postgres;

--
-- TOC entry 3867 (class 0 OID 0)
-- Dependencies: 248
-- Name: dproductosalidas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dproductosalidas_id_seq OWNED BY public.dproductosalidas.id;


--
-- TOC entry 245 (class 1259 OID 17632)
-- Name: dsalidaalmacens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dsalidaalmacens (
    id bigint NOT NULL,
    factura character varying(255) NOT NULL,
    total double precision NOT NULL,
    esventa boolean NOT NULL,
    nalmacenes_origen_id bigint NOT NULL,
    nalmacenes_destino_id bigint,
    dproveedor_destino_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    estado integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.dsalidaalmacens OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 17631)
-- Name: dsalidaalmacens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dsalidaalmacens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dsalidaalmacens_id_seq OWNER TO postgres;

--
-- TOC entry 3868 (class 0 OID 0)
-- Dependencies: 244
-- Name: dsalidaalmacens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dsalidaalmacens_id_seq OWNED BY public.dsalidaalmacens.id;


--
-- TOC entry 253 (class 1259 OID 17697)
-- Name: dventaproductos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dventaproductos (
    id bigint NOT NULL,
    cantidad double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    dventa_id bigint NOT NULL,
    dproducto_id bigint NOT NULL,
    precio numeric(19,2) NOT NULL
);


ALTER TABLE public.dventaproductos OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 17696)
-- Name: dventaproductos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dventaproductos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dventaproductos_id_seq OWNER TO postgres;

--
-- TOC entry 3869 (class 0 OID 0)
-- Dependencies: 252
-- Name: dventaproductos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dventaproductos_id_seq OWNED BY public.dventaproductos.id;


--
-- TOC entry 251 (class 1259 OID 17688)
-- Name: dventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dventas (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    total numeric(19,2) NOT NULL,
    codigo character varying(8),
    estado integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.dventas OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 17687)
-- Name: dventas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dventas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dventas_id_seq OWNER TO postgres;

--
-- TOC entry 3870 (class 0 OID 0)
-- Dependencies: 250
-- Name: dventas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dventas_id_seq OWNED BY public.dventas.id;


--
-- TOC entry 227 (class 1259 OID 17520)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17519)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 3871 (class 0 OID 0)
-- Dependencies: 226
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 225 (class 1259 OID 17512)
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17503)
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17502)
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- TOC entry 3872 (class 0 OID 0)
-- Dependencies: 223
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- TOC entry 216 (class 1259 OID 16946)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16945)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3873 (class 0 OID 0)
-- Dependencies: 215
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 231 (class 1259 OID 17539)
-- Name: nalmacens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nalmacens (
    id bigint NOT NULL,
    denominacion character varying(100) NOT NULL,
    activo boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    tipo integer DEFAULT 1
);


ALTER TABLE public.nalmacens OWNER TO postgres;

--
-- TOC entry 3874 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN nalmacens.tipo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.nalmacens.tipo IS 'solo alamacenara dos valores 1- Alamcen interno, 2 Almacen de ventas';


--
-- TOC entry 230 (class 1259 OID 17538)
-- Name: nalmacens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nalmacens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.nalmacens_id_seq OWNER TO postgres;

--
-- TOC entry 3875 (class 0 OID 0)
-- Dependencies: 230
-- Name: nalmacens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nalmacens_id_seq OWNED BY public.nalmacens.id;


--
-- TOC entry 229 (class 1259 OID 17532)
-- Name: ngiros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ngiros (
    id bigint NOT NULL,
    denominacion character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.ngiros OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17531)
-- Name: ngiros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ngiros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ngiros_id_seq OWNER TO postgres;

--
-- TOC entry 3876 (class 0 OID 0)
-- Dependencies: 228
-- Name: ngiros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ngiros_id_seq OWNED BY public.ngiros.id;


--
-- TOC entry 233 (class 1259 OID 17546)
-- Name: ntipogiros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ntipogiros (
    id bigint NOT NULL,
    denominacion character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    ngiros_id bigint NOT NULL
);


ALTER TABLE public.ntipogiros OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 17545)
-- Name: ntipogiros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ntipogiros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ntipogiros_id_seq OWNER TO postgres;

--
-- TOC entry 3877 (class 0 OID 0)
-- Dependencies: 232
-- Name: ntipogiros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ntipogiros_id_seq OWNED BY public.ntipogiros.id;


--
-- TOC entry 254 (class 1259 OID 17729)
-- Name: nunidadmedidas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nunidadmedidas (
    id numeric(19,0) NOT NULL,
    denominacion character varying,
    created_at timestamp(0) with time zone,
    updated_at timestamp(0) with time zone
);


ALTER TABLE public.nunidadmedidas OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17472)
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17479)
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17462)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17461)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3878 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3587 (class 2604 OID 17584)
-- Name: dalmaceninternos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dalmaceninternos ALTER COLUMN id SET DEFAULT nextval('public.dalmaceninternos_id_seq'::regclass);


--
-- TOC entry 3588 (class 2604 OID 17601)
-- Name: dalmacenventas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dalmacenventas ALTER COLUMN id SET DEFAULT nextval('public.dalmacenventas_id_seq'::regclass);


--
-- TOC entry 3586 (class 2604 OID 17575)
-- Name: dclienteproveedors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dclienteproveedors ALTER COLUMN id SET DEFAULT nextval('public.dclienteproveedors_id_seq'::regclass);


--
-- TOC entry 3589 (class 2604 OID 17618)
-- Name: dentradaalmacens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dentradaalmacens ALTER COLUMN id SET DEFAULT nextval('public.dentradaalmacens_id_seq'::regclass);


--
-- TOC entry 3593 (class 2604 OID 17657)
-- Name: dproductoentradas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductoentradas ALTER COLUMN id SET DEFAULT nextval('public.dproductoentradas_id_seq'::regclass);


--
-- TOC entry 3585 (class 2604 OID 17561)
-- Name: dproductos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductos ALTER COLUMN id SET DEFAULT nextval('public.dproductos_id_seq'::regclass);


--
-- TOC entry 3594 (class 2604 OID 17674)
-- Name: dproductosalidas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductosalidas ALTER COLUMN id SET DEFAULT nextval('public.dproductosalidas_id_seq'::regclass);


--
-- TOC entry 3591 (class 2604 OID 17635)
-- Name: dsalidaalmacens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dsalidaalmacens ALTER COLUMN id SET DEFAULT nextval('public.dsalidaalmacens_id_seq'::regclass);


--
-- TOC entry 3597 (class 2604 OID 17700)
-- Name: dventaproductos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dventaproductos ALTER COLUMN id SET DEFAULT nextval('public.dventaproductos_id_seq'::regclass);


--
-- TOC entry 3595 (class 2604 OID 17691)
-- Name: dventas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dventas ALTER COLUMN id SET DEFAULT nextval('public.dventas_id_seq'::regclass);


--
-- TOC entry 3579 (class 2604 OID 17523)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3578 (class 2604 OID 17506)
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- TOC entry 3576 (class 2604 OID 16949)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3582 (class 2604 OID 17542)
-- Name: nalmacens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nalmacens ALTER COLUMN id SET DEFAULT nextval('public.nalmacens_id_seq'::regclass);


--
-- TOC entry 3581 (class 2604 OID 17535)
-- Name: ngiros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ngiros ALTER COLUMN id SET DEFAULT nextval('public.ngiros_id_seq'::regclass);


--
-- TOC entry 3584 (class 2604 OID 17549)
-- Name: ntipogiros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ntipogiros ALTER COLUMN id SET DEFAULT nextval('public.ntipogiros_id_seq'::regclass);


--
-- TOC entry 3577 (class 2604 OID 17465)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3822 (class 0 OID 17488)
-- Dependencies: 221
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3823 (class 0 OID 17495)
-- Dependencies: 222
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3840 (class 0 OID 17581)
-- Dependencies: 239
-- Data for Name: dalmaceninternos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dalmaceninternos (id, cantidad, ialmacens_id, dproductos_id, created_at, updated_at, precio, precioventa) VALUES (13, 1, 1, 2, '2024-06-23 23:41:07', '2024-06-23 23:41:07', 7.00, 2.00);
INSERT INTO public.dalmaceninternos (id, cantidad, ialmacens_id, dproductos_id, created_at, updated_at, precio, precioventa) VALUES (14, 1, 1, 3, '2024-06-23 23:41:07', '2024-06-23 23:41:07', 3.00, 3.00);


--
-- TOC entry 3842 (class 0 OID 17598)
-- Dependencies: 241
-- Data for Name: dalmacenventas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3838 (class 0 OID 17572)
-- Dependencies: 237
-- Data for Name: dclienteproveedors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dclienteproveedors (id, denominacion, tipocliente, esembarazada, carnetidentidad, activo, created_at, updated_at) VALUES (1, 'Paco perico', 1, true, '234324234888', true, '2024-05-25 15:39:13', '2024-05-25 18:55:28');
INSERT INTO public.dclienteproveedors (id, denominacion, tipocliente, esembarazada, carnetidentidad, activo, created_at, updated_at) VALUES (3, 'Alma mater', 1, false, NULL, true, '2024-06-01 15:47:15', '2024-06-01 15:47:15');
INSERT INTO public.dclienteproveedors (id, denominacion, tipocliente, esembarazada, carnetidentidad, activo, created_at, updated_at) VALUES (4, 'Clara pErez', 2, false, '234324234', true, '2024-06-01 15:47:31', '2024-06-01 15:47:31');


--
-- TOC entry 3844 (class 0 OID 17615)
-- Dependencies: 243
-- Data for Name: dentradaalmacens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dentradaalmacens (id, factura, total, nalmacens_id, dproveedor_origen_id, created_at, updated_at, estado) VALUES (25, 'wwerweer', 10, 1, 1, '2024-06-24 03:41:07', '2024-06-24 03:41:07', 0);


--
-- TOC entry 3848 (class 0 OID 17654)
-- Dependencies: 247
-- Data for Name: dproductoentradas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dproductoentradas (id, cantidad, dproducto_id, dentradaalmacen_id, created_at, updated_at, precio, precioventa) VALUES (24, 1, 2, 25, '2024-06-24 03:41:07', '2024-06-24 03:41:07', 7.00, NULL);
INSERT INTO public.dproductoentradas (id, cantidad, dproducto_id, dentradaalmacen_id, created_at, updated_at, precio, precioventa) VALUES (25, 1, 3, 25, '2024-06-24 03:41:07', '2024-06-24 03:41:07', 3.00, NULL);


--
-- TOC entry 3836 (class 0 OID 17558)
-- Dependencies: 235
-- Data for Name: dproductos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dproductos (id, denominacion, preciocosto, codigocup, codigoproducto, dtipogiros_id, created_at, updated_at, nunidadmedida_id, precioventa) VALUES (2, 'sfg ergdg', 7, 'wrewr', 'wrwrwffdd', 4, '2024-05-26 19:15:02', '2024-05-30 01:50:40', 1, 2.00);
INSERT INTO public.dproductos (id, denominacion, preciocosto, codigocup, codigoproducto, dtipogiros_id, created_at, updated_at, nunidadmedida_id, precioventa) VALUES (3, 'pasta', 3, 'kljask', 'kljdklsj', 2, '2024-05-30 01:49:40', '2024-05-30 01:49:40', 1, 3.00);
INSERT INTO public.dproductos (id, denominacion, preciocosto, codigocup, codigoproducto, dtipogiros_id, created_at, updated_at, nunidadmedida_id, precioventa) VALUES (4, 'sabana', 5, 'sdf', 'sddq', 4, '2024-05-30 01:50:27', '2024-05-30 01:50:27', 1, 4.00);
INSERT INTO public.dproductos (id, denominacion, preciocosto, codigocup, codigoproducto, dtipogiros_id, created_at, updated_at, nunidadmedida_id, precioventa) VALUES (5, 'Sabana blanca', 3, 'sdfsafds', 'sfdffsdf', 6, '2024-06-15 22:34:38', '2024-06-15 22:34:38', 1, 1.00);
INSERT INTO public.dproductos (id, denominacion, preciocosto, codigocup, codigoproducto, dtipogiros_id, created_at, updated_at, nunidadmedida_id, precioventa) VALUES (6, 'Sabana blanca espumosoa', 2, 'asd', 'asdad', 6, '2024-06-15 22:38:15', '2024-06-15 22:38:15', 1, 5.00);
INSERT INTO public.dproductos (id, denominacion, preciocosto, codigocup, codigoproducto, dtipogiros_id, created_at, updated_at, nunidadmedida_id, precioventa) VALUES (7, 'wfwf', 3, 'sffe', 'fwefefer', 6, '2024-06-18 03:42:31', '2024-06-18 03:51:33', 2, 21.00);


--
-- TOC entry 3850 (class 0 OID 17671)
-- Dependencies: 249
-- Data for Name: dproductosalidas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3846 (class 0 OID 17632)
-- Dependencies: 245
-- Data for Name: dsalidaalmacens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3854 (class 0 OID 17697)
-- Dependencies: 253
-- Data for Name: dventaproductos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3852 (class 0 OID 17688)
-- Dependencies: 251
-- Data for Name: dventas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3828 (class 0 OID 17520)
-- Dependencies: 227
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3826 (class 0 OID 17512)
-- Dependencies: 225
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3825 (class 0 OID 17503)
-- Dependencies: 224
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3817 (class 0 OID 16946)
-- Dependencies: 216
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.migrations (id, migration, batch) VALUES (32, '0001_01_01_000000_create_users_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (33, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (34, '0001_01_01_000002_create_jobs_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (35, '2024_05_11_155711_create_ngiros_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (36, '2024_05_11_155734_create_nalmacens_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (37, '2024_05_11_160139_create_ntipogiros_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (38, '2024_05_11_171629_create_dproductos_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (39, '2024_05_11_171652_create_dclienteproveedors_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (40, '2024_05_11_171731_create_dalmaceninternos_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (41, '2024_05_11_171752_create_dalmacenventas_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (42, '2024_05_11_171833_create_dentradaalmacens_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (43, '2024_05_11_171842_create_dsalidaalmacens_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (44, '2024_05_11_171933_create_dproductoentradas_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (45, '2024_05_11_171948_create_dproductosalidas_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (46, '2024_05_11_172015_create_dventas_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (47, '2024_05_11_183453_create_dventaproductos_table', 1);


--
-- TOC entry 3832 (class 0 OID 17539)
-- Dependencies: 231
-- Data for Name: nalmacens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nalmacens (id, denominacion, activo, created_at, updated_at, tipo) VALUES (1, 'Alamcen 1', true, '2024-05-24 00:00:00', '2024-05-24 00:00:00', 1);
INSERT INTO public.nalmacens (id, denominacion, activo, created_at, updated_at, tipo) VALUES (2, 'Almacen 2', true, '2024-05-24 00:00:00', '2024-05-24 00:00:00', 2);


--
-- TOC entry 3830 (class 0 OID 17532)
-- Dependencies: 229
-- Data for Name: ngiros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ngiros (id, denominacion, created_at, updated_at) VALUES (1, 'Canastilla', '2024-05-12 02:37:43', '2024-05-12 02:37:43');
INSERT INTO public.ngiros (id, denominacion, created_at, updated_at) VALUES (3, 'biberon 44', '2024-05-22 23:50:05', '2024-05-23 00:20:18');
INSERT INTO public.ngiros (id, denominacion, created_at, updated_at) VALUES (7, 'saasas', '2024-06-16 13:31:35', '2024-06-16 13:31:35');
INSERT INTO public.ngiros (id, denominacion, created_at, updated_at) VALUES (6, 'Encamados', '2024-06-15 22:30:43', '2024-06-16 13:52:07');
INSERT INTO public.ngiros (id, denominacion, created_at, updated_at) VALUES (16, 'asdad', '2024-06-16 16:30:18', '2024-06-16 16:30:18');
INSERT INTO public.ngiros (id, denominacion, created_at, updated_at) VALUES (17, 'asdadweew', '2024-06-16 16:31:52', '2024-06-16 16:31:52');
INSERT INTO public.ngiros (id, denominacion, created_at, updated_at) VALUES (18, 'fgfgfgfg', '2024-06-16 16:32:46', '2024-06-16 16:32:46');
INSERT INTO public.ngiros (id, denominacion, created_at, updated_at) VALUES (19, 'sdggdfgdfgdfgdfgd', '2024-06-16 16:32:54', '2024-06-16 16:32:54');
INSERT INTO public.ngiros (id, denominacion, created_at, updated_at) VALUES (20, 'gdfgd dfgdfggwfs sfs', '2024-06-16 16:33:08', '2024-06-16 16:33:08');


--
-- TOC entry 3834 (class 0 OID 17546)
-- Dependencies: 233
-- Data for Name: ntipogiros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ntipogiros (id, denominacion, created_at, updated_at, ngiros_id) VALUES (2, 'hh fff', '2024-05-26 04:35:06', '2024-05-26 16:24:12', 1);
INSERT INTO public.ntipogiros (id, denominacion, created_at, updated_at, ngiros_id) VALUES (4, 'gggg', '2024-05-26 21:56:43', '2024-05-26 21:56:43', 3);
INSERT INTO public.ntipogiros (id, denominacion, created_at, updated_at, ngiros_id) VALUES (5, 'Jabon de encamado', '2024-06-15 22:31:50', '2024-06-15 22:31:50', 6);
INSERT INTO public.ntipogiros (id, denominacion, created_at, updated_at, ngiros_id) VALUES (6, 'Sabanas blancas', '2024-06-15 22:32:09', '2024-06-15 22:32:09', 6);


--
-- TOC entry 3855 (class 0 OID 17729)
-- Dependencies: 254
-- Data for Name: nunidadmedidas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nunidadmedidas (id, denominacion, created_at, updated_at) VALUES (1, 'U', NULL, NULL);
INSERT INTO public.nunidadmedidas (id, denominacion, created_at, updated_at) VALUES (2, 'Kg', NULL, NULL);


--
-- TOC entry 3820 (class 0 OID 17472)
-- Dependencies: 219
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3821 (class 0 OID 17479)
-- Dependencies: 220
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) VALUES ('4O92xmPGxQiC4g78l90NwOWLxSqMXBlVmyezfI4u', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:127.0) Gecko/20100101 Firefox/127.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiN21paFlwVW9LeTN6dVZWWmdsZ3NRUTZlRG53M0QwMnFpV3gycXdDUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kZW50cmFkYWFsbWFjZW5zL2NyZWF0ZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1718857370);
INSERT INTO public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) VALUES ('KDg46gJ5Ckm4fGyoziYD7d48A6QJB2j2v24utJ0G', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:127.0) Gecko/20100101 Firefox/127.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWjJFQmhzVEhrYXh5eGg2eWxNRWFEYjJCS2NIMFhkbFI1d1lwWk1BaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kc2FsaWRhYWxtYWNlbnMvY3JlYXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1719200591);


--
-- TOC entry 3819 (class 0 OID 17462)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (1, 'comercio', 'comercio@comercio.app', NULL, '$2y$12$Fb5qSR2aMonz9/R1QZOB5.luWw40U9lbi3vGYYfge5.FqgSUCb1Fm', 'laiFRROSxJo79WNfa72nh7ykiSry1HQgnUsmvAB9zajUCkHth86vGiQWd6hp', '2024-05-11 20:18:22', '2024-05-11 20:18:22');


--
-- TOC entry 3879 (class 0 OID 0)
-- Dependencies: 238
-- Name: dalmaceninternos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dalmaceninternos_id_seq', 14, true);


--
-- TOC entry 3880 (class 0 OID 0)
-- Dependencies: 240
-- Name: dalmacenventas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dalmacenventas_id_seq', 3, true);


--
-- TOC entry 3881 (class 0 OID 0)
-- Dependencies: 236
-- Name: dclienteproveedors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dclienteproveedors_id_seq', 4, true);


--
-- TOC entry 3882 (class 0 OID 0)
-- Dependencies: 242
-- Name: dentradaalmacens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dentradaalmacens_id_seq', 25, true);


--
-- TOC entry 3883 (class 0 OID 0)
-- Dependencies: 246
-- Name: dproductoentradas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dproductoentradas_id_seq', 25, true);


--
-- TOC entry 3884 (class 0 OID 0)
-- Dependencies: 234
-- Name: dproductos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dproductos_id_seq', 7, true);


--
-- TOC entry 3885 (class 0 OID 0)
-- Dependencies: 248
-- Name: dproductosalidas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dproductosalidas_id_seq', 14, true);


--
-- TOC entry 3886 (class 0 OID 0)
-- Dependencies: 244
-- Name: dsalidaalmacens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dsalidaalmacens_id_seq', 16, true);


--
-- TOC entry 3887 (class 0 OID 0)
-- Dependencies: 252
-- Name: dventaproductos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dventaproductos_id_seq', 6, true);


--
-- TOC entry 3888 (class 0 OID 0)
-- Dependencies: 250
-- Name: dventas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dventas_id_seq', 17, true);


--
-- TOC entry 3889 (class 0 OID 0)
-- Dependencies: 226
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3890 (class 0 OID 0)
-- Dependencies: 223
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- TOC entry 3891 (class 0 OID 0)
-- Dependencies: 215
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 47, true);


--
-- TOC entry 3892 (class 0 OID 0)
-- Dependencies: 230
-- Name: nalmacens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nalmacens_id_seq', 2, true);


--
-- TOC entry 3893 (class 0 OID 0)
-- Dependencies: 228
-- Name: ngiros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ngiros_id_seq', 20, true);


--
-- TOC entry 3894 (class 0 OID 0)
-- Dependencies: 232
-- Name: ntipogiros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ntipogiros_id_seq', 6, true);


--
-- TOC entry 3895 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- TOC entry 3613 (class 2606 OID 17501)
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- TOC entry 3611 (class 2606 OID 17494)
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- TOC entry 3634 (class 2606 OID 17586)
-- Name: dalmaceninternos dalmaceninternos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dalmaceninternos
    ADD CONSTRAINT dalmaceninternos_pkey PRIMARY KEY (id);


--
-- TOC entry 3636 (class 2606 OID 17603)
-- Name: dalmacenventas dalmacenventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dalmacenventas
    ADD CONSTRAINT dalmacenventas_pkey PRIMARY KEY (id);


--
-- TOC entry 3632 (class 2606 OID 17579)
-- Name: dclienteproveedors dclienteproveedors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dclienteproveedors
    ADD CONSTRAINT dclienteproveedors_pkey PRIMARY KEY (id);


--
-- TOC entry 3638 (class 2606 OID 17620)
-- Name: dentradaalmacens dentradaalmacens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dentradaalmacens
    ADD CONSTRAINT dentradaalmacens_pkey PRIMARY KEY (id);


--
-- TOC entry 3642 (class 2606 OID 17659)
-- Name: dproductoentradas dproductoentradas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductoentradas
    ADD CONSTRAINT dproductoentradas_pkey PRIMARY KEY (id);


--
-- TOC entry 3630 (class 2606 OID 17565)
-- Name: dproductos dproductos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductos
    ADD CONSTRAINT dproductos_pkey PRIMARY KEY (id);


--
-- TOC entry 3644 (class 2606 OID 17676)
-- Name: dproductosalidas dproductosalidas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductosalidas
    ADD CONSTRAINT dproductosalidas_pkey PRIMARY KEY (id);


--
-- TOC entry 3640 (class 2606 OID 17637)
-- Name: dsalidaalmacens dsalidaalmacens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dsalidaalmacens
    ADD CONSTRAINT dsalidaalmacens_pkey PRIMARY KEY (id);


--
-- TOC entry 3648 (class 2606 OID 17702)
-- Name: dventaproductos dventaproductos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dventaproductos
    ADD CONSTRAINT dventaproductos_pkey PRIMARY KEY (id);


--
-- TOC entry 3646 (class 2606 OID 17693)
-- Name: dventas dventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dventas
    ADD CONSTRAINT dventas_pkey PRIMARY KEY (id);


--
-- TOC entry 3620 (class 2606 OID 17528)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3622 (class 2606 OID 17530)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 3618 (class 2606 OID 17518)
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 3615 (class 2606 OID 17510)
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3599 (class 2606 OID 16951)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3626 (class 2606 OID 17544)
-- Name: nalmacens nalmacens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nalmacens
    ADD CONSTRAINT nalmacens_pkey PRIMARY KEY (id);


--
-- TOC entry 3624 (class 2606 OID 17537)
-- Name: ngiros ngiros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ngiros
    ADD CONSTRAINT ngiros_pkey PRIMARY KEY (id);


--
-- TOC entry 3628 (class 2606 OID 17551)
-- Name: ntipogiros ntipogiros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ntipogiros
    ADD CONSTRAINT ntipogiros_pkey PRIMARY KEY (id);


--
-- TOC entry 3650 (class 2606 OID 17735)
-- Name: nunidadmedidas nunidadmedida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nunidadmedidas
    ADD CONSTRAINT nunidadmedida_pkey PRIMARY KEY (id);


--
-- TOC entry 3605 (class 2606 OID 17478)
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- TOC entry 3608 (class 2606 OID 17485)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3601 (class 2606 OID 17471)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3603 (class 2606 OID 17469)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3616 (class 1259 OID 17511)
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- TOC entry 3606 (class 1259 OID 17487)
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- TOC entry 3609 (class 1259 OID 17486)
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- TOC entry 3669 (class 2620 OID 17720)
-- Name: dproductoentradas after_delete_dproductoentradas; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER after_delete_dproductoentradas AFTER DELETE ON public.dproductoentradas FOR EACH ROW EXECUTE FUNCTION public.handle_delete_dproductoentradas();


--
-- TOC entry 3671 (class 2620 OID 17728)
-- Name: dproductosalidas after_dproductosalidas_delete; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER after_dproductosalidas_delete AFTER DELETE ON public.dproductosalidas FOR EACH ROW EXECUTE FUNCTION public.handle_dproductosalidas_delete();


--
-- TOC entry 3672 (class 2620 OID 17742)
-- Name: dproductosalidas after_dproductosalidas_insert_or_update; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER after_dproductosalidas_insert_or_update AFTER INSERT OR UPDATE ON public.dproductosalidas FOR EACH ROW EXECUTE FUNCTION public.handle_dproductosalidas_insert_or_update();


--
-- TOC entry 3670 (class 2620 OID 17719)
-- Name: dproductoentradas after_insert_update_dproductoentradas; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER after_insert_update_dproductoentradas AFTER INSERT OR UPDATE ON public.dproductoentradas FOR EACH ROW EXECUTE FUNCTION public.handle_insert_update_dproductoentradas();


--
-- TOC entry 3654 (class 2606 OID 17592)
-- Name: dalmaceninternos dalmaceninternos_dproductos_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dalmaceninternos
    ADD CONSTRAINT dalmaceninternos_dproductos_id_foreign FOREIGN KEY (dproductos_id) REFERENCES public.dproductos(id);


--
-- TOC entry 3655 (class 2606 OID 17587)
-- Name: dalmaceninternos dalmaceninternos_ialmacens_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dalmaceninternos
    ADD CONSTRAINT dalmaceninternos_ialmacens_id_foreign FOREIGN KEY (ialmacens_id) REFERENCES public.nalmacens(id);


--
-- TOC entry 3656 (class 2606 OID 17609)
-- Name: dalmacenventas dalmacenventas_dproductos_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dalmacenventas
    ADD CONSTRAINT dalmacenventas_dproductos_id_foreign FOREIGN KEY (dproductos_id) REFERENCES public.dproductos(id);


--
-- TOC entry 3657 (class 2606 OID 17604)
-- Name: dalmacenventas dalmacenventas_valamcens_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dalmacenventas
    ADD CONSTRAINT dalmacenventas_valamcens_id_foreign FOREIGN KEY (valamcens_id) REFERENCES public.nalmacens(id);


--
-- TOC entry 3658 (class 2606 OID 17626)
-- Name: dentradaalmacens dentradaalmacens_dproveedor_origen_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dentradaalmacens
    ADD CONSTRAINT dentradaalmacens_dproveedor_origen_id_foreign FOREIGN KEY (dproveedor_origen_id) REFERENCES public.dclienteproveedors(id);


--
-- TOC entry 3659 (class 2606 OID 17621)
-- Name: dentradaalmacens dentradaalmacens_nalmacens_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dentradaalmacens
    ADD CONSTRAINT dentradaalmacens_nalmacens_id_foreign FOREIGN KEY (nalmacens_id) REFERENCES public.nalmacens(id);


--
-- TOC entry 3663 (class 2606 OID 17665)
-- Name: dproductoentradas dproductoentradas_dentradaalmacen_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductoentradas
    ADD CONSTRAINT dproductoentradas_dentradaalmacen_id_foreign FOREIGN KEY (dentradaalmacen_id) REFERENCES public.dentradaalmacens(id);


--
-- TOC entry 3664 (class 2606 OID 17660)
-- Name: dproductoentradas dproductoentradas_dproducto_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductoentradas
    ADD CONSTRAINT dproductoentradas_dproducto_id_foreign FOREIGN KEY (dproducto_id) REFERENCES public.dproductos(id);


--
-- TOC entry 3652 (class 2606 OID 17566)
-- Name: dproductos dproductos_dtipogiros_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductos
    ADD CONSTRAINT dproductos_dtipogiros_id_foreign FOREIGN KEY (dtipogiros_id) REFERENCES public.ntipogiros(id);


--
-- TOC entry 3653 (class 2606 OID 17736)
-- Name: dproductos dproductos_nunidadmedida_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductos
    ADD CONSTRAINT dproductos_nunidadmedida_id_foreign FOREIGN KEY (nunidadmedida_id) REFERENCES public.nunidadmedidas(id) NOT VALID;


--
-- TOC entry 3665 (class 2606 OID 17677)
-- Name: dproductosalidas dproductosalidas_dproducto_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductosalidas
    ADD CONSTRAINT dproductosalidas_dproducto_id_foreign FOREIGN KEY (dproducto_id) REFERENCES public.dproductos(id);


--
-- TOC entry 3666 (class 2606 OID 17682)
-- Name: dproductosalidas dproductosalidas_dsalidaalmacen_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dproductosalidas
    ADD CONSTRAINT dproductosalidas_dsalidaalmacen_id_foreign FOREIGN KEY (dsalidaalmacen_id) REFERENCES public.dsalidaalmacens(id);


--
-- TOC entry 3660 (class 2606 OID 17648)
-- Name: dsalidaalmacens dsalidaalmacens_dproveedor_destino_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dsalidaalmacens
    ADD CONSTRAINT dsalidaalmacens_dproveedor_destino_id_foreign FOREIGN KEY (dproveedor_destino_id) REFERENCES public.dclienteproveedors(id);


--
-- TOC entry 3661 (class 2606 OID 17643)
-- Name: dsalidaalmacens dsalidaalmacens_nalmacenes_destino_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dsalidaalmacens
    ADD CONSTRAINT dsalidaalmacens_nalmacenes_destino_id_foreign FOREIGN KEY (nalmacenes_destino_id) REFERENCES public.nalmacens(id);


--
-- TOC entry 3662 (class 2606 OID 17638)
-- Name: dsalidaalmacens dsalidaalmacens_nalmacenes_origen_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dsalidaalmacens
    ADD CONSTRAINT dsalidaalmacens_nalmacenes_origen_id_foreign FOREIGN KEY (nalmacenes_origen_id) REFERENCES public.nalmacens(id);


--
-- TOC entry 3667 (class 2606 OID 17708)
-- Name: dventaproductos dventaproductos_dproductos_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dventaproductos
    ADD CONSTRAINT dventaproductos_dproductos_id_foreign FOREIGN KEY (dproducto_id) REFERENCES public.dproductos(id);


--
-- TOC entry 3668 (class 2606 OID 17703)
-- Name: dventaproductos dventaproductos_dventas_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dventaproductos
    ADD CONSTRAINT dventaproductos_dventas_id_foreign FOREIGN KEY (dventa_id) REFERENCES public.dventas(id);


--
-- TOC entry 3651 (class 2606 OID 17552)
-- Name: ntipogiros ntipogiros_ngiros_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ntipogiros
    ADD CONSTRAINT ntipogiros_ngiros_id_foreign FOREIGN KEY (ngiros_id) REFERENCES public.ngiros(id);


-- Completed on 2024-06-23 23:45:24 EDT

--
-- PostgreSQL database dump complete
--

