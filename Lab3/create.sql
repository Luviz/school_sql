use dv1454_ht13_5

--
-- Create the database schema for this lab
--

--
-- Table Account
--
DROP TABLE AccountLog
DROP TABLE Account

CREATE TABLE Account
(
    -- Primary key
    nrAccount INT NOT NULL,
    PRIMARY KEY(nrAccount),

    -- Attributes
    nameAccount VARCHAR(15) NOT NULL,
    balanceAccount MONEY NOT NULL
)

INSERT INTO Account VALUES (1,'Nils',500)
INSERT INTO Account VALUES (2,'Sven',150)
INSERT INTO Account VALUES (3,'Ingvar',0)
INSERT INTO Account VALUES (4,'Anna',500)
INSERT INTO Account VALUES (5,'Jenny',850)

--
-- Table AccountLog
--
CREATE TABLE AccountLog
(
    -- Primary Key
    idAccountLog INT IDENTITY(1,1),
    PRIMARY KEY(idAccountLog),

    -- Foreign Key
    AccountLog_nrAccount INT NOT NULL,
    FOREIGN KEY(AccountLog_nrAccount) REFERENCES Account(nrAccount),

    -- Attributes
    timeAccountLog DATETIME NOT NULL,
    amountAccountLog MONEY NOT NULL
)

SELECT * FROM Account;
SELECT * FROM AccountLog;