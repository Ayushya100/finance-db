CREATE TYPE method_code_opt AS ENUM ('UPI', 'CASH', 'BANK_TRANSFER', 'CASH', 'WALLET', 'CHEQUE');
CREATE TYPE method_name_opt AS ENUM ('UPI', 'PAYMENT', 'DEBIT_CARD', 'CREDIT_CARD');
CREATE TYPE method_type_opt AS ENUM ('DIGITAL', 'PHYSICAL');

CREATE TABLE payment_methods (
    id TEXT PRIMARY KEY DEFAULT UPPER(REPLACE(uuid_generate_v4()::TEXT, '-', '')),
    method_code method_code_opt VARCHAR(25) NOT NULL,
    method_name method_name_opt VARCHAR(25) NOT NULL,
    method_type method_type_opt VARCHAR(25) NOT NULL,
    is_active BOOLEAN DEFAULT true,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(100) DEFAULT 'SYSTEM',
    version INT DEFAULT 1,
    is_deleted BOOLEAN DEFAULT false
);
