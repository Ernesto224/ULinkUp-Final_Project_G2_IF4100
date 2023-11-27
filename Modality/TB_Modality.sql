-- Table to store information about modalities
CREATE TABLE Modality.TB_Modality
(
    Modality_ID INT PRIMARY KEY IDENTITY NOT NULL, -- Unique identifier for the modality
    Modality_Name VARCHAR(50) UNIQUE NOT NULL, -- Name of the modality
    Erased BIT DEFAULT 0 NOT NULL  -- Bit field to indicate if the record is active (1) or deleted (0)
);
--IN 5FN	
