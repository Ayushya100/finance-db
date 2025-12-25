CREATE TYPE instrument_type_opt AS ENUM ('ACCOUNT', 'CARD', 'WALLET');
CREATE TYPE entry_type_opt AS ENUM ('DEBIT', 'CREDIT');

CREATE TABLE txn_entries (
    id TEXT PRIMARY KEY DEFAULT UPPER(REPLACE(uuid_generate_v4()::TEXT, '-', '')),
    transaction_id TEXT NOT NULL,
    instrument_type instrument_type_opt VARCHAR(25) NOT NULL,
    instrument_id TEXT NOT NULL,
    entry_type entry_type_opt TEXT NOT NULL,
    amount NUMERIC(18,2) NOT NULL CHECK (amount > 0),
    balance_before NUMERIC(18,2) NOT NULL,
    balance_after NUMERIC(18,2) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(100) DEFAULT 'SYSTEM',
    version INT DEFAULT 1,
    is_deleted BOOLEAN DEFAULT false,
    FOREIGN KEY (transaction_id) REFERENCES txn_transactions(id) ON DELETE CASCADE
);
