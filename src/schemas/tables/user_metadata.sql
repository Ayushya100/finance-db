CREATE TABLE user_metadata (
    id TEXT PRIMARY KEY DEFAULT ('014AUM' || UPPER(REPLACE(gen_random_uuid()::TEXT, '-', ''))),
    user_id TEXT NOT NULL,
    is_verified BOOLEAN DEFAULT FALSE,
    verification_code VARCHAR(255),
    verification_code_exp TIMESTAMP,
    forgot_password_token VARCHAR(255),
    forgot_password_token_exp TIMESTAMP,
    refresh_token VARCHAR(255),
    version INT NOT NULL DEFAULT 1,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    modified_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    is_deleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CHECK (id ~ '^014AUM[A-F0-9]{32}$')
);
