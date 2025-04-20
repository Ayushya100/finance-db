'use strict';

import { logger } from 'finance-lib';
import { readSqlFile } from '../utils/index.js';

const dbTables = [
  'svc_config',
  'path_config',
  'user_role',
  'user_scope',
  'role_scope',
  'dashboard_setup_header',
  'dashboard_setup',
  'users',
  'user_metadata',
  'user_dashboard',
  'operation_tags',
  'txn_accounts',
  'txn_cards',
  'wallet',
  'user_finance',
  'txn_dtl',
  'credit_txn_dtl',
  'user_task',
];

const up = async (knex) => {
  const log = logger('DB: schemas-migration-up');
  log.info('Schema migration up operation initiated');

  for (const table of dbTables) {
    const schema = readSqlFile('tables', table);

    knex
      .raw(schema)
      .then(() => {
        log.info(`${table} table defined in db`);
      })
      .catch((err) => {
        log.error(`Error defining ${table} table in db: ${err}`);
      });
  }
};

const down = async (knex) => {
  const log = logger('DB: schemas-migration-down');
  log.info('Down migration skipped. No schema to drop.');
};

export { up, down };
