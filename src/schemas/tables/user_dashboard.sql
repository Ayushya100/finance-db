CREATE TABLE user_dashboard (
    id TEXT PRIMARY KEY DEFAULT ('024SUD' || UPPER(REPLACE(gen_random_uuid()::TEXT, '-', ''))),
    user_id TEXT NOT NULL,
    setup_id TEXT NOT NULL,
    value VARCHAR(20) NOT NULL,
    version INT NOT NULL DEFAULT 1,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    modified_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    is_deleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (setup_id) REFERENCES dashboard_setup(id) ON DELETE CASCADE,
    CHECK (id ~ '^024SUD[A-F0-9]{32}$')
);
