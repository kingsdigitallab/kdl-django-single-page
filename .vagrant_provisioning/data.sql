--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taggit_tag_id_seq OWNED BY taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taggit_taggeditem_id_seq OWNED BY taggit_taggeditem.id;


--
-- Name: wagtailbase_baseindexpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_baseindexpage (
    basepage_ptr_id integer NOT NULL,
    introduction text NOT NULL
);


--
-- Name: wagtailbase_basepage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_basepage (
    page_ptr_id integer NOT NULL
);


--
-- Name: wagtailbase_baserichtextpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_baserichtextpage (
    basepage_ptr_id integer NOT NULL,
    content text NOT NULL
);


--
-- Name: wagtailbase_blogindexpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_blogindexpage (
    baseindexpage_ptr_id integer NOT NULL
);


--
-- Name: wagtailbase_blogindexpageattachment; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_blogindexpageattachment (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200),
    embed_url character varying(200) NOT NULL,
    caption character varying(255) NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: wagtailbase_blogindexpageattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailbase_blogindexpageattachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailbase_blogindexpageattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailbase_blogindexpageattachment_id_seq OWNED BY wagtailbase_blogindexpageattachment.id;


--
-- Name: wagtailbase_blogindexpagerelatedlink; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_blogindexpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200),
    title character varying(256) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: wagtailbase_blogindexpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailbase_blogindexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailbase_blogindexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailbase_blogindexpagerelatedlink_id_seq OWNED BY wagtailbase_blogindexpagerelatedlink.id;


--
-- Name: wagtailbase_blogpost; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_blogpost (
    baserichtextpage_ptr_id integer NOT NULL,
    date date NOT NULL,
    featured boolean NOT NULL
);


--
-- Name: wagtailbase_blogpostattachment; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_blogpostattachment (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200),
    embed_url character varying(200) NOT NULL,
    caption character varying(255) NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: wagtailbase_blogpostattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailbase_blogpostattachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailbase_blogpostattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailbase_blogpostattachment_id_seq OWNED BY wagtailbase_blogpostattachment.id;


--
-- Name: wagtailbase_blogpostrelatedlink; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_blogpostrelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200),
    title character varying(256) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: wagtailbase_blogpostrelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailbase_blogpostrelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailbase_blogpostrelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailbase_blogpostrelatedlink_id_seq OWNED BY wagtailbase_blogpostrelatedlink.id;


--
-- Name: wagtailbase_blogposttag; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_blogposttag (
    id integer NOT NULL,
    content_object_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: wagtailbase_blogposttag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailbase_blogposttag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailbase_blogposttag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailbase_blogposttag_id_seq OWNED BY wagtailbase_blogposttag.id;


--
-- Name: wagtailbase_homepage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_homepage (
    baserichtextpage_ptr_id integer NOT NULL
);


--
-- Name: wagtailbase_homepageattachment; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_homepageattachment (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200),
    embed_url character varying(200) NOT NULL,
    caption character varying(255) NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: wagtailbase_homepageattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailbase_homepageattachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailbase_homepageattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailbase_homepageattachment_id_seq OWNED BY wagtailbase_homepageattachment.id;


--
-- Name: wagtailbase_indexpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_indexpage (
    baseindexpage_ptr_id integer NOT NULL
);


--
-- Name: wagtailbase_indexpageattachment; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_indexpageattachment (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200),
    embed_url character varying(200) NOT NULL,
    caption character varying(255) NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: wagtailbase_indexpageattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailbase_indexpageattachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailbase_indexpageattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailbase_indexpageattachment_id_seq OWNED BY wagtailbase_indexpageattachment.id;


--
-- Name: wagtailbase_indexpagerelatedlink; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_indexpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200),
    title character varying(256) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: wagtailbase_indexpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailbase_indexpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailbase_indexpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailbase_indexpagerelatedlink_id_seq OWNED BY wagtailbase_indexpagerelatedlink.id;


--
-- Name: wagtailbase_richtextattachment; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_richtextattachment (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200),
    embed_url character varying(200) NOT NULL,
    caption character varying(255) NOT NULL,
    image_id integer,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: wagtailbase_richtextattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailbase_richtextattachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailbase_richtextattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailbase_richtextattachment_id_seq OWNED BY wagtailbase_richtextattachment.id;


--
-- Name: wagtailbase_richtextpage; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_richtextpage (
    baserichtextpage_ptr_id integer NOT NULL
);


--
-- Name: wagtailbase_richtextpagerelatedlink; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailbase_richtextpagerelatedlink (
    id integer NOT NULL,
    sort_order integer,
    link_external character varying(200),
    title character varying(256) NOT NULL,
    link_document_id integer,
    link_page_id integer,
    page_id integer NOT NULL
);


--
-- Name: wagtailbase_richtextpagerelatedlink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailbase_richtextpagerelatedlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailbase_richtextpagerelatedlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailbase_richtextpagerelatedlink_id_seq OWNED BY wagtailbase_richtextpagerelatedlink.id;


--
-- Name: wagtailcore_grouppagepermission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailcore_grouppagepermission (
    id integer NOT NULL,
    permission_type character varying(20) NOT NULL,
    group_id integer NOT NULL,
    page_id integer NOT NULL
);


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_grouppagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_grouppagepermission_id_seq OWNED BY wagtailcore_grouppagepermission.id;


--
-- Name: wagtailcore_page; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailcore_page (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    live boolean NOT NULL,
    has_unpublished_changes boolean NOT NULL,
    url_path text NOT NULL,
    seo_title character varying(255) NOT NULL,
    show_in_menus boolean NOT NULL,
    search_description text NOT NULL,
    go_live_at timestamp with time zone,
    expire_at timestamp with time zone,
    expired boolean NOT NULL,
    content_type_id integer NOT NULL,
    owner_id integer,
    locked boolean NOT NULL,
    latest_revision_created_at timestamp with time zone,
    first_published_at timestamp with time zone,
    CONSTRAINT wagtailcore_page_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_page_numchild_check CHECK ((numchild >= 0))
);


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_page_id_seq OWNED BY wagtailcore_page.id;


--
-- Name: wagtailcore_pagerevision; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailcore_pagerevision (
    id integer NOT NULL,
    submitted_for_moderation boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    content_json text NOT NULL,
    approved_go_live_at timestamp with time zone,
    page_id integer NOT NULL,
    user_id integer
);


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_pagerevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_pagerevision_id_seq OWNED BY wagtailcore_pagerevision.id;


--
-- Name: wagtailcore_pageviewrestriction; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailcore_pageviewrestriction (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    page_id integer NOT NULL
);


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_pageviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_pageviewrestriction_id_seq OWNED BY wagtailcore_pageviewrestriction.id;


--
-- Name: wagtailcore_site; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailcore_site (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    port integer NOT NULL,
    is_default_site boolean NOT NULL,
    root_page_id integer NOT NULL
);


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailcore_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailcore_site_id_seq OWNED BY wagtailcore_site.id;


--
-- Name: wagtaildocs_document; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtaildocs_document (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    uploaded_by_user_id integer
);


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtaildocs_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtaildocs_document_id_seq OWNED BY wagtaildocs_document.id;


--
-- Name: wagtailembeds_embed; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailembeds_embed (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    max_width smallint,
    type character varying(10) NOT NULL,
    html text NOT NULL,
    title text NOT NULL,
    author_name text NOT NULL,
    provider_name text NOT NULL,
    thumbnail_url character varying(200),
    width integer,
    height integer,
    last_updated timestamp with time zone NOT NULL
);


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailembeds_embed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailembeds_embed_id_seq OWNED BY wagtailembeds_embed.id;


--
-- Name: wagtailimages_filter; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailimages_filter (
    id integer NOT NULL,
    spec character varying(255) NOT NULL
);


--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailimages_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailimages_filter_id_seq OWNED BY wagtailimages_filter.id;


--
-- Name: wagtailimages_image; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailimages_image (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    focal_point_x integer,
    focal_point_y integer,
    focal_point_width integer,
    focal_point_height integer,
    uploaded_by_user_id integer,
    CONSTRAINT wagtailimages_image_focal_point_height_check CHECK ((focal_point_height >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_width_check CHECK ((focal_point_width >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_x_check CHECK ((focal_point_x >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_y_check CHECK ((focal_point_y >= 0))
);


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailimages_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailimages_image_id_seq OWNED BY wagtailimages_image.id;


--
-- Name: wagtailimages_rendition; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailimages_rendition (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    focal_point_key character varying(255) NOT NULL,
    filter_id integer NOT NULL,
    image_id integer NOT NULL
);


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailimages_rendition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailimages_rendition_id_seq OWNED BY wagtailimages_rendition.id;


--
-- Name: wagtailredirects_redirect; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailredirects_redirect (
    id integer NOT NULL,
    old_path character varying(255) NOT NULL,
    is_permanent boolean NOT NULL,
    redirect_link character varying(200) NOT NULL,
    redirect_page_id integer,
    site_id integer
);


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailredirects_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailredirects_redirect_id_seq OWNED BY wagtailredirects_redirect.id;


--
-- Name: wagtailsearch_editorspick; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailsearch_editorspick (
    id integer NOT NULL,
    sort_order integer,
    description text NOT NULL,
    page_id integer NOT NULL,
    query_id integer NOT NULL
);


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailsearch_editorspick_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailsearch_editorspick_id_seq OWNED BY wagtailsearch_editorspick.id;


--
-- Name: wagtailsearch_query; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailsearch_query (
    id integer NOT NULL,
    query_string character varying(255) NOT NULL
);


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailsearch_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailsearch_query_id_seq OWNED BY wagtailsearch_query.id;


--
-- Name: wagtailsearch_querydailyhits; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailsearch_querydailyhits (
    id integer NOT NULL,
    date date NOT NULL,
    hits integer NOT NULL,
    query_id integer NOT NULL
);


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailsearch_querydailyhits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailsearch_querydailyhits_id_seq OWNED BY wagtailsearch_querydailyhits.id;


--
-- Name: wagtailusers_userprofile; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE wagtailusers_userprofile (
    id integer NOT NULL,
    submitted_notifications boolean NOT NULL,
    approved_notifications boolean NOT NULL,
    rejected_notifications boolean NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE wagtailusers_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE wagtailusers_userprofile_id_seq OWNED BY wagtailusers_userprofile.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_tag ALTER COLUMN id SET DEFAULT nextval('taggit_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('taggit_taggeditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogindexpageattachment ALTER COLUMN id SET DEFAULT nextval('wagtailbase_blogindexpageattachment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogindexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('wagtailbase_blogindexpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogpostattachment ALTER COLUMN id SET DEFAULT nextval('wagtailbase_blogpostattachment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogpostrelatedlink ALTER COLUMN id SET DEFAULT nextval('wagtailbase_blogpostrelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogposttag ALTER COLUMN id SET DEFAULT nextval('wagtailbase_blogposttag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_homepageattachment ALTER COLUMN id SET DEFAULT nextval('wagtailbase_homepageattachment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_indexpageattachment ALTER COLUMN id SET DEFAULT nextval('wagtailbase_indexpageattachment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_indexpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('wagtailbase_indexpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_richtextattachment ALTER COLUMN id SET DEFAULT nextval('wagtailbase_richtextattachment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_richtextpagerelatedlink ALTER COLUMN id SET DEFAULT nextval('wagtailbase_richtextpagerelatedlink_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_grouppagepermission ALTER COLUMN id SET DEFAULT nextval('wagtailcore_grouppagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page ALTER COLUMN id SET DEFAULT nextval('wagtailcore_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pagerevision ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pagerevision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction ALTER COLUMN id SET DEFAULT nextval('wagtailcore_pageviewrestriction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_site ALTER COLUMN id SET DEFAULT nextval('wagtailcore_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtaildocs_document ALTER COLUMN id SET DEFAULT nextval('wagtaildocs_document_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailembeds_embed ALTER COLUMN id SET DEFAULT nextval('wagtailembeds_embed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_filter ALTER COLUMN id SET DEFAULT nextval('wagtailimages_filter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_image ALTER COLUMN id SET DEFAULT nextval('wagtailimages_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_rendition ALTER COLUMN id SET DEFAULT nextval('wagtailimages_rendition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailredirects_redirect ALTER COLUMN id SET DEFAULT nextval('wagtailredirects_redirect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_editorspick ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_editorspick_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_query ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_query_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_querydailyhits ALTER COLUMN id SET DEFAULT nextval('wagtailsearch_querydailyhits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailusers_userprofile ALTER COLUMN id SET DEFAULT nextval('wagtailusers_userprofile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group (id, name) FROM stdin;
1	Moderators
2	Editors
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	2	1
3	1	2
4	1	3
5	1	4
6	2	2
7	2	3
8	2	4
9	1	5
10	1	6
11	1	7
12	2	5
13	2	6
14	2	7
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 14, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can access Wagtail admin	2	access_admin
2	Can add image	3	add_image
3	Can change image	3	change_image
4	Can delete image	3	delete_image
5	Can add document	4	add_document
6	Can change document	4	change_document
7	Can delete document	4	delete_document
8	Can add log entry	5	add_logentry
9	Can change log entry	5	change_logentry
10	Can delete log entry	5	delete_logentry
11	Can add permission	6	add_permission
12	Can change permission	6	change_permission
13	Can delete permission	6	delete_permission
14	Can add group	7	add_group
15	Can change group	7	change_group
16	Can delete group	7	delete_group
17	Can add user	8	add_user
18	Can change user	8	change_user
19	Can delete user	8	delete_user
20	Can add content type	9	add_contenttype
21	Can change content type	9	change_contenttype
22	Can delete content type	9	delete_contenttype
23	Can add session	10	add_session
24	Can change session	10	change_session
25	Can delete session	10	delete_session
26	Can add Tag	11	add_tag
27	Can change Tag	11	change_tag
28	Can delete Tag	11	delete_tag
29	Can add Tagged Item	12	add_taggeditem
30	Can change Tagged Item	12	change_taggeditem
31	Can delete Tagged Item	12	delete_taggeditem
32	Can add Site	13	add_site
33	Can change Site	13	change_site
34	Can delete Site	13	delete_site
35	Can add page	1	add_page
36	Can change page	1	change_page
37	Can delete page	1	delete_page
38	Can add Page Revision	14	add_pagerevision
39	Can change Page Revision	14	change_pagerevision
40	Can delete Page Revision	14	delete_pagerevision
41	Can add Group Page Permission	15	add_grouppagepermission
42	Can change Group Page Permission	15	change_grouppagepermission
43	Can delete Group Page Permission	15	delete_grouppagepermission
44	Can add Page View Restriction	16	add_pageviewrestriction
45	Can change Page View Restriction	16	change_pageviewrestriction
46	Can delete Page View Restriction	16	delete_pageviewrestriction
47	Can add User Profile	17	add_userprofile
48	Can change User Profile	17	change_userprofile
49	Can delete User Profile	17	delete_userprofile
50	Can add filter	18	add_filter
51	Can change filter	18	change_filter
52	Can delete filter	18	delete_filter
53	Can add rendition	19	add_rendition
54	Can change rendition	19	change_rendition
55	Can delete rendition	19	delete_rendition
56	Can add Embed	20	add_embed
57	Can change Embed	20	change_embed
58	Can delete Embed	20	delete_embed
59	Can add query	21	add_query
60	Can change query	21	change_query
61	Can delete query	21	delete_query
62	Can add Query Daily Hits	22	add_querydailyhits
63	Can change Query Daily Hits	22	change_querydailyhits
64	Can delete Query Daily Hits	22	delete_querydailyhits
65	Can add Editor's Pick	23	add_editorspick
66	Can change Editor's Pick	23	change_editorspick
67	Can delete Editor's Pick	23	delete_editorspick
68	Can add Redirect	24	add_redirect
69	Can change Redirect	24	change_redirect
70	Can delete Redirect	24	delete_redirect
71	Can add base page	25	add_basepage
72	Can change base page	25	change_basepage
73	Can delete base page	25	delete_basepage
74	Can add base index page	26	add_baseindexpage
75	Can change base index page	26	change_baseindexpage
76	Can delete base index page	26	delete_baseindexpage
77	Can add base rich text page	27	add_baserichtextpage
78	Can change base rich text page	27	change_baserichtextpage
79	Can delete base rich text page	27	delete_baserichtextpage
80	Can add index page	28	add_indexpage
81	Can change index page	28	change_indexpage
82	Can delete index page	28	delete_indexpage
83	Can add index page related link	29	add_indexpagerelatedlink
84	Can change index page related link	29	change_indexpagerelatedlink
85	Can delete index page related link	29	delete_indexpagerelatedlink
86	Can add index page attachment	30	add_indexpageattachment
87	Can change index page attachment	30	change_indexpageattachment
88	Can delete index page attachment	30	delete_indexpageattachment
89	Can add rich text page	31	add_richtextpage
90	Can change rich text page	31	change_richtextpage
91	Can delete rich text page	31	delete_richtextpage
92	Can add rich text page related link	32	add_richtextpagerelatedlink
93	Can change rich text page related link	32	change_richtextpagerelatedlink
94	Can delete rich text page related link	32	delete_richtextpagerelatedlink
95	Can add rich text attachment	33	add_richtextattachment
96	Can change rich text attachment	33	change_richtextattachment
97	Can delete rich text attachment	33	delete_richtextattachment
98	Can add Homepage	34	add_homepage
99	Can change Homepage	34	change_homepage
100	Can delete Homepage	34	delete_homepage
101	Can add home page attachment	35	add_homepageattachment
102	Can change home page attachment	35	change_homepageattachment
103	Can delete home page attachment	35	delete_homepageattachment
104	Can add blog index page	36	add_blogindexpage
105	Can change blog index page	36	change_blogindexpage
106	Can delete blog index page	36	delete_blogindexpage
107	Can add blog index page related link	37	add_blogindexpagerelatedlink
108	Can change blog index page related link	37	change_blogindexpagerelatedlink
109	Can delete blog index page related link	37	delete_blogindexpagerelatedlink
110	Can add blog index page attachment	38	add_blogindexpageattachment
111	Can change blog index page attachment	38	change_blogindexpageattachment
112	Can delete blog index page attachment	38	delete_blogindexpageattachment
113	Can add blog post tag	39	add_blogposttag
114	Can change blog post tag	39	change_blogposttag
115	Can delete blog post tag	39	delete_blogposttag
116	Can add blog post	40	add_blogpost
117	Can change blog post	40	change_blogpost
118	Can delete blog post	40	delete_blogpost
119	Can add blog post related link	41	add_blogpostrelatedlink
120	Can change blog post related link	41	change_blogpostrelatedlink
121	Can delete blog post related link	41	delete_blogpostrelatedlink
122	Can add blog post attachment	42	add_blogpostattachment
123	Can change blog post attachment	42	change_blogpostattachment
124	Can delete blog post attachment	42	delete_blogpostattachment
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_permission_id_seq', 124, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	!x5BhtCLyJuYbwUZ38iKgPUas39LsjDUXpqk0ewc0	2015-08-13 09:54:56.145204+00	t	jvieira	Miguel	Vieira	jose.m.vieira@kcl.ac.uk	t	t	2015-08-13 09:54:56.111103+00
2	pbkdf2_sha256$20000$KliTLiYua7z7$OWailpPZ+tiNUt2Ca4CQuICk3cDbPobl09XQyF30IEg=	\N	t	vagrant			vagrant@kdl.vagrant	t	t	2015-08-13 10:00:03.266204+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	wagtailcore	page
2	wagtailadmin	admin
3	wagtailimages	image
4	wagtaildocs	document
5	admin	logentry
6	auth	permission
7	auth	group
8	auth	user
9	contenttypes	contenttype
10	sessions	session
11	taggit	tag
12	taggit	taggeditem
13	wagtailcore	site
14	wagtailcore	pagerevision
15	wagtailcore	grouppagepermission
16	wagtailcore	pageviewrestriction
17	wagtailusers	userprofile
18	wagtailimages	filter
19	wagtailimages	rendition
20	wagtailembeds	embed
21	wagtailsearch	query
22	wagtailsearch	querydailyhits
23	wagtailsearch	editorspick
24	wagtailredirects	redirect
25	wagtailbase	basepage
26	wagtailbase	baseindexpage
27	wagtailbase	baserichtextpage
28	wagtailbase	indexpage
29	wagtailbase	indexpagerelatedlink
30	wagtailbase	indexpageattachment
31	wagtailbase	richtextpage
32	wagtailbase	richtextpagerelatedlink
33	wagtailbase	richtextattachment
34	wagtailbase	homepage
35	wagtailbase	homepageattachment
36	wagtailbase	blogindexpage
37	wagtailbase	blogindexpagerelatedlink
38	wagtailbase	blogindexpageattachment
39	wagtailbase	blogposttag
40	wagtailbase	blogpost
41	wagtailbase	blogpostrelatedlink
42	wagtailbase	blogpostattachment
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_content_type_id_seq', 42, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-08-13 09:51:24.937117+00
2	auth	0001_initial	2015-08-13 09:51:25.122012+00
3	admin	0001_initial	2015-08-13 09:51:25.186426+00
4	contenttypes	0002_remove_content_type_name	2015-08-13 09:51:25.284303+00
5	auth	0002_alter_permission_name_max_length	2015-08-13 09:51:25.32612+00
6	auth	0003_alter_user_email_max_length	2015-08-13 09:51:25.374524+00
7	auth	0004_alter_user_username_opts	2015-08-13 09:51:25.413355+00
8	auth	0005_alter_user_last_login_null	2015-08-13 09:51:25.454724+00
9	auth	0006_require_contenttypes_0002	2015-08-13 09:51:25.458855+00
10	sessions	0001_initial	2015-08-13 09:51:25.488176+00
11	taggit	0001_initial	2015-08-13 09:51:25.58577+00
12	wagtailcore	0001_initial	2015-08-13 09:51:26.386127+00
13	wagtailcore	0002_initial_data	2015-08-13 09:51:26.388998+00
14	wagtailcore	0003_add_uniqueness_constraint_on_group_page_permission	2015-08-13 09:51:26.393175+00
15	wagtailcore	0004_page_locked	2015-08-13 09:51:26.39664+00
16	wagtailcore	0005_add_page_lock_permission_to_moderators	2015-08-13 09:51:26.40006+00
17	wagtailcore	0006_add_lock_page_permission	2015-08-13 09:51:26.403411+00
18	wagtailcore	0007_page_latest_revision_created_at	2015-08-13 09:51:26.407034+00
19	wagtailcore	0008_populate_latest_revision_created_at	2015-08-13 09:51:26.41067+00
20	wagtailcore	0009_remove_auto_now_add_from_pagerevision_created_at	2015-08-13 09:51:26.413997+00
21	wagtailcore	0010_change_page_owner_to_null_on_delete	2015-08-13 09:51:26.418649+00
22	wagtailcore	0011_page_first_published_at	2015-08-13 09:51:26.423309+00
23	wagtailcore	0012_extend_page_slug_field	2015-08-13 09:51:26.428214+00
24	wagtailcore	0013_update_golive_expire_help_text	2015-08-13 09:51:26.433039+00
25	wagtailcore	0014_add_verbose_name	2015-08-13 09:51:26.437175+00
26	wagtailcore	0015_add_more_verbose_names	2015-08-13 09:51:26.441115+00
27	wagtailcore	0016_change_page_url_path_to_text_field	2015-08-13 09:51:26.443831+00
28	wagtailadmin	0001_create_admin_access_permissions	2015-08-13 09:51:26.479213+00
29	wagtailimages	0001_initial	2015-08-13 09:51:26.760781+00
30	wagtailimages	0002_initial_data	2015-08-13 09:51:26.802767+00
31	wagtaildocs	0001_initial	2015-08-13 09:51:26.905437+00
32	wagtaildocs	0002_initial_data	2015-08-13 09:51:26.958167+00
33	wagtailbase	0001_initial	2015-08-13 09:51:30.307975+00
34	wagtailbase	0002_blogpost_featured	2015-08-13 09:51:30.454313+00
35	wagtaildocs	0003_add_verbose_names	2015-08-13 09:51:30.851827+00
36	wagtailembeds	0001_initial	2015-08-13 09:51:30.892225+00
37	wagtailembeds	0002_add_verbose_names	2015-08-13 09:51:30.911213+00
38	wagtailimages	0003_fix_focal_point_fields	2015-08-13 09:51:31.706811+00
39	wagtailimages	0004_make_focal_point_key_not_nullable	2015-08-13 09:51:31.93103+00
40	wagtailimages	0005_make_filter_spec_unique	2015-08-13 09:51:32.134358+00
41	wagtailimages	0006_add_verbose_names	2015-08-13 09:51:33.271445+00
42	wagtailredirects	0001_initial	2015-08-13 09:51:33.67496+00
43	wagtailredirects	0002_add_verbose_names	2015-08-13 09:51:34.163589+00
44	wagtailsearch	0001_initial	2015-08-13 09:51:34.750586+00
45	wagtailsearch	0002_add_verbose_names	2015-08-13 09:51:35.726035+00
46	wagtailusers	0001_initial	2015-08-13 09:51:35.917533+00
47	wagtailusers	0002_add_verbose_name_on_userprofile	2015-08-13 09:51:36.661367+00
48	wagtailusers	0003_add_verbose_names	2015-08-13 09:51:37.136401+00
49	wagtailcore	0001_squashed_0016_change_page_url_path_to_text_field	2015-08-13 09:51:37.143447+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_migrations_id_seq', 49, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
c7wk8adh8egm7ik5im8wu2iqsgcrrpub	ZTM3OWZhZGU1ZmQ4MmZmYTBlYjFmNGJmYTkwNzA5MjAyM2JiNzNjYTp7Il9hdXRoX3VzZXJfaGFzaCI6ImE1ODY0MmQzMzdmOTM4NzdlOGJkNDgxNTcwNDUxZmE3N2QzNjIwZWQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ29fYXV0aF9sZGFwLmJhY2tlbmQuTERBUEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9	2015-08-27 09:54:56.149879+00
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('taggit_tag_id_seq', 1, false);


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('taggit_taggeditem_id_seq', 1, false);


--
-- Data for Name: wagtailbase_baseindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_baseindexpage (basepage_ptr_id, introduction) FROM stdin;
\.


--
-- Data for Name: wagtailbase_basepage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_basepage (page_ptr_id) FROM stdin;
3
\.


--
-- Data for Name: wagtailbase_baserichtextpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_baserichtextpage (basepage_ptr_id, content) FROM stdin;
3	<p>King's Digital Laboratory...<br/></p>
\.


--
-- Data for Name: wagtailbase_blogindexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_blogindexpage (baseindexpage_ptr_id) FROM stdin;
\.


--
-- Data for Name: wagtailbase_blogindexpageattachment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_blogindexpageattachment (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: wagtailbase_blogindexpageattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailbase_blogindexpageattachment_id_seq', 1, false);


--
-- Data for Name: wagtailbase_blogindexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_blogindexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: wagtailbase_blogindexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailbase_blogindexpagerelatedlink_id_seq', 1, false);


--
-- Data for Name: wagtailbase_blogpost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_blogpost (baserichtextpage_ptr_id, date, featured) FROM stdin;
\.


--
-- Data for Name: wagtailbase_blogpostattachment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_blogpostattachment (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: wagtailbase_blogpostattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailbase_blogpostattachment_id_seq', 1, false);


--
-- Data for Name: wagtailbase_blogpostrelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_blogpostrelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: wagtailbase_blogpostrelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailbase_blogpostrelatedlink_id_seq', 1, false);


--
-- Data for Name: wagtailbase_blogposttag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_blogposttag (id, content_object_id, tag_id) FROM stdin;
\.


--
-- Name: wagtailbase_blogposttag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailbase_blogposttag_id_seq', 1, false);


--
-- Data for Name: wagtailbase_homepage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_homepage (baserichtextpage_ptr_id) FROM stdin;
3
\.


--
-- Data for Name: wagtailbase_homepageattachment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_homepageattachment (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: wagtailbase_homepageattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailbase_homepageattachment_id_seq', 1, false);


--
-- Data for Name: wagtailbase_indexpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_indexpage (baseindexpage_ptr_id) FROM stdin;
\.


--
-- Data for Name: wagtailbase_indexpageattachment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_indexpageattachment (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: wagtailbase_indexpageattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailbase_indexpageattachment_id_seq', 1, false);


--
-- Data for Name: wagtailbase_indexpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_indexpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: wagtailbase_indexpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailbase_indexpagerelatedlink_id_seq', 1, false);


--
-- Data for Name: wagtailbase_richtextattachment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_richtextattachment (id, sort_order, link_external, embed_url, caption, image_id, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: wagtailbase_richtextattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailbase_richtextattachment_id_seq', 1, false);


--
-- Data for Name: wagtailbase_richtextpage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_richtextpage (baserichtextpage_ptr_id) FROM stdin;
\.


--
-- Data for Name: wagtailbase_richtextpagerelatedlink; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailbase_richtextpagerelatedlink (id, sort_order, link_external, title, link_document_id, link_page_id, page_id) FROM stdin;
\.


--
-- Name: wagtailbase_richtextpagerelatedlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailbase_richtextpagerelatedlink_id_seq', 1, false);


--
-- Data for Name: wagtailcore_grouppagepermission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_grouppagepermission (id, permission_type, group_id, page_id) FROM stdin;
1	add	1	1
2	edit	1	1
3	publish	1	1
4	add	2	1
5	edit	2	1
6	lock	1	1
\.


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_grouppagepermission_id_seq', 6, true);


--
-- Data for Name: wagtailcore_page; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_page (id, path, depth, numchild, title, slug, live, has_unpublished_changes, url_path, seo_title, show_in_menus, search_description, go_live_at, expire_at, expired, content_type_id, owner_id, locked, latest_revision_created_at, first_published_at) FROM stdin;
1	0001	1	1	Root	root	t	f	/		f		\N	\N	f	1	\N	f	\N	\N
3	000100010001	3	0	Home	home	t	f	/home/home/		t		\N	\N	f	34	1	f	2015-08-13 09:57:27.711267+00	2015-08-13 09:55:28.195243+00
2	00010001	2	1	King's Digital Laboratory	home	t	f	/home/		f		\N	\N	f	1	\N	f	2015-08-13 09:57:47.51015+00	2015-08-13 09:57:47.545218+00
\.


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_page_id_seq', 3, true);


--
-- Data for Name: wagtailcore_pagerevision; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_pagerevision (id, submitted_for_moderation, created_at, content_json, approved_go_live_at, page_id, user_id) FROM stdin;
1	f	2015-08-13 09:55:28.16776+00	{"attachments": [], "search_description": "", "owner": 1, "latest_revision_created_at": null, "go_live_at": null, "title": "King's Digital Laboratory", "seo_title": "", "slug": "kings-digital-laboratory", "content": "<p>King's Digital Laboratory<br/></p>", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 34, "show_in_menus": true, "path": "000100010001", "url_path": "/home/kings-digital-laboratory/", "expired": false, "pk": 3, "locked": false, "depth": 3, "first_published_at": null, "expire_at": null}	\N	3	1
2	f	2015-08-13 09:56:29.608139+00	{"attachments": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-13T09:55:28.167Z", "go_live_at": null, "title": "Home", "seo_title": "", "slug": "home", "content": "<p>King's Digital Laboratory<br/></p>", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 34, "show_in_menus": true, "path": "000100010001", "url_path": "/home/kings-digital-laboratory/", "expired": false, "pk": 3, "locked": false, "depth": 3, "first_published_at": "2015-08-13T09:55:28.195Z", "expire_at": null}	\N	3	1
3	f	2015-08-13 09:57:27.711267+00	{"attachments": [], "search_description": "", "owner": 1, "latest_revision_created_at": "2015-08-13T09:56:29.608Z", "go_live_at": null, "title": "Home", "seo_title": "", "slug": "home", "content": "<p>King's Digital Laboratory...<br/></p>", "live": true, "has_unpublished_changes": false, "numchild": 0, "content_type": 34, "show_in_menus": true, "path": "000100010001", "url_path": "/home/home/", "expired": false, "pk": 3, "locked": false, "depth": 3, "first_published_at": "2015-08-13T09:55:28.195Z", "expire_at": null}	\N	3	1
4	f	2015-08-13 09:57:47.51015+00	{"locked": false, "title": "King's Digital Laboratory", "numchild": 1, "show_in_menus": false, "live": true, "seo_title": "", "search_description": "", "depth": 2, "latest_revision_created_at": null, "has_unpublished_changes": false, "content_type": 1, "path": "00010001", "owner": null, "pk": 2, "first_published_at": null, "url_path": "/home/", "expired": false, "slug": "home", "expire_at": null, "go_live_at": null}	\N	2	1
\.


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_pagerevision_id_seq', 4, true);


--
-- Data for Name: wagtailcore_pageviewrestriction; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_pageviewrestriction (id, password, page_id) FROM stdin;
\.


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_pageviewrestriction_id_seq', 1, false);


--
-- Data for Name: wagtailcore_site; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailcore_site (id, hostname, port, is_default_site, root_page_id) FROM stdin;
1	localhost	80	t	3
\.


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailcore_site_id_seq', 1, true);


--
-- Data for Name: wagtaildocs_document; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtaildocs_document (id, title, file, created_at, uploaded_by_user_id) FROM stdin;
\.


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtaildocs_document_id_seq', 1, false);


--
-- Data for Name: wagtailembeds_embed; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailembeds_embed (id, url, max_width, type, html, title, author_name, provider_name, thumbnail_url, width, height, last_updated) FROM stdin;
\.


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailembeds_embed_id_seq', 1, false);


--
-- Data for Name: wagtailimages_filter; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailimages_filter (id, spec) FROM stdin;
\.


--
-- Name: wagtailimages_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailimages_filter_id_seq', 1, false);


--
-- Data for Name: wagtailimages_image; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailimages_image (id, title, file, width, height, created_at, focal_point_x, focal_point_y, focal_point_width, focal_point_height, uploaded_by_user_id) FROM stdin;
\.


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailimages_image_id_seq', 1, false);


--
-- Data for Name: wagtailimages_rendition; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailimages_rendition (id, file, width, height, focal_point_key, filter_id, image_id) FROM stdin;
\.


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailimages_rendition_id_seq', 1, false);


--
-- Data for Name: wagtailredirects_redirect; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailredirects_redirect (id, old_path, is_permanent, redirect_link, redirect_page_id, site_id) FROM stdin;
\.


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailredirects_redirect_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_editorspick; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailsearch_editorspick (id, sort_order, description, page_id, query_id) FROM stdin;
\.


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailsearch_editorspick_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_query; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailsearch_query (id, query_string) FROM stdin;
\.


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailsearch_query_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_querydailyhits; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailsearch_querydailyhits (id, date, hits, query_id) FROM stdin;
\.


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailsearch_querydailyhits_id_seq', 1, false);


--
-- Data for Name: wagtailusers_userprofile; Type: TABLE DATA; Schema: public; Owner: -
--

COPY wagtailusers_userprofile (id, submitted_notifications, approved_notifications, rejected_notifications, user_id) FROM stdin;
\.


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('wagtailusers_userprofile_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: wagtailbase_baseindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_baseindexpage
    ADD CONSTRAINT wagtailbase_baseindexpage_pkey PRIMARY KEY (basepage_ptr_id);


--
-- Name: wagtailbase_basepage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_basepage
    ADD CONSTRAINT wagtailbase_basepage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: wagtailbase_baserichtextpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_baserichtextpage
    ADD CONSTRAINT wagtailbase_baserichtextpage_pkey PRIMARY KEY (basepage_ptr_id);


--
-- Name: wagtailbase_blogindexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_blogindexpage
    ADD CONSTRAINT wagtailbase_blogindexpage_pkey PRIMARY KEY (baseindexpage_ptr_id);


--
-- Name: wagtailbase_blogindexpageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_blogindexpageattachment
    ADD CONSTRAINT wagtailbase_blogindexpageattachment_pkey PRIMARY KEY (id);


--
-- Name: wagtailbase_blogindexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_blogindexpagerelatedlink
    ADD CONSTRAINT wagtailbase_blogindexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: wagtailbase_blogpost_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_blogpost
    ADD CONSTRAINT wagtailbase_blogpost_pkey PRIMARY KEY (baserichtextpage_ptr_id);


--
-- Name: wagtailbase_blogpostattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_blogpostattachment
    ADD CONSTRAINT wagtailbase_blogpostattachment_pkey PRIMARY KEY (id);


--
-- Name: wagtailbase_blogpostrelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_blogpostrelatedlink
    ADD CONSTRAINT wagtailbase_blogpostrelatedlink_pkey PRIMARY KEY (id);


--
-- Name: wagtailbase_blogposttag_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_blogposttag
    ADD CONSTRAINT wagtailbase_blogposttag_pkey PRIMARY KEY (id);


--
-- Name: wagtailbase_homepage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_homepage
    ADD CONSTRAINT wagtailbase_homepage_pkey PRIMARY KEY (baserichtextpage_ptr_id);


--
-- Name: wagtailbase_homepageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_homepageattachment
    ADD CONSTRAINT wagtailbase_homepageattachment_pkey PRIMARY KEY (id);


--
-- Name: wagtailbase_indexpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_indexpage
    ADD CONSTRAINT wagtailbase_indexpage_pkey PRIMARY KEY (baseindexpage_ptr_id);


--
-- Name: wagtailbase_indexpageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_indexpageattachment
    ADD CONSTRAINT wagtailbase_indexpageattachment_pkey PRIMARY KEY (id);


--
-- Name: wagtailbase_indexpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_indexpagerelatedlink
    ADD CONSTRAINT wagtailbase_indexpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: wagtailbase_richtextattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_richtextattachment
    ADD CONSTRAINT wagtailbase_richtextattachment_pkey PRIMARY KEY (id);


--
-- Name: wagtailbase_richtextpage_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_richtextpage
    ADD CONSTRAINT wagtailbase_richtextpage_pkey PRIMARY KEY (baserichtextpage_ptr_id);


--
-- Name: wagtailbase_richtextpagerelatedlink_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailbase_richtextpagerelatedlink
    ADD CONSTRAINT wagtailbase_richtextpagerelatedlink_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_grouppagepermission_group_id_16e761a1726500_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_group_id_16e761a1726500_uniq UNIQUE (group_id, page_id, permission_type);


--
-- Name: wagtailcore_grouppagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_page_path_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_path_key UNIQUE (path);


--
-- Name: wagtailcore_page_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pagerevision_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_site_hostname_29d2c7f94ac026_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_hostname_29d2c7f94ac026_uniq UNIQUE (hostname, port);


--
-- Name: wagtailcore_site_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_pkey PRIMARY KEY (id);


--
-- Name: wagtaildocs_document_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_url_37a13a49926a4846_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_url_37a13a49926a4846_uniq UNIQUE (url, max_width);


--
-- Name: wagtailimages_filter_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_filter
    ADD CONSTRAINT wagtailimages_filter_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_filter_spec_45e80ac840fed7f8_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_filter
    ADD CONSTRAINT wagtailimages_filter_spec_45e80ac840fed7f8_uniq UNIQUE (spec);


--
-- Name: wagtailimages_image_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_rendition_image_id_742f4fe4119535f1_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_image_id_742f4fe4119535f1_uniq UNIQUE (image_id, filter_id, focal_point_key);


--
-- Name: wagtailimages_rendition_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_pkey PRIMARY KEY (id);


--
-- Name: wagtailredirects_redirect_old_path_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_old_path_key UNIQUE (old_path);


--
-- Name: wagtailredirects_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_editorspick_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editorspick_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_query_string_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_query_string_key UNIQUE (query_string);


--
-- Name: wagtailsearch_querydailyhits_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_querydailyhits_query_id_4e12c633921cb0c9_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_query_id_4e12c633921cb0c9_uniq UNIQUE (query_id, date);


--
-- Name: wagtailusers_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_pkey PRIMARY KEY (id);


--
-- Name: wagtailusers_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: taggit_tag_name_4ed9aad194b72af1_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX taggit_tag_name_4ed9aad194b72af1_like ON taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_703438030cd922a7_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX taggit_tag_slug_703438030cd922a7_like ON taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX taggit_taggeditem_417f1b1c ON taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_76f094bc; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX taggit_taggeditem_76f094bc ON taggit_taggeditem USING btree (tag_id);


--
-- Name: taggit_taggeditem_af31437c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX taggit_taggeditem_af31437c ON taggit_taggeditem USING btree (object_id);


--
-- Name: wagtailbase_blogindexpageattachment_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_blogindexpageattachment_121087a8 ON wagtailbase_blogindexpageattachment USING btree (link_document_id);


--
-- Name: wagtailbase_blogindexpageattachment_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_blogindexpageattachment_1a63c800 ON wagtailbase_blogindexpageattachment USING btree (page_id);


--
-- Name: wagtailbase_blogindexpageattachment_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_blogindexpageattachment_5b76e141 ON wagtailbase_blogindexpageattachment USING btree (link_page_id);


--
-- Name: wagtailbase_blogindexpageattachment_f33175e6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_blogindexpageattachment_f33175e6 ON wagtailbase_blogindexpageattachment USING btree (image_id);


--
-- Name: wagtailbase_blogindexpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_blogindexpagerelatedlink_121087a8 ON wagtailbase_blogindexpagerelatedlink USING btree (link_document_id);


--
-- Name: wagtailbase_blogindexpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_blogindexpagerelatedlink_1a63c800 ON wagtailbase_blogindexpagerelatedlink USING btree (page_id);


--
-- Name: wagtailbase_blogindexpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_blogindexpagerelatedlink_5b76e141 ON wagtailbase_blogindexpagerelatedlink USING btree (link_page_id);


--
-- Name: wagtailbase_blogpostattachment_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_blogpostattachment_121087a8 ON wagtailbase_blogpostattachment USING btree (link_document_id);


--
-- Name: wagtailbase_blogpostattachment_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_blogpostattachment_1a63c800 ON wagtailbase_blogpostattachment USING btree (page_id);


--
-- Name: wagtailbase_blogpostattachment_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_blogpostattachment_5b76e141 ON wagtailbase_blogpostattachment USING btree (link_page_id);


--
-- Name: wagtailbase_blogpostattachment_f33175e6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_blogpostattachment_f33175e6 ON wagtailbase_blogpostattachment USING btree (image_id);


--
-- Name: wagtailbase_blogpostrelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_blogpostrelatedlink_121087a8 ON wagtailbase_blogpostrelatedlink USING btree (link_document_id);


--
-- Name: wagtailbase_blogpostrelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_blogpostrelatedlink_1a63c800 ON wagtailbase_blogpostrelatedlink USING btree (page_id);


--
-- Name: wagtailbase_blogpostrelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_blogpostrelatedlink_5b76e141 ON wagtailbase_blogpostrelatedlink USING btree (link_page_id);


--
-- Name: wagtailbase_blogposttag_09a80f33; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_blogposttag_09a80f33 ON wagtailbase_blogposttag USING btree (content_object_id);


--
-- Name: wagtailbase_blogposttag_76f094bc; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_blogposttag_76f094bc ON wagtailbase_blogposttag USING btree (tag_id);


--
-- Name: wagtailbase_homepageattachment_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_homepageattachment_121087a8 ON wagtailbase_homepageattachment USING btree (link_document_id);


--
-- Name: wagtailbase_homepageattachment_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_homepageattachment_1a63c800 ON wagtailbase_homepageattachment USING btree (page_id);


--
-- Name: wagtailbase_homepageattachment_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_homepageattachment_5b76e141 ON wagtailbase_homepageattachment USING btree (link_page_id);


--
-- Name: wagtailbase_homepageattachment_f33175e6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_homepageattachment_f33175e6 ON wagtailbase_homepageattachment USING btree (image_id);


--
-- Name: wagtailbase_indexpageattachment_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_indexpageattachment_121087a8 ON wagtailbase_indexpageattachment USING btree (link_document_id);


--
-- Name: wagtailbase_indexpageattachment_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_indexpageattachment_1a63c800 ON wagtailbase_indexpageattachment USING btree (page_id);


--
-- Name: wagtailbase_indexpageattachment_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_indexpageattachment_5b76e141 ON wagtailbase_indexpageattachment USING btree (link_page_id);


--
-- Name: wagtailbase_indexpageattachment_f33175e6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_indexpageattachment_f33175e6 ON wagtailbase_indexpageattachment USING btree (image_id);


--
-- Name: wagtailbase_indexpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_indexpagerelatedlink_121087a8 ON wagtailbase_indexpagerelatedlink USING btree (link_document_id);


--
-- Name: wagtailbase_indexpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_indexpagerelatedlink_1a63c800 ON wagtailbase_indexpagerelatedlink USING btree (page_id);


--
-- Name: wagtailbase_indexpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_indexpagerelatedlink_5b76e141 ON wagtailbase_indexpagerelatedlink USING btree (link_page_id);


--
-- Name: wagtailbase_richtextattachment_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_richtextattachment_121087a8 ON wagtailbase_richtextattachment USING btree (link_document_id);


--
-- Name: wagtailbase_richtextattachment_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_richtextattachment_1a63c800 ON wagtailbase_richtextattachment USING btree (page_id);


--
-- Name: wagtailbase_richtextattachment_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_richtextattachment_5b76e141 ON wagtailbase_richtextattachment USING btree (link_page_id);


--
-- Name: wagtailbase_richtextattachment_f33175e6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_richtextattachment_f33175e6 ON wagtailbase_richtextattachment USING btree (image_id);


--
-- Name: wagtailbase_richtextpagerelatedlink_121087a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_richtextpagerelatedlink_121087a8 ON wagtailbase_richtextpagerelatedlink USING btree (link_document_id);


--
-- Name: wagtailbase_richtextpagerelatedlink_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_richtextpagerelatedlink_1a63c800 ON wagtailbase_richtextpagerelatedlink USING btree (page_id);


--
-- Name: wagtailbase_richtextpagerelatedlink_5b76e141; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailbase_richtextpagerelatedlink_5b76e141 ON wagtailbase_richtextpagerelatedlink USING btree (link_page_id);


--
-- Name: wagtailcore_grouppagepermission_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_grouppagepermission_0e939a4f ON wagtailcore_grouppagepermission USING btree (group_id);


--
-- Name: wagtailcore_grouppagepermission_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_grouppagepermission_1a63c800 ON wagtailcore_grouppagepermission USING btree (page_id);


--
-- Name: wagtailcore_page_2dbcba41; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_page_2dbcba41 ON wagtailcore_page USING btree (slug);


--
-- Name: wagtailcore_page_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_page_417f1b1c ON wagtailcore_page USING btree (content_type_id);


--
-- Name: wagtailcore_page_5e7b1936; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_page_5e7b1936 ON wagtailcore_page USING btree (owner_id);


--
-- Name: wagtailcore_page_path_adbf7302a1ab75e_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_page_path_adbf7302a1ab75e_like ON wagtailcore_page USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_page_slug_de66a236c47d916_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_page_slug_de66a236c47d916_like ON wagtailcore_page USING btree (slug varchar_pattern_ops);


--
-- Name: wagtailcore_pagerevision_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_1a63c800 ON wagtailcore_pagerevision USING btree (page_id);


--
-- Name: wagtailcore_pagerevision_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_pagerevision_e8701ad4 ON wagtailcore_pagerevision USING btree (user_id);


--
-- Name: wagtailcore_pageviewrestriction_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_pageviewrestriction_1a63c800 ON wagtailcore_pageviewrestriction USING btree (page_id);


--
-- Name: wagtailcore_site_0897acf4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_site_0897acf4 ON wagtailcore_site USING btree (hostname);


--
-- Name: wagtailcore_site_8372b497; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_site_8372b497 ON wagtailcore_site USING btree (root_page_id);


--
-- Name: wagtailcore_site_hostname_3649a8ca5c8e8730_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailcore_site_hostname_3649a8ca5c8e8730_like ON wagtailcore_site USING btree (hostname varchar_pattern_ops);


--
-- Name: wagtaildocs_document_ef01e2b6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtaildocs_document_ef01e2b6 ON wagtaildocs_document USING btree (uploaded_by_user_id);


--
-- Name: wagtailimages_filter_b979c293; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailimages_filter_b979c293 ON wagtailimages_filter USING btree (spec);


--
-- Name: wagtailimages_filter_spec_45e80ac840fed7f8_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailimages_filter_spec_45e80ac840fed7f8_like ON wagtailimages_filter USING btree (spec varchar_pattern_ops);


--
-- Name: wagtailimages_image_ef01e2b6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailimages_image_ef01e2b6 ON wagtailimages_image USING btree (uploaded_by_user_id);


--
-- Name: wagtailimages_rendition_0a317463; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailimages_rendition_0a317463 ON wagtailimages_rendition USING btree (filter_id);


--
-- Name: wagtailimages_rendition_f33175e6; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailimages_rendition_f33175e6 ON wagtailimages_rendition USING btree (image_id);


--
-- Name: wagtailredirects_redirect_2fd79f37; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_2fd79f37 ON wagtailredirects_redirect USING btree (redirect_page_id);


--
-- Name: wagtailredirects_redirect_9365d6e7; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_9365d6e7 ON wagtailredirects_redirect USING btree (site_id);


--
-- Name: wagtailredirects_redirect_old_path_579ecadc1434daf4_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailredirects_redirect_old_path_579ecadc1434daf4_like ON wagtailredirects_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: wagtailsearch_editorspick_0bbeda9c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailsearch_editorspick_0bbeda9c ON wagtailsearch_editorspick USING btree (query_id);


--
-- Name: wagtailsearch_editorspick_1a63c800; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailsearch_editorspick_1a63c800 ON wagtailsearch_editorspick USING btree (page_id);


--
-- Name: wagtailsearch_query_query_string_a78010a1796bb04_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailsearch_query_query_string_a78010a1796bb04_like ON wagtailsearch_query USING btree (query_string varchar_pattern_ops);


--
-- Name: wagtailsearch_querydailyhits_0bbeda9c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX wagtailsearch_querydailyhits_0bbeda9c ON wagtailsearch_querydailyhits USING btree (query_id);


--
-- Name: D0fdd806b892f2279512638e282734e4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_homepageattachment
    ADD CONSTRAINT "D0fdd806b892f2279512638e282734e4" FOREIGN KEY (page_id) REFERENCES wagtailbase_homepage(baserichtextpage_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D21519ae6604802e5d7abf7181638384; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_homepage
    ADD CONSTRAINT "D21519ae6604802e5d7abf7181638384" FOREIGN KEY (baserichtextpage_ptr_id) REFERENCES wagtailbase_baserichtextpage(basepage_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D3f36fa2492ebcb69814f541c25d3e08; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogindexpagerelatedlink
    ADD CONSTRAINT "D3f36fa2492ebcb69814f541c25d3e08" FOREIGN KEY (page_id) REFERENCES wagtailbase_blogindexpage(baseindexpage_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D4180bd5007f36ef1da70100a4f1b799; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_richtextattachment
    ADD CONSTRAINT "D4180bd5007f36ef1da70100a4f1b799" FOREIGN KEY (page_id) REFERENCES wagtailbase_richtextpage(baserichtextpage_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D49d9c4968a158eed1aaa5eab0fbfa2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogpostattachment
    ADD CONSTRAINT "D49d9c4968a158eed1aaa5eab0fbfa2c" FOREIGN KEY (page_id) REFERENCES wagtailbase_blogpost(baserichtextpage_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D65e6f9a167c1521c5b1de367506613c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_indexpage
    ADD CONSTRAINT "D65e6f9a167c1521c5b1de367506613c" FOREIGN KEY (baseindexpage_ptr_id) REFERENCES wagtailbase_baseindexpage(basepage_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D734d7d5113fcbbdf27a0bc51a8a47ed; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogpostrelatedlink
    ADD CONSTRAINT "D734d7d5113fcbbdf27a0bc51a8a47ed" FOREIGN KEY (page_id) REFERENCES wagtailbase_blogpost(baserichtextpage_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D74af88cb429a264c2b060630611b290; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogposttag
    ADD CONSTRAINT "D74af88cb429a264c2b060630611b290" FOREIGN KEY (content_object_id) REFERENCES wagtailbase_blogpost(baserichtextpage_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D82912f1cd76c4927a38b5cc24619bc5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_baseindexpage
    ADD CONSTRAINT "D82912f1cd76c4927a38b5cc24619bc5" FOREIGN KEY (basepage_ptr_id) REFERENCES wagtailbase_basepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D8797f92d9bc0b22c97e50fafe91aaf0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_baserichtextpage
    ADD CONSTRAINT "D8797f92d9bc0b22c97e50fafe91aaf0" FOREIGN KEY (basepage_ptr_id) REFERENCES wagtailbase_basepage(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D8e3fff2ab2e9dbdfefd6e01aa65ade4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_indexpageattachment
    ADD CONSTRAINT "D8e3fff2ab2e9dbdfefd6e01aa65ade4" FOREIGN KEY (page_id) REFERENCES wagtailbase_indexpage(baseindexpage_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: a674812221bc7461c2c723e2ac0cae83; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_richtextpagerelatedlink
    ADD CONSTRAINT a674812221bc7461c2c723e2ac0cae83 FOREIGN KEY (page_id) REFERENCES wagtailbase_richtextpage(baserichtextpage_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: a8b0b69cc08a1f74d6cd8094d2190e11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_indexpagerelatedlink
    ADD CONSTRAINT a8b0b69cc08a1f74d6cd8094d2190e11 FOREIGN KEY (page_id) REFERENCES wagtailbase_indexpage(baseindexpage_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: b0c95762c9488043718dca457a058ccd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_richtextpage
    ADD CONSTRAINT b0c95762c9488043718dca457a058ccd FOREIGN KEY (baserichtextpage_ptr_id) REFERENCES wagtailbase_baserichtextpage(basepage_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cd8fb7d80f6844f5cbf724b5bbe07a40; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogpost
    ADD CONSTRAINT cd8fb7d80f6844f5cbf724b5bbe07a40 FOREIGN KEY (baserichtextpage_ptr_id) REFERENCES wagtailbase_baserichtextpage(basepage_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: e332e7e4a6f853f93d26cb5db67c67c1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogindexpage
    ADD CONSTRAINT e332e7e4a6f853f93d26cb5db67c67c1 FOREIGN KEY (baseindexpage_ptr_id) REFERENCES wagtailbase_baseindexpage(basepage_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ecee366c3a391e214f29f47946fc7877; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogindexpageattachment
    ADD CONSTRAINT ecee366c3a391e214f29f47946fc7877 FOREIGN KEY (page_id) REFERENCES wagtailbase_blogindexpage(baseindexpage_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tagg_content_type_id_62e0524705c3ec8f_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT tagg_content_type_id_62e0524705c3ec8f_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_tag_id_6318217c0d95e0d2_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_6318217c0d95e0d2_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wa_link_document_id_110d6c247bf88233_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogindexpageattachment
    ADD CONSTRAINT wa_link_document_id_110d6c247bf88233_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wa_link_document_id_3b206d6a8aa1731f_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_indexpageattachment
    ADD CONSTRAINT wa_link_document_id_3b206d6a8aa1731f_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wa_link_document_id_4d42b2c24212bb1c_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_richtextattachment
    ADD CONSTRAINT wa_link_document_id_4d42b2c24212bb1c_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wa_link_document_id_57eb1c241eb1e6e0_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_indexpagerelatedlink
    ADD CONSTRAINT wa_link_document_id_57eb1c241eb1e6e0_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wa_link_document_id_5d0e3e686eb3217d_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogpostattachment
    ADD CONSTRAINT wa_link_document_id_5d0e3e686eb3217d_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wa_link_document_id_6674e1b8a4d30a14_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogpostrelatedlink
    ADD CONSTRAINT wa_link_document_id_6674e1b8a4d30a14_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wag_link_document_id_573909008a6e3b0_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_richtextpagerelatedlink
    ADD CONSTRAINT wag_link_document_id_573909008a6e3b0_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wag_link_document_id_afe36b938390ab1_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_homepageattachment
    ADD CONSTRAINT wag_link_document_id_afe36b938390ab1_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wag_link_document_id_b21e5ba5ee1cbec_fk_wagtaildocs_document_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogindexpagerelatedlink
    ADD CONSTRAINT wag_link_document_id_b21e5ba5ee1cbec_fk_wagtaildocs_document_id FOREIGN KEY (link_document_id) REFERENCES wagtaildocs_document(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagt_content_type_id_7ae0ebb2acb1454e_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagt_content_type_id_7ae0ebb2acb1454e_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtai_redirect_page_id_4fb5deae195b3223_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtai_redirect_page_id_4fb5deae195b3223_fk_wagtailcore_page_id FOREIGN KEY (redirect_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailbas_link_page_id_10d2528ebe1d3ffa_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogpostrelatedlink
    ADD CONSTRAINT wagtailbas_link_page_id_10d2528ebe1d3ffa_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailbas_link_page_id_19b1ea3e41e7c097_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_homepageattachment
    ADD CONSTRAINT wagtailbas_link_page_id_19b1ea3e41e7c097_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailbas_link_page_id_4b295858832b3573_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogindexpageattachment
    ADD CONSTRAINT wagtailbas_link_page_id_4b295858832b3573_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailbas_link_page_id_58377baa0591d52e_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogindexpagerelatedlink
    ADD CONSTRAINT wagtailbas_link_page_id_58377baa0591d52e_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailbas_link_page_id_61aef608191e65fe_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_richtextattachment
    ADD CONSTRAINT wagtailbas_link_page_id_61aef608191e65fe_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailbas_link_page_id_67818b53df5a4ec7_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_indexpageattachment
    ADD CONSTRAINT wagtailbas_link_page_id_67818b53df5a4ec7_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailbas_link_page_id_7261085177ce81aa_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_richtextpagerelatedlink
    ADD CONSTRAINT wagtailbas_link_page_id_7261085177ce81aa_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailbase_blogpostta_tag_id_57008cfdf2672c23_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogposttag
    ADD CONSTRAINT wagtailbase_blogpostta_tag_id_57008cfdf2672c23_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailbase_image_id_26221a81875ab8e8_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_homepageattachment
    ADD CONSTRAINT wagtailbase_image_id_26221a81875ab8e8_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailbase_image_id_34402f9efa098b82_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogindexpageattachment
    ADD CONSTRAINT wagtailbase_image_id_34402f9efa098b82_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailbase_image_id_3c7c06957e576096_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_indexpageattachment
    ADD CONSTRAINT wagtailbase_image_id_3c7c06957e576096_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailbase_image_id_483083ba8bcb9cd2_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogpostattachment
    ADD CONSTRAINT wagtailbase_image_id_483083ba8bcb9cd2_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailbase_image_id_72c7e619e9acd90d_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_richtextattachment
    ADD CONSTRAINT wagtailbase_image_id_72c7e619e9acd90d_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailbase_link_page_id_d6176ae2103e33a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_indexpagerelatedlink
    ADD CONSTRAINT wagtailbase_link_page_id_d6176ae2103e33a_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailbase_link_page_id_e6f529d91fab023_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_blogpostattachment
    ADD CONSTRAINT wagtailbase_link_page_id_e6f529d91fab023_fk_wagtailcore_page_id FOREIGN KEY (link_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailbase_page_ptr_id_376b9a8ee4e5e7b9_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailbase_basepage
    ADD CONSTRAINT wagtailbase_page_ptr_id_376b9a8ee4e5e7b9_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcor_root_page_id_5c8b4b84e03f7f29_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_site
    ADD CONSTRAINT wagtailcor_root_page_id_5c8b4b84e03f7f29_fk_wagtailcore_page_id FOREIGN KEY (root_page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_gro_page_id_70d2788c0579bb7c_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_gro_page_id_70d2788c0579bb7c_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppage_group_id_2df9571b92fb26d_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppage_group_id_2df9571b92fb26d_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pag_page_id_1d5ab1303676feba_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pag_page_id_1d5ab1303676feba_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pag_page_id_318895e696da7fed_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pag_page_id_318895e696da7fed_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page_owner_id_7a2f24f1767b30bc_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_owner_id_7a2f24f1767b30bc_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevisi_user_id_3a9a8cf31a218402_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevisi_user_id_3a9a8cf31a218402_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildoc_uploaded_by_user_id_62c5d96169f4ec20_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtaildocs_document
    ADD CONSTRAINT wagtaildoc_uploaded_by_user_id_62c5d96169f4ec20_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailima_filter_id_b5a94d704fa1f7f_fk_wagtailimages_filter_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailima_filter_id_b5a94d704fa1f7f_fk_wagtailimages_filter_id FOREIGN KEY (filter_id) REFERENCES wagtailimages_filter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailima_uploaded_by_user_id_4941ddafe7e6985a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_image
    ADD CONSTRAINT wagtailima_uploaded_by_user_id_4941ddafe7e6985a_fk_auth_user_id FOREIGN KEY (uploaded_by_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimag_image_id_4b83f0a74ebd24db_fk_wagtailimages_image_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailimages_rendition
    ADD CONSTRAINT wagtailimag_image_id_4b83f0a74ebd24db_fk_wagtailimages_image_id FOREIGN KEY (image_id) REFERENCES wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirect_site_id_72075f3bbfcf92e7_fk_wagtailcore_site_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirect_site_id_72075f3bbfcf92e7_fk_wagtailcore_site_id FOREIGN KEY (site_id) REFERENCES wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsear_query_id_355494074ca8351a_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsear_query_id_355494074ca8351a_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsear_query_id_74051b390c9e69bd_fk_wagtailsearch_query_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsear_query_id_74051b390c9e69bd_fk_wagtailsearch_query_id FOREIGN KEY (query_id) REFERENCES wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_e_page_id_3cd69b3b50c44c9b_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_e_page_id_3cd69b3b50c44c9b_fk_wagtailcore_page_id FOREIGN KEY (page_id) REFERENCES wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailusers_userprofi_user_id_755efda9998dba71_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofi_user_id_755efda9998dba71_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

