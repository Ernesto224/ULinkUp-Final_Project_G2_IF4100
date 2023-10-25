
-- Table to store information about modalities
CREATE TABLE MODALITY.TB_MODALITY
(
    ID_MODALITY INT NOT NULL PRIMARY KEY, -- Unique identifier for the modality
    MODALITY_NAME VARCHAR(20) -- Name of the modality
    Erased BIT DEFAULT 1 NOT NULL -- Bit field to indicate if the record is active (1) or deleted (0)
);
