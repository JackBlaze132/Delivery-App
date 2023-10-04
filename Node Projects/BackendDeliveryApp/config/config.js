const promise = require('bluebird');
const options = {
    promiseLib: promise,
    query: (e) => {}
}
const pgp = require('pg-promise')(options);
const types = pgp.pg.types;
types.setTypeParser(1114,function(stringValue){
    return stringValue;
});
const databasteConfig = {
    'host': 'db.freqcrpltohigmsjngqt.supabase.co',
    'port': 5432,
    'database': 'delivery_db',
    'user': 'postgres',
    'password': 'GzYkssy0fCBWulFd'
}

const db = pgp(databasteConfig);

module.exports = db;