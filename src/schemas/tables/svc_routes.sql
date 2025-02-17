CREATE TYPE svc_method AS ENUM ('GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS');

CREATE TABLE svc_routes (
    id TEXT PRIMARY KEY DEFAULT ('051USR' || UPPER(REPLACE(gen_random_uuid()::TEXT, '-', ''))),
    svc_id TEXT NOT NULL,
    path VARCHAR(255) NOT NULL,
    method svc_method NOT NULL,
    validations TEXT[] DEFAULT '{}',
    version INT NOT NULL DEFAULT 1,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    modified_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    is_deleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (svc_id) REFERENCES svc_configs(id),
    CHECK (id ~ '^051USR[A-F0-9]{32}$')
);
