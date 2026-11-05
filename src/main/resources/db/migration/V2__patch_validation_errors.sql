CREATE
SEQUENCE IF NOT EXISTS revinfo_seq START
WITH 1 INCREMENT BY 50;

DROP TABLE IF EXISTS revchanges CASCADE;
DROP TABLE IF EXISTS revinfo CASCADE;
CREATE TABLE revchanges
(
    rev        BIGINT NOT NULL,
    entityname VARCHAR(255)
);

CREATE TABLE revinfo
(
    rev      BIGINT NOT NULL,
    revtstmp BIGINT,
    CONSTRAINT pk_revinfo PRIMARY KEY (rev)
);

ALTER TABLE add_info
    ADD employee_emp_id INTEGER;

ALTER TABLE add_info
    ADD CONSTRAINT FK_ADD_INFO_ON_EMPLOYEE_EMP FOREIGN KEY (employee_emp_id) REFERENCES emp_info (emp_id);

ALTER TABLE revchanges
    ADD CONSTRAINT fk_revchanges_on_default_tracking_modified_entities_changelog FOREIGN KEY (rev) REFERENCES revinfo (rev);

CREATE
SEQUENCE IF NOT EXISTS add_info_add_id_seq;
ALTER TABLE add_info
    ALTER COLUMN add_id SET NOT NULL;
ALTER TABLE add_info
    ALTER COLUMN add_id SET DEFAULT nextval('add_info_add_id_seq');

ALTER
SEQUENCE add_info_add_id_seq OWNED BY add_info.add_id;

ALTER TABLE add_info
    ALTER COLUMN address TYPE VARCHAR (255) USING (address:: VARCHAR (255));

ALTER TABLE add_info
    ALTER COLUMN address DROP NOT NULL;

CREATE
SEQUENCE IF NOT EXISTS emp_info_emp_id_seq;
ALTER TABLE emp_info
    ALTER COLUMN emp_id SET NOT NULL;
ALTER TABLE emp_info
    ALTER COLUMN emp_id SET DEFAULT nextval('emp_info_emp_id_seq');

ALTER
SEQUENCE emp_info_emp_id_seq OWNED BY emp_info.emp_id;

ALTER TABLE emp_info
    ALTER COLUMN name TYPE VARCHAR (255) USING (name :: VARCHAR (255));

ALTER TABLE emp_info
    ALTER COLUMN name DROP NOT NULL;