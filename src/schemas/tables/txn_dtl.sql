CREATE TYPE txn_type_opt AS ENUM ('DEBIT', 'CREDIT', 'SELF TRANSFER');
CREATE TYPE pay_method_opt AS ENUM ('CARD', 'ACCOUNT', 'WALLET');

CREATE TABLE txn_dtl (
    id TEXT PRIMARY KEY DEFAULT ('027ATD' || UPPER(REPLACE(gen_random_uuid()::TEXT, '-', ''))),
    user_id TEXT NOT NULL,
    tag_id TEXT NOT NULL,
    txn_number VARCHAR(15) NOT NULL,
    txn_dtl VARCHAR(100),
    txn_Date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    txn_ref VARCHAR(100),
    txn_type txn_type_opt NOT NULL,
    amount NUMERIC(10, 2) NOT NULL DEFAULT 0,
    pay_method pay_method_opt NOT NULL,
    pay_token VARCHAR(255) NOT NULL,
    version INT NOT NULL DEFAULT 1,
    created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    modified_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(255) NOT NULL DEFAULT 'SYSTEM',
    is_deleted BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES operation_tags(id),
    CHECK (id ~ '^027ATD[A-F0-9]{32}$')
);
