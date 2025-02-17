'use strict';

import { logger } from 'lib-finance-svc';
import readSqlFile from '../utils/readSqlFile.js';

export async function up(knex) {
    const triggerFunction = readSqlFile('triggers/functions', 'update_modified_version');
    const trigger = readSqlFile('triggers', 'triggers');

    const log = logger('DB: triggers-migration-up');

    return knex.raw(triggerFunction).then(() => {
        knex.raw(trigger).then(() => {
            log.info('Triggers defined in db');
        }).catch((err) => {
            log.error(`Error defining triggers in db : ${err}`);
        });
    }).catch((err) => {
        log.error(`Error defining trigger function in db : ${err}`);
    });
}

export async function down(knex) {
    const log = logger('DB: triggers-migration-down');
    log.info('Down migration skipped. No trigger to drop.');
}