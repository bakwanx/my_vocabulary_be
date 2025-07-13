const express = require('express');
const app = express();
const routing = require('./routes/routes')
const dotenv = require('dotenv');
const morgan = require('morgan')
const cors = require('cors'); 
const http = require('http');
const bodyParser = require('body-parser');
const server = http.createServer(app);

dotenv.config({ path: `${__dirname}/config/config.env` });

app.use(cors({
    origin: 'https://bakwanx.github.io',
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
}));

app.use(express.static(__dirname + '/public'));
app.set('view engine', 'ejs');
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/', routing)

// server.listen();

server.listen(process.env.PORT, () => {
    console.log(`listening on port : ${process.env.PORT}`);
});



