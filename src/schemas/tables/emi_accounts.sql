CREATE TYPE emi_status_opt AS ENUM ('ACTIVE', 'COMPLETED', 'PRE_CLOSED', 'DEFAULTED');

CREATE TABLE emi_accounts (
    id TEXT PRIMARY KEY DEFAULT UPPER(REPLACE(uuid_generate_v4()::TEXT, '-', '')),
    user_id TEXT NOT NULL,
    title TEXT NOT NULL,
    source_card_id TEXT,
    source_account_id TEXT,
    total_amount NUMERIC(18,2) NOT NULL,
    principal_amount NUMERIC(18,2) NOT NULL,
    interest_rate NUMERIC(5,2) NOT NULL,
    tenure_months INT NOT NULL,
    emi_amount NUMERIC(18,2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    outstanding_amount NUMERIC(18,2) NOT NULL,
    status emi_status_opt TEXT DEFAULT 'ACTIVE',
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(100) DEFAULT 'SYSTEM',
    version INT DEFAULT 1,
    is_deleted BOOLEAN DEFAULT false,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (source_card_id) REFERENCES txn_cards(id),
    FOREIGN KEY (source_account_id) REFERENCES txn_accounts(id)
);
