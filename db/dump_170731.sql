--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: Sek
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO "Sek";

--
-- Name: documents; Type: TABLE; Schema: public; Owner: Sek
--

CREATE TABLE documents (
    id integer NOT NULL,
    title character varying,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer
);


ALTER TABLE documents OWNER TO "Sek";

--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: Sek
--

CREATE SEQUENCE documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE documents_id_seq OWNER TO "Sek";

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Sek
--

ALTER SEQUENCE documents_id_seq OWNED BY documents.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Sek
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "Sek";

--
-- Name: users; Type: TABLE; Schema: public; Owner: Sek
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE users OWNER TO "Sek";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Sek
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "Sek";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Sek
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: Sek
--

ALTER TABLE ONLY documents ALTER COLUMN id SET DEFAULT nextval('documents_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: Sek
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: Sek
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-05-19 16:30:45.174873	2017-05-19 16:30:45.174873
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: Sek
--

COPY documents (id, title, content, created_at, updated_at, user_id) FROM stdin;
3	Cupcake biscuit chocolate bar cotton	Jelly-o tiramisu pudding pudding sweet roll cookie cupcake sweet roll sesame snaps. Jelly beans powder biscuit croissant cake ice cream gummies. Ice cream chocolate cake tart. Jelly beans gummi bears jujubes candy. Tart jelly-o jelly donut. Cookie bonbon caramels biscuit lollipop candy sweet muffin cake. Cake wafer marshmallow sweet roll cake biscuit brownie. Chupa chups gummies biscuit bear claw candy danish cookie marshmallow. Topping tiramisu fruitcake tart gummies sesame snaps chocolate caramels. Lemon drops wafer chocolate gingerbread toffee chocolate bar. Sweet roll halvah pudding sweet marzipan. Pastry bonbon cookie lemon drops wafer sesame snaps wafer. Jelly halvah cake jelly-o jelly beans liquorice cheesecake caramels toffee. Ice cream candy canes sweet roll.\r\n\r\nSesame snaps tart pie pie bonbon croissant topping. Toffee jelly caramels tart jujubes dessert apple pie marshmallow. Donut jelly beans fruitcake macaroon caramels cotton candy donut muffin pastry. Muffin soufflé carrot cake chupa chups. Jujubes chocolate cake donut pastry chocolate bar pudding. Tootsie roll cheesecake wafer sweet roll cheesecake fruitcake tiramisu cotton candy. Cupcake chocolate cake dessert. Candy topping cake cake bonbon. Chocolate gummi bears soufflé cheesecake jelly beans cake caramels. Jelly beans dessert toffee icing caramels candy bonbon. Bear claw jelly pastry dessert wafer. Carrot cake sweet roll tootsie roll chocolate bar tiramisu cotton candy muffin. Bear claw chocolate candy donut. Gummies muffin chocolate bar chupa chups fruitcake pastry.\r\n\r\nCotton candy marzipan carrot cake cake muffin. Pudding wafer cake icing gummi bears cake dragée sugar plum. Bonbon jelly ice cream chocolate bar tiramisu marshmallow. Cotton candy pudding apple pie pie. Oat cake candy canes danish cookie gummi bears sweet bear claw candy. Bear claw powder gummi bears. Cotton candy carrot cake marshmallow. Biscuit lemon drops candy chocolate wafer cotton candy chocolate bar pastry halvah. Icing toffee jujubes tootsie roll bear claw lemon drops. Halvah chupa chups apple pie. Cupcake biscuit chocolate bar cotton candy wafer. Candy canes gummies bonbon.	2017-05-20 13:38:44.274266	2017-05-31 09:38:57.575523	1
5	Let's start something beautiful	Bacon ipsum dolor amet frankfurter pancetta pork chop, spare ribs ribeye ground round short ribs shank jerky kevin drumstick ball tip. Pancetta porchetta salami biltong cow. Pastrami pig alcatra pork, chuck picanha pancetta bacon tri-tip. Tenderloin hamburger bacon, tail shoulder venison ham alcatra short ribs shank.\r\n\r\nT-bone jowl flank rump, chuck shankle pancetta cupim hamburger biltong. Ham hock hamburger ribeye biltong, landjaeger spare ribs strip steak. Beef pancetta porchetta, ball tip cupim tail corned beef. Kevin venison cupim pork loin. Beef bacon salami venison rump short ribs cow pork chop chuck jowl swine. Kevin filet mignon prosciutto porchetta, kielbasa frankfurter picanha. Ground round landjaeger ham hock brisket kielbasa.\r\n\r\nChicken kielbasa kevin short ribs, bacon flank prosciutto capicola bresaola fatback pig shank. Tri-tip swine pork belly bresaola corned beef frankfurter shank, alcatra pancetta burgdoggen. Short loin tri-tip capicola brisket, strip steak andouille pancetta. Pork brisket kevin corned beef short ribs turducken chuck landjaeger shank. Swine alcatra hamburger, turducken ham short ribs leberkas ground round cupim rump.\r\n\r\nShankle beef t-bone swine shank strip steak rump cupim burgdoggen sirloin pork ham hock tri-tip. Ham pig pork chop tongue cow ribeye. Ground round turkey tail kielbasa picanha porchetta meatloaf jerky short ribs flank andouille chuck pig. Rump landjaeger chicken, cow chuck tongue beef ribs shankle strip steak short loin capicola. Chuck spare ribs tongue, strip steak drumstick pork loin short ribs. Strip steak alcatra landjaeger pork belly brisket filet mignon rump andouille t-bone porchetta jerky tri-tip pork.	2017-05-29 08:38:06.987923	2017-05-29 08:38:06.987923	1
4	I'm in love with Rails	Yes, I really love this framework!!! It's absolutely fantastic! <3\r\n\r\nSpicy jalapeno bacon ipsum dolor amet beef swine ball tip, salami ham hock fatback tri-tip t-bone meatloaf shankle landjaeger prosciutto ribeye chuck. Pastrami short loin rump burgdoggen prosciutto shoulder doner, cupim porchetta strip steak chicken shank hamburger. Pig porchetta shoulder venison, ham pork chop turkey. Doner ribeye venison, jerky spare ribs brisket pork chop porchetta rump tri-tip fatback short ribs.\r\n\r\n<h2>Tasty bacon</h2>\r\n\r\nLandjaeger rump biltong alcatra turducken drumstick pork loin. Turducken frankfurter pig picanha, burgdoggen turkey boudin prosciutto ham pork chop. Pastrami fatback beef rump pork belly. Pork chop shankle jowl meatball ground round picanha ham short loin salami. Pork chop chuck capicola jowl, spare ribs alcatra jerky sausage landjaeger pig beef.	2017-05-20 15:53:30.567852	2017-05-29 09:57:26.158781	1
13	Hello from the other side	Bacon ipsum dolor amet t-bone brisket swine flank. Short loin corned beef t-bone, salami ham hock chicken pork belly beef ribs shoulder beef picanha. Ham hock venison strip steak tenderloin porchetta sirloin beef ribs rump. Turducken swine chuck, pig shankle pork loin sirloin ground round tongue ham hock pork.\r\n\r\nBresaola shank meatball biltong cow landjaeger, turkey strip steak ball tip tenderloin ribeye meatloaf pork belly. Tail jerky pork belly strip steak prosciutto pork chop filet mignon fatback ball tip. Bresaola tenderloin venison salami. Drumstick pork belly tenderloin boudin swine sausage salami pig beef ribs capicola. Beef ribs meatloaf pastrami andouille, landjaeger jowl bresaola porchetta.\r\n\r\nGround round ham hock meatloaf shankle meatball ball tip ribeye pig tail fatback cow ham boudin. Hamburger ham hock picanha boudin, pastrami shank brisket filet mignon t-bone rump biltong pancetta sausage. Tenderloin ribeye hamburger chuck. Pastrami leberkas ham, jowl prosciutto fatback short loin landjaeger burgdoggen.\r\n\r\nHam hock porchetta hamburger shankle tail strip steak ball tip swine pork jerky spare ribs corned beef pancetta short ribs. Ground round burgdoggen boudin corned beef ham hock, chuck doner pastrami rump flank capicola meatloaf. Fatback bacon pig kevin tail bresaola hamburger meatloaf shankle pancetta sirloin corned beef t-bone drumstick jerky. Boudin flank biltong capicola ground round short ribs pig filet mignon chuck picanha pastrami.\r\n\r\nHamburger fatback rump corned beef. Cupim kielbasa flank pancetta jowl tail ground round turkey kevin pig ball tip. Pork loin alcatra ball tip rump spare ribs tongue sirloin andouille meatball kielbasa chicken chuck kevin fatback. Meatball boudin sirloin tri-tip kevin bresaola tongue.	2017-05-30 16:03:00.109213	2017-05-30 16:03:00.109213	1
14	TI AMO	Sei il mio amori-developer! Full-stack lover!!!	2017-05-30 19:12:02.65508	2017-05-30 19:12:02.65508	3
\.


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Sek
--

SELECT pg_catalog.setval('documents_id_seq', 17, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Sek
--

COPY schema_migrations (version) FROM stdin;
20170519162957
20170520105918
20170520110931
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Sek
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
1	francescojjmari@gmail.com	$2a$11$kbvLULgTefA/d91psYAAKeOtVieI08NxPosWB3uZz9caKTF4ed6NC	f5630941daf5ca7b574984cdecf808cb003fb7c8fd30527fb7af995117557e26	2017-05-30 18:35:29.976166	2017-05-31 10:20:42.98998	92	2017-05-31 10:22:11.797115	2017-05-31 10:20:42.994044	127.0.0.1	127.0.0.1	2017-05-20 11:19:55.128037	2017-05-31 10:22:11.799033
2	francesco.jjmari@gmail.com	$2a$11$SMMG2t.MTsKMjYsK7bAODugwt.mCgiV6qEj30b.0wCMJRC64MOzkS	\N	\N	\N	1	2017-05-29 12:54:14.855445	2017-05-29 12:54:14.855445	127.0.0.1	127.0.0.1	2017-05-29 12:54:14.850497	2017-05-29 12:54:14.856209
3	chiarasag@gmail.com	$2a$11$M1XU0b/C/z/a.qD94SsxleEOstKu14qdpld2lD481QYWcrtHp.V6m	\N	\N	\N	1	2017-05-30 19:11:27.772418	2017-05-30 19:11:27.772418	5.90.157.96	5.90.157.96	2017-05-30 19:11:27.763118	2017-05-30 19:11:27.77361
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Sek
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: Sek
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: Sek
--

ALTER TABLE ONLY documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: Sek
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: Sek
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: Sek
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: Sek
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- PostgreSQL database dump complete
--

