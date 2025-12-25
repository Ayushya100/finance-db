CREATE TYPE account_type_opt AS ENUM ('BANK', 'CREDIT_ACCOUNT', 'LOAN_ACCOUNT', 'INVESTMENT_ACCOUNT', 'CASH_ACCOUNT', 'MUTUAL_FUND');
CREATE TYPE account_sub_type_opt AS ENUM ('SAVINGS', 'CURRENT', 'SALARY', 'JOINT', 'NRE', 'NRO', 'FIXED_DEPOSIT', 'RECURRING_DEPOSIT', 'OVERDRAFT', 'PERSONAL_LOAN', 'HOME_LOAN', 'EDUCATION_LOAN', 'LOAN', 'DMAT', 'MF');
CREATE TYPE account_status_opt AS ENUM ('ACTIVE', 'FROZEN', 'CLOSED');

CREATE TABLE txn_accounts (
    id TEXT PRIMARY KEY DEFAULT UPPER(REPLACE(uuid_generate_v4()::TEXT, '-', '')),
    user_id TEXT NOT NULL,
    token TEXT NOT NULL UNIQUE,
    account_name TEXT NOT NULL,
    account_number VARCHAR(50) UNIQUE,
    account_type account_type_opt VARCHAR(50) NOT NULL,
    account_sub_type account_sub_type_opt VARCHAR(50) NOT NULL,
    account_status account_status_opt VARCHAR(25) DEFAULT 'ACTIVE',
    holder_name TEXT NOT NULL,
    bank_name TEXT,
    currency VARCHAR(5) DEFAULT 'INR',
    opening_date DATE,
    opening_balance NUMERIC(18,2) DEFAULT 0,
    current_balance NUMERIC(18,2) NOT NULL DEFAULT 0,
    credit_limit NUMERIC(18,2) DEFAULT 0,
    physical_acc BOOLEAN DEFAULT true,
    is_active BOOLEAN DEFAULT true,
    metadata TEXT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(100) DEFAULT 'SYSTEM',
    version INT DEFAULT 1,
    is_deleted BOOLEAN DEFAULT false,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
