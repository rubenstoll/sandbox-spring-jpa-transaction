DROP TABLE IF EXISTS emp_info CASCADE;
DROP TABLE IF EXISTS add_info CASCADE;

CREATE TABLE add_info
(
    add_id  integer primary key,
    address VARCHAR(50) NOT NULL
);

CREATE TABLE emp_info
(
    emp_id          integer primary key,
    name            VARCHAR(50) NOT NULL,
    address_info_id int         not null,
    constraint emp_info_add_info_id_fkey
    foreign key (address_info_id) references add_info (add_id) on delete cascade
);

INSERT INTO add_info (add_id, address)
VALUES (1, 'kathy road, 88881 Kathy NJ'),
       (2, 'Bert roard, 33861 Bert FL'),
       (3, 'Bryan St, 33186 Boca FL');

INSERT INTO emp_info (emp_id, name, address_info_id)
VALUES (1, 'Kathy', 1),
       (2, 'Bert', 2),
       (3, 'Bryan', 3);
