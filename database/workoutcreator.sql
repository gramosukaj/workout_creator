DROP TABLE IF EXISTS exercises;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS categories_exercises;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS workout;
DROP TABLE IF EXISTS workout_exercises;
DROP TABLE IF EXISTS workouts_sets;
DROP TABLE IF EXISTS equipements;
DROP TABLE IF EXISTS exercises_equipements;
DROP TABLE IF EXISTS type;

CREATE TABLE exercises (
  id          int(10) NOT NULL AUTO_INCREMENT, 
  name        varchar(255) NOT NULL, 
  description text NOT NULL, 
  id_type     int(11) NOT NULL, 
  PRIMARY KEY (id));

CREATE TABLE categories (
  id          int(10) NOT NULL AUTO_INCREMENT, 
  name        varchar(90) NOT NULL, 
  description text, 
  PRIMARY KEY (id));

CREATE TABLE categories_exercises (
  id_exercise int(10) NOT NULL, 
  id_category int(10) NOT NULL, 
  PRIMARY KEY (id_exercise, 
  id_category));

CREATE TABLE users (
  id          int(10) NOT NULL AUTO_INCREMENT, 
  login       varchar(255) NOT NULL, 
  email       varchar(255) NOT NULL, 
  pass        varchar(255) NOT NULL, 
  pseudo      varchar(80), 
  description text, 
  avatar      varchar(80) NOT NULL, 
  PRIMARY KEY (id));

CREATE TABLE photos (
  id_exercise int(10) NOT NULL, 
  photo       varchar(255) NOT NULL);

CREATE TABLE workout (
  id          int(11) NOT NULL AUTO_INCREMENT, 
  id_user     int(10) NOT NULL, 
  name        varchar(2155) NOT NULL, 
  description text, 
  `public`    boolean NOT NULL, 
  PRIMARY KEY (id));

CREATE TABLE workout_exercises (
  id_workout  int(11) NOT NULL, 
  id_exercise int(10) NOT NULL, 
  description varchar(255), 
  sets_unit   int(11) NOT NULL, 
  `order`     int(11) NOT NULL, 
  PRIMARY KEY (id_workout, 
  id_exercise));

CREATE TABLE workouts_sets (
  id_workout  int(11) NOT NULL, 
  id_exercise int(10) NOT NULL, 
  id_set      int(11) NOT NULL, 
  reps        int(11) NOT NULL, 
  pause       int(11) NOT NULL, 
  weight      int(11), 
  `order`     int(11) NOT NULL, 
  PRIMARY KEY (id_workout, 
  id_exercise, 
  id_set));

CREATE TABLE equipements (
  id          int(11) NOT NULL AUTO_INCREMENT, 
  name        varchar(90) NOT NULL, 
  description varchar(255), 
  PRIMARY KEY (id));

CREATE TABLE exercises_equipements (
  id_exercice   int(10) NOT NULL, 
  id_equipement int(11) NOT NULL, 
  PRIMARY KEY (id_exercice, 
  id_equipement));

CREATE TABLE type (
  id   int(11) NOT NULL AUTO_INCREMENT, 
  type varchar(80) NOT NULL, 
  PRIMARY KEY (id));

ALTER TABLE categories_exercises ADD CONSTRAINT FKcategories22022 FOREIGN KEY (id_category) REFERENCES categories (id);
ALTER TABLE categories_exercises ADD CONSTRAINT FKcategories205646 FOREIGN KEY (id_exercise) REFERENCES exercises (id);
ALTER TABLE photos ADD CONSTRAINT FKphotos483754 FOREIGN KEY (id_exercise) REFERENCES exercises (id);
ALTER TABLE workout ADD CONSTRAINT FKworkout360574 FOREIGN KEY (id_user) REFERENCES users (id);
ALTER TABLE workout_exercises ADD CONSTRAINT FKworkout_ex444739 FOREIGN KEY (id_workout) REFERENCES workout (id);
ALTER TABLE workout_exercises ADD CONSTRAINT FKworkout_ex375942 FOREIGN KEY (id_exercise) REFERENCES exercises (id);
ALTER TABLE workouts_sets ADD CONSTRAINT FKworkouts_s854436 FOREIGN KEY (id_workout, id_exercise) REFERENCES workout_exercises (id_workout, id_exercise);
ALTER TABLE exercises_equipements ADD CONSTRAINT FKexercises_498217 FOREIGN KEY (id_exercice) REFERENCES exercises (id);
ALTER TABLE exercises_equipements ADD CONSTRAINT FKexercises_201439 FOREIGN KEY (id_equipement) REFERENCES equipements (id);
ALTER TABLE exercises ADD CONSTRAINT FKexercises931679 FOREIGN KEY (id_type) REFERENCES type (id);
