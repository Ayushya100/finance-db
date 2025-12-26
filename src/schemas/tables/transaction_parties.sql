CREATE TYPE party_role_opt AS ENUM ('SOURCE', 'DESTINATION');
CREATE TYPE party_type_opt AS ENUM ('ACCOUNT', 'CARD', 'WALLET', 'MERCHANT', 'EXTERNAL');

CREATE TABLE transaction_parties (
    id TEXT PRIMARY KEY DEFAULT UPPER(REPLACE(uuid_generate_v4()::TEXT, '-', '')),
    transaction_id TEXT NOT NULL,
    party_role party_role_opt NOT NULL,
    party_type party_type_opt NOT NULL,
    party_id TEXT NOT NULL,
    amount NUMERIC(18,2) NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(100) DEFAULT 'SYSTEM',
    version INT DEFAULT 1,
    is_deleted BOOLEAN DEFAULT false,
    FOREIGN KEY (transaction_id) REFERENCES txn_transactions(id) ON DELETE CASCADE
);
