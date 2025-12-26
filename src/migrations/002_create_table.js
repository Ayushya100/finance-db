'use strict';

import { logger } from 'common-svc-lib';
import { readSqlFile } from '../utils/index.js';

const dbTables = [
    'svc_config',
    'path_config',
    'user_role',
    'user_scope',
    'role_scope',
    'users',
    'user_metadata',
    'operation_tags',
    'global_operation_tags',
    'user_global_operation_tags',
    'categories',
    'global_categories',
    'user_global_categories',
    'txn_accounts',
    'txn_cards',
    'wallet',
    'merchant',
    'payment_methods',
    'txn_transactions',
    'transaction_parties',
    'txn_entries',
    'recurring_transactions',
    'recurring_transaction_runs',
    'emi_accounts',
    'emi_schedules',
    'dashboard_setup_header',
    'dashboard_setup',
    'user_dashboard_settings'
];

const up = async(knex) => {
    const log = logger('DB: schemas-migration-up');
    log.info('Schema migration up operation initiated');

    for (const table of dbTables) {
        const schema = await readSqlFile('tables', table);

        knex.raw(schema).then(() => {
            log.info(`${table} table defined in db`);
        }).catch((err) => {
            log.error(`Error defining ${table} table in db: ${err}`);
        });
    }
}

const down = async(knex) => {
    const log = logger('DB: schemas-migration-down');
    log.info('Down migration skipped. No schema to drop.');
}

export { up, down };
