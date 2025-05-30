PGDMP                      }            Library    17.4    17.4 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16387    Library    DATABASE     o   CREATE DATABASE "Library" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru-RU';
    DROP DATABASE "Library";
                     postgres    false                        2615    24576    Library    SCHEMA        CREATE SCHEMA "Library";
    DROP SCHEMA "Library";
                     postgres    false            �            1259    24676    Acceptance_certificate    TABLE     �   CREATE TABLE "Library"."Acceptance_certificate" (
    acceptance_certificate_id integer NOT NULL,
    admission_date date NOT NULL,
    copy_id integer NOT NULL
);
 /   DROP TABLE "Library"."Acceptance_certificate";
       Library         heap r       postgres    false    6            �            1259    24703 4   Acceptance_certificate_acceptance_certificate_id_seq    SEQUENCE       ALTER TABLE "Library"."Acceptance_certificate" ALTER COLUMN acceptance_certificate_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Library"."Acceptance_certificate_acceptance_certificate_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Library               postgres    false    6    230            �            1259    24671 "   Act_of_acceptance_in_place_of_lost    TABLE     �   CREATE TABLE "Library"."Act_of_acceptance_in_place_of_lost" (
    act_acceptance_in_place_lost_id integer NOT NULL,
    admission_date date NOT NULL,
    lost_copy_id integer NOT NULL,
    new_copy_id integer NOT NULL
);
 ;   DROP TABLE "Library"."Act_of_acceptance_in_place_of_lost";
       Library         heap r       postgres    false    6            �            1259    24704 ?   Act_of_acceptance_in_place_of_act_acceptance_in_place_lost__seq    SEQUENCE     <  ALTER TABLE "Library"."Act_of_acceptance_in_place_of_lost" ALTER COLUMN act_acceptance_in_place_lost_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Library"."Act_of_acceptance_in_place_of_act_acceptance_in_place_lost__seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Library               postgres    false    229    6            �            1259    24686    Appendix_to_writeoff_act    TABLE     i  CREATE TABLE "Library"."Appendix_to_writeoff_act" (
    appendix_to_writeoff_act_id integer NOT NULL,
    registration_number integer NOT NULL,
    storage_cipher character varying(50) NOT NULL,
    short_description character varying(1000),
    revaluation_coefficient numeric NOT NULL,
    total_cost integer NOT NULL,
    writeoff_act_id integer NOT NULL
);
 1   DROP TABLE "Library"."Appendix_to_writeoff_act";
       Library         heap r       postgres    false    6            �            1259    24705 8   Appendix_to_writeoff_act_appendix_to_writeoff_act_id_seq    SEQUENCE     '  ALTER TABLE "Library"."Appendix_to_writeoff_act" ALTER COLUMN appendix_to_writeoff_act_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Library"."Appendix_to_writeoff_act_appendix_to_writeoff_act_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Library               postgres    false    6    232            �            1259    24577    Book    TABLE     j  CREATE TABLE "Library"."Book" (
    book_id integer NOT NULL,
    author character varying(150) NOT NULL,
    name character varying(150) NOT NULL,
    volume_number integer DEFAULT 1,
    compiled_by character varying(200) NOT NULL,
    original_language character varying(50) NOT NULL,
    translator character varying(200),
    year_of_issue date NOT NULL
);
    DROP TABLE "Library"."Book";
       Library         heap r       postgres    false    6            �            1259    24706    Book_book_id_seq    SEQUENCE     �   ALTER TABLE "Library"."Book" ALTER COLUMN book_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Library"."Book_book_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Library               postgres    false    6    218            �            1259    24621 	   Copy_book    TABLE     �  CREATE TABLE "Library"."Copy_book" (
    copy_id integer NOT NULL,
    library_cipher character varying(100) NOT NULL,
    type_publication character varying(150) NOT NULL,
    price integer NOT NULL,
    publishing_house character varying(150) NOT NULL,
    inventory_number integer NOT NULL,
    book_id integer NOT NULL,
    rack_id integer,
    year_publication integer NOT NULL
);
 "   DROP TABLE "Library"."Copy_book";
       Library         heap r       postgres    false    6            �            1259    24707    Copy_book_copy_id_seq    SEQUENCE     �   ALTER TABLE "Library"."Copy_book" ALTER COLUMN copy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Library"."Copy_book_copy_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Library               postgres    false    219    6            �            1259    24693    Document    TABLE     '  CREATE TABLE "Library"."Document" (
    document_id integer NOT NULL,
    packing_list_id integer,
    writeoff_act_id integer,
    acceptance_certificate_id integer,
    act_acceptance_in_place_lost_id integer,
    document_type character varying(150) NOT NULL,
    date_added date NOT NULL
);
 !   DROP TABLE "Library"."Document";
       Library         heap r       postgres    false    6            �            1259    24708    Document_document_id_seq    SEQUENCE     �   ALTER TABLE "Library"."Document" ALTER COLUMN document_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Library"."Document_document_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Library               postgres    false    233    6            �            1259    24651    Employee    TABLE     h   CREATE TABLE "Library"."Employee" (
    employee_id integer NOT NULL,
    people_id integer NOT NULL
);
 !   DROP TABLE "Library"."Employee";
       Library         heap r       postgres    false    6            �            1259    24709    Employee_employee_id_seq    SEQUENCE     �   ALTER TABLE "Library"."Employee" ALTER COLUMN employee_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Library"."Employee_employee_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Library               postgres    false    225    6            �            1259    24636    People    TABLE     z  CREATE TABLE "Library"."People" (
    people_id integer NOT NULL,
    name character varying(50) NOT NULL,
    surname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    address character varying(50) NOT NULL,
    phone_number character varying(50) NOT NULL,
    role character varying(50) NOT NULL,
    education character varying(75) NOT NULL
);
    DROP TABLE "Library"."People";
       Library         heap r       postgres    false    6            �            1259    24646    Reader    TABLE     n   CREATE TABLE "Library"."Reader" (
    library_card_number integer NOT NULL,
    people_id integer NOT NULL
);
    DROP TABLE "Library"."Reader";
       Library         heap r       postgres    false    6            �            1259    24631    Reading    TABLE       CREATE TABLE "Library"."Reading" (
    reading_id integer NOT NULL,
    receipt_date date NOT NULL,
    copy_id integer NOT NULL,
    library_card_number integer NOT NULL,
    returned boolean DEFAULT false NOT NULL,
    returned_on_time boolean DEFAULT false NOT NULL
);
     DROP TABLE "Library"."Reading";
       Library         heap r       postgres    false    6            �            1259    49183    Information about debtors    VIEW     �  CREATE VIEW "Library"."Information about debtors" AS
 SELECT DISTINCT p.name,
    p.surname,
    p.lastname,
    p.address,
    p.phone_number,
    p.education
   FROM (("Library"."Reading" r
     LEFT JOIN "Library"."Reader" rr ON ((r.library_card_number = rr.library_card_number)))
     LEFT JOIN "Library"."People" p ON ((rr.people_id = p.people_id)))
  WHERE (r.returned = false);
 1   DROP VIEW "Library"."Information about debtors";
       Library       v       postgres    false    222    221    221    222    222    222    222    222    222    224    224    6            �            1259    24659    Job_history    TABLE     �   CREATE TABLE "Library"."Job_history" (
    id integer NOT NULL,
    date_leaving_office date,
    date_taking_office date NOT NULL,
    number_rates integer NOT NULL,
    job_title_id integer NOT NULL,
    employee_id integer NOT NULL
);
 $   DROP TABLE "Library"."Job_history";
       Library         heap r       postgres    false    6            �            1259    24710    Job_history_id_seq    SEQUENCE     �   ALTER TABLE "Library"."Job_history" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Library"."Job_history_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Library               postgres    false    6    227            �            1259    24656 	   Job_title    TABLE     �   CREATE TABLE "Library"."Job_title" (
    job_title_id integer NOT NULL,
    name character varying(150) NOT NULL,
    rate_value integer NOT NULL
);
 "   DROP TABLE "Library"."Job_title";
       Library         heap r       postgres    false    6            �            1259    24711    Job_title_job_title_id_seq    SEQUENCE     �   ALTER TABLE "Library"."Job_title" ALTER COLUMN job_title_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Library"."Job_title_job_title_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Library               postgres    false    6    226            �            1259    49178    Most popular books    VIEW     �  CREATE VIEW "Library"."Most popular books" AS
 WITH book_count AS (
         SELECT "Copy_book".book_id,
            count(*) AS count_on_library
           FROM "Library"."Copy_book"
          WHERE ("Copy_book".rack_id IS NOT NULL)
          GROUP BY "Copy_book".book_id
        ), on_hands_book AS (
         SELECT b_1.book_id,
            count(*) AS count_on_hands
           FROM (("Library"."Book" b_1
             LEFT JOIN "Library"."Copy_book" cb_1 ON ((b_1.book_id = cb_1.book_id)))
             LEFT JOIN "Library"."Reading" r_1 ON ((cb_1.copy_id = r_1.copy_id)))
          WHERE (r_1.receipt_date >= (CURRENT_DATE - '21 days'::interval))
          GROUP BY b_1.book_id
        )
 SELECT b.book_id,
    b.author,
    b.name,
    b.volume_number,
    b.compiled_by,
    b.original_language,
    b.translator,
    b.year_of_issue
   FROM (("Library"."Book" b
     LEFT JOIN "Library"."Copy_book" cb ON ((b.book_id = cb.book_id)))
     LEFT JOIN "Library"."Reading" r ON ((cb.copy_id = r.copy_id)))
  WHERE ((r.receipt_date >= (CURRENT_DATE - '21 days'::interval)) AND (b.book_id IN ( SELECT ohb.book_id
           FROM (on_hands_book ohb
             JOIN book_count bc ON (((ohb.book_id = bc.book_id) AND (bc.count_on_library = ohb.count_on_hands)))))));
 *   DROP VIEW "Library"."Most popular books";
       Library       v       postgres    false    218    218    218    218    218    218    218    219    219    219    221    221    218    6            �            1259    24664    Packing_list    TABLE     Z  CREATE TABLE "Library"."Packing_list" (
    packing_list_id integer NOT NULL,
    name character varying(150) NOT NULL,
    serial_number integer NOT NULL,
    compilation_date date NOT NULL,
    product_name character varying(250) NOT NULL,
    quantity_goods integer NOT NULL,
    product_weight numeric NOT NULL,
    price integer NOT NULL
);
 %   DROP TABLE "Library"."Packing_list";
       Library         heap r       postgres    false    6            �            1259    24712     Packing_list_packing_list_id_seq    SEQUENCE     �   ALTER TABLE "Library"."Packing_list" ALTER COLUMN packing_list_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Library"."Packing_list_packing_list_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Library               postgres    false    228    6            �            1259    24641    Passport    TABLE     �   CREATE TABLE "Library"."Passport" (
    people_id integer NOT NULL,
    series character varying(4) NOT NULL,
    number character varying(6) NOT NULL,
    date_to date NOT NULL,
    date_from date NOT NULL,
    id integer NOT NULL
);
 !   DROP TABLE "Library"."Passport";
       Library         heap r       postgres    false    6            �            1259    49154    Passport_id_seq    SEQUENCE     �   ALTER TABLE "Library"."Passport" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Library"."Passport_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Library               postgres    false    223    6            �            1259    24714    People_people_id_seq    SEQUENCE     �   ALTER TABLE "Library"."People" ALTER COLUMN people_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Library"."People_people_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Library               postgres    false    222    6            �            1259    24626    Rack    TABLE     �   CREATE TABLE "Library"."Rack" (
    rack_id integer NOT NULL,
    shelf_number integer NOT NULL,
    copy_id integer NOT NULL
);
    DROP TABLE "Library"."Rack";
       Library         heap r       postgres    false    6            �            1259    24715    Rack_rack_id_seq    SEQUENCE     �   ALTER TABLE "Library"."Rack" ALTER COLUMN rack_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Library"."Rack_rack_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Library               postgres    false    6    220            �            1259    24717    Reading_reading_id_seq    SEQUENCE     �   ALTER TABLE "Library"."Reading" ALTER COLUMN reading_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Library"."Reading_reading_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Library               postgres    false    6    221            �            1259    24698    Working_with_documents    TABLE     �   CREATE TABLE "Library"."Working_with_documents" (
    working_id integer NOT NULL,
    employee_id integer NOT NULL,
    document_id integer NOT NULL,
    work_date date NOT NULL
);
 /   DROP TABLE "Library"."Working_with_documents";
       Library         heap r       postgres    false    6            �            1259    24719 %   Working_with_documents_working_id_seq    SEQUENCE       ALTER TABLE "Library"."Working_with_documents" ALTER COLUMN working_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Library"."Working_with_documents_working_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Library               postgres    false    234    6            �            1259    24681    Writeoff_act    TABLE     �   CREATE TABLE "Library"."Writeoff_act" (
    writeoff_act_id integer NOT NULL,
    writeoff_date date NOT NULL,
    copy_id integer NOT NULL
);
 %   DROP TABLE "Library"."Writeoff_act";
       Library         heap r       postgres    false    6            �            1259    24720     Writeoff_act_writeoff_act_id_seq    SEQUENCE     �   ALTER TABLE "Library"."Writeoff_act" ALTER COLUMN writeoff_act_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "Library"."Writeoff_act_writeoff_act_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            Library               postgres    false    6    231            �          0    24676    Acceptance_certificate 
   TABLE DATA           i   COPY "Library"."Acceptance_certificate" (acceptance_certificate_id, admission_date, copy_id) FROM stdin;
    Library               postgres    false    230   ��       �          0    24671 "   Act_of_acceptance_in_place_of_lost 
   TABLE DATA           �   COPY "Library"."Act_of_acceptance_in_place_of_lost" (act_acceptance_in_place_lost_id, admission_date, lost_copy_id, new_copy_id) FROM stdin;
    Library               postgres    false    229   ��       �          0    24686    Appendix_to_writeoff_act 
   TABLE DATA           �   COPY "Library"."Appendix_to_writeoff_act" (appendix_to_writeoff_act_id, registration_number, storage_cipher, short_description, revaluation_coefficient, total_cost, writeoff_act_id) FROM stdin;
    Library               postgres    false    232   O�       �          0    24577    Book 
   TABLE DATA           �   COPY "Library"."Book" (book_id, author, name, volume_number, compiled_by, original_language, translator, year_of_issue) FROM stdin;
    Library               postgres    false    218   ��       �          0    24621 	   Copy_book 
   TABLE DATA           �   COPY "Library"."Copy_book" (copy_id, library_cipher, type_publication, price, publishing_house, inventory_number, book_id, rack_id, year_publication) FROM stdin;
    Library               postgres    false    219   j�       �          0    24693    Document 
   TABLE DATA           �   COPY "Library"."Document" (document_id, packing_list_id, writeoff_act_id, acceptance_certificate_id, act_acceptance_in_place_lost_id, document_type, date_added) FROM stdin;
    Library               postgres    false    233   ��       �          0    24651    Employee 
   TABLE DATA           ?   COPY "Library"."Employee" (employee_id, people_id) FROM stdin;
    Library               postgres    false    225   9�       �          0    24659    Job_history 
   TABLE DATA           �   COPY "Library"."Job_history" (id, date_leaving_office, date_taking_office, number_rates, job_title_id, employee_id) FROM stdin;
    Library               postgres    false    227   {�       �          0    24656 	   Job_title 
   TABLE DATA           H   COPY "Library"."Job_title" (job_title_id, name, rate_value) FROM stdin;
    Library               postgres    false    226   ��       �          0    24664    Packing_list 
   TABLE DATA           �   COPY "Library"."Packing_list" (packing_list_id, name, serial_number, compilation_date, product_name, quantity_goods, product_weight, price) FROM stdin;
    Library               postgres    false    228   ��       �          0    24641    Passport 
   TABLE DATA           Z   COPY "Library"."Passport" (people_id, series, number, date_to, date_from, id) FROM stdin;
    Library               postgres    false    223         �          0    24636    People 
   TABLE DATA           q   COPY "Library"."People" (people_id, name, surname, lastname, address, phone_number, role, education) FROM stdin;
    Library               postgres    false    222   �      �          0    24626    Rack 
   TABLE DATA           C   COPY "Library"."Rack" (rack_id, shelf_number, copy_id) FROM stdin;
    Library               postgres    false    220   ;      �          0    24646    Reader 
   TABLE DATA           E   COPY "Library"."Reader" (library_card_number, people_id) FROM stdin;
    Library               postgres    false    224   �      �          0    24631    Reading 
   TABLE DATA           z   COPY "Library"."Reading" (reading_id, receipt_date, copy_id, library_card_number, returned, returned_on_time) FROM stdin;
    Library               postgres    false    221         �          0    24698    Working_with_documents 
   TABLE DATA           f   COPY "Library"."Working_with_documents" (working_id, employee_id, document_id, work_date) FROM stdin;
    Library               postgres    false    234         �          0    24681    Writeoff_act 
   TABLE DATA           T   COPY "Library"."Writeoff_act" (writeoff_act_id, writeoff_date, copy_id) FROM stdin;
    Library               postgres    false    231   y      �           0    0 4   Acceptance_certificate_acceptance_certificate_id_seq    SEQUENCE SET     h   SELECT pg_catalog.setval('"Library"."Acceptance_certificate_acceptance_certificate_id_seq"', 10, true);
          Library               postgres    false    235            �           0    0 ?   Act_of_acceptance_in_place_of_act_acceptance_in_place_lost__seq    SEQUENCE SET     s   SELECT pg_catalog.setval('"Library"."Act_of_acceptance_in_place_of_act_acceptance_in_place_lost__seq"', 20, true);
          Library               postgres    false    236            �           0    0 8   Appendix_to_writeoff_act_appendix_to_writeoff_act_id_seq    SEQUENCE SET     l   SELECT pg_catalog.setval('"Library"."Appendix_to_writeoff_act_appendix_to_writeoff_act_id_seq"', 10, true);
          Library               postgres    false    237            �           0    0    Book_book_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('"Library"."Book_book_id_seq"', 47, true);
          Library               postgres    false    238            �           0    0    Copy_book_copy_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('"Library"."Copy_book_copy_id_seq"', 71, true);
          Library               postgres    false    239            �           0    0    Document_document_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"Library"."Document_document_id_seq"', 41, true);
          Library               postgres    false    240            �           0    0    Employee_employee_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"Library"."Employee_employee_id_seq"', 10, true);
          Library               postgres    false    241            �           0    0    Job_history_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('"Library"."Job_history_id_seq"', 13, true);
          Library               postgres    false    242            �           0    0    Job_title_job_title_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('"Library"."Job_title_job_title_id_seq"', 12, true);
          Library               postgres    false    243            �           0    0     Packing_list_packing_list_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('"Library"."Packing_list_packing_list_id_seq"', 11, true);
          Library               postgres    false    244            �           0    0    Passport_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('"Library"."Passport_id_seq"', 21, true);
          Library               postgres    false    250            �           0    0    People_people_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('"Library"."People_people_id_seq"', 23, true);
          Library               postgres    false    245            �           0    0    Rack_rack_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('"Library"."Rack_rack_id_seq"', 30, true);
          Library               postgres    false    246            �           0    0    Reading_reading_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('"Library"."Reading_reading_id_seq"', 38, true);
          Library               postgres    false    247            �           0    0 %   Working_with_documents_working_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('"Library"."Working_with_documents_working_id_seq"', 20, true);
          Library               postgres    false    248            �           0    0     Writeoff_act_writeoff_act_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('"Library"."Writeoff_act_writeoff_act_id_seq"', 10, true);
          Library               postgres    false    249                       2606    24680 2   Acceptance_certificate Acceptance_certificate_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Library"."Acceptance_certificate"
    ADD CONSTRAINT "Acceptance_certificate_pkey" PRIMARY KEY (acceptance_certificate_id);
 c   ALTER TABLE ONLY "Library"."Acceptance_certificate" DROP CONSTRAINT "Acceptance_certificate_pkey";
       Library                 postgres    false    230                       2606    24675 J   Act_of_acceptance_in_place_of_lost Act_of_acceptance_in_place_of_lost_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Library"."Act_of_acceptance_in_place_of_lost"
    ADD CONSTRAINT "Act_of_acceptance_in_place_of_lost_pkey" PRIMARY KEY (act_acceptance_in_place_lost_id);
 {   ALTER TABLE ONLY "Library"."Act_of_acceptance_in_place_of_lost" DROP CONSTRAINT "Act_of_acceptance_in_place_of_lost_pkey";
       Library                 postgres    false    229                       2606    24692 6   Appendix_to_writeoff_act Appendix_to_writeoff_act_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "Library"."Appendix_to_writeoff_act"
    ADD CONSTRAINT "Appendix_to_writeoff_act_pkey" PRIMARY KEY (appendix_to_writeoff_act_id);
 g   ALTER TABLE ONLY "Library"."Appendix_to_writeoff_act" DROP CONSTRAINT "Appendix_to_writeoff_act_pkey";
       Library                 postgres    false    232            �           2606    32796 K   Appendix_to_writeoff_act Appendix_to_writeoff_act_registration_number_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Appendix_to_writeoff_act"
    ADD CONSTRAINT "Appendix_to_writeoff_act_registration_number_check" CHECK ((registration_number > 0)) NOT VALID;
 w   ALTER TABLE "Library"."Appendix_to_writeoff_act" DROP CONSTRAINT "Appendix_to_writeoff_act_registration_number_check";
       Library               postgres    false    232    232            �           2606    40981 I   Appendix_to_writeoff_act Appendix_to_writeoff_act_short_description_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Appendix_to_writeoff_act"
    ADD CONSTRAINT "Appendix_to_writeoff_act_short_description_check" CHECK (((short_description)::text ~ '^[А-Яа-яA-Za-z,.!? ]+$'::text)) NOT VALID;
 u   ALTER TABLE "Library"."Appendix_to_writeoff_act" DROP CONSTRAINT "Appendix_to_writeoff_act_short_description_check";
       Library               postgres    false    232    232            �           2606    32798 B   Appendix_to_writeoff_act Appendix_to_writeoff_act_total_cost_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Appendix_to_writeoff_act"
    ADD CONSTRAINT "Appendix_to_writeoff_act_total_cost_check" CHECK ((total_cost > 0)) NOT VALID;
 n   ALTER TABLE "Library"."Appendix_to_writeoff_act" DROP CONSTRAINT "Appendix_to_writeoff_act_total_cost_check";
       Library               postgres    false    232    232            �           2606    40960    Book Book_author_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Book"
    ADD CONSTRAINT "Book_author_check" CHECK (((author)::text ~ '^[A-Za-z. ]+$'::text)) NOT VALID;
 B   ALTER TABLE "Library"."Book" DROP CONSTRAINT "Book_author_check";
       Library               postgres    false    218    218            �           2606    40962    Book Book_compiled_by_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Book"
    ADD CONSTRAINT "Book_compiled_by_check" CHECK (((compiled_by)::text ~ '^[A-Za-z. ]+$'::text)) NOT VALID;
 G   ALTER TABLE "Library"."Book" DROP CONSTRAINT "Book_compiled_by_check";
       Library               postgres    false    218    218            �           2606    49166    Book Book_name_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Book"
    ADD CONSTRAINT "Book_name_check" CHECK (((name)::text ~ '^[А-Яа-яA-Za-z0-9\-\# ]+$'::text)) NOT VALID;
 @   ALTER TABLE "Library"."Book" DROP CONSTRAINT "Book_name_check";
       Library               postgres    false    218    218            �           2606    24619 !   Book Book_original_language_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Book"
    ADD CONSTRAINT "Book_original_language_check" CHECK (((original_language)::text ~ '^[A-Za-z]+$'::text)) NOT VALID;
 M   ALTER TABLE "Library"."Book" DROP CONSTRAINT "Book_original_language_check";
       Library               postgres    false    218    218            �           2606    24611    Book Book_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY "Library"."Book"
    ADD CONSTRAINT "Book_pkey" PRIMARY KEY (book_id);
 ?   ALTER TABLE ONLY "Library"."Book" DROP CONSTRAINT "Book_pkey";
       Library                 postgres    false    218            �           2606    40977    Book Book_translator_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Book"
    ADD CONSTRAINT "Book_translator_check" CHECK (((translator)::text ~ '^[А-Яа-яA-Za-z. ]+$'::text)) NOT VALID;
 F   ALTER TABLE "Library"."Book" DROP CONSTRAINT "Book_translator_check";
       Library               postgres    false    218    218            �           2606    24615    Book Book_volume_number_check    CHECK CONSTRAINT     r   ALTER TABLE "Library"."Book"
    ADD CONSTRAINT "Book_volume_number_check" CHECK ((volume_number > 0)) NOT VALID;
 I   ALTER TABLE "Library"."Book" DROP CONSTRAINT "Book_volume_number_check";
       Library               postgres    false    218    218            �           2606    32772 *   Copy_book Copy_book_inventory_number_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Copy_book"
    ADD CONSTRAINT "Copy_book_inventory_number_check" CHECK ((inventory_number > 0)) NOT VALID;
 V   ALTER TABLE "Library"."Copy_book" DROP CONSTRAINT "Copy_book_inventory_number_check";
       Library               postgres    false    219    219            �           2606    32768 (   Copy_book Copy_book_library_cipher_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Copy_book"
    ADD CONSTRAINT "Copy_book_library_cipher_check" CHECK (((library_cipher)::text ~ '^[A-Za-z0-9]+$'::text)) NOT VALID;
 T   ALTER TABLE "Library"."Copy_book" DROP CONSTRAINT "Copy_book_library_cipher_check";
       Library               postgres    false    219    219            �           2606    24625    Copy_book Copy_book_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY "Library"."Copy_book"
    ADD CONSTRAINT "Copy_book_pkey" PRIMARY KEY (copy_id);
 I   ALTER TABLE ONLY "Library"."Copy_book" DROP CONSTRAINT "Copy_book_pkey";
       Library                 postgres    false    219            �           2606    32770    Copy_book Copy_book_price_check    CHECK CONSTRAINT     l   ALTER TABLE "Library"."Copy_book"
    ADD CONSTRAINT "Copy_book_price_check" CHECK ((price > 0)) NOT VALID;
 K   ALTER TABLE "Library"."Copy_book" DROP CONSTRAINT "Copy_book_price_check";
       Library               postgres    false    219    219            �           2606    40969 *   Copy_book Copy_book_publishing_house_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Copy_book"
    ADD CONSTRAINT "Copy_book_publishing_house_check" CHECK (((publishing_house)::text ~ '^[А-Яа-яA-Za-z,  ]+$'::text)) NOT VALID;
 V   ALTER TABLE "Library"."Copy_book" DROP CONSTRAINT "Copy_book_publishing_house_check";
       Library               postgres    false    219    219            �           2606    32769 *   Copy_book Copy_book_type_publication_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Copy_book"
    ADD CONSTRAINT "Copy_book_type_publication_check" CHECK (((type_publication)::text ~ '^[A-Za-z]+$'::text)) NOT VALID;
 V   ALTER TABLE "Library"."Copy_book" DROP CONSTRAINT "Copy_book_type_publication_check";
       Library               postgres    false    219    219            �           2606    49162 *   Copy_book Copy_book_year_publication_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Copy_book"
    ADD CONSTRAINT "Copy_book_year_publication_check" CHECK ((year_publication > 1500)) NOT VALID;
 V   ALTER TABLE "Library"."Copy_book" DROP CONSTRAINT "Copy_book_year_publication_check";
       Library               postgres    false    219    219            �           2606    49163 +   Copy_book Copy_book_year_publication_check1    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Copy_book"
    ADD CONSTRAINT "Copy_book_year_publication_check1" CHECK ((year_publication <= 2025)) NOT VALID;
 W   ALTER TABLE "Library"."Copy_book" DROP CONSTRAINT "Copy_book_year_publication_check1";
       Library               postgres    false    219    219            �           2606    40982 %   Document Document_document_type_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Document"
    ADD CONSTRAINT "Document_document_type_check" CHECK (((document_type)::text ~ '^[А-Яа-яA-Za-z ]+$'::text)) NOT VALID;
 Q   ALTER TABLE "Library"."Document" DROP CONSTRAINT "Document_document_type_check";
       Library               postgres    false    233    233                       2606    24697    Document Document_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY "Library"."Document"
    ADD CONSTRAINT "Document_pkey" PRIMARY KEY (document_id);
 G   ALTER TABLE ONLY "Library"."Document" DROP CONSTRAINT "Document_pkey";
       Library                 postgres    false    233            �           2606    24655    Employee Employee_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY "Library"."Employee"
    ADD CONSTRAINT "Employee_pkey" PRIMARY KEY (employee_id);
 G   ALTER TABLE ONLY "Library"."Employee" DROP CONSTRAINT "Employee_pkey";
       Library                 postgres    false    225            �           2606    32787    Job_history Job_history_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Job_history"
    ADD CONSTRAINT "Job_history_check" CHECK ((date_taking_office < date_leaving_office)) NOT VALID;
 I   ALTER TABLE "Library"."Job_history" DROP CONSTRAINT "Job_history_check";
       Library               postgres    false    227    227    227    227            �           2606    32788 *   Job_history Job_history_number_rates_check    CHECK CONSTRAINT        ALTER TABLE "Library"."Job_history"
    ADD CONSTRAINT "Job_history_number_rates_check" CHECK ((number_rates <= 2)) NOT VALID;
 V   ALTER TABLE "Library"."Job_history" DROP CONSTRAINT "Job_history_number_rates_check";
       Library               postgres    false    227    227            �           2606    32789 +   Job_history Job_history_number_rates_check1    CHECK CONSTRAINT        ALTER TABLE "Library"."Job_history"
    ADD CONSTRAINT "Job_history_number_rates_check1" CHECK ((number_rates > 0)) NOT VALID;
 W   ALTER TABLE "Library"."Job_history" DROP CONSTRAINT "Job_history_number_rates_check1";
       Library               postgres    false    227    227            �           2606    24663    Job_history Job_history_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY "Library"."Job_history"
    ADD CONSTRAINT "Job_history_pkey" PRIMARY KEY (id);
 M   ALTER TABLE ONLY "Library"."Job_history" DROP CONSTRAINT "Job_history_pkey";
       Library                 postgres    false    227            �           2606    40975    Job_title Job_title_name_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Job_title"
    ADD CONSTRAINT "Job_title_name_check" CHECK (((name)::text ~ '^[А-Яа-яA-Za-z -]+$'::text)) NOT VALID;
 J   ALTER TABLE "Library"."Job_title" DROP CONSTRAINT "Job_title_name_check";
       Library               postgres    false    226    226            �           2606    24762    Job_title Job_title_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY "Library"."Job_title"
    ADD CONSTRAINT "Job_title_pkey" PRIMARY KEY (job_title_id);
 I   ALTER TABLE ONLY "Library"."Job_title" DROP CONSTRAINT "Job_title_pkey";
       Library                 postgres    false    226            �           2606    32786 $   Job_title Job_title_rate_value_check    CHECK CONSTRAINT     v   ALTER TABLE "Library"."Job_title"
    ADD CONSTRAINT "Job_title_rate_value_check" CHECK ((rate_value > 0)) NOT VALID;
 P   ALTER TABLE "Library"."Job_title" DROP CONSTRAINT "Job_title_rate_value_check";
       Library               postgres    false    226    226            �           2606    40976 $   Packing_list Packing_list_name_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Packing_list"
    ADD CONSTRAINT "Packing_list_name_check" CHECK (((name)::text ~ '^[А-Яа-яA-Za-z., ]+$'::text)) NOT VALID;
 P   ALTER TABLE "Library"."Packing_list" DROP CONSTRAINT "Packing_list_name_check";
       Library               postgres    false    228    228                       2606    24670    Packing_list Packing_list_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY "Library"."Packing_list"
    ADD CONSTRAINT "Packing_list_pkey" PRIMARY KEY (packing_list_id);
 O   ALTER TABLE ONLY "Library"."Packing_list" DROP CONSTRAINT "Packing_list_pkey";
       Library                 postgres    false    228            �           2606    32795 %   Packing_list Packing_list_price_check    CHECK CONSTRAINT     r   ALTER TABLE "Library"."Packing_list"
    ADD CONSTRAINT "Packing_list_price_check" CHECK ((price > 0)) NOT VALID;
 Q   ALTER TABLE "Library"."Packing_list" DROP CONSTRAINT "Packing_list_price_check";
       Library               postgres    false    228    228            �           2606    40980 ,   Packing_list Packing_list_product_name_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Packing_list"
    ADD CONSTRAINT "Packing_list_product_name_check" CHECK (((product_name)::text ~ '^[А-Яа-яA-Za-z ]+$'::text)) NOT VALID;
 X   ALTER TABLE "Library"."Packing_list" DROP CONSTRAINT "Packing_list_product_name_check";
       Library               postgres    false    228    228            �           2606    32794 .   Packing_list Packing_list_product_weight_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Packing_list"
    ADD CONSTRAINT "Packing_list_product_weight_check" CHECK ((product_weight > (0)::numeric)) NOT VALID;
 Z   ALTER TABLE "Library"."Packing_list" DROP CONSTRAINT "Packing_list_product_weight_check";
       Library               postgres    false    228    228            �           2606    32793 .   Packing_list Packing_list_quantity_goods_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Packing_list"
    ADD CONSTRAINT "Packing_list_quantity_goods_check" CHECK ((quantity_goods > 0)) NOT VALID;
 Z   ALTER TABLE "Library"."Packing_list" DROP CONSTRAINT "Packing_list_quantity_goods_check";
       Library               postgres    false    228    228            �           2606    32791 -   Packing_list Packing_list_serial_number_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Packing_list"
    ADD CONSTRAINT "Packing_list_serial_number_check" CHECK ((serial_number > 0)) NOT VALID;
 Y   ALTER TABLE "Library"."Packing_list" DROP CONSTRAINT "Packing_list_serial_number_check";
       Library               postgres    false    228    228            �           2606    32782    Passport Passport_check    CHECK CONSTRAINT     n   ALTER TABLE "Library"."Passport"
    ADD CONSTRAINT "Passport_check" CHECK ((date_from < date_to)) NOT VALID;
 C   ALTER TABLE "Library"."Passport" DROP CONSTRAINT "Passport_check";
       Library               postgres    false    223    223    223    223            �           2606    32784    Passport Passport_number_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Passport"
    ADD CONSTRAINT "Passport_number_check" CHECK (((number)::text ~ '^[0-9]+$'::text)) NOT VALID;
 J   ALTER TABLE "Library"."Passport" DROP CONSTRAINT "Passport_number_check";
       Library               postgres    false    223    223            �           2606    49161    Passport Passport_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY "Library"."Passport"
    ADD CONSTRAINT "Passport_pkey" PRIMARY KEY (id);
 G   ALTER TABLE ONLY "Library"."Passport" DROP CONSTRAINT "Passport_pkey";
       Library                 postgres    false    223            �           2606    32783    Passport Passport_series_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."Passport"
    ADD CONSTRAINT "Passport_series_check" CHECK (((series)::text ~ '^[0-9]+$'::text)) NOT VALID;
 J   ALTER TABLE "Library"."Passport" DROP CONSTRAINT "Passport_series_check";
       Library               postgres    false    223    223            �           2606    40970    People People_address_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."People"
    ADD CONSTRAINT "People_address_check" CHECK (((address)::text ~ '^[A-Za-z.,0-9 ]+$'::text)) NOT VALID;
 G   ALTER TABLE "Library"."People" DROP CONSTRAINT "People_address_check";
       Library               postgres    false    222    222            �           2606    49169    People People_education_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."People"
    ADD CONSTRAINT "People_education_check" CHECK (((education)::text ~ '^[А-Яа-яA-Za-z.,0-9 ]+$'::text)) NOT VALID;
 I   ALTER TABLE "Library"."People" DROP CONSTRAINT "People_education_check";
       Library               postgres    false    222    222            �           2606    32776    People People_lastname_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."People"
    ADD CONSTRAINT "People_lastname_check" CHECK (((lastname)::text ~ '^[A-Za-z]+$'::text)) NOT VALID;
 H   ALTER TABLE "Library"."People" DROP CONSTRAINT "People_lastname_check";
       Library               postgres    false    222    222            �           2606    32774    People People_name_check    CHECK CONSTRAINT     ~   ALTER TABLE "Library"."People"
    ADD CONSTRAINT "People_name_check" CHECK (((name)::text ~ '^[A-Za-z]+$'::text)) NOT VALID;
 D   ALTER TABLE "Library"."People" DROP CONSTRAINT "People_name_check";
       Library               postgres    false    222    222            �           2606    40971     People People_phone_number_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."People"
    ADD CONSTRAINT "People_phone_number_check" CHECK (((phone_number)::text ~ '^\+[0-9]+$'::text)) NOT VALID;
 L   ALTER TABLE "Library"."People" DROP CONSTRAINT "People_phone_number_check";
       Library               postgres    false    222    222            �           2606    24640    People People_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY "Library"."People"
    ADD CONSTRAINT "People_pkey" PRIMARY KEY (people_id);
 C   ALTER TABLE ONLY "Library"."People" DROP CONSTRAINT "People_pkey";
       Library                 postgres    false    222            �           2606    32779    People People_role_check    CHECK CONSTRAINT     ~   ALTER TABLE "Library"."People"
    ADD CONSTRAINT "People_role_check" CHECK (((role)::text ~ '^[A-Za-z]+$'::text)) NOT VALID;
 D   ALTER TABLE "Library"."People" DROP CONSTRAINT "People_role_check";
       Library               postgres    false    222    222            �           2606    32775    People People_surname_check    CHECK CONSTRAINT     �   ALTER TABLE "Library"."People"
    ADD CONSTRAINT "People_surname_check" CHECK (((surname)::text ~ '^[A-Za-z]+$'::text)) NOT VALID;
 G   ALTER TABLE "Library"."People" DROP CONSTRAINT "People_surname_check";
       Library               postgres    false    222    222            �           2606    24630    Rack Rack_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY "Library"."Rack"
    ADD CONSTRAINT "Rack_pkey" PRIMARY KEY (rack_id);
 ?   ALTER TABLE ONLY "Library"."Rack" DROP CONSTRAINT "Rack_pkey";
       Library                 postgres    false    220            �           2606    32773    Rack Rack_shelf_number_check    CHECK CONSTRAINT     p   ALTER TABLE "Library"."Rack"
    ADD CONSTRAINT "Rack_shelf_number_check" CHECK ((shelf_number > 0)) NOT VALID;
 H   ALTER TABLE "Library"."Rack" DROP CONSTRAINT "Rack_shelf_number_check";
       Library               postgres    false    220    220            �           2606    24650    Reader Reader_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY "Library"."Reader"
    ADD CONSTRAINT "Reader_pkey" PRIMARY KEY (library_card_number);
 C   ALTER TABLE ONLY "Library"."Reader" DROP CONSTRAINT "Reader_pkey";
       Library                 postgres    false    224            �           2606    24635    Reading Reading_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY "Library"."Reading"
    ADD CONSTRAINT "Reading_pkey" PRIMARY KEY (reading_id);
 E   ALTER TABLE ONLY "Library"."Reading" DROP CONSTRAINT "Reading_pkey";
       Library                 postgres    false    221                       2606    24702 2   Working_with_documents Working_with_documents_pkey 
   CONSTRAINT        ALTER TABLE ONLY "Library"."Working_with_documents"
    ADD CONSTRAINT "Working_with_documents_pkey" PRIMARY KEY (working_id);
 c   ALTER TABLE ONLY "Library"."Working_with_documents" DROP CONSTRAINT "Working_with_documents_pkey";
       Library                 postgres    false    234                       2606    24685    Writeoff_act Writeoff_act_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY "Library"."Writeoff_act"
    ADD CONSTRAINT "Writeoff_act_pkey" PRIMARY KEY (writeoff_act_id);
 O   ALTER TABLE ONLY "Library"."Writeoff_act" DROP CONSTRAINT "Writeoff_act_pkey";
       Library                 postgres    false    231                       2606    24853 (   Acceptance_certificate acceptance_unique 
   CONSTRAINT     }   ALTER TABLE ONLY "Library"."Acceptance_certificate"
    ADD CONSTRAINT acceptance_unique UNIQUE (acceptance_certificate_id);
 W   ALTER TABLE ONLY "Library"."Acceptance_certificate" DROP CONSTRAINT acceptance_unique;
       Library                 postgres    false    230                       2606    24859 1   Appendix_to_writeoff_act appendix_writeoff_unique 
   CONSTRAINT     �   ALTER TABLE ONLY "Library"."Appendix_to_writeoff_act"
    ADD CONSTRAINT appendix_writeoff_unique UNIQUE (appendix_to_writeoff_act_id);
 `   ALTER TABLE ONLY "Library"."Appendix_to_writeoff_act" DROP CONSTRAINT appendix_writeoff_unique;
       Library                 postgres    false    232            �           2606    24829    Book book_unique 
   CONSTRAINT     S   ALTER TABLE ONLY "Library"."Book"
    ADD CONSTRAINT book_unique UNIQUE (book_id);
 ?   ALTER TABLE ONLY "Library"."Book" DROP CONSTRAINT book_unique;
       Library                 postgres    false    218            �           2606    24831    Copy_book copy_unique 
   CONSTRAINT     X   ALTER TABLE ONLY "Library"."Copy_book"
    ADD CONSTRAINT copy_unique UNIQUE (copy_id);
 D   ALTER TABLE ONLY "Library"."Copy_book" DROP CONSTRAINT copy_unique;
       Library                 postgres    false    219                       2606    24861    Document document_unique 
   CONSTRAINT     _   ALTER TABLE ONLY "Library"."Document"
    ADD CONSTRAINT document_unique UNIQUE (document_id);
 G   ALTER TABLE ONLY "Library"."Document" DROP CONSTRAINT document_unique;
       Library                 postgres    false    233            �           2606    24843    Employee employee_unique 
   CONSTRAINT     j   ALTER TABLE ONLY "Library"."Employee"
    ADD CONSTRAINT employee_unique UNIQUE (employee_id, people_id);
 G   ALTER TABLE ONLY "Library"."Employee" DROP CONSTRAINT employee_unique;
       Library                 postgres    false    225    225                        2606    24847    Job_history job_history_unique 
   CONSTRAINT     \   ALTER TABLE ONLY "Library"."Job_history"
    ADD CONSTRAINT job_history_unique UNIQUE (id);
 M   ALTER TABLE ONLY "Library"."Job_history" DROP CONSTRAINT job_history_unique;
       Library                 postgres    false    227            �           2606    24845    Job_title job_unique 
   CONSTRAINT     \   ALTER TABLE ONLY "Library"."Job_title"
    ADD CONSTRAINT job_unique UNIQUE (job_title_id);
 C   ALTER TABLE ONLY "Library"."Job_title" DROP CONSTRAINT job_unique;
       Library                 postgres    false    226                       2606    24857 /   Act_of_acceptance_in_place_of_lost laAct_unique 
   CONSTRAINT     �   ALTER TABLE ONLY "Library"."Act_of_acceptance_in_place_of_lost"
    ADD CONSTRAINT "laAct_unique" UNIQUE (lost_copy_id, new_copy_id);
 `   ALTER TABLE ONLY "Library"."Act_of_acceptance_in_place_of_lost" DROP CONSTRAINT "laAct_unique";
       Library                 postgres    false    229    229            
           2606    24851 2   Act_of_acceptance_in_place_of_lost lost_act_unique 
   CONSTRAINT     �   ALTER TABLE ONLY "Library"."Act_of_acceptance_in_place_of_lost"
    ADD CONSTRAINT lost_act_unique UNIQUE (act_acceptance_in_place_lost_id);
 a   ALTER TABLE ONLY "Library"."Act_of_acceptance_in_place_of_lost" DROP CONSTRAINT lost_act_unique;
       Library                 postgres    false    229                       2606    24849     Packing_list packing_list_unique 
   CONSTRAINT     k   ALTER TABLE ONLY "Library"."Packing_list"
    ADD CONSTRAINT packing_list_unique UNIQUE (packing_list_id);
 O   ALTER TABLE ONLY "Library"."Packing_list" DROP CONSTRAINT packing_list_unique;
       Library                 postgres    false    228            �           2606    24837    People people_unique 
   CONSTRAINT     g   ALTER TABLE ONLY "Library"."People"
    ADD CONSTRAINT people_unique UNIQUE (people_id, phone_number);
 C   ALTER TABLE ONLY "Library"."People" DROP CONSTRAINT people_unique;
       Library                 postgres    false    222    222            �           2606    40973    Passport pkey_unique 
   CONSTRAINT     d   ALTER TABLE ONLY "Library"."Passport"
    ADD CONSTRAINT pkey_unique UNIQUE (people_id, date_from);
 C   ALTER TABLE ONLY "Library"."Passport" DROP CONSTRAINT pkey_unique;
       Library                 postgres    false    223    223            �           2606    24833    Rack rack_unique 
   CONSTRAINT     \   ALTER TABLE ONLY "Library"."Rack"
    ADD CONSTRAINT rack_unique UNIQUE (rack_id, copy_id);
 ?   ALTER TABLE ONLY "Library"."Rack" DROP CONSTRAINT rack_unique;
       Library                 postgres    false    220    220            �           2606    24841    Reader reader_unique 
   CONSTRAINT     n   ALTER TABLE ONLY "Library"."Reader"
    ADD CONSTRAINT reader_unique UNIQUE (library_card_number, people_id);
 C   ALTER TABLE ONLY "Library"."Reader" DROP CONSTRAINT reader_unique;
       Library                 postgres    false    224    224            �           2606    24835    Reading reading_unique 
   CONSTRAINT     \   ALTER TABLE ONLY "Library"."Reading"
    ADD CONSTRAINT reading_unique UNIQUE (reading_id);
 E   ALTER TABLE ONLY "Library"."Reading" DROP CONSTRAINT reading_unique;
       Library                 postgres    false    221                       2606    24863 /   Working_with_documents working_documents_unique 
   CONSTRAINT     u   ALTER TABLE ONLY "Library"."Working_with_documents"
    ADD CONSTRAINT working_documents_unique UNIQUE (working_id);
 ^   ALTER TABLE ONLY "Library"."Working_with_documents" DROP CONSTRAINT working_documents_unique;
       Library                 postgres    false    234                       2606    24855    Writeoff_act writeoff_unique 
   CONSTRAINT     p   ALTER TABLE ONLY "Library"."Writeoff_act"
    ADD CONSTRAINT writeoff_unique UNIQUE (writeoff_act_id, copy_id);
 K   ALTER TABLE ONLY "Library"."Writeoff_act" DROP CONSTRAINT writeoff_unique;
       Library                 postgres    false    231    231            .           2606    24808 "   Document fk_acceptance_certificate    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Document"
    ADD CONSTRAINT fk_acceptance_certificate FOREIGN KEY (acceptance_certificate_id) REFERENCES "Library"."Acceptance_certificate"(acceptance_certificate_id) NOT VALID;
 Q   ALTER TABLE ONLY "Library"."Document" DROP CONSTRAINT fk_acceptance_certificate;
       Library               postgres    false    4876    230    233            /           2606    24813 .   Document fk_act_of_acceptance_in_place_of_lost    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Document"
    ADD CONSTRAINT fk_act_of_acceptance_in_place_of_lost FOREIGN KEY (act_acceptance_in_place_lost_id) REFERENCES "Library"."Act_of_acceptance_in_place_of_lost"(act_acceptance_in_place_lost_id) NOT VALID;
 ]   ALTER TABLE ONLY "Library"."Document" DROP CONSTRAINT fk_act_of_acceptance_in_place_of_lost;
       Library               postgres    false    4870    229    233                       2606    24721    Copy_book fk_book    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Copy_book"
    ADD CONSTRAINT fk_book FOREIGN KEY (book_id) REFERENCES "Library"."Book"(book_id) NOT VALID;
 @   ALTER TABLE ONLY "Library"."Copy_book" DROP CONSTRAINT fk_book;
       Library               postgres    false    219    4826    218            !           2606    24731    Rack fk_copy    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Rack"
    ADD CONSTRAINT fk_copy FOREIGN KEY (copy_id) REFERENCES "Library"."Copy_book"(copy_id) NOT VALID;
 ;   ALTER TABLE ONLY "Library"."Rack" DROP CONSTRAINT fk_copy;
       Library               postgres    false    220    4830    219            "           2606    24741    Reading fk_copy    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Reading"
    ADD CONSTRAINT fk_copy FOREIGN KEY (copy_id) REFERENCES "Library"."Copy_book"(copy_id) NOT VALID;
 >   ALTER TABLE ONLY "Library"."Reading" DROP CONSTRAINT fk_copy;
       Library               postgres    false    219    221    4830            +           2606    24783    Acceptance_certificate fk_copy    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Acceptance_certificate"
    ADD CONSTRAINT fk_copy FOREIGN KEY (copy_id) REFERENCES "Library"."Copy_book"(copy_id) NOT VALID;
 M   ALTER TABLE ONLY "Library"."Acceptance_certificate" DROP CONSTRAINT fk_copy;
       Library               postgres    false    4830    219    230            ,           2606    24788    Writeoff_act fk_copy    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Writeoff_act"
    ADD CONSTRAINT fk_copy FOREIGN KEY (copy_id) REFERENCES "Library"."Copy_book"(copy_id) NOT VALID;
 C   ALTER TABLE ONLY "Library"."Writeoff_act" DROP CONSTRAINT fk_copy;
       Library               postgres    false    4830    219    231            )           2606    24773 /   Act_of_acceptance_in_place_of_lost fk_copy_lost    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Act_of_acceptance_in_place_of_lost"
    ADD CONSTRAINT fk_copy_lost FOREIGN KEY (lost_copy_id) REFERENCES "Library"."Copy_book"(copy_id) NOT VALID;
 ^   ALTER TABLE ONLY "Library"."Act_of_acceptance_in_place_of_lost" DROP CONSTRAINT fk_copy_lost;
       Library               postgres    false    4830    229    219            *           2606    24778 .   Act_of_acceptance_in_place_of_lost fk_copy_new    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Act_of_acceptance_in_place_of_lost"
    ADD CONSTRAINT fk_copy_new FOREIGN KEY (new_copy_id) REFERENCES "Library"."Copy_book"(copy_id) NOT VALID;
 ]   ALTER TABLE ONLY "Library"."Act_of_acceptance_in_place_of_lost" DROP CONSTRAINT fk_copy_new;
       Library               postgres    false    4830    219    229            2           2606    24823 "   Working_with_documents fk_document    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Working_with_documents"
    ADD CONSTRAINT fk_document FOREIGN KEY (document_id) REFERENCES "Library"."Document"(document_id) NOT VALID;
 Q   ALTER TABLE ONLY "Library"."Working_with_documents" DROP CONSTRAINT fk_document;
       Library               postgres    false    234    233    4888            '           2606    24768    Job_history fk_employee    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Job_history"
    ADD CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES "Library"."Employee"(employee_id) NOT VALID;
 F   ALTER TABLE ONLY "Library"."Job_history" DROP CONSTRAINT fk_employee;
       Library               postgres    false    227    4854    225            3           2606    24818 "   Working_with_documents fk_employee    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Working_with_documents"
    ADD CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES "Library"."Employee"(employee_id) NOT VALID;
 Q   ALTER TABLE ONLY "Library"."Working_with_documents" DROP CONSTRAINT fk_employee;
       Library               postgres    false    4854    225    234            (           2606    24763    Job_history fk_job_title    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Job_history"
    ADD CONSTRAINT fk_job_title FOREIGN KEY (job_title_id) REFERENCES "Library"."Job_title"(job_title_id) NOT VALID;
 G   ALTER TABLE ONLY "Library"."Job_history" DROP CONSTRAINT fk_job_title;
       Library               postgres    false    4858    226    227            0           2606    24798    Document fk_packing_list    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Document"
    ADD CONSTRAINT fk_packing_list FOREIGN KEY (packing_list_id) REFERENCES "Library"."Packing_list"(packing_list_id) NOT VALID;
 G   ALTER TABLE ONLY "Library"."Document" DROP CONSTRAINT fk_packing_list;
       Library               postgres    false    4866    228    233            $           2606    24746    Passport fk_people    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Passport"
    ADD CONSTRAINT fk_people FOREIGN KEY (people_id) REFERENCES "Library"."People"(people_id) NOT VALID;
 A   ALTER TABLE ONLY "Library"."Passport" DROP CONSTRAINT fk_people;
       Library               postgres    false    223    222    4842            %           2606    24751    Reader fk_people    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Reader"
    ADD CONSTRAINT fk_people FOREIGN KEY (people_id) REFERENCES "Library"."People"(people_id) NOT VALID;
 ?   ALTER TABLE ONLY "Library"."Reader" DROP CONSTRAINT fk_people;
       Library               postgres    false    4842    222    224            &           2606    24756    Employee fk_people    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Employee"
    ADD CONSTRAINT fk_people FOREIGN KEY (people_id) REFERENCES "Library"."People"(people_id) NOT VALID;
 A   ALTER TABLE ONLY "Library"."Employee" DROP CONSTRAINT fk_people;
       Library               postgres    false    225    4842    222                        2606    24726    Copy_book fk_rack    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Copy_book"
    ADD CONSTRAINT fk_rack FOREIGN KEY (rack_id) REFERENCES "Library"."Rack"(rack_id) NOT VALID;
 @   ALTER TABLE ONLY "Library"."Copy_book" DROP CONSTRAINT fk_rack;
       Library               postgres    false    219    4834    220            #           2606    24736    Reading fk_reader    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Reading"
    ADD CONSTRAINT fk_reader FOREIGN KEY (library_card_number) REFERENCES "Library"."Reader"(library_card_number) NOT VALID;
 @   ALTER TABLE ONLY "Library"."Reading" DROP CONSTRAINT fk_reader;
       Library               postgres    false    224    4850    221            -           2606    24793 (   Appendix_to_writeoff_act fk_writeoff_act    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Appendix_to_writeoff_act"
    ADD CONSTRAINT fk_writeoff_act FOREIGN KEY (writeoff_act_id) REFERENCES "Library"."Writeoff_act"(writeoff_act_id) NOT VALID;
 W   ALTER TABLE ONLY "Library"."Appendix_to_writeoff_act" DROP CONSTRAINT fk_writeoff_act;
       Library               postgres    false    4880    231    232            1           2606    24803    Document fk_writeoff_act    FK CONSTRAINT     �   ALTER TABLE ONLY "Library"."Document"
    ADD CONSTRAINT fk_writeoff_act FOREIGN KEY (writeoff_act_id) REFERENCES "Library"."Writeoff_act"(writeoff_act_id) NOT VALID;
 G   ALTER TABLE ONLY "Library"."Document" DROP CONSTRAINT fk_writeoff_act;
       Library               postgres    false    4880    231    233            �   @   x�U��� D����X�����:r�㌆�kښ��ě���V���ET�$���r�Ð����f-      �   S   x�U͹�@��ؿ�{�B�u`2��@._Ws�˘"�m#D+v�&�߆]�bC�bYG�bY��.��|�bY�
/���ܒ^~\!6      �   �   x��ѽB1��n
&x��5^C��%C� ���f�D�g����?n���/���~��_�e��_���Cvπ0%#�(&"ҔH���"�fAYPXQ�DeCQ�(�)!�6�F쇎�B��[�n      �   t  x���AO�0��Χ��9(v��+@0m��i��j���e'JL�$ܦ]6�tU+�+<���!A�XW)��~�����g3F�U+Ն.��ْ��i�#��F&��ɤ��v�(�u�6U�q�2������g{��\LZ*��*�*wy�a�Bf����T�d[籠"ޥk� ���8�ժ��1��?A�SP�%% �H�L4�e�K�Y(c<�F,�Ҵ�!��V���HäͶ��RE2'e��I΃��8�T�$�}��ۅ�=�gз'0�>��Wk�Wq=����U��h&$�#��|,y�����F��*lΤ8�����%o�F�!]��jG�rx�/��X�L�N������b2+��=��L�5a"}@�(�ʞQ{
=��k�%�@�<�|<�����
��!�(c׶k��'{<��z%�?��`h;����ރ��sv���0~��~DFtqn
Z����
��39�o����IQpמ"vd�)����\�9n�Q!�r��Xk� <W�iO(U\�[���R,��Ei�%���7	E�.�J�UKGx'��[Ɍ�WD]���LQ=�u���������d���<�+����5,ƌ�9��f�vl,x�P�s��;���MYO      �   2  x���=nT1�k�{ �<c�?j��u�%�� m��#PFQ��E�HH4��F̌_��>[/H�����7��|:9�:�{�̼�8?�ٟ�3������$g �F��&���L��a�-�/���f8d�$f!Yt�l1Ln"z�Ǚ%VL\�)�%<�@��Rކ5<Ɏ,M�x�?�={q~0i�L"C���lXXEO_6���,���?�m�}����F���7��{W��_?֟�i�����wP��Q�) z�� 5��q��c/���e���w�k��ٸ�����w����z��u��U����L0h�@�|�O���&�.0��!��Z���A/��&�C�C�������,7�I�'-S:X0�~�:X��Tr���Р��H�ܯ�s��\�I�b��,>K+3�����c�t��H(3�l��e���d?���a��
�q��d�8����r�;�W�.K�F?��+�̯�n#���@ZY$�L��4�+�(�Q���8P��A�Ӑ�k��Ed���&�c0�������
F뺬-P�s���Sk�?���      �   }  x����M�0����F�9��%��Ô2@Y�*��ji��y#S���r�,YQ~��t��C�ju;�L;:҉�ot�]�*46j��pʉ��`T��6V�^y��k�`RӒ�j��T��D�ռ������KR�M�/k���5�`�Ⳙl�F��9=�1m�遮t��=:���4��y2B���,�6O���<����ɘC�'�<���6O��sa�������5�Y�����`a�B}����p�?/�v�P_���0�ezWpE����ߜ�����7�B�|=���CzLڧu��}9Ӆ^�r��ë
�"�YU=�L��j%pu��V�T��j�p�u��Vw\��jeq������%�Z\�="Ww �	`�`      �   2   x���� ��t0.�c�\�?K��9�\fl�(;;N�ܸ���}��      �   m   x�u���0��L/^���	*��:0�HH n�{�p�p�	�!`̗fi����ݤר�&�o�i���L��t}�����'Ol4_�S�0��X�)~m�I��#y��)d      �   �   x�u�[�P�����
���e/�B��x#b-�˱�vd�ԋ�<�d.�?�L�pƓc����5�x�2�@�6g��<A�)Ǽ�0ra�B� e�1�H�>a/�5rN�R(\����@J�(2 a�⢑����/{9��4Pb��gNE}�jzD8�L���֔	'���/���&A�Z]Ɂ�eZ=c�.s��^�ڱ5l���\�-���9�H�q�����      �     x���QN�0���SpG����]8� ��� n�Cc�
΍���ҤDM+��'��-�Om�s�գ��A_�Å�C��^C� �Y0�s�֝���w�������ɔ_����vX��˝�d0!$F�@-�S�ڶ�{�mc���,��	�+� '�t�Wӛ\�K6���*�b��Vz�5v��ur&��Jv��3,"ѢuN��ћ��,V��b���P`poC����%!U3���^ۛ>^u^v�<�s�.ө;&��xbsH���B�;k�n      �   m  x�u�IrC1D��.J����#��8����5͏�h�v�7�Ȯ�C4}I�Tkn#���躻���2Z8v˝,���y����#V��8*�ѡV���vA[���5�UY��ɬ�Vðb��g�\?�Cx��TS+����W��'ͲDoc%�����
��Qi�x���;vRB�Eu��C��o9@�hˀ�1���R�N�g���E
�����f�����5�����Wm� BPv����k*=:��~�Zal�V�
Rdv���C�~�<s�<�/� ���2q���wMj�p��"����&Z����,��|.�b�q��L���q�?��ܥQz�::�Ƿ��"��KD~ �͎j      �   �  x���Qo�0��/�"ĉ��X�֪-k5��I{�C,_�$���w���-y�"�s�=v
��ܡ-Ьan�Q9maސU��qJ5��%�'�0U�uJA�7�r�*�6��(��^��&�H5,j{%�gRʘ�И�[�%���9<���EP�.����&N�x���ī2pc�j����0�z�U�p�lD��%�L��"�:]7m�z��5ī�I�v��V3O��0��x�i$�	+m�Y�O��������KѿR�b�+Wj�;�5�����8��̒!T�Fm`FvC��Qۚ+�h�W%�Ʃ��VS�>�T�y�^%<�]�~lYxq�R0�|��}�H�k�D*�,���}{�^��R�(}�����e����)������\s�H�'@�D�SX(wM!L���O���v0k���{���5�z�<k����s^����^��@G��B�g�'��I�V?CJ��&�x���|�)����~ʈ�S���:x%g��Z^i��G��y��$2K�FQ~"<`Ň�$�o��H��AsC�\���+��m{8t���	�S.�A"����mɇ�*dq\��\#2�i9����������$�&���vmW��T�
�+ ��-´�%�m��ln��%.u��-�x=�?�Y>�������7���      �   �   x��ˍD!C�u9�v}�\:�8���=`����D��t��ml��j�F����Ai��`�n�e4�U}�<��n��}��0Z�}���UFBiTFC�����Ўʘ�B��\����&�      �   =   x����@��]L��^��ZM�Aґ�⹉K��M�T���mX���u����f
�      �   �   x�U���0C��..��o��3A�Ge'�# �GQi��%��U@J��$=z��ё� 	Ԧ��_��=�N����m(��S�L4���ȓm�x%�y��ظ��E��{ڞ2;@�A�a]��cK�֥��̻A؋��u��,�u���-=mM��:ۮV�u����~=A���<܀J������7�x�\0po �Ym�9��\�[�Ϳ���rqx�      �   a   x�U���0�w�KP추���s�$@��'�dQQ����䠒�KkR�QK�/M��=�2�7�q�#�H���������gH{d�)�#����*#      �   ?   x�U��� D���� A���_G��㌏��i=�GB�,�%�.���G�hqrŅ���}���+     