const crypto = require('crypto');

function generateSecretKey() {
    const secretKey = crypto.randomBytes(32).toString('hex');
    return secretKey;
}

const secretKey = generateSecretKey();
console.log(secretKey); // This will print a 64-char