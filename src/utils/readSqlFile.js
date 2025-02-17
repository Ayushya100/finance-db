'use strict';

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

// Define __dirname
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const readSqlFile = (relativePath, fileName) => {
    const filePath = path.join(__dirname, `../schemas/${relativePath}/${fileName}.sql`);
    return fs.readFileSync(filePath, 'utf8');
}

export default readSqlFile;
