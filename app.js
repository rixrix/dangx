'use strict';

const path = require('path');
const express = require('express');
const app = express();

const routes = require('./routes/index');

app.use('/user', routes.user(express));
app.use('/dashboard', routes.dashboard(express));

app.get('/', (req, res) => {
    res.status(200).json({
        message: 'hello, world!'
    });
});

app.get('*', (req, res) => {
    res.redirect('/');
});

app.listen(8081, () => {
    console.log('NodeJS app listening on port 8081');
});
