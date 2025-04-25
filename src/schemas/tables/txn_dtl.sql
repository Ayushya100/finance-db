CREATE TYPE txn_type_opt AS ENUM ('EXPENSE', 'INCOME', 'INVESTMENT', 'CREDIT-REPAY', 'SELF-TRANSFER');
CREATE TYPE pay_method_opt AS ENUM ('CARD', 'WALLET', 'ACCOUNT');

CREATE TABLE txn_dtl (
    id TEXT PRIMARY KEY DEFAULT UPPER(REPLACE(uuid_generate_v4()::TEXT, '-', '')),
    user_id TEXT NOT NULL,
    acc_id TEXT NOT NULL,
    tag_id TEXT NOT NULL,
    txn_cd TEXT NOT NULL,
    txn_dtl TEXT NOT NULL,
    txn_date TIMESTAMP DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'UTC'),
    txn_ref TEXT,
    txn_type txn_type_opt NOT NULL,
    amount BIGINT DEFAULT 0,
    pay_method pay_method_opt NOT NULL,
    created_date TIMESTAMP DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'UTC'),
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    modified_date TIMESTAMP DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'UTC'),
    modified_by VARCHAR(100) DEFAULT 'SYSTEM',
    version INT DEFAULT 1,
    is_deleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES operation_tags(id) ON DELETE CASCADE
);
