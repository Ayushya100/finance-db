CREATE TABLE user_task (
    id TEXT PRIMARY KEY DEFAULT ('074AUT' || UPPER(REPLACE(gen_random_uuid()::TEXT, '-', ''))),
    user_id TEXT NOT NULL,
    ref_id TEXT NOT NULL,
    task_name VARCHAR(50) NOT NULL,
    task_desc VARCHAR(100),
    is_settled BOOLEAN DEFAULT FALSE,
    settled_on TIMESTAMP DEFAULT NULL,
    version INT NOT NULL DEFAULT 1,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    modified_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    is_deleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (ref_id) REFERENCES credit_txn_dtl(id) ON DELETE CASCADE,
    CHECK (id ~ '^074AUT[A-F0-9]{32}$')
);
