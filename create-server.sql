DROP DATABASE hack_wizard;
CREATE DATABASE hack_wizard;

\c hack_wizard;

/* Create Wizard Session Table */
CREATE TABLE session (
    id SERIAL PRIMARY KEY,
    completed_steps VARCHAR(255)[] DEFAULT ARRAY[]::VARCHAR(255)[],
    current_step VARCHAR(255)
);

CREATE SEQUENCE session_sequence
    start 1
    increment 1;

INSERT INTO session 
    (id,completed_steps, current_step) 
    VALUES 
    (
        nextval('session_sequence'),
        ARRAY[1]::INTEGER[],
        'address'
    );

/* Create Answers Table */
CREATE TABLE answers (
    id SERIAL PRIMARY KEY,
    session_id SERIAL NOT NULL,
    step_key VARCHAR(50) NOT NULL,
    answer VARCHAR(255),
    CONSTRAINT fk_session_id FOREIGN KEY (session_id) REFERENCES session(id)
);

CREATE SEQUENCE answers_sequence
    start 1
    increment 1;

INSERT INTO answers 
    (id, session_id, step_key, answer) 
    VALUES 
    (
        nextval('answers_sequence'),
        currval('session_sequence'),
        'address',
        '1234 Washington Boulevard'
    );

/* Create Wizard Step Table */
CREATE TABLE steps (
    id SERIAL PRIMARY KEY,
    index INTEGER NOT NULL,
    complete BOOLEAN DEFAULT FALSE,
    schema_key VARCHAR(50) NOT NULL
);

CREATE SEQUENCE steps_sequence
    start 1
    increment 1;

INSERT INTO steps 
    (id,index, complete,schema_key) 
    VALUES 
    (
        nextval('steps_sequence'),
        '1',
        FALSE,
        'address'
    );




