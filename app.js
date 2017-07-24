'use strict';

const path = require('path');
const express = require('express');
const app = express();

const PUBLIC_DIR = path.resolve(__dirname, './public');

app.get('/', (req, res) => {
    res.sendFile('index.html', {
        root: PUBLIC_DIR
    });
});

app.listen(9001, () => {
    console.log('NodeJS app listening on port 9001!');
});
