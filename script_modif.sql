create table CATEGORIE
(
   id_cat BIGINT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) ,
   nom_cat VARCHAR(50)
);

INSERT INTO USR.CATEGORIE (nom_cat) VALUES ('Amusement');
INSERT INTO USR.CATEGORIE (nom_cat) VALUES ('Deplacement');
INSERT INTO USR.CATEGORIE (nom_cat) VALUES ('Telephone');
INSERT INTO USR.CATEGORIE (nom_cat) VALUES ('Camping');
INSERT INTO USR.CATEGORIE (nom_cat) VALUES ('Accessoire');

create table ARTICLE
(
  id_article BIGINT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
  nom_article VARCHAR(50),
  desc_article VARCHAR(255),
  date_depos TIMESTAMP,
  createur BIGINT,
  date_fin TIMESTAMP,
  prix_depart  DOUBLE,
  gagnant BIGINT,
  prix_vendu  DOUBLE,
  etat_article VARCHAR(10),
  categorie BIGINT,
  photo_url VARCHAR(32672)
  );
  ALTER TABLE ARTICLE ADD FOREIGN KEY (categorie) REFERENCES CATEGORIE;
  
create table UTILISATEUR
( 
  id_user BIGINT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
  nom_user VARCHAR(50),
  prenom_user VARCHAR(50),
  email VARCHAR(50),
  password VARCHAR(50),
  tel VARCHAR(20),
  pays VARCHAR(20),
  ville VARCHAR(20),
  rue VARCHAR(50),
  code_postal INTEGER,
  nbr_encher_annuli INTEGER,
  num_CB BIGINT 
);
  ALTER TABLE ARTICLE ADD FOREIGN KEY (createur) REFERENCES UTILISATEUR;
  ALTER TABLE ARTICLE ADD FOREIGN KEY (gagnant) REFERENCES UTILISATEUR;


INSERT INTO USR.UTILISATEUR (nom_user,prenom_user,email,password,tel,pays,ville,rue,code_postal,nbr_encher_annuli,num_CB)
  VALUES ('Blin','Nicolas','nico@gmail.com','nico','0123456789','France','Nancy','43 Rue de la Com',54000,0,123456789999);
INSERT INTO USR.UTILISATEUR (nom_user,prenom_user,email,password,tel,pays,ville,rue,code_postal,nbr_encher_annuli,num_CB)
  VALUES ('Grall','Alexis','nico@gmail.com','nico','0123456789','France','Nancy','43 Rue de la Com',54000,0,123456789999);

INSERT INTO USR.ARTICLE (NOM_ARTICLE, DESC_ARTICLE, DATE_DEPOS, CREATEUR, DATE_FIN, PRIX_DEPART, GAGNANT, PRIX_VENDU, ETAT_ARTICLE, CATEGORIE, PHOTO_URL) 
  VALUES ('Hand Spinner', 'Des hand-spinners de ouf en 5 couleurs!', CURRENT_TIMESTAMP, 1, '2018-01-25 23:54:00', 1., 1, 0., 'Neuf', 1, 'https://upload.wikimedia.org/wikipedia/commons/f/f3/Fidget_spinner_red%2C_cropped.jpg');
INSERT INTO USR.ARTICLE (NOM_ARTICLE, DESC_ARTICLE, DATE_DEPOS, CREATEUR, DATE_FIN, PRIX_DEPART, GAGNANT, PRIX_VENDU, ETAT_ARTICLE, CATEGORIE, PHOTO_URL) 
  VALUES ('Voiture', 'Une 4L de folie', CURRENT_TIMESTAMP, 1, '2018-01-31 13:46:23', 1000., 1, 0., 'Neuf', 2, 'http://www.r4-4l.com/wp-content/uploads/2015/08/articles.jpg');
INSERT INTO USR.ARTICLE (NOM_ARTICLE, DESC_ARTICLE, DATE_DEPOS, CREATEUR, DATE_FIN, PRIX_DEPART, GAGNANT, PRIX_VENDU, ETAT_ARTICLE, CATEGORIE, PHOTO_URL) 
  VALUES ('IPhone X', 'Le tout nouveau smartphone à la mode de chez les bouffons', CURRENT_TIMESTAMP, 1, '2018-01-30 13:46:23', 800., 1, 0., 'Neuf', 3, 'https://boutique.orange.fr/media-cms/mediatheque/636x900-iphone-x-gris-sideral---vue-1-105038.jpg');
INSERT INTO USR.ARTICLE (NOM_ARTICLE, DESC_ARTICLE, DATE_DEPOS, CREATEUR, DATE_FIN, PRIX_DEPART, GAGNANT, PRIX_VENDU, ETAT_ARTICLE, CATEGORIE, PHOTO_URL) 
  VALUES ('Sac', 'Un nouveau sac Tatanka !', CURRENT_TIMESTAMP, 2, '2018-01-31 13:46:30', 10., 2, 0., 'Neuf', 5, 'http://www.enquetepublique-gpso-amenagementsnordtoulouse.fr/image/cache/data/category_44/tatonka-sac-a-dos-reglable-17-l-b006ztxrm8-4735-500x500_0.jpg');
INSERT INTO USR.ARTICLE (NOM_ARTICLE, DESC_ARTICLE, DATE_DEPOS, CREATEUR, DATE_FIN, PRIX_DEPART, GAGNANT, PRIX_VENDU, ETAT_ARTICLE, CATEGORIE, PHOTO_URL) 
  VALUES ('Tente', 'Tente Quechua très bon état', CURRENT_TIMESTAMP, 2, '2018-01-30 13:46:23', 50., 2, 0., 'Neuf', 4, 'https://www.usinenouvelle.com/mediatheque/1/8/2/000129281_image_896x598/quechua-tente-2-secondes.jpg');
INSERT INTO USR.ARTICLE (NOM_ARTICLE, DESC_ARTICLE, DATE_DEPOS, CREATEUR, DATE_FIN, PRIX_DEPART, GAGNANT, PRIX_VENDU, ETAT_ARTICLE, CATEGORIE, PHOTO_URL) 
	VALUES ('R8 Gordini', 'Pour débarasser', CURRENT_TIMESTAMP, 2, '2018-01-30 19:00:00.0', 7000.0, 2, 0., 'Occasion', 2, 'https://c1.staticflickr.com/8/7254/7789482114_79c4d50f78_b.jpg');


CREATE TABLE PARTICIPE
(
   article BIGINT,
   utilisateur BIGINT,
   prixEmis DOUBLE,
   dateParticipation TIMESTAMP,
   primary key (article, utilisateur)
);
 ALTER TABLE PARTICIPE ADD FOREIGN KEY (article) REFERENCES ARTICLE;
 ALTER TABLE PARTICIPE ADD FOREIGN KEY (utilisateur) REFERENCES UTILISATEUR;

 INSERT INTO USR.PARTICIPE (article,utilisateur,prixEmis,dateParticipation)
  VALUES (1,1,5.,'2018-01-20 13:46:30');
 
  
  CREATE TABLE PROMOTION
(
   id_promo INTEGER NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
   article BIGINT,
   desc_promo VARCHAR(255)
);
 ALTER TABLE PROMOTION ADD FOREIGN KEY (article) REFERENCES ARTICLE;
 
   CREATE TABLE COMMANDE
(
   id_cmd BIGINT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
   utilisateur BIGINT,
   date_dmd DATE,
   etat_dmd VARCHAR(50),
   date_validation_annulation DATE,
   date_dmd_facturation DATE
);
 ALTER TABLE COMMANDE ADD FOREIGN KEY (utilisateur) REFERENCES UTILISATEUR;
 
 CREATE TABLE LIGNE_CMD
(
   id_cmd BIGINT,
   article BIGINT,
   prix_achat DOUBLE,
   primary key (article, id_cmd)
);
 ALTER TABLE LIGNE_CMD ADD FOREIGN KEY (article) REFERENCES ARTICLE;
 ALTER TABLE LIGNE_CMD ADD FOREIGN KEY (id_cmd) REFERENCES COMMANDE;
 
  CREATE TABLE FACTURE
(
   id_fct BIGINT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
   id_cmd BIGINT,
   utilisateur BIGINT,
   date_edition DATE,
   prix_total DOUBLE
);
 ALTER TABLE FACTURE ADD FOREIGN KEY (id_cmd) REFERENCES COMMANDE;
 ALTER TABLE FACTURE ADD FOREIGN KEY (utilisateur) REFERENCES UTILISATEUR;