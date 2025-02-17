CREATE TABLE operation_tags (
    id TEXT PRIMARY KEY DEFAULT ('026OOT' || UPPER(REPLACE(gen_random_uuid()::TEXT, '-', ''))),
    user_id TEXT NOT NULL,
    tag_name VARCHAR(50) NOT NULL,
    tag_desc VARCHAR(100),
    metadata VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE,
    version INT NOT NULL DEFAULT 1,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    modified_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    is_deleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CHECK (id ~ '^026OOT[A-F0-9]{32}$')
);
