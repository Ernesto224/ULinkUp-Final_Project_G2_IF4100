-- Table to store information about modalities
CREATE TABLE Modality.TB_Modality
(
    Modality_ID INT NOT NULL PRIMARY KEY, -- Unique identifier for the modality
    Modality_Name VARCHAR(20) NOT NULL, -- Name of the modality
    Erased BIT DEFAULT 1 NOT NULL -- Bit field to indicate if the record is active (1) or deleted (0)
);
--IN 5FN	