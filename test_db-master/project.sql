--   -----creating database---

CREATE DATABASE IF NOT EXISTS lab;
USE lab;

--  ------creating tables according to ER-Model---

CREATE TABLE IF NOT EXISTS ChemicalsinExperiments
( Chemicals int, Experiments int);

CREATE TABLE IF NOT EXISTS Chemicals
(idChemicals int NOT NULL auto_increment, Name varchar (50), Toxicity_class int, 
PRIMARY KEY (idChemicals));

CREATE TABLE IF NOT EXISTS Toxicity_class
(Class_number int NOT NULL, Description varchar (50), PRIMARY KEY (Class_number));

CREATE TABLE IF NOT EXISTS Laboratory_Benches
(idLaboratory_Benches int NOT NULL auto_increment, Place_name varchar (50), Experiment_class int, 
PRIMARY KEY (idLaboratory_Benches));

CREATE TABLE IF NOT EXISTS Scientists
(idScientists int NOT NULL auto_increment, FirstName varchar (50), LastName varchar (50), 
DateofBirth date, YearofGraduation int (4), Operational_unit int, 
PRIMARY KEY (idScientists));

CREATE TABLE IF NOT EXISTS Operational_units 
(idOperational_unit int NOT NULL auto_increment, Name varchar (50), HeadofOperational_unit int,
PRIMARY KEY (idOperational_unit));

CREATE TABLE IF NOT EXISTS Experiments
(idExperiments int NOT NULL auto_increment, Date_of_Execution date, 
Duration time, Outcome boolean, Experiment_class int, PerformingScientist int,
PRIMARY KEY (idExperiments));

--  ------add foreign keys---

ALTER TABLE ChemicalsinExperiments ADD FOREIGN KEY (Chemicals) REFERENCES Chemicals (idChemicals); 
ALTER TABLE ChemicalsinExperiments ADD FOREIGN KEY (Experiments) REFERENCES Experiments (idExperiments);
ALTER TABLE Chemicals ADD FOREIGN KEY (Toxicity_class) REFERENCES Toxicity_class (Class_number);
ALTER TABLE Operational_units ADD FOREIGN KEY (HeadofOperational_unit) REFERENCES Scientists (idScientists);
ALTER TABLE Experiments ADD FOREIGN KEY (PerformingScientist) REFERENCES Scientists (idScientists);
ALTER TABLE Scientists ADD FOREIGN KEY (Operational_unit) REFERENCES Operational_units (idOperational_unit);
