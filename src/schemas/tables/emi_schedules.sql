CREATE TYPE emi_schedule_status_opt AS ENUM ('PENDING', 'PAID', 'PARTIALLY_PAID', 'OVERDUE', 'SKIPPED');

CREATE TABLE emi_schedules (
    id TEXT PRIMARY KEY DEFAULT UPPER(REPLACE(uuid_generate_v4()::TEXT, '-', '')),
    emi_account_id TEXT NOT NULL,
    installment_no INT NOT NULL,
    due_date DATE NOT NULL,
    emi_amount NUMERIC(18,2) NOT NULL,
    principal_component NUMERIC(18,2) NOT NULL,
    interest_component NUMERIC(18,2) NOT NULL,
    paid_amount NUMERIC(18,2) DEFAULT 0,
    payment_date DATE,
    transaction_id TEXT,
    status emi_schedule_status_opt DEFAULT 'PENDING',
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(100) DEFAULT 'SYSTEM',
    modified_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_by VARCHAR(100) DEFAULT 'SYSTEM',
    version INT DEFAULT 1,
    is_deleted BOOLEAN DEFAULT false,
    FOREIGN KEY (emi_account_id) REFERENCES emi_accounts(id) ON DELETE CASCADE,
    FOREIGN KEY (transaction_id) REFERENCES txn_transactions(id)
);
