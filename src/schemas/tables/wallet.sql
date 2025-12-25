CREATE TYPE wallet_type_opt AS ENUM ('UPI', 'OPEN_WALLET', 'CLOSED_WALLET', 'API_WALLET', 'CASH', 'REWARD_WALLET');
CREATE TYPE wallet_source_opt AS ENUM ('USER_TOPUP', 'CASHBACK', 'REFUND', 'REWARD_POINTS', 'SYSTEM_CREDIT');
CREATE TYPE wallet_status_opt AS ENUM ('ACTIVE', 'SUSPENDED', 'CLOSED');

CREATE TABLE wallet (
    id TEXT PRIMARY KEY DEFAULT UPPER(REPLACE(uuid_generate_v4()::TEXT, '-', '')),
    user_id TEXT NOT NULL,
    wallet_name TEXT NOT NULL,
    wallet_desc TEXT,
    wallet_type wallet_type_opt VARCHAR(25) NOT NULL,
    wallet_source wallet_source_opt VARCHAR(25) NOT NULL,
    currency VARCHAR(5) DEFAULT 'INR',
    balance NUMERIC(18,2) NOT NULL DEFAULT 0,
    wallet_status wallet_status_opt VARCHAR(25) DEFAULT 'ACTIVE',
    metadata TEXT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(100) DEFAULT 'SYSTEM',
    version INT DEFAULT 1,
    is_deleted BOOLEAN DEFAULT false,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
