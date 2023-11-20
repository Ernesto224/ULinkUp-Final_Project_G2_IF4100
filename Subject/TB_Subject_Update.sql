ALTER TABLE Subject.TB_Subject
DROP CONSTRAINT fk_Subject_School; -- Drop the foreign key constraint
ALTER TABLE Subject.TB_Subject
DROP COLUMN School_ID; -- Drop the School_ID column


ALTER TABLE Subject.TB_Subject
ADD School_ID INT NOT NULL; -- Add the School_ID column
ALTER TABLE Subject.TB_Subject
ADD CONSTRAINT fk_Subject_School
FOREIGN KEY (School_ID)
REFERENCES School.TB_School (School_ID); -- Add the foreign key constraint
