CREATE TABLE treningsokt (
	id INT,
    dato DATE,
	tidStart TIME,
    tidSlutt TIME,
    dagsform INT,
    notat VARCHAR(400),
    
    PRIMARY KEY(id),
    FOREIGN KEY(lokasjon) REFERENCES lokasjon(id),
    
    CHECK(dagsform<11 AND dagsform>0)
);

CREATE TABLE resultat (
	treningsoktID INT NOT NULL,
    ovelseID INT NOT NULL,
    belastning INT,
    reps INT,
    sett INT,
    lengde INT,
    tid INT,
    pulsOgGps TEXT,
    kommentar VARCHAR(400),
    
    FOREIGN KEY(treningsoktID) REFERENCES treningsokt(id),
    FOREIGN KEY(ovelseID) REFERENCES ovelse(id)
);

CREATE TABLE ovelse (
	id INT NOT NULL,
    navn VARCHAR(50),
    beskrivelse VARCHAR(500),
    
    PRIMARY KEY(id)
);

CREATE TABLE lignendeOvelse (
	ovelseID INT NOT NULL,
    lignendeOvelseID INT NOT NULL,
    
    FOREIGN KEY(ovelseID) REFERENCES ovelse(id),
    FOREIGN KEY(ligendeOvelseID) REFERENCES ovelse(id)
);

CREATE TABLE styrkemaal (
	ovelseID INT NOT NULL,
    belastning INT,
    reps INT,
    sett INT,
    
    FOREIGN KEY(ovelseID) REFERENCES ovelse(id)
);

CREATE TABLE utholdenshetsmaal (
	ovelseID INT NOT NULL,
    lengde INT,
    tid INT,
    puls INT, 
    
    FOREIGN KEY(ovelseID) REFERENCES ovelse(id)
);

CREATE TABLE gruppe (
	id INT NOT NULL,
    navn VARCHAR(40),
    
    PRIMARY KEY(id)
);

CREATE TABLE gruppeDelAv (
	gruppeID INT NOT NULL,
    overGruppeID INT NOT NULL,
    
    FOREIGN KEY(gruppeID) REFERENCES gruppe(id),
    FOREIGN KEY(overGruppeID) REFERENCES gruppe(id)
	);

CREATE TABLE ovelseOgGruppe (
	gruppeID INT NOT NULL,
    ovelseID INT NOT NULL,
    
    FOREIGN KEY(gruppeID) REFERENCES gruppe(id),
    FOREIGN KEY(ovelseID) REFERENCES ovelse(id)
);

CREATE TABLE lokasjon (
	id INT NOT NULL,
    sted VARCHAR(40),
    
    PRIMARY KEY(id)
);

CREATE TABLE inne (
	lokasjonID INT NOT NULL,
    tilskuere INT,
    luftkvalitet INT,
    
    FOREIGN KEY(lokasjonID) REFERENCES lokasjon(id)
);

CREATE TABLE ute (
	lokasjonID INT NOT NULL,
    temp INT,
    vaer VARCHAR(100),
    
    FOREIGN KEY(lokasjonID) REFERENCES lokasjon(id)
);

CREATE TABLE treningsLokasjon (
	treningsoktID INT NOT NULL,
    lokasjonID INT NOT NULL,
    
    FOREIGN KEY(treningsoktID) REFERENCES treningsokt(id),
    FOREIGN KEY(lokasjonID) REFERENCES lokasjon(id)
);

CREATE TABLE mal (
	id INT NOT NULL,
    treningsoktID INT NOT NULL,
    navn VARCHAR(50),
    
    PRIMARY KEY(id),
    FOREIGN KEY(treningsoktID) REFERENCES treningsokt(id)
);