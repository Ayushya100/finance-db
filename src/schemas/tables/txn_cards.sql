CREATE TYPE card_type_opt AS ENUM ('DEBIT', 'CREDIT', 'PREPAID', 'GIFT', 'MEAL', 'FOREX', 'VIRTUAL');
CREATE TYPE card_network_opt AS ENUM ('VISA', 'MASTERCARD', 'RUPAY', 'AMEX', 'MAESTRO');
CREATE TYPE card_status_opt AS ENUM ('ACTIVE', 'BLOCKED', 'EXPIRED', 'CLOSED');

CREATE TABLE txn_cards (
    id TEXT PRIMARY KEY DEFAULT UPPER(REPLACE(uuid_generate_v4()::TEXT, '-', '')),
    user_id TEXT NOT NULL,
    account_id TEXT,
    card_token TEXT NOT NULL UNIQUE,
    card_number VARCHAR(25) NOT NULL UNIQUE,
    card_type card_type_opt NOT NULL,
    card_network card_network_opt,
    holder_name TEXT NOT NULL,
    expiry_date DATE NOT NULL,
    card_status card_status_opt DEFAULT 'ACTIVE',
    is_virtual BOOLEAN DEFAULT false,
    card_limit NUMERIC(18,2) DEFAULT 0,
    outstanding_amount NUMERIC(18,2) DEFAULT 0,
    available_limit NUMERIC(18,2) DEFAULT 0,
    metadata TEXT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(100) DEFAULT 'SYSTEM',
    version INT DEFAULT 1,
    is_deleted BOOLEAN DEFAULT false,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (account_id) REFERENCES txn_accounts(id) ON DELETE CASCADE
);
