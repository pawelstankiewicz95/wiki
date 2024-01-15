CREATE TABLE program (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);
CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    program_id BIGINT,
    FOREIGN KEY (program_id) REFERENCES program(id)
);
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    password VARCHAR(255)
);

CREATE TABLE subject (
    id SERIAL PRIMARY KEY,
    user_id BIGINT,
    title VARCHAR(255),
    time_created TIMESTAMP,
    time_updated TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE solution (
    id SERIAL PRIMARY KEY,
    user_id BIGINT,
    subject_id BIGINT,
    description TEXT,
    time_created TIMESTAMP,
    time_updated TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (subject_id) REFERENCES subject(id)
);