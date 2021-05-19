CREATE TABLE IF NOT EXISTS ovelse (
	id INT NOT NULL,
    navn VARCHAR(50),
    beskrivelse VARCHAR(500),
    
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS lokasjon (
	id INT NOT NULL,
    sted VARCHAR(40),
    
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS treningsokt (
	id INT,
    dato DATE,
	tidStart TIME,
    tidSlutt TIME,
    dagsform INT,
    notat VARCHAR(400),
    lokasjon INT NOT NULL,
    
    PRIMARY KEY(id),
    FOREIGN KEY(lokasjon) REFERENCES lokasjon(id),
    
    CHECK(dagsform<11 AND dagsform>0)
);

CREATE TABLE IF NOT EXISTS gruppe (
	id INT NOT NULL,
    navn VARCHAR(40),
    delAvID INT NOT NULL,
    
    PRIMARY KEY(id),
    FOREIGN KEY(delAvID) REFERENCES gruppe(id)
);

CREATE TABLE IF NOT EXISTS mal (
	id INT NOT NULL,
    treningsoktID INT NOT NULL,
    navn VARCHAR(50),
    
    PRIMARY KEY(id),
    FOREIGN KEY(treningsoktID) REFERENCES treningsokt(id)
);

CREATE TABLE IF NOT EXISTS resultat (
	treningsoktID INT NOT NULL,
    ovelseID INT NOT NULL,
    belastning INT,
    reps INT,
    sett INT,
    lengde INT,
    pulsOgGps TEXT,
    kommentar VARCHAR(400),
    
    FOREIGN KEY(treningsoktID) REFERENCES treningsokt(id),
    FOREIGN KEY(ovelseID) REFERENCES ovelse(id)
);

CREATE TABLE IF NOT EXISTS lignendeOvelse (
	ovelseID INT NOT NULL,
    lignendeOvelseID INT NOT NULL,
    
    FOREIGN KEY(ovelseID) REFERENCES ovelse(id),
    FOREIGN KEY(lignendeOvelseID) REFERENCES ovelse(id)
);

CREATE TABLE IF NOT EXISTS styrkemaal (
	ovelseID INT NOT NULL,
    belastning INT,
    reps INT,
    sett INT,
    
    FOREIGN KEY(ovelseID) REFERENCES ovelse(id)
);

CREATE TABLE IF NOT EXISTS utholdenshetsmaal (
	ovelseID INT NOT NULL,
    lengde INT,
    tid INT,
    puls INT, 
    
    FOREIGN KEY(ovelseID) REFERENCES ovelse(id)
);


CREATE TABLE IF NOT EXISTS gruppeDelAv (
	gruppeID INT NOT NULL,
    overGruppeID INT NOT NULL,
    
    FOREIGN KEY(gruppeID) REFERENCES gruppe(id),
    FOREIGN KEY(overGruppeID) REFERENCES gruppe(id)
	);

CREATE TABLE IF NOT EXISTS ovelseOgGruppe (
	gruppeID INT NOT NULL,
    ovelseID INT NOT NULL,
    
    FOREIGN KEY(gruppeID) REFERENCES gruppe(id),
    FOREIGN KEY(ovelseID) REFERENCES ovelse(id)
);

CREATE TABLE IF NOT EXISTS inne (
	lokasjonID INT NOT NULL,
    tilskuere INT,
    luftkvalitet INT,
    
    FOREIGN KEY(lokasjonID) REFERENCES lokasjon(id)
);

CREATE TABLE IF NOT EXISTS ute (
	lokasjonID INT NOT NULL,
    temp INT,
    vaer VARCHAR(100),
    
    FOREIGN KEY(lokasjonID) REFERENCES lokasjon(id)
);

CREATE TABLE IF NOT EXISTS treningsLokasjon (
	treningsoktID INT NOT NULL,
    lokasjonID INT NOT NULL,
    
    FOREIGN KEY(treningsoktID) REFERENCES treningsokt(id),
    FOREIGN KEY(lokasjonID) REFERENCES lokasjon(id)
);
