PGDMP     .    #    
            |            siniestros_viales    14.8 (Debian 14.8-1.pgdg110+1)    15.3 G    F           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            G           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            H           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            I           1262    25278    siniestros_viales    DATABASE     |   CREATE DATABASE siniestros_viales WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
 !   DROP DATABASE siniestros_viales;
                jhparra    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                jhparra    false            J           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   jhparra    false    4            K           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   jhparra    false    4            �            1255    26072 A   llenar_dimension_calendario(character varying, character varying) 	   PROCEDURE     �  CREATE PROCEDURE public.llenar_dimension_calendario(IN startdate character varying, IN stopdate character varying)
    LANGUAGE plpgsql
    AS $$
DECLARE currentdate date;
DECLARE inicio varchar;
BEGIN
  SET currentdate = startdate;
  WHILE currentdate < stopdate LOOP
	  INSERT INTO calendario VALUES (
	         EXTRACT(YEAR FROM currentdate)*10000+EXTRACT(MONTH FROM currentdate)*100 + EXTRACT(DAY FROM currentdate),
	         currentdate,
	         EXTRACT(YEAR FROM currentdate),
	         EXTRACT(MONTH FROM currentdate),
	         EXTRACT(DAY FROM currentdate),
	         EXTRACT(MONTH FROM currentdate) / 3,
	         DATE_PART('week', fecha),
	         NULL,
	         NULL);
  END LOOP;
END;
$$;
 r   DROP PROCEDURE public.llenar_dimension_calendario(IN startdate character varying, IN stopdate character varying);
       public          jhparra    false    4            �            1259    26147    comuna    TABLE     �   CREATE TABLE public.comuna (
    id_comuna integer NOT NULL,
    objeto character varying,
    comuna integer,
    barrios character varying,
    perimetro numeric(16,7),
    area numeric(16,7)
);
    DROP TABLE public.comuna;
       public         heap    jhparra    false    4            �            1259    26146    comuna_id_comuna_seq    SEQUENCE     �   CREATE SEQUENCE public.comuna_id_comuna_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.comuna_id_comuna_seq;
       public          jhparra    false    4    224            L           0    0    comuna_id_comuna_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.comuna_id_comuna_seq OWNED BY public.comuna.id_comuna;
          public          jhparra    false    223            �            1259    25899 
   siniestros    TABLE     4  CREATE TABLE public.siniestros (
    cantidad_victimas integer,
    fecha date,
    hora character varying,
    lugar_hecho character varying,
    direccion_siniestro character varying,
    id_comuna integer,
    longitud character varying,
    latitud character varying,
    id_tipocalle integer DEFAULT 0,
    id_tipoparticipante integer DEFAULT 0,
    id_tipovictima integer DEFAULT 0,
    id_tipoacusado integer DEFAULT 0,
    id_siniestro integer NOT NULL,
    id_victima integer DEFAULT 0,
    edad_etaria character varying DEFAULT '-'::character varying
);
    DROP TABLE public.siniestros;
       public         heap    jhparra    false    4            �            1259    25964 "   homicidios_hechos_id_siniestro_seq    SEQUENCE     �   CREATE SEQUENCE public.homicidios_hechos_id_siniestro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.homicidios_hechos_id_siniestro_seq;
       public          jhparra    false    4    212            M           0    0 "   homicidios_hechos_id_siniestro_seq    SEQUENCE OWNED BY     b   ALTER SEQUENCE public.homicidios_hechos_id_siniestro_seq OWNED BY public.siniestros.id_siniestro;
          public          jhparra    false    219            �            1259    25889    victimas    TABLE       CREATE TABLE public.victimas (
    codigo_siniestro character varying,
    fecha date,
    sexo_victima character varying,
    edad_victima character varying,
    fecha_fallecimiento character varying,
    id_tiporol integer DEFAULT 0,
    id_victima integer NOT NULL
);
    DROP TABLE public.victimas;
       public         heap    jhparra    false    4            �            1259    26027 "   homicidios_victimas_id_victima_seq    SEQUENCE     �   CREATE SEQUENCE public.homicidios_victimas_id_victima_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.homicidios_victimas_id_victima_seq;
       public          jhparra    false    4    211            N           0    0 "   homicidios_victimas_id_victima_seq    SEQUENCE OWNED BY     ^   ALTER SEQUENCE public.homicidios_victimas_id_victima_seq OWNED BY public.victimas.id_victima;
          public          jhparra    false    222            �            1259    25946    tipo_acusado    TABLE     n   CREATE TABLE public.tipo_acusado (
    tipo_acusado character varying,
    id_tipoacusado integer NOT NULL
);
     DROP TABLE public.tipo_acusado;
       public         heap    jhparra    false    4            �            1259    25951    tipo_acusado_id_tipoacusado_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_acusado_id_tipoacusado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tipo_acusado_id_tipoacusado_seq;
       public          jhparra    false    217    4            O           0    0    tipo_acusado_id_tipoacusado_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tipo_acusado_id_tipoacusado_seq OWNED BY public.tipo_acusado.id_tipoacusado;
          public          jhparra    false    218            �            1259    25865 
   tipo_calle    TABLE     h   CREATE TABLE public.tipo_calle (
    tipo_calle character varying,
    id_tipocalle integer NOT NULL
);
    DROP TABLE public.tipo_calle;
       public         heap    jhparra    false    4            �            1259    25870    tipo_calle_id_tipocalle_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_calle_id_tipocalle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tipo_calle_id_tipocalle_seq;
       public          jhparra    false    209    4            P           0    0    tipo_calle_id_tipocalle_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tipo_calle_id_tipocalle_seq OWNED BY public.tipo_calle.id_tipocalle;
          public          jhparra    false    210            �            1259    25906    tipo_participante    TABLE     ~   CREATE TABLE public.tipo_participante (
    tipo_participantes character varying,
    id_tipoparticipante integer NOT NULL
);
 %   DROP TABLE public.tipo_participante;
       public         heap    jhparra    false    4            �            1259    25912 )   tipo_participante_id_tipoparticipante_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_participante_id_tipoparticipante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.tipo_participante_id_tipoparticipante_seq;
       public          jhparra    false    213    4            Q           0    0 )   tipo_participante_id_tipoparticipante_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.tipo_participante_id_tipoparticipante_seq OWNED BY public.tipo_participante.id_tipoparticipante;
          public          jhparra    false    214            �            1259    25995    tipo_rol    TABLE     ]   CREATE TABLE public.tipo_rol (
    rol character varying,
    id_tiporol integer NOT NULL
);
    DROP TABLE public.tipo_rol;
       public         heap    jhparra    false    4            �            1259    26011    tipo_rol_id_tiporol_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_rol_id_tiporol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tipo_rol_id_tiporol_seq;
       public          jhparra    false    4    220            R           0    0    tipo_rol_id_tiporol_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.tipo_rol_id_tiporol_seq OWNED BY public.tipo_rol.id_tiporol;
          public          jhparra    false    221            �            1259    25928    tipo_victima    TABLE     n   CREATE TABLE public.tipo_victima (
    tipo_victima character varying,
    id_tipovictima integer NOT NULL
);
     DROP TABLE public.tipo_victima;
       public         heap    jhparra    false    4            �            1259    25933    tipo_victima_id_tipovictima_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_victima_id_tipovictima_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tipo_victima_id_tipovictima_seq;
       public          jhparra    false    215    4            S           0    0    tipo_victima_id_tipovictima_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tipo_victima_id_tipovictima_seq OWNED BY public.tipo_victima.id_tipovictima;
          public          jhparra    false    216            �           2604    26150    comuna id_comuna    DEFAULT     t   ALTER TABLE ONLY public.comuna ALTER COLUMN id_comuna SET DEFAULT nextval('public.comuna_id_comuna_seq'::regclass);
 ?   ALTER TABLE public.comuna ALTER COLUMN id_comuna DROP DEFAULT;
       public          jhparra    false    223    224    224            �           2604    25965    siniestros id_siniestro    DEFAULT     �   ALTER TABLE ONLY public.siniestros ALTER COLUMN id_siniestro SET DEFAULT nextval('public.homicidios_hechos_id_siniestro_seq'::regclass);
 F   ALTER TABLE public.siniestros ALTER COLUMN id_siniestro DROP DEFAULT;
       public          jhparra    false    219    212            �           2604    25952    tipo_acusado id_tipoacusado    DEFAULT     �   ALTER TABLE ONLY public.tipo_acusado ALTER COLUMN id_tipoacusado SET DEFAULT nextval('public.tipo_acusado_id_tipoacusado_seq'::regclass);
 J   ALTER TABLE public.tipo_acusado ALTER COLUMN id_tipoacusado DROP DEFAULT;
       public          jhparra    false    218    217            �           2604    25871    tipo_calle id_tipocalle    DEFAULT     �   ALTER TABLE ONLY public.tipo_calle ALTER COLUMN id_tipocalle SET DEFAULT nextval('public.tipo_calle_id_tipocalle_seq'::regclass);
 F   ALTER TABLE public.tipo_calle ALTER COLUMN id_tipocalle DROP DEFAULT;
       public          jhparra    false    210    209            �           2604    25913 %   tipo_participante id_tipoparticipante    DEFAULT     �   ALTER TABLE ONLY public.tipo_participante ALTER COLUMN id_tipoparticipante SET DEFAULT nextval('public.tipo_participante_id_tipoparticipante_seq'::regclass);
 T   ALTER TABLE public.tipo_participante ALTER COLUMN id_tipoparticipante DROP DEFAULT;
       public          jhparra    false    214    213            �           2604    26012    tipo_rol id_tiporol    DEFAULT     z   ALTER TABLE ONLY public.tipo_rol ALTER COLUMN id_tiporol SET DEFAULT nextval('public.tipo_rol_id_tiporol_seq'::regclass);
 B   ALTER TABLE public.tipo_rol ALTER COLUMN id_tiporol DROP DEFAULT;
       public          jhparra    false    221    220            �           2604    25934    tipo_victima id_tipovictima    DEFAULT     �   ALTER TABLE ONLY public.tipo_victima ALTER COLUMN id_tipovictima SET DEFAULT nextval('public.tipo_victima_id_tipovictima_seq'::regclass);
 J   ALTER TABLE public.tipo_victima ALTER COLUMN id_tipovictima DROP DEFAULT;
       public          jhparra    false    216    215            �           2604    26028    victimas id_victima    DEFAULT     �   ALTER TABLE ONLY public.victimas ALTER COLUMN id_victima SET DEFAULT nextval('public.homicidios_victimas_id_victima_seq'::regclass);
 B   ALTER TABLE public.victimas ALTER COLUMN id_victima DROP DEFAULT;
       public          jhparra    false    222    211            C          0    26147    comuna 
   TABLE DATA           U   COPY public.comuna (id_comuna, objeto, comuna, barrios, perimetro, area) FROM stdin;
    public          jhparra    false    224   Y       7          0    25899 
   siniestros 
   TABLE DATA           �   COPY public.siniestros (cantidad_victimas, fecha, hora, lugar_hecho, direccion_siniestro, id_comuna, longitud, latitud, id_tipocalle, id_tipoparticipante, id_tipovictima, id_tipoacusado, id_siniestro, id_victima, edad_etaria) FROM stdin;
    public          jhparra    false    212   �[       <          0    25946    tipo_acusado 
   TABLE DATA           D   COPY public.tipo_acusado (tipo_acusado, id_tipoacusado) FROM stdin;
    public          jhparra    false    217   ?�       4          0    25865 
   tipo_calle 
   TABLE DATA           >   COPY public.tipo_calle (tipo_calle, id_tipocalle) FROM stdin;
    public          jhparra    false    209   ��       8          0    25906    tipo_participante 
   TABLE DATA           T   COPY public.tipo_participante (tipo_participantes, id_tipoparticipante) FROM stdin;
    public          jhparra    false    213   ��       ?          0    25995    tipo_rol 
   TABLE DATA           3   COPY public.tipo_rol (rol, id_tiporol) FROM stdin;
    public          jhparra    false    220   �       :          0    25928    tipo_victima 
   TABLE DATA           D   COPY public.tipo_victima (tipo_victima, id_tipovictima) FROM stdin;
    public          jhparra    false    215   q�       6          0    25889    victimas 
   TABLE DATA           �   COPY public.victimas (codigo_siniestro, fecha, sexo_victima, edad_victima, fecha_fallecimiento, id_tiporol, id_victima) FROM stdin;
    public          jhparra    false    211   ��       T           0    0    comuna_id_comuna_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.comuna_id_comuna_seq', 1, false);
          public          jhparra    false    223            U           0    0 "   homicidios_hechos_id_siniestro_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.homicidios_hechos_id_siniestro_seq', 696, true);
          public          jhparra    false    219            V           0    0 "   homicidios_victimas_id_victima_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.homicidios_victimas_id_victima_seq', 717, true);
          public          jhparra    false    222            W           0    0    tipo_acusado_id_tipoacusado_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tipo_acusado_id_tipoacusado_seq', 10, true);
          public          jhparra    false    218            X           0    0    tipo_calle_id_tipocalle_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tipo_calle_id_tipocalle_seq', 4, true);
          public          jhparra    false    210            Y           0    0 )   tipo_participante_id_tipoparticipante_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.tipo_participante_id_tipoparticipante_seq', 41, true);
          public          jhparra    false    214            Z           0    0    tipo_rol_id_tiporol_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tipo_rol_id_tiporol_seq', 5, true);
          public          jhparra    false    221            [           0    0    tipo_victima_id_tipovictima_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tipo_victima_id_tipovictima_seq', 10, true);
          public          jhparra    false    216            �           2606    26154    comuna comuna_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.comuna
    ADD CONSTRAINT comuna_pkey PRIMARY KEY (id_comuna);
 <   ALTER TABLE ONLY public.comuna DROP CONSTRAINT comuna_pkey;
       public            jhparra    false    224            �           2606    25967 !   siniestros homicidios_hechos_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.siniestros
    ADD CONSTRAINT homicidios_hechos_pkey PRIMARY KEY (id_siniestro);
 K   ALTER TABLE ONLY public.siniestros DROP CONSTRAINT homicidios_hechos_pkey;
       public            jhparra    false    212            �           2606    26030 !   victimas homicidios_victimas_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.victimas
    ADD CONSTRAINT homicidios_victimas_pkey PRIMARY KEY (id_victima);
 K   ALTER TABLE ONLY public.victimas DROP CONSTRAINT homicidios_victimas_pkey;
       public            jhparra    false    211            �           2606    25954    tipo_acusado tipo_acusado_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tipo_acusado
    ADD CONSTRAINT tipo_acusado_pkey PRIMARY KEY (id_tipoacusado);
 H   ALTER TABLE ONLY public.tipo_acusado DROP CONSTRAINT tipo_acusado_pkey;
       public            jhparra    false    217            �           2606    25873    tipo_calle tipo_calle_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tipo_calle
    ADD CONSTRAINT tipo_calle_pkey PRIMARY KEY (id_tipocalle);
 D   ALTER TABLE ONLY public.tipo_calle DROP CONSTRAINT tipo_calle_pkey;
       public            jhparra    false    209            �           2606    25915 (   tipo_participante tipo_participante_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.tipo_participante
    ADD CONSTRAINT tipo_participante_pkey PRIMARY KEY (id_tipoparticipante);
 R   ALTER TABLE ONLY public.tipo_participante DROP CONSTRAINT tipo_participante_pkey;
       public            jhparra    false    213            �           2606    26014    tipo_rol tipo_rol_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tipo_rol
    ADD CONSTRAINT tipo_rol_pkey PRIMARY KEY (id_tiporol);
 @   ALTER TABLE ONLY public.tipo_rol DROP CONSTRAINT tipo_rol_pkey;
       public            jhparra    false    220            �           2606    25936    tipo_victima tipo_victima_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tipo_victima
    ADD CONSTRAINT tipo_victima_pkey PRIMARY KEY (id_tipovictima);
 H   ALTER TABLE ONLY public.tipo_victima DROP CONSTRAINT tipo_victima_pkey;
       public            jhparra    false    215            �           2606    25990 $   siniestros fk_siniestro_tipo_acusado    FK CONSTRAINT     �   ALTER TABLE ONLY public.siniestros
    ADD CONSTRAINT fk_siniestro_tipo_acusado FOREIGN KEY (id_tipoacusado) REFERENCES public.tipo_acusado(id_tipoacusado);
 N   ALTER TABLE ONLY public.siniestros DROP CONSTRAINT fk_siniestro_tipo_acusado;
       public          jhparra    false    217    212    3229            �           2606    25980 )   siniestros fk_siniestro_tipo_participante    FK CONSTRAINT     �   ALTER TABLE ONLY public.siniestros
    ADD CONSTRAINT fk_siniestro_tipo_participante FOREIGN KEY (id_tipoparticipante) REFERENCES public.tipo_participante(id_tipoparticipante);
 S   ALTER TABLE ONLY public.siniestros DROP CONSTRAINT fk_siniestro_tipo_participante;
       public          jhparra    false    3225    212    213            �           2606    25985 $   siniestros fk_siniestro_tipo_victima    FK CONSTRAINT     �   ALTER TABLE ONLY public.siniestros
    ADD CONSTRAINT fk_siniestro_tipo_victima FOREIGN KEY (id_tipovictima) REFERENCES public.tipo_victima(id_tipovictima);
 N   ALTER TABLE ONLY public.siniestros DROP CONSTRAINT fk_siniestro_tipo_victima;
       public          jhparra    false    212    215    3227            �           2606    25975 !   siniestros fk_siniestro_tipocalle    FK CONSTRAINT     �   ALTER TABLE ONLY public.siniestros
    ADD CONSTRAINT fk_siniestro_tipocalle FOREIGN KEY (id_tipocalle) REFERENCES public.tipo_calle(id_tipocalle);
 K   ALTER TABLE ONLY public.siniestros DROP CONSTRAINT fk_siniestro_tipocalle;
       public          jhparra    false    209    3219    212            �           2606    26155    siniestros fk_siniestros_comuna    FK CONSTRAINT     �   ALTER TABLE ONLY public.siniestros
    ADD CONSTRAINT fk_siniestros_comuna FOREIGN KEY (id_comuna) REFERENCES public.comuna(id_comuna);
 I   ALTER TABLE ONLY public.siniestros DROP CONSTRAINT fk_siniestros_comuna;
       public          jhparra    false    224    212    3233            �           2606    26040 !   siniestros fk_siniestros_victimas    FK CONSTRAINT     �   ALTER TABLE ONLY public.siniestros
    ADD CONSTRAINT fk_siniestros_victimas FOREIGN KEY (id_victima) REFERENCES public.victimas(id_victima);
 K   ALTER TABLE ONLY public.siniestros DROP CONSTRAINT fk_siniestros_victimas;
       public          jhparra    false    212    211    3221            �           2606    26022    victimas fk_victimas_tipo_rol    FK CONSTRAINT     �   ALTER TABLE ONLY public.victimas
    ADD CONSTRAINT fk_victimas_tipo_rol FOREIGN KEY (id_tiporol) REFERENCES public.tipo_rol(id_tiporol);
 G   ALTER TABLE ONLY public.victimas DROP CONSTRAINT fk_victimas_tipo_rol;
       public          jhparra    false    3231    211    220            C   �  x�eTm�;�mN�b���fpXK�1��A�*���.��$�<ˆ $�]�U��X�s��8�y[baĦ��=�m�u9~;�u�kj-v�[j��xN���R����㒧Z�z?�T�ʔ%!�d���XϽ��|/YK@I=2I�H�yf9i57V��s�b�XnqI-�7�Z^{=RB{˥^	(oB ��qP�J
���˩Np��-�u���|��-᣷�V����K/]��[����JkS�<İX�x��;�t����VR��%��P�(( �`�A���!
��0�T�<�2��=�:��Ԗ���tO�(n��`���z� ��3�g�\J<���A���r�޶T���s�I�Ⴄ��I	�� ��!�Cx0
KNml;Ǿ[���񖀾���"�WZF����`Bcu/fw!z�;�ŵ���#��{N�W�
�w�>I�/�Ӏ�JI.�����c9��vD/;�]�s*��>Q����pi��#���7pzr#1�w�Fƀ�&)���ܯ�^҆�T/o�o��<���@F��g.K�����UN�$&�,H˭rfg��NTN�`��"#�?�\������_zg�R����(��)IH��e�KPQ���6�F�7^c#��;B��������yP�0T��P�Ǟz��0�2�ǵ�ַ�ؠ��*�C�$Y� U�������fA      7      x����r#I���}
�d3f�T�{xDx�$���`�GL���	US�E�0�%C���'����R�I�7P��}�{��~�@�3ۦ{Ʀ��� ��?��;�Q]����Pu�4ՏU5���~1��?M����j����g��.���wt��t�WO��2�&?��]�VMmm3�����զ��D���Xz~���|;U�t3�v���=��T�r�h0~<靈�~z=[-�hDX�WW�ɢ��]���H����ѭ�������7�ߤ�Wm&�-�X�-�_�.����r~���I�^��W����j�WO��]v����QUMe�j����3��&:NK7Ѯ<*�&��X�2}\�И�ռ�^.W��%��_��7����_:ɟ�S�	�E�2�X?.�8�,�VE�����z�TM�����������e�C�j�ߜ-'|�$<!�H��d�yT��jR][UCSe'����%�?�j��4Y����n��W˛~�/�ċ��պuu���j�J���u�7O���]����є���������˛��lu�Ӟ�����������͓i��?����Y��J[E��41݄�幠�l��t��W3�3ڦ�~.�ِ�5�ݴm�M�?L��U��=0����44=��+�����z~s�O�c5��^ݮW��{:���Os�37t�o�a5������{;�%����;�F���T�tj1p�<�Lf�4��+��Ḙ��V���r5=��$8�xLA4mm�V�hk�M�Җ�%����JK���������j��?�/�Z�y�������V�V�����6���G��a��F�۝;z;�,~�l��g�w�E�Z~����_���$\8�����Vs�i^�m��ڒ����s�V]�Ab�[/hP$��������>�:Q�~��rqt��]�n�O��)�A��1��Sf;:�b�{i��QLS����͏���o��ł怆s=_-��/���tQ^_i�Y9��Ԋ&�@�M4�h����I&UM��������!\����$^���/�j\��e�mM(_꜄�������4������/���i�+�t�}y���tt�d���O/��B8Hc�ت�I8:7���_N��F��-D������>�q�~�����8���}�_�}�Z�4�|!2�5��\�S��6�2rӺ�!�Ml�pbΖW7���5�NX4g^�]��U�7�r-��0 ��M�V��ZZ K��< �9��o��L��B��_�\�_>�;z@L�ee�f���D�Ӿ515tS0�V�	,��T���ÄԖ�\�Y�5EFc�@3.�����@$k*7Z,��![��+�\Kb�
��j�ʹ6�2�7���@������"�↬�+�+�Q�f����kɮT�ަ�LfXB2馤N�b�D�&�������)$�֐
d\�7�p5����b�mm�k85�b���5b4���BC�u$)�i4-��#��S���Q��N��;~����6i3n?�0���ض"/����׳sz����$ޓÂ�'�,T�+5��6�"VZ�$Fk��)nڴM:�g=�,��|�E����As��'o(lR[�Ƒ�2d	�h���D8v霴b����8�V�ri�]2Ah:E�ۅ�ѐ���Z_�Nj��w,Hp�"��5��.�l� ����u����������:�/�O���r�]��>��Y_,?Hj�{8Dg�����C�OU�U��5k�V���E�a�4CnR�a��6?m�6�d�����3�l��m�Dc��:�f�}�?OV�i�/�qR~gsr��q��W�s{�Ϯ�8���ضuaY����@�LtG�Pg��="7����ozO����e�����Ͽl���h[�A�/��C�����ymŔ�U]�#�:h�Ġ&7ܨ�]M���_"��'�f��m3}�J�a�W� ;@5���� �Y%����5�b�FYm��:��C���jN{d�Z0	��i�z���S�F��N�1�nQ�n�dN���e���Ob��?m_�<��y�<MO7���~c���9m��XJ����梧H*�L�
��oIH�A;����d�I:��q�GZ�z�;��������'o?ќ����HI�Η�^�bX#�:�pPX#g�|ភ?�yл�����JD���q�x��������jI2�)�����/z��]x��'6�����e4�ɖk���S�]�&������N?o^6.gO�^������0�Z�]X�s��:ثٔ�Q����a��gYĈd��ȶ	+�V�@LR�lV ��q(�vx�]o��ߞ���/[��I��wm!R�="X���q�|9�>�3-K`N�Q5���4��_W)�$�D�M�	➦�"RQ<%���xN��H�t�a�H^^%� x%&a��u�f��^��9I�������͗ͯ��|پ<m_6����?��bD���B&$��3N��U��!�ظq{�B;������7%���|�����%�:�ӽ�\:�EmQu���ylꪭ0!2/d�W�d�BRu?�.���i�<��0u�/[�܏�ӛ�H#���Wh��,n�PŰ���SIB�<j�GnHH���J����vz�}���>��/�G���˖���������m�:�@d��܁�+x�Z�/o�;��
o�R&˧�ӛ):�X����J�|~|�:ݒ��e�'6>��8�!�w�H�fK��oEq��.ȴ�\����K��j|���� '�����`@����k2�!�Cb%$�i�௓���԰�� `��C�S��������V��"���k1�U�	mg�H���k�ꂶsl�h&ym�IDJ��F���~=����Lz",KC��4.�KG�Lݦ@jmhd��!�\u���� ��b�������v�:Q$˽�6��n�	����z��Umr۰\,KKC��6ᰑV8'�6ծm�?���i���s�]���q<�֖vhAB:V������!���f�p��U��%�U�=����u�*�2$jl��hȈ���5׸E��}"߬���?!��̬G�REB�b��j��	"��C�#kYv���9��)ܦ#��	��n[�j��u�H�a�H¨vd�RF��-4�Wps��Eρ(��ł��-m���2��܌��r�Dbj�M7I�Y�Ь)m_��9?��xH��{�B��zy��%��V�Ƣ�F���L�5~4=��{��E9�Z�r'혦���;FW�L��lIY3�gDHNq�L���g�d�\	�4L����*m�)r4�U;�f�7lJT��*�����j	�,�~���7������
>$�����L�Y�\u�.�ۚq]��HQ
��I����I�q��Ge�������c�t0�+��̳�-J�Ja�e���zJ�f�s(au������,��Ǣ��v"<W��7Nq\����G�i~X�pW4,��;_ώ���"UMǺO��N���FnҌ��x�F���� "k��Ҍ�A�,g�5�������wKF;�,.����~w7���0����H6�K��M�m��H�4�Do�Ҏ�+r|G�ǝOjee瓍H�oJA6$O��;�aY�h9�01N�4�ْv���#�u����'�$2ٔw����|3���&ͰG�����o%��37�o����m���HZ��-�g��B���e��#��YJ�e�c��2FI�����:�vSC���pc�t�!r�kv��Ű��5����OyT�_.�$(J�o��[�̤�O������#YvrGk�"֜���#H���צ}# ��7��7/_�?�sx�}����F?>�(��n� v
kd�<�Yc	�~\��"�uW�wHV��N�Z&E�F �� �Z�)&��5I6i��i��%BAS�:�+�mF�Լr�צ)�X���m4o��o�Iǔ����_��z�~��@�8 [ڐ�kښ�6�u����Z�{�M�Z�T7]�.�A��H��oW�3�FvE� I��ƞή�❌�F����։�Z�
MG�\L�Z;�xV�&��o�_��X�/�_"-@�A�'�NI��!�.��g|�:�?�.o�������ɺ�`P�h���
�]x�� uC���    j�#V��g}u7_��Z"c <�b��֞�a���kI	U�>A|%��=Cg��� x��]�R	h=��dB?{���v�.�w���H��x# ��&@*%:&$��CmR��!���N8&}35H�᧓pӟ���#�~sېv�]T��O�4˰�&7����l�>��g�~-��t9���M��_�LS�[�֝�|Y�m�].����j��(7�����ɠ��Sܖ�A�C,�֒m�+���=m9�eҞ�"��{�Yz?�)��q�>�*��pm'������c%p����q�q}��{XSR84+�lHxV))G�Ķ�1 H?J@�n�[,����j�
��xY�3:ٿ'�J3??um�ϴ�I6M������8&�u8?�՜<������P����bp�-9�ZU�q�;u�~U�f�J�1p����\�%�����؃�.D<M��� �7H���cJ�R��V���S]c���w��%M�$���~x�H
�4���DM�+ c��w�[miD
�^�/a�x#�Կ A��P���`��?������[����Uնm �udd�^�P�&B����rA)������Yk�����jx̲�
(,]���Q�s7�)������3�"��D����lq��bn)�[��1�YZ/��b���Ih���b�Q�G�g���*��v�o��4tb��iT��6��
)MSR��1��'e�ex��.��[Rv�$|���'�!�u�F�F�3�z�I�����3�#��~�B��F�Ћ~�d�� :~<��,&���i��	HCp1�� �6�-���2\3��	�x���$���"���I�&S���2-:��|������΁p�
vvOP1�f�o�x�:���G�ɯ8*�PK�������/����l�X^�Vӭ��O�:�&���q`K�>غ{c�h�y@�-PD �����s����#��Q,]�� S�Ez�#�=���S=��@�d�w���I�`�JڀtC�`����_aT�M���S� )
5� �t�dRr)h_74�dնn��Cl3&��c���w��H� Uxףt���Ś�-Nw���9�U������b��={2�}w�.<���m�]��L�]�`H����#�@aV��M�گ.�+�M~&����A��ҵʴR�C���7-<E����wd��`g�����/���I��}�{�=9d��U�=خv5CPұ�䌋'�0��͖7�L�r�{���Op�*@��vtmk%Ix=P1�@&;��Ã�[If�ޗ�C-T�~��/����3�8(�����#��W��P��T�\~"C���,��y'�C\���q���6�PĄk�S����_K�5������{��9�iP���Ί�%$Gu�u�lV��q��K�`T0DH%�Q~˨j>�+����.�&!f$�B�����&@	 �j�c���0_�d���K�}&
�d�~�oǬY��s��l4㹣�l��6�A)�=��wB�A>�[~�6�t�����¢L����8�9��x(�3�X�o�}DZҽ�`�d(+!�w �x�~��A=%��E3\L�CB����6�:��i�� �-��4m$�g�+H����B��#e����N�C����k� /����8��Hݾ��d���r��X�Ϗ���-q�:w�q�*ZU�*[�P��G�t�2
P�>�q�s ":�dHRda5r�1�ՆDW�WC���|?��1�lk$J��p�,���������$3�W�zh�ʋ��r��չ������gsD�$�{Td�ƈ�V� ����FIo!X���G5��]����;���b��>��/Z\D�_��=n.�)�?�#��<��w�,�A���~�U�I`����;6Tu6���\m$�TD�(o�L�7���X�gQ�.�BgZ�%�u��Ͽ�A�������o������0������_��s��i�1*Djct˱�XÎ�p��Tǹ#�rG�/O��/�� p}�L�^^�޼���eC�������7�G:տ��/z~�"��Y�&�?�����Ul�ń��I&��$���`��q�Ki��bB��k@ʣx�镦7]>n~ݼ�<l�Jb��a�=\�g����^^�Oȇ��D$9��y���}W���8:�t������3�� e==籭��n^���pF�5�Hk>�(��Ae��W�,V	��Bm\�t��������J�����	���䓙��撚D ��YB��H��:��d%������B'�{�a��3(��PW9��C�b�Z���~0�
*��l#���0󍳇86�$���)�@H���#����q+ҿ��$*��f���`���'����/��xTޱs���}��F���N�{}��F�m��h@��%����b	��?\N�w���s��/DB��|��x"����{";[���~-}�o
�UYr3��V��~_0�au���^����]�bZa!�E�l��(:��� o� ���0#"4�ĵ�h��b����m�*=�Wh���#�]��td�r-�!�Y����\���mh,������@�͟�О݆�.Ӂ���Δ��� )	�YC��d-���e�M��m��v\�_�h�Co;}���e����������y0ɗ���0�tu')����Vg��pKWQȲI��[<�οmQ�k�^��l�B}�|��F<�9p�U*�b(1T�Fw��AU��H5�6�a�82�<FZu��T� _�����)VSAw��?���79(&��&�U�j@���NF��E���h�/��aq�^�\������7_�fl_@�0�\�����
1�(9������Cmcz����d5��5<�$��ٱ(�;�jq-Z�Jɂ	T�XfE��m��%{������vT����
m��积����`�|-��$��s�
��mH���
�c�Z.z.���:������D��I���O��fr5�G�e��,I¦-O&Z��h�bMX:��pŉ #:@V���.d��������Z�/���/^FX+Yн��.'�#���U5���d9����9uķu?��o��!".#̆��+�:8U�
�`�����������@��t}&!��g7v�7D��,"M^[���@E!�+>�W�sY��!����<��D�7�ct0�v�p�qLsRM��Yd�?n�D�����������Xv� �c�}����f-Pv�f��F���V�R�TxJ�]��P�V�`���|�dI��Nb>g�ȸ�/��t����*�)�,��_|���/���=u����Zm~��|�y�L�=O��!!��ɉ�.ޝ���T�8WG�V]Y�T���C]޸[�!�� �Խ���h���3ǏE�э8��Nw�������f�J���~q7��BB�ry�>���ߙ�qQ!!i��%@M�pL�1��t����aF��=��Jk�Ƴ�e� �{l7�X$�r��VU�5lA�˕�vC�n���c��5s�A�>��ֱ����h�j<ٵo�]��U#2�d��L9]߀���֐�~P0
5��'w�|�6-1DD3� �x�*�ν���gW�Eȝ�nH(ҹJw��B��^{[�p�p�MQ֬�%,0�����gjE�P�W�2�|m]۴a�tH��X�Tk�	� ,uA�Ǻ��m�V�_�n����.^hDuU]K]�"��(�;���Y�l�gp���)���5!�$P���+�)���5h �ߺe���S�u�����+r�X!�2���6="��
�8��P��:��I���P�������
��%��I��\��������6�E�
8��֤�H}E��́�U�m��]�2�.%9�ӾX̊���3*�?���/�]�V��H� ;n���K�3��"����1iх��pm�_�}A:7��t��'��i���'��qi$��Ռ$cO��k���?���*c��W8�2nR���8�o�����y���>����ع	%J֒pI��$�c�a;A�y_ ��|�n^ݒ�<*}��ND�    �]�0b(�Au^1��`�xf_�O�:]?=�?de�����o	�n�O������,y׫?��z	���Ax�L7�*�#С�Z>T��iq����J����r
Q��{�w�>�G�6m,z����	�D}S���9��H�2
��bv��V�0`�� B�܌��C1+O�K��Z3�[m����Qm6�٥���$c��Z'ڪ��|��b��4��3kۆ�vH�[�m�N�R��RR	6�*o:?�$��%:�&झsJ'Z,[��J�f�I�{�FҪ�~ţd�0�"��k+��L�EY��n�)&���`Kοn~Bv3=�|{~|���P����"����d~ӟ"<���3_'��CbB�Fp�Lm)��Ikl�4dY����z�`!���9
p�����,-f���?������.�;uU%�ֹ�%YR9`@5C����e�W<�nw//�/�r������D��˻�-�y|�d<�' ^Av&Gu^�V8��xywUb�7�NE�3!��A��Qz^��C�P��ws�=����@}��c��ǢK
:9��A;�J�GVfWc��.�� �of׷�d�T�u�ܽ�7��.=Ɔ��B%W�$��"X�^M"�<]JiIr�-��7����rmE�F$Š%n�ѿ����� ��u������N�9�鴄�!j��Ij�Ȓ�_U�yx �@e�{��u����A����T�%�k�B��Qa.�"�d�-=��[�ri�]�F�֮��X�<�&�15IL�#�Bܫ\;E���f���&��҇W�%���uyI����q��f5Sm@~&W.9X@ʛ�+"']S��NAƂ�,L��]h����jy�������HȜ��9wx�]ͤ�j-��ժ��d���݌gوNѹ������~��e^�@��<-Dy�&m����kDW�Hr�I�VX�d�+r!8ZfˑQ��F��엣��!(w5I���GS��jM�,�cg�;̡P���uh(a�M��%��ؘ
�#
q��kQϭ2N��F1,	�`
���"�$�M
�6�CX$x�����h,�֒���'�7_��ӳ���'�G���Aq��+���G��*w��q��so�F��ދǻ�����5Km@wF�X���fBU9��eJ��`T�%=���S�+s�U���jR�Y��B���\b�nڰա�}�pn2����Ȉ۲��hfG���j�ܠ�)K�}�����*��f�|�~����F(:��u����a����Lj�2	!�n��v�d�K9_g��Bu�r�?K���z�N���y:;dҏ����p�TWc�<���2���Hy��93 �v|]�(<FĦ�|"'#9|#CO3�ֵ�%5t������d��j���QWão��5�w�)鈅Z����9�XH&W+�o������ڈ77Ȓ� ���8C/�:����u�_ݥ��$2�#� ��J
���7.�� @�g�R��������]�F]
/Q`�X���0��Vg�s���wv�N��D������Z�~�Ci�얇r�>[_2��A7�1�ݍ�+�RD�����vx��������e0}��g&����z����N���!�}�H�I� ���&���Ĕ�*���Y�}�ahfޯA:}�J�Щx;����6W�����h���}^F��K����%��J�u�أe�U^�t�-삍�� .���p#>�'�͚&��hrc�(�~�OgSq����?�¸�A���;dAM�Y�aX�i��e3FU�^��r�m�欶�r��E9Db2�� Bp]�O	�|KU`7�`��Z���Ú�r�T�e�#�ޒU$����^8�
�� �ʰ�� ��K�۔�
f���:�
p��? �A�䇁Ñ���\��"q�.�H~�aalu��&wq����86�p�/@��C��y��NӃ�ʐ��X�U]��s�ҳ�zi�S	�!xwGg�s�ipa�f��S[�¼f���[{�E���cBNY:^\=�=2�=LǢS�Z#bd�A쎊�/�HF��#n�AҩPJ�踧Rq�`��Rp	l����;����r� D��:���Ɨ)�xʋ�R��0�(�:^��m[5����4��!՚���s���]�=�&GG>�NnD?��64K�=�h[q;��at\����V9�4�͋m2�i�X�jT�y�P� ǚ�|aD�O��X�'�&�8^~c��ן�O��*F�CU�O��^�VK]2���k�[	�u�\�� ��}|����?Z%�\�����0&�3�� �;���k��o�!��?��k�*;A��F�cCt)��e�Xh�ӿ�g�	��r4�t��3��wԭdS���rB���L��ِ5򢝎�j���Og-&�͡�bܵm�]'ё�8����q	����ɒ�Ws��_g7t'*c��[���q4�u }���-��P�T��"�N��RS�9�n�����:����������~Wj>���6��^�/�@;6lz�6+]�E��`��Ľ�|'�N�2�䅒����5ݏ���ړN0�4$;�ܛI����#�ĵ��+:a��*xa�ک��.�~��Wg����v.v�൐f��Hh�F)Ԯs[͂++��J
��-jb��Ŕ/���=�He.Rg�1ihXM;^�o�E5�Fܒ�e���j�	��re��H�~K�s@�!�#c�7��M���vIg�G/���ߏx���h�&x�2�nV�b ���诧�G��w�D�+ )W=:_�������S���2>��1X�-I�d��U��U�Pw�!s�$X�x���"b�4�?�~JLT=�gS~,�����ᰡ}�x�n2"'�}�yVi�ai��+0���P	��C2��+�]�[6"���FP8�h�%�`�;��V�$z�=O���Q�{��[��Ѫ�DWV��dDO���6�	��y�;d��Q�%��aV�7���*z"]S{��t�r�����f����|�x���e(ʱin�ȓ�سs��-��f�R�[]��{yL��^��1qT$��2[;D��f��HUWFC<���ݐ��q��b�@(�g��,n#Eh��|^�趩�< ����HESR�~x��r~������Q�y����U��q��	3�Y&�&�<��������!T��Wu�S��Kc�5�!�Dz<mڄ&ØB�~&�~�iM�B+=�e����U]�WsN�:cWF�x��.���[)���;�_й���X�.ٝHd��%*�vMc���'�Ł@�����{������)��b�;���a`�SW��h�vH���C�I���ǭ�^�8��)�k�J�~K��ث�Z0�L�F��f|'���X�{��^��fZ��g��~E���$�"�̊�sH[~ꈱ����ʲE�6�d>>��#'ZY�?�E{��}&��D<�B��IUr-�N���Ou�C�܎�A2>l,����0�N��v�����lMl.��99������kC�R��xHuy����<ȒGּ0&���ǴG��#&�p]h<���E�\[�r�ѹqw��C�)���|X_����@n�e@BPǖF��0�/�[�|�������~zy�f�a���j��X����rC�|p�[�I��	R(���Iȧ�痗�LH�gt�y&E�����s��X%N(�W���B#�S.�T]�>/�P4�k�m��<��Xm�n_~A�W�
z�������͎����p�&RڐM#��:6�0M����0R��R��l��9h����=_�����o��A�_dM�J��	�{������&#ϡ���+��6/0iE��.���:����Pv��X�s�ٜ�k�#�׾={�+{��CW�j�0�.�~}Iyٹ<�o�&��⎃������+��Wx|7=莓�;,��Ur�i�`�[;��B�0��m0�O��'�W|��L�NOz�w�(W��� 1'i�a�}o�Q]UD��\\!�;x��@�H;�����t5���k�z��m*LU,�&	K�rb1�#pn�(A`X��ހ�=�6l�|�&��    sm�N1�mT�Ҁ�^�����v�D��n.� [���Z�e�hm�ږ{�CT��-��8ά�#�;���7ߨ���4:qp�t"�8/N�(�?;"���+�����
2W���|aV�0I�j@ӎ��GSU$�#
*����C�c�Y������^&o>�7��H ��im+�_d���d�д4[J�1����3��"��"����)��`)����*4	�� CJ�>�}�a
D��+k`��C����ljOf�
�A�����﬍g�C���_[kT�����aU�]u8��I&�a���r����V�!�x7:��&OGb�^�6��*Ʊ�5����/�ZR�{?�V>�qv�k���x���4�>iC3�n��W�e�cM���6k�w7�hh���a��?q�O Ԏ��Ma��]�Tn�;"�{+����>��椽�ǝ��$=T����A9"�����`x���y��M�G�*��|?�/����}f�j�~U�6�m�ͱ��~5��f��l�!�k�3�^�d���{��fke*-d(�!iP崶XHȆ�q�gl6ޟ���y���fT�A�"D���`uWU>��{O���v��y�K�ZCHy���n���I6zיJ��5�΋����%���錡�O�+�
�9)���ɬ��'v#��qhCQK2��U���n|�)����j�� ��f^|7��j�glW%@�j���рѫ��t�N��.�~��a��_�jFZV�����7��� <�!��{0�1X��ˌ���ܬZw��ye�֓n�څ���8浸}���ˆy�������<}yy��_s�|� ��*Bs��hq�U�
Pi`�PB`bh��"���y�G�-�"O�v�0J]�2m� h\m��ϯm�:�@O�0��m8�.�f�i`�g�������:}:�ʑ��3�޼O[����䀫��S�P$ZƸQo#Em3)�#���&o�p�b�TN���˓3Ȝ�h�	����}���8�)ML��>5��#._���MD�+W[6�}��y��U[��J��7��)�P��8�`�9��|?`Ғ��9 \���ґ$6�x��	�����c+k����Qf7=H��
����L��������m8��dl�~��t?�
���@�K�{�+��
ur�Uň�̨��d�sﭔ����N�c��/��9�����A�����6�2�>2�0}�:��E�[��'��:s/�x?[���h'���W��C�����r3n��T���Udtf�N�^�;���ߣ��T�X���H�1iAp�Q'�5����S���Y�O����a���ȩ�ο�o@Q	��X��p.Ib�I�f��T�>���J�@���2���ȸ�b � �h⃱�DH���|�L��!E�����r�d!eC�� x��PJ~���&SS�b��S�a"��&Y^.�5\���%���s��l�a9n>qb�|"��&�Ѧ5_C���C5x@w�:�n��Am]d$����8���8�-�c���զ�y)�JE╩��0⧺M��Vx�V��:kh�x����K�P�Wb�=Ma��ȩ'*:Ӆ�{��Ꮴ:C����[!-:n>�<����b�W�H�~�l�k��|��:��Q'0oD�y��w��*r) ת6 ��|���g}���f!w�/�������~��v���}�������T��Xf���z~�2�)��{Ƀ֒N��z��1��/-�K�$�iU��`�Gz����U��O�c)V#�+�\��lI fJ��T�(O�k�M\C��w�i��.(�8��'���-�����Q��~���h�i���lNZt�=Oζ�������?��sU��$_�!�I�&���Un�N��d�*���"�h�}f����%5_;���5]�.�1��H��u��Z ��b�U_6����=iQ�*��S��]6"�H
#R������sZ#h����{,�Ҿ��(��Nd,2T��l�+��T���J����<j��Tg=��W��	��8�G�'��I[9�^]�c�9X� G��R��K#��J���Ͽl��<O�w��t����e3��4D�y��}<�~�������������W��_�m�U�]H�����b󉎬֘#�j��dd��f�y�(J�����e���f���~����o��t������ӷ�DXC�c��3��*ca�Ѯ�B�-n�q���Z#�yp���몮������\���B�՘�_^�љ2��Dm׳��L�� 9�q�� `��%����\'�:�s�M�t�[~���O��o�B��[�:�Cr�q��.�X���Z�p]zA�hf^Wip������,9�}���%����鸖U�Y�+S�n�v��[��XK��	�����e����j������X���+�N��bB�����o�i�^&��q�n|!��3�㟭�7�S],�|^��2&�t�=�R
@�W�n-U_,,չ���u�	N!��)N�6���::Q= ��zm����J�<���8+JxW>,��?.X���/�Xt�U�����`2g����ou�9m��Esڷ�s�o�#� ��P,2�/�T/6;���1eڼŅ�YCf!Ӌ�S��Cy���Q����6����O��u�[s�`���EBP��4ph���by7�ү$��{B���QVh�Y�,ג��K{\01�I��R�#��&g�6�?ƐY�B��k嫜�a!���W�������?LUE���F��|d5qo�5j���Y���E`��	,��퐫�O./�W1�T�[�@�z�e�^�m�p��l��)���y�=���O�e����{���DoC�RW�a�A��1�ey*����.���_�����钬����GG�X�������wՒ�����3A���`$�>� 8v�ǈ5��[�X=@%�9�T�6�tGh�r߄�!��¦Et�.R��h4Z
E) i��K���oH�#	�ڝ�~�j���N22�+�TP!�^~F:�(-�N+x�G���B7�T6�NG�ڪ�"��ή���
��Q��[�F~����@�>���B���E9��HȪ���y�Joa1>O���as���}�-Wq�\��NжZw�/,���nҌ�M��6$*Ryc���=\��\^/&��n��P���U����p�A6��M������v9���ke�@���!r�n΁��d�,�M�qߘ�Ҝ&�N��1T��Dz�V�BO�����u�#-#-����-�%��}�5-��Hj��w��Iz2:U�R��2v�A�8.��a9��i��_�y��h���נ�o�L�o���Z�W���8��&�����ޘ7��<����=~�����j���6h?�5Dnͤ+:��[�b�A3'=�b�Pv�o���S����͊ZPB���QZO������IIp�����g�N�w=��0�Q�0�k+������hc��'�4!1�ws�pu���]��R�A\12�A|c<�j;qEC���D��ʼ�Y�U�g>���!�]��`Ql8lwR>�TA�[o��������bU�u])cQ����ȩ���3��D�U�cP`���`�U�h��V	n^����|rY�A���(Y{c�fi�'��_?�Ʋ�h2Ճ��]3�/�o�E��Xm���+�n���X�Sk�����`���EDe�"~
���)��E?޺r��VЀ�/'��Ez�Ð�нu�:��u3f�\�1����O��B2;f[�5��2�?r��bZ�a��I�>��ŀ�4�B���0ZSN�J��3�R����/즑�7��*����Ǹ5[�.ɴ�h�k�C�7	��M����2\e"ȳQ����)8�r�]hY?D��q���M�>���i�O_?�O%R�	��u����O���"�M6�������}HfPp�5�f_&��G�c���
�R���D�_�w�1Õ���/�U]ISrM�p�H�U���iy�#�����U@C���G��}��X�w    /���ԩ�`i�<�c	^��NW�2���n���.�@Z�����3?|1E&�*�q�7H��ՌT�$o��o���������Mp\�@�?�ހ�h��7.S�5mџ�9��Ft�i+��*�MHA�0�Q�-�a�aރ��#}k9��Rm�!�\�6��n��`����u"�@��f���
�JYF_�#+��BiҵrE���U�1�Pލ\n��5mL��G�^h��J~�o� (Y�������?^M���$\f�]�Ђ�h�!!�ڸ��C�d�|oYZ�z	��!�!�d��~%�8�	'�:au�%Վ����۵(w6P��U;�I��yz��{�Ļ��B��ω;
G�8a�G&�Y)a1�)�����KΤJ��m�Մ-��N'��+Pܷ%S�
}$+�`��	�O'Њ�y���Q�A��1]�V"Q�A{�T`g��k&Lc�=��)��p@=��u��:C�+�ȑyB��N�G.Q���j�,�2���w�BkB]r�}��D2��hC���C`�^�ܞ�/��e��]Mq���!	_���`г�{	m��W�퇳gbf���d��F��>$�.��UgΊ9���ٓ7^�@������1
�����Ժa�0�e�y��lz(�ϫY�sS���I��಑�_G%�;݁�:(�Xm����
��lc�:��E�&ӑ� ����3bhL���֙���������g�����g�l��n���%:�F�MA����)R��j���㎾gI��+ُ"���p9�e��3�6u߀,�D����ϴvX�{<�X�S7њ�P���#q��)a�s!����L�-q���gn ����pW�)��0l���!��ɚv������xJ����F�K�#K|sϓ#��b�E������[�Iy�C���;�(��k1�7 n��V�\Ľ]��׋!��p�D��х���V�*�)��������)�/E��<ۡrA�,�ε��+�v���
Ml��:�[@�����4'��/��38��*@�Ƀ�=�h�zEN3���O��dz��wJ���K/��ډ�)kT��j07�{���Y��CxТ)��l��F�UL��c&V��F�x���2*�c���39�Wt�7m��D�4��ſ��:�FV��	R&���]��P���P� �G*3��1�be�	�>m�X}i�$?'�_[GJ����rcm�~�t�"~��L����"-{��o�.�w�\�.���l�>�ϧ���lu¿��-����J7��S�\
.���'KI�1�+O�!����p'LG�I[q8:f�<ē�I&��jџ��
V��_7؝n� �D�*Z��5����%��R5���z�h��{{�в-V��v�n-MB!�ǣ�����ZN��@+�[m�x��}31s�ܔh@�Hrqb�5����ч��ۻ880QD&vט�ND����	��zW	�qK��c��4��4jU�ƥ�̰�L,U��6�c>�����J\���	2�D��儫I�_��Ia�;c�,T%�I��%:��ue���S��m���CF~��Y ti8�0_��&� ���8:Q��QX��&{6��w����#��e?�^�UBg�)�8��8#`�K���r��f��X(��hL�Dý�񱒏��<;v ��<{�O,���6�oLqOU��jQ�g����ٚ�G�e��au����Hc6M�z��cU�Q����Cs�#g�=������C{�Eob��L�Zz�������?uNV�j~��#�u�w�J 4��d�7HLE0�F�A����.0�Qtq[�98�i��I<ʱ3Å�a�Z�f5��-Z�K��^�mJ�24!���8��{i��x"� EFH �t�S�O���C�����oXʚ��B�7������|V>%6��V���w�|��OӒCg�}��=��J�F4�o�N	��l��s������"Q��`�e�I����9m��FJ!�X�~�6���� ��/W�0�-g�s�j�q�iG���NA�����x"��J����1�O���M+L�i����AHy�-�UQw�cUF�x����/�,�أ���{]����!�](AnCJ ��6�C.�_���ıV�?��'��)�".K�����4Y���'�S��iQmx�Λd�pZf�,0iƇR���V]$�"��s�O�Ӆ,�샱M�O�nw
���H�*rM$���O1��MX�H�7v��i��.S�ҷ�-ڶ��x��zb�E{I���h�a�w(�F��0Uu���ź)���.�]0�l!U��$Ʋظ��;��jg�����s�k���f%z���l[�Z6D؆{���
ys��r~�j��7N��Bk��s�ښc����\��/ߚ�Φl�a��ٔ6�\�t�ͻ���<8�;���y�� Q���vd�*Z4�Bݏ������v@�����|�F 2\���Īll[G�%m2d�3e\��h��:��z�O�6�A�w�L"�
ɂ�sFC�E?�Y&�-DS%y	��N�+v���޵]�&uu�UU+����n]�hI���7�ipIZdvW�����|��Z�g�>�t���Ԭ܂�|�*��-c-����]D�*�d<�G�'�'9w�LmZU��|�$M�-�˚���\vȫ7n�Z��r�F'֪�����.��-Snj��V�)�u����}z����Ө���35�l<�f9%�sÓ2c9�m� AjD���v ̋���
R0�c�������b�ѐG-�^W�Qt	LO�I�G� B�?Z��1q�C��ޙDh��E�j�*����Z��W|�+�V�~_��ܴ�ҒD`g[��ӆ�l� �V�0����=�;��HLϯq�4�����.:��O	BJu�f�T�k�M`��F#��Lu�� �H�\�ٽ�w9�+w�qyC��rOF��_�ꚜA���q�!�R.œ��vL�S����Y�Ҿ��;8^�u��C�P	��C2�+5\u�;�9�Y��+�K�t� ��o yZFI�H�%s����~S!�U̖�^k:(��d^٦5�W�uS���N1o�C@[W4��RD��e���S�/���#�Fhut�(��\���h�Ў�������I��
bԕ���٢�o���u6���n$'��VF�z��&Y$��x��Њ�%���*`��/?�a��cб��8|烟B��'ช������y~�{����b��]�o�I�t"�L>�I-Y<�t�StzڬJ	�$�ߕ;�1�er3�U����y�h�.{��VZw	}�����Z	4L�>CY�}<Z�;q�&ZKѾN�Nh��ww���a�*Ϛg�.i�QOK�(xImȬ�S��t�a͊�d�Ln�U�������YVM�}|EN���j����5j����֙.�j�z�BYe���i�#i\�c�Z(Tb�%�!�h'��Mװv��m�Qt��]������<M?��?�D����������_ͯ�bV�8�iKH��Pk�A��V7�T�r�����ۖD�󟶿MR���U�(���sO٘�$ϯ�Dԁ@��vI�hLqzO�,6_��/����������|��ax�@N�)&�8+�	���Z�\���g��GT��{����[u`������ܸ��	�������ϿlvX�ӗ���D���a����F@_(|��MkZ�E�����JK�Ǎ�]�9'D�QR�,��6_��y�,Q
���5!�`ێt�π��L[���1��Fg���_��m��_6��t��y����?O@�� ��<����g{�ut������N�N��Щ�8�dr�6_A3HG����v󚊫�Y��uVZ���n!G]��'v1cЙw-� �QR�y�����,Ǘ��燯��ú���>N��<�Y�P�ҟ֋��ȝ������ު �P���=�Sb�l����8��_7/�n��~�P���
�]��LO�3,�@��Ϟ_�<�$�D�/?���N?>�Ng���l��;����\�}�y&��(e:�S"Wh����9)�`@'�L��    {mW�o_�6�e� ���i{؎�{�^b1W�����u�-�1ũ�`�K�Xq���s������@��hLi�)��Ţ��N�Ӷ������x�d�Q��Tjwn�NC�%���!&gۗ_7aN���ׯ߶��O��ׇ�d��C��]�=�Sr%�7�HL	�:�t:��(�)��wō�]�:)�U�^�_ib��Ї�����KZ��r(L�o�锖4HW�q����7o�|xݾ�LBh����e���l����>�F�G%���/�k�!�R�td�vY�
@+�`�BG�8i���ա��	Y�@V�x�a��%A㒞ԡ��Z���I�:�wan<;�$RϷ����Oۗo�'_��������z؜x�t�y�ϴox����=�����G}&CUKd��f�7o����w���%HՑo�}"ݵc�f�ް̛�o����u�乒�#�Q��
�A	��׫q�F�����'R�ۇ�K�{ ���.7?��d���:y����]H����S$�%p@���u��J)%��*�R7�R#���z��.+ z~����sj�N$��)��U�'Yo:(j۴4�!�x���|��6z�l^��X����������@-B�C^���\�Q��ʒ3Yǔ��C�b�aH�N��"������$���9_���V+��'������W��R�q�M��G�χA�hG�U�"q�NAE��dJ�D��Gw�ݴ}���c��L:lG��h�)�8�ttZ��U�eڕ�I�t�k�:3��L���/�_H�?��t�t���������FW�Q��G®Ps�k��o���ё$p<p9���;'�4�CR$�pĚ�����.�d�m��y<���B���Gy�$ncƟ�|q��;߂O�{�G��!�TK��ji;�l� e�n�e/V:,^�S�k����5NA�c�4&V6��
|z�$E�{�lAoLb�k�Y���Oп&�æ(��=��N�|I��M�?x]-�"dq/x;�.�� �Ǎ��8��-6�_��[ǃ�5SKM�hX���k\�l6D�4ڷ�Ȩ�'��OC�����ȸ�<�Җ%��������ot�gO/���e˕)To�x���uܻ��W˳����2�`�F
\]�2v��%�Rq�:�ˍ-��Ba�eМ���345u*�ګ����?tn���]�UTA��O'��m��HE~�U�<n%�q��-w��ԏ1Ce~�8>���x�5���ٶ�����aÑ�����H0eA�v~����^��/WW��i+pѮ�{P����Y\M2�Z%�|�����	���1�x���l���l_�S�w
�L#b�p�����2Ru�M�����N����;��#0�_±�ڦ���NYB�X'k�7��{��Fd�}�_ �>o^HE�n��<��
0�@i��5/�;d>�D_l^6��_�M�..�t�A)��K	��ѳ���=�$`ܓ�e�����<P+p�o�0Bh�_�c�HS�E�P��[\֨B�9��Ng♶j]4mZn�-T�g���������c��GX5*R��X:��+P��,��>^�̾�]�:]?=�?��R����~sܚ�>���cޢ��@��<�ԝo����p
�h)��<�#��������`�R�����~�B'�
Q�����O'�h�-��qD��5�i�������rt�^���6�H�>W��6٭����	[g� ]M��?�C�ܾgϿ������u��/އ�_��<O����d�\���3�+_/?�*~X�w)u���CO�R����:��%b@UQ���8�<6{�G�(��bo?�+q�5��ԵTeU�F�n�r�V�a*~_�)�z�����dܼ�y��@�����N�Yd����=f�ɖT��4"�\
@��Vď�I�S�� J�@H��v2$�p?��'�D+%6�sV���0�8Op��{�yZ���|y������fok�����q}u�P�`�}r� �].�W ?P6�s��O?�<<�9C��#�g�g:d��4��T�֡�G����0H^��*���P�/�ZKC���?�>��鼛����z�T�dX�\X�rG�i�HV������d�[�:�������u�eKS�������6$�+c��4�Г1�UW�Uߟ�$��f�:1�MeLnD��4��o/4��Gl�_�%�}��H���YC�����կɻ�v5V�-��;6?��2V�����ׇ-�=ea߹���P�|�7%2Lj#bJ`��		Ż�/5��a�OIw�yd#�;����K���뷇a^��ůR��-�:ۺΛ�A4c[wŭ����z�����6�H����˟�_6�Є�x���HuI0����O.����o��^^m:ޢ���[<�M�e��M�߻�J����������ۻ,)��3 ��'�ޮ��E�{	�
aX�)>�=d��b0n��}��]m��W:_�y�;�%�x�d�8o}1[��:�B�xJ�¼a0��i�.O��� �m��Ӄ��dhF��,�N�Eґj/��6t��`��2H�y�O�B<��_��`��A�#�^�����/W��C��zv�Z�Η{-�+ZS-���mkD�S�Ux@��9?v���������M�e�	}b�ն��Q�.���&�I�]tA�ͣx���������&�Øf���}�;V����Wv7[�#K�m��������qo�2�x�������qs��~���Ej��U��N��ɕU&k�?ܓѕ�l���\���w�Z�?��<{3h�Q�fv�^-G��u%�nۊ�{�4�E���+�Sb��Rɱ��$� �e0e�"�,�+����i�$����jY����q���k/8����p�G�G����z�rW� ��=�@g���\r +�ԉ�� 9ޕ|~��#ͯ�F��F�9�?>� ��o��$R|��&�k�&d�X�8Y�~,�DhX)�nu���V�%l��?��[$���DBJ�&i2��AJ�f���r�����VMV� �q%��&�ٝ>��Ǔ��I�l'N�7gN�lʜ�щ9|#8��e2�@�_ ��U%m 0T�X������ƴJ�����o��̌�P��0�7i ;�?ƮG> t��5�5�nR�a2�&u=޴���ї=����6�G'��dI:rl����ՠ���`iC���D�h����Ǧ�Ac�zL�U5��J[WUF�W�^���c`c�c�0̛�!~\��7�1v�X$PU�"��t�p#� ��.��y�BcK��G�����N�������h�Bձ/H�q��V�$����-W���LW��$K���F'=��5HQg&�Κ|���8����U��A��i�q)(I�y�մ�^-����6�M4��B����Ea ���� ����\��;��h2�c�#Zݴ��Vtl�TmV�][
��ޖ�(,=�'`8���L����_=z�EA���`��κB�|V�Ej�[`5PA�W��8#���ޒ�
3�]^nĜ;�GZ	+��uF6Z>3^���ϓz+�����k�E��1Ź���Yc�U6��M�>�f>�#����:c���J���bd�#>u�%�����iO~}x���ҷ����de>"��b�����&)������~�G	�PqS�,�KI�!���S|�AZ�e�����H,��G�5�v��&;��xJ���@ښ���Y�%�X��h[]�?G?Y�V�m��]�9�n��F~�;p�'f�����XVS�<'�F�B�euZq5������6��%��p���MՍ\��Cə�҈d1�P2�Bu����>-����#��E�G�Ω�W$�I�r2�iy\�rs��~�O��*e���Yn�&�$�/�0�S��0��ʈ�`[1I����G��<_��@G�<�w8�՜K���%�E���ֲʐm^�5_ϑ�4Ũ����ӗ��R0KN.�VD�E�d�Ħ��uu�#�$Om�qQ.T��5�A_H�ß���_d�.�}de듰D�$�0����j3��2�J����    ���1�/Ƣ��!w)"�,��|��
�L�w�3 �VQ:�4��'\t�����D���l��hurE��u����8Z�<2*��ͯ����!7y��pB�TU�t#t�����b��������9�?;G�8�ͽ���r�N�\���z3r�K��j&I ��3d��B���;��o���S�d���t�O�ei�p�ƕ��XD嬘y`���~��^?z`w���FZ2����X4<S�t��Vȶ;�J���A�GB/$�������)N�Ks��-�J���TzZ8����y���s��)&|4&��j�4 燧�S��d=�VWE�����r��I�ķLF[�7�ê:۾'[��6���j�_څK��u�D�V)�a[�^p]�����M���������:��ۻ'*űeT
��.+�f�5��Nc�����G��0`�����CYj�=�Ko����&�G�-c��l��y[��=�>ڃ�d!���.� R�d���@�i�2�,e(<�6��*�Z�C�~�7�2!��=���3ΰ�=�˞��^��q"� ��%���1rQ)P��4m������
~��.����5���1mFS�Yґ֍2�����C�P���t6'�:�s�3��XY��1e���]���l��P����ۍbS�8�J�� ���3�BE������HF����
��u���0��Ƕ�E�:�N3}���d����h	i �n��n��mGfx-�\x)X���M;i�䏌�"4 nn��Zb!{������U��75�C@�B��N�W�HGl�xa� .0+Z�[ ���?l�?W��:���T��d?��n�U��h@��-���K�P�e�;�9I[Y�M�aZ�d��-��)K֪R�����J���_\�7ha�c�d@�Q)ʵ���=B�w����L�����.���*2��?ϐ �j9S ��vX���^Ǩv�B�+%���H��*��a`��������B
o�y2Ni�ttkoE��!_���}�.�����x�����I�0�®�����l�F�$�&��ı�a7���UV���}K>�U��Wv�J�:�SIf�D{u�44|���$U�)yG��U���t�B՞����l$�-m$+�H�^�i3�Y���Q�+�ev���>�z��J�û���Y�AB���>d`��\@�;F��ԋ}�8[3'O�����-S��d��"�g�7�4�J\��;*���W�ڿ��N��	е4FP���""ނZӎ��j�CNg���|�{� ڻz��@Y�Mޚ��(,��(��q���Fa�#|�sA_kG����[�[[��-��*��
֖�uvǕ�I���D�[#�M��*4�w�2�Ӗ5�b 6���;RiW��.]XW�m�����T�'�b�*��|7�D�r�t��a5�L_�w��n�1�&49�R�i����=Qd8�ɉ]�UD܌[6�[��:�Ѹ��F��@����/tIM)�^G&�1���>���ٻ��Wc�l]q]�v��J���N��ҺX�i�����ʐ5$�W�1���H����� �;�U���C���byԜ\�ɅXd���O(yeE���h�׿W�\(���Y��8�c�#(�$�+�c�TN9ݥ�0��B�2�I��M����i�ur���+�x%��t��X"�&�G~���]�lO�����3)�gv��riyfc�Ҷ���j2[�%�$�I�^�:���Ѧp�A�qӎ\K���(��@�,��ЎD����9��R{ЗG���Y����������eģ{\x�H�;�T�U���e����.e4C$D�e��`\CW�f�7-)>#�Gk]�Q����R��1	-�<'�Kr>�Q�,�5t����\��ݦ�Tb�$O��q$H�8ŏф�H����������o�^w��}�k0��{[x�M�ZT�n��8����*�;�X FIvK(u�>�qD���V{��=��b9rM��|�3V�:h�4�8]R�
(�P���q\�w�|(V�!�nm�ź�98^,�S��[��ܹ�S�a>e-��.�l��]�8�؍�G�O�BO�ET���u���W/`b�蓄t1�U�,�c�x�q�b����I��8H��9�Uy0�k��������	�mT�d8��g� �;9���(����c(�ڵ����΂�ώ�?���2��'�'�m5\��bW��A[G֍�T&"���8�F�;cE��}���i7�B�el�f	lt����@��3��g���k�}QY���ʓ��A���׌���z��J����A�wI�͇5[b�3�����d�r0z�}B�1�S!�"��d�㦀� �Ў*\��[%�<�my�z�D��ih3�$� 8J3�&xQL���~��1k:���0��w=��7w-ɍ�Ft�}
-=@U�7;JbK��H%�V���=��3�b� (VRG����UP��y��%�4��a(T2CU�f\�ށ�"i�@��Z�d��^S�#�qr"H�w�{"�&Z�Ƶ��锍��)��zڝh=��{|��--����?f��둗�Hq,��"ch�E�ONYEal/�4S[��;��wД?�h!����͕T�ڨ�b���q| ���U;5�z�_�Gבh�n���'�18�B'��+���,y�'�04��2h˽�sgd�	�r�O���I�ق3Z��)2m�v6i�YZ}O�W��ݒE{p��8�=;��LL�d�",3@O?r��G�u;��)��a0�����v�3��S�P��ہ-lC0�)V�}�Tݜ6��F�@��p� (/��%��'~��Sb6����$�>���iw �Mf"ː�g�u������������A6���s����"�&dF��0N-ZM������v?�t>=�w M@�1,>���Nr�ڹ�7(%mP��wrT��#�������.2��р~ќ���yל[D����,� �9'����
��,e����8-Y�.������GIn�i�=��0���=m�<׿nN�\����:�0r3�0�0�ǘ�l+vg�U���
8��wpC�<>&��O�&"4�,F�A��lQ� =�6&3���Ǐ�U��QF	^Ei�2��p�'�(�@Hv�+��Ώ�8��:��.eZ�~���^5zR 6-/��XT�ړ�����>���:9}�+%-��0�����e��hB�y �=�zRiQ}Q�>�Y�j}����GB &T�ư4���Dƿ���H'L�]	t���.F�Awud 6��B�ֆ���M���'�����RlC�z.��dye�^v������s�tt���)��O��"PH��;c�����k�y�hr.�q ׀�'WOzt���!kJ#�"$���-���zD�k�&n�p�\a�\ѻ���D�{�ݽLmp%�R���y�Q�����k�y��	m��!�Є9�j$��e�O���-Vl�7��\��#��f�q��vrhMO�tP�:�
��<,��Ȟ!!������A�(F�gP��A$"\00=v�:�1^������ա�w��?� ��������1D���zȺ�%�����A��mk��i��|���Cs{��9~;I�b�KO�J�|<��!�˕:��~�R2B��o+��d2N�m���%vvR0���)T�zr����%OB�Y�f��j֐�Ce��Z8{��<n�@+g'���o$�d�A��4�~�2���&�������g��󂺻;�a*�ǢQ��q�ɢ�����`�����B^�QC�E�ۖ�Iv*ʡ�{U���ϼ��W9+?c��-�:j!�lی2�A@���7�	G��&	&)���=Y�/���_�K,�.���؝v��ö�O/���*�!�d��E�$��%�ʡz{|8��9=�ҥ��F�>݌ɠ�:P� ^'+7e���۱��|�-Y��MAvz�N9A�ơ�HL�˴���^�t��1Y���1⍖&�q�(�z�hA8+��/�WZ{tR/�0�S�i�f�
����o�H�B�&��3I��p�����f�n���<I����K�d�s 	  ���*�r6���'q(f�m��4W��6{���Xb��oEV�}GP��N'�^ՠB�8 ����L����q�߼���r�䛡tD�%����z,�r���c�|<esEĒ�i� �fm7Al�*��������D�(�>�b-�iCkឃnCVl�T��<���Aq�����J��K����U�!�D�Z�� �j���L�B�F��	���D��x{�'��Q-�/��Q���H2߀E��8 �a/-��Y�6!��ĳ���o߫k��7��![!=����T,E����1H(S�E�
���cu璮0#l)JЊt>�z��Z_2���NwC�x\)n2_��hO�eɗ�t˅ӠՒS���R[�1��8>��re&�A���YI�ݿ���)C����P��\��8޶��ҬF]��w��\���ʹ�y#�bT4�h
פn�Z��c��nۊ;)�Pq��1�������Q _�2��Sʪ�東{�Ng�t����f�ߜ�Ǘ��v��?����}�Wvu��hZ`��8hhu�5�/��"�NMlkv���+�ە\�Ր� ��jE��Ykq����JE�.��4����p'�גϻ�.�.�_��y����� ^�ꔣ׌s��N�1δ����a#�u��(��"P�&j��8&1�TD�d���yr!��������$�<2��ά�m��+j�K�tm��Y#
?g݃���nzM�x�,qb?�?�r�tbk��Eb���ؕ(�
�k|�Q��,� \%s� $=]o_�S6�U��cG��qS_Qe��9���|�I#���9g�xd�W�������x&�X9�Y����?��hw=��?��.�r?j=�3�J��k]^OޤP4m�aDf�PTG@����Ȫ�ǘ��E��K�?J��>�|�����j= �K��}00��a�okڌ~�)�8q�p��:���9�U�������ZP�f��59F�M
��e9�|h�ijC���7�1���o�����[�i��"�Or����b6�|��B���6$���C��鸍��<���Æ�1�/��UQ�[z(�h���\�-�����>QHM�8rs%�z\��H��6b6Qç:�в��n�q��	����܈�ۦ��v��e���y�ރhd�@�f��?�!���OQ���ūf�!�6K�`�7o�o��&�1cE�l���﮲��b:�s���<�R�1[�U��l��:� ��siي�xY6��cVs�3Ruw����ɭB��۷���GdY�N&�)7J-�6�c1�@g���^�ݐ�c��@n�o^/��F���.�5���ӶA��01		L��Y�b8���0�@T`�,$c���Yk������������DbG�ƪ��ґn�A��>C�;����CKj��D@\�Ipj��6�5u�Y��&3N��v��̨�f*���G�1��A�ض��0�(@H&ӌ�$M��d|�(��Ӷ�����ց�hn�T�Ⱦn�5�RwYʣ�E�7� ]Y2�ǜj�A���>��`��}�ӞM=����)jG;]�^��+\H���]����{�Jk"~�*.G`������!!����EԀ>��7��8�{٩�̩�U���'�~�l�@�l�<y��������7�d}�k�}����%^���
�
L���&��!f���&�-��u�1^�cs��t|��Qp%��h�µv��R�!���)v���	E<vI==h���<��������¢z�NfTM"R�gt�\O�G��xWNj��!��T���c�%yq����|R Ǔ�4�������'���#�1B~��0� ��Q�x	n~9���c��p��=�t�+�	�x���A!
��*b�J���12�"]�����I�� �_��F�+��n^��(����gGk�M#��b_c�J�R�\K���\.L9��ٟSș��wi���ֹ$ٓ���f�"2ε��oq���Ku�Sʚ",��tVS2�L��z�Xʦ�P^�w��;����>�6]��d��B̳K�+��m��l�L�]���M�Z���t�J��k��T�p��(P��@��x��;<o�O[|:��K�,_]��Rv�F6�=o:;�d���ԝZ��:;7yV?��+ɮ|�Y��@F�)�5臔�$Y:�LI�A%myd�c2b������]��oF�%E�g��Y9I�?X@6��KBJ#��ES)~0ŸV��4dŦ����{�K��aE�tp��j�Elŷ[�[�6˛��]�-�崕<�+�dVp�4Y	=u����t�&��X���ׯ_�p?Ѻ      <   ^   x��1�0�z�y�@)s [�C����w��'H٤��CY]�\n�i^O���XŇ6'u{�1���F���u����=�Yѵ��F��      4   6   x�s��q�4�rs��tq�4�rv��q�4�rr�Qp��4����� �
      8     x�M�M�� ���s��bH�)���%tV#��o1��x��6����9�w_�w_O�8�p>�Y/}
	��޽��N(��2���ng;��kq+�]�z1�;Eu̺�&�1��1��Y��W#��-�ŏ@�e"�JA*�
@��
H
7�g�{2p�c��7�1+�1�@�~�Zj�=���)�tXJr�<e�0�Ɏ��\f:*��,�C)��H���ɉ����>
a�U��.6U�+"��z`�1SBUNN��������I{um��B�~���3��      ?   R   x���	�@�sR��
x�+���x�ɚl̙@î�������^�^i�P��,E����y�-T�V���w��?`��      :   a   x�-�I
�0�u�Sxq��%!��DW����"�Gi��T"�i=UPV[�Mb��Gj�N�R����Gvf�H=D9�$���#�De�+� �]K      6      x��]I�,;r\�?�.��ᜩ� ��ԭ����Ed&�͜Lx�z�n����9D���y]����_v�������������c����{��I?�G�0�[$b��pf&0�[dbfbfff0+,�6�ܦ��
�pf9��
3���L�7g�O_L�gO�[���4���38Mƙ9�̰���4��,?v�Zݤ���_���Df&� &ĜG���`�M*e��I��?�{��JхY3]�<$�E�72Jv��rL�n.�Q�q��!�9���zy�E�=�Ae�^_ʚ��D�!MfS��p+ʔ�4I5.T8'W7ɧjzp�V����D2�8�p�srwn��"\RE+��8�I.e�_3��s�I�
�s�p-�K�v^2Ln���F0�7í�����K�h�eUpц�r<��
�B�E}��BEWz�N�xp�0*�f7I'�?8�Z�p���n�^�T9Ղ��L����!���+���s�T���*S}Z�+�;���o&�pQ����.hr訫��⛛
�6O�\�5��
���jӞ�$�9ՊZ��M2�R&X����O������e�6�w����R^�h�AJ��	���x�AJß��5��.ì��E��K��	�q1L̨����i��$�C�F���u�6��5�!f"�So��t�T�FP�����t}gL
EL���c�u���}��D�
1����A-�t?��RM���	W�~#�.�@%�rh�#��j�/�S'\���&���*j��$��k%ؙ�g�:(>�����dQ-������O�C0П:�D�;Üo�!��LM�Zg���f=S��eΕ3+��T�z2�#XgC���*�cs���pt_�qN��Y=��'����nS#�W���A�c#�C%\�P`&�/�MU�j���c��]Fw�pI�1+�m�/��+y^���ƸG��p�ǧl+�q���Y+�\��R�TڽX�6V��T�$�R͘Y���!�s�ɢ�����Z?������5;s�u�>�tTUKn#�}��LM�p��g�5�h
��u|;�F.�{�t6h��40����A����^;�q}��URn7��73.y~��_��y]�k,e�K6��>��zy����������!������zN�V�,���AMn���G���#6���PְS�lh�(7�W�j��$�H�5>a���ܼ���x(-Ded#�M�+���o�y���0D�6گgQ��u��w���jU�z��g&\Ӆ����������k�L�c��$U%�f�+�N��@cɡ_/�;7�\Hn|q���H}�ed��tU�"\��CP�+*��]�j��z��D*��r�0�Fo�#�w-w#W��n��߸T�}�[�^_��p�{�	I"�6���p	H���ʅ4�S��Pұ%<j���0ڲ��>(��bI�?�=��AR��]o�n1��f�ī$���Ę��0�<D��gx�B]�*�Z��>J\
hZls�x	�h[��� ��ʅ�K���q�B�e����ᢗ�T/�������߸v�>Ahu�I��Z�Ou��GMnCTaAH�po�L=tC5��&�[��pg,��d�n3O=X�À����3w\G�S\��N�p$23�T������qV���BT͝�k$:!����\	ת���{�WR;W�����;W��T�$��tATͳ&+,���N}Y���\���'�PU���w*���nT�\U�g�"5.��y}�{13�\Ȫ{�$"Ojκ�xAV}孅A|%\Ӆ�zv�1�la�.Ȫ�3eQ�t�=o��̸.[CW�����`�BV���) ���ɠ��5"1��	W.T5��<��`�1D5ܹ2�ȍp�BTce���N�f��m�e��!YhjT���0zdW.45��̃o{�ԓAR�Ke�1Ǻ1&%(j�F7;���5�C%]L;s�8r�'&c��e:��.�1�<>�D��1'8�a���,ù�l�e��Y�w�p
��=4�bg���U�4�����Ϻ��&�H�����	T�Z��k�!�jr�r}���\�-nC��J����y�jT���@].�:nżn�qk���6�g&���+��ʝ�N�9�Kf�&Dr��/��J�@SF�?�v*4���%�F�R�\Dg览J���V�D�r�!sI,�)3�г�)�{qo4�սg��Bk�:�4���y�$|ldlb�k�p�s=6���W.Z}�����>�r��yl$ZNe�cB �V?��E/X�
M��%!��	�,Cٟ���L�r��5�md�L\](K��
�=�m�&�`).�Ƕ&[q)3�#5��x\��q)�I���J�0�Qc��������v�������T��^�GUYTUs�p	0RUi������֛믿�T��\_�-G��]4���{/o�7/XK�v���������,�A��S��#Xn�2u{�#�ڊF�&��E;(�|rР��>��F��Vo�p�BS���/���6]�z���
����5I��w�vcE֞%e	�y~��o[����p�3��8�hW5�"H ���D�r��u�C�N�r��u�C�̰.Z�j�6�j���,ʏ��{�<�����&��qp3�A�[�H��z����{�k���6{��K�#�/n=sk9ro��}q�X<�*�`)�;�;�a�;�:?xGzv �mX�`�P�Flo}p���}��6��1�\h�\S�*�p�ehʼ\�	�"\Ӆ��E�s!\�P�-7�D�p���~㢞�k7Ұ�l�.�a�m�}�/\���ڰq�&�O�t]������'YH#����l8�i$�� ["X��2ٔ�wu�B�����Y���I�mX��"\�lPUZ^̧ ��3%U�:��s�O}d��7_G���J62C/k�!*Tg�GЍp庪�����Ņ��X��.�+�ʞ7=�Ƹr!+t��t��Kyd���l+�c��U��6�!���BU�W���&�J��rs�}%{�RO�!*����vB*AUy�����I�Rۙ��\=���M��!�B�� eG{�]� A��{7�a��C���p�.C�07L��~�+g���eV�.�5YçF��a��6"�上*Ce����Jv�PF�n��Bq��B�lJݼ`��Φz��)��*)�T�
��׽B�+�T͞�}ei���۹����~��S�24U����Ǿ�4U���h�a��I�6�J4z븚�=ƌ8XҨk��^��\�h�5��Rqة��N���eF��OA��m$�V�t+��q^b�%݊�j���^�a�Z���U�K��e�U���Bƕ!6w�3�g(��%ʴj���HE�ֆ�ة�����+T�F�Ò�E8O�s��:��S��!��+T�ltL�זР����흨��nPF��p%ޘ=L�s�2:��ӛ:���e��6�����e�~�Vw{��5H��M�R�aP� ���M�z�����lugQ%\��^�C6}b�<��;�����>+�,�;�&�7�� {9S����r�w�ra��"\���Qd����nw�N���JW���N�'U�h�ޝ�6�ϡ��ܑ��9�� G�4���p˷�P�$�}���#�t!�I�ൻI�ʘ��y�'�e(c.OL���S��#�s������#1�#�)��j����f#.���E����e|�����`��j�&���pJ�\ȑ����ip���C��VD�� �&�5�
nu�����6P�f?�<�#�a^�Ȧ�����P�����Ɛ��ڊ�o'�ˑ[��X񸹡^�a��c#3�A8� Bl�u�g����ǂ �����p�A��a� �g�����`�
�f.*=粊O�D�m�-,H�I���u-��z�?6��ō���2z~݃�W�
"Ķ�ၚ��zKĖ���[�g=X����%;R;�:�
I%���q�q�
�Ö�F�.4�^�����`\��??�;�-�aK���#lPx҅��F�.��M�aK�)�}2	�WXA|8p�`�NM.*�ٯ-�A������u<Ўg�0+����"y�K[nߩP    :�,�a)�����1q�x��,y-7�}F�'�P!x"$K��#ג ��~��k,�`�">l�l�s�o�(�(י�Ǳ�na >lžp�1���/����4����ᆅ'�UqQi ���m� ���~����m�R���]sߢP�≝��߻s_�/���ֈ�-�w#\�\/��s���<�c�[#^6������w�xbk����s%\�M���}��7�fp'�l#�#�,�{$8�;�$\�i�N⚽�yg)p�e��&qs�����ʙ��t+�k�m�#e3��p�_kn#��/�Z�r����$}���K0>�TU�{�E�?��=Y�UW�����R����$ɝ�&�9�8����^�h9�V����Qܛ�E��ƌ+����E�E	CJW빡wΗ��d?�r�#4�z؋p�3|��,��0����oh��m�Y�@Wipov�`;Òl��rs���jߔ�/���Ƹr��<܆W+��:��^Ez�{U+��.�������.�@���k*�N:tQ�mxP6�AJ�.�Ft]k�Ņ.(k�W���A�2���*��Z9�s�e@���$��Ȣt�����dy�c.�m���\�a��6#Ζ�p�)�^L=��Z�Ԁ.���~2�+¨�	�*o��a�Q������3�\�Q�2���n��N��j�U]����[vX[���ꀍF=�˄�*���-s_<,�jd�mՙq1��2D��H�ߩ�T[��5-df�Q���Zq�}w��ϯ��h�mx����zA��F[�E�r!���f����k���6�\���]``ִ
q�r����J{��+���ݴa��-��{��-���77�=F/g.ճΕ�A�md"����j�:�)͞�\�
i�57E�x���cT�2��p��{%��{5�{��lI'\sa��̥J�f_�����.����J��+���� *�m� ;�Z^�j�፪��l��F�b��l}p�BS��Fga�p�r���Wg:��_�r��1��4�z��Y��g"X�P��*��(٦\�j�b���췥���*�-~��\�jf��kw�^����n���L������y�z"���k�w�8R�נ���g4�C)\_:��ܯ"i+ϲ���v��"i+��=�n&�m�Ñ;�u�Q'�^AZ_q�t��������,,�}�!���6�m1\k��|s3lt�R�t�d��ox~����|s뙛��е��o��k�òp�Vp�>e�AM�k��6w��k�܉r�m����k�u��0c�n�6,�ߠ��d+�a6r�`�8�k�2̽��u��k��]�ɀ�Q�:��ͩ����Z�!���s���˂5Y8(����ê��f�<gvj�9Aj�k�rm�#��j��m|��R1��!
R����i�],\�h������<W.������`z�j�����Ӏ�aF�0 ڰy��>.Ӡ�L6r{)�Z^H��k����Cyi#D �����m���m���G��.�����P=�<o:�����8�X�r���n��y�q[��um,?ΰ��y�6��f����%����6��&,����͹�3��P��*�3���X&\�i�
�d�W.���o�YU��8S�Q��k��}�i�7�c3���i�E܄��.��:1	��p��L���f۷�p��� *ޒ�� ���L�jI�¾���=]��lBV՟���<'�PMȪ�3w���6ꄬj���m��`�*��v��P�1�O�PUu7�˗����	U�J�(�8��j�S�Z;z��]U3��0������j�lb�f�֛Q��6��s���7ّk7�j��8޴���o�Ш�]�PU�$ZV�71��j^'��͹:�jTEРS%\�
��.+�Q���7~3Ȋ��qj��
UuW�n�a\TePU�T#\��[MT�˙��W.Tս6u/
�G[�AU��V�rM��\EeUwQ�n̋`��_��4���ꃩT�v�>rIQe�f/\����>�����jd��t��5p��pȷ��jvGl�'-\���6�sY�"�ojej'~p���+���z��:B"���+���R��k�x
���u��9�Y�N��������}�|;p9]�f����}{��qj�2�����t�[�v�!�1��2�aչ�Wg��B�6�K�+ڰ�6�i؅+�0/��U��ۗQ�����k[��m����`�������D�qm8W����^m-��O�pM�`��'�ҿH#��mW|,\��4����@���մi$z>�@�I�R���6���l	K˭��P@�J&��ފ���E���s�3�B9��v=�_�K���R�
a��6|��,z�F^¨a�j!\��0P�� �+�tZkMA�lx�^!XSE�����1V����&T��r��ߖ�pI�AS����#�.n��Jr��0�Q��6���ʢo�QQ}�}6e�N�[U�*T�vz��8ZhPUq���X��5]�
�v��pM�*�md�[�kH�5��3��5]�
����4ۡ�jn#��㲖�:tU���:tͺ���Y��TʲW��Z��*U�|=���BV���L;�g�
�ٵ�B�����!��ac{����|��$�CQ׺�� �.�
��x�CUT,���:R���CT��t�\w%X��TKn�Oz�q7 ��l��7����j����M���h�U��ݞ]@l�j����&n2l�j����µ� )E��y�\H���4]�t�4�/��.\��;!��6ҫ�U��l�&T�ل���T�
z�,�~BT�Ç��ڄ�:�pi�e�j�-~`�r�<��.Tջی��`�BT+��}�<�\�j�*��v	��/c��Y��6a��6����\(cd��.]�r!����ɉp�B���\H���0f� �Qa���,�?�B��3m7�,�%�/hcx���F&X�.���K��]���fL�9Bl��d5/���7Q�3\�}�� ���?���BV3���*e'i�P��n��R����MuQy�x,W2�J���;"�ӚwEi�3hj6�Z=����x������߶�Om0�~�"����-�S���s�`t�e[n��#�g��ᙅ?_DZ����C�7�.�9F�/�y1l?e�0����l�_���Ҷ��I�?���(�K����c�/�I��?['��� �~�aУƗL��"-�,�\\�?a�1W1��j%3|��0��;4�7�}�-�m�!!����	�ض����b�>��>w��7!��3���S?��Zx���+�������Ө`d�e��̂o
n�Q���Ⅷ��b$���Ah/�&���/��^~&>*��{�޾��@1R�_�s���7F�����N�0u��x�)�(�{�.���?�J�O�E�~̐������p%ق���|M��������O~(����6X��?%�~K�����]_y��?q(v2�0 �ꉤm��WB�j�N��G���F�v��|�����k�O���(Pq�l������ϲ�/���A�{x�Y��m�6���[���H�[���=�;?~�R����'F�
2�=��/	|��x��a�����C�gb�}ǰ(�o7���u��1��7]�n{�������!3�����3D�{_�O�+Ɵ���}~o2�|9�?*�_�MI����Q)���ˇ�����g^�s.��官n�%~nB�����|��ޥ��!K�}X�lHv]��e򙫻VrCq�%��w��Dt���D�r��E�y�X��e���	�Žn�p�?���vܓ�߮��p�7�|4�i����lFWô�m��_����"9��ƶ�v��Rq �%��S���U"�"�p-��D�Rq��~��Wg�2�s��d��γ��֟2��L>�3�&k~2�O�]���[/?�������,D jF����L'-m��������t֋-�)Ģk��-+�ً�p�V�3?.s���k�fP�~4dY��"�n�;�Ȃo��P���v�UU�K�3��u�fi����u��o�--1�w��Ԃd��J9'�c�3�&�E ~   vz���= �\)���i8�ӅsvL������`���sU_o%D�T�Id��Hq��_�:��4����օ�Sv�N����+�l?C���]��πS�Ncԃ���3H��߿����=T>�     