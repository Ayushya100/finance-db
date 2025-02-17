CREATE TABLE IF NOT EXISTS svc_configs (
    id TEXT PRIMARY KEY DEFAULT ('038GSC' || UPPER(REPLACE(gen_random_uuid()::TEXT, '-', ''))),
    microservice VARCHAR(30) NOT NULL,
    environment VARCHAR(8) not null,
    protocol VARCHAR(8) NOT NULL DEFAULT 'http',
    port VARCHAR(5) NOT NULL,
    version INT NOT NULL DEFAULT 1,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    modified_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    is_deleted BOOLEAN DEFAULT FALSE,
    CHECK (id ~ '^038GSC[A-F0-9]{32}$')
);
