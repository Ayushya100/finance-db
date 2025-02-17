CREATE TYPE credit_pay_method_opt AS ENUM ('CARD');

CREATE TABLE credit_txn_dtl (
    id TEXT PRIMARY KEY DEFAULT ('032CTD' || UPPER(REPLACE(gen_random_uuid()::TEXT, '-', ''))),
    user_id TEXT NOT NULL,
    tag_id TEXT NOT NULL,
    txn_number VARCHAR(15) NOT NULL,
    txn_dtl VARCHAR(100),
    txn_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    txn_type VARCHAR(15) NOT NULL,
    amount NUMERIC(10, 2) NOT NULL DEFAULT 0,
    pay_method credit_pay_method_opt NOT NULL,
    pay_token VARCHAR(255) NOT NULL,
    repay_task TEXT DEFAULT NULL,
    repay_txn_id TEXT DEFAULT NULL,
    version INT NOT NULL DEFAULT 1,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    modified_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    is_deleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES operation_tags(id),
    CHECK (id ~ '^032CTD[A-F0-9]{32}$')
);
