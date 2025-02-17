'use strict';

import { logger } from 'lib-finance-svc';
import readSqlFile from '../utils/readSqlFile.js';

const dbTables = [
    'svc_configs',
    'svc_routes',
    'user_roles',
    'user_scopes',
    'role_scope',
    'dashboard_setup',
    'users',
    'user_account',
    'user_metadata',
    'user_dashboard',
    'operation_tags',
    'txn_accounts',
    'txn_cards',
    'wallet',
    'user_finance',
    'txn_dtl',
    'credit_txn_dtl',
    'user_task'
];

export async function up(knex) {
    const log = logger('DB: schemas-migration-up');

    for (const table of dbTables) {
        const schema = readSqlFile('tables', table);

        knex.raw(schema).then(() => {
            log.info(`${table} table defined in db`);
        }).catch((err) => {
            log.info(`Error defining ${table} table in db : ${err}`);
        });
    }
}

export async function down(knex) {
    const log = logger('DB: schemas-migration-down');
    log.info('Down migration skipped. No schema to drop.');
}
