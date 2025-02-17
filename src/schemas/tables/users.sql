CREATE TYPE user_gender AS ENUM ('M', 'F', 'O');

CREATE TABLE users (
    id TEXT PRIMARY KEY DEFAULT ('052BUS' || UPPER(REPLACE(gen_random_uuid()::TEXT, '-', ''))),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender user_gender NOT NULL,
    DOB DATE,
    contact_number VARCHAR(10),
    version INT NOT NULL DEFAULT 1,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    modified_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    is_deleted BOOLEAN DEFAULT FALSE,
    CHECK (id ~ '^052BUS[A-F0-9]{32}$')
);
