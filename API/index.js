const mysql = require('mysql2'), cors = require('cors'), express = require('express');
var url = require('url');
const querystring = require('querystring');

var app = express();

app.use(express.json());
app.use(cors());

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Iyzkw3927',
    database: 'iwork'
});
connection.connect();

app.get('/employeeCategories', (req, res) => {
    connection.query('SELECT category, COUNT(category) FROM `iwork`.`employees` GROUP BY(category)', function (err, results, fields) {
        if (err) {
            res.status(500).send('No se puede establecer conexion con base de datos');
        }
        else {
            res.send(results);
        }
    })
});

app.get('/employeeCategories/:category', (req, res) => {
    // WHERE category = ?
    //WHERE category IS NOT NUL esto seria lo mas facil y ya no necesesitaria todos los gets pero ahora tendria que modificar lo que recibe db
    connection.query('SELECT * FROM `iwork`.`employees` WHERE ? IS NOT NULL', [req.params.category], (err, results, fields) => {
        if (err) {
            res.status(500).send('No se puede establecer conexion con base de datos');
        }
        else {
            res.send(results);
        }
    })
});

app.get('/employeeCategories/:category2', (req, res) => {
    connection.query('SELECT * FROM `iwork`.`employees` WHERE category2 IS NOT NULL', [req.params.category], (err, results, fields) => {
        if (err) {
            res.status(500).send('No se puede establecer conexion con base de datos');
        }
        else {
            res.send(results);
        }
    })
});


app.get('/employeeCategories/:category3', (req, res) => {
    connection.query('SELECT * FROM `iwork`.`employees` WHERE category3 IS NOT NULL', [req.params.category], (err, results, fields) => {
        if (err) {
            res.status(500).send('No se puede establecer conexion con base de datos');
        }
        else {
            res.send(results);
        }
    })
});

app.get('/employeeCategories/:category4', (req, res) => {
    connection.query('SELECT * FROM `iwork`.`employees` WHERE category4 IS NOT NULL', [req.params.category], (err, results, fields) => {
        if (err) {
            res.status(500).send('No se puede establecer conexion con base de datos');
        }
        else {
            res.send(results);
        }
    })
});

app.get('/employeeCategories/:category5', (req, res) => {
    connection.query('SELECT * FROM `iwork`.`employees` WHERE category5 IS NOT NULL', [req.params.category], (err, results, fields) => {
        if (err) {
            res.status(500).send('No se puede establecer conexion con base de datos');
        }
        else {
            res.send(results);
        }
    })
});

app.get('/employeeCategories/:category6', (req, res) => {
    connection.query('SELECT * FROM `iwork`.`employees` WHERE category6 IS NOT NULL', [req.params.category], (err, results, fields) => {
        if (err) {
            res.status(500).send('No se puede establecer conexion con base de datos');
        }
        else {
            res.send(results);
        }
    })
});

app.get('/jobCategories', (req, res) => {
    connection.query('SELECT category, COUNT(category) FROM `iwork`.`jobs` GROUP BY(category)', function (err, results, fields) {
        if (err) {
            res.status(500).send('No se puede establecer conexion con base de datos');
        }
        else {
            res.send(results);
        }
    })
});

app.get('/jobCategories/:category', (req, res) => {
    //WHERE category = ?
    connection.query('SELECT * FROM `iwork`.`jobs` WHERE category = ?', [req.params.category], (err, results, fields) => {
        if (err) {
            res.status(500).send('No se puede establecer conexion con base de datos');
        }
        else {
            res.send(results);
        }
    })
});

app.post('/employee', function(request, response){

    
    let sql = 'INSERT INTO employees SET ?'

    let post = {
        name : request.query.name,
        experience : request.query.experience,
        years: request.query.years ,
        location: request.query.location ,
        socials: request.query.socials,
        category: request.query.category,
        category2: request.query.category2,
        category3: request.query.category3,
        category4: request.query.category4,
        category5: request.query.category5,
        category6: request.query.category6

    }
    console.log(post);

    connection.query(sql, post, function (err, results) {
                if (err) {
                    console.log(err);
                    response.status(500).send('No se puede establecer conexion con base de datos');
                }
                else {
                    response.send(['Succesfully installed into id: ' + results.insertId]);
                }
    })
});

app.post('/employer', function(request, response){
    console.log("se intentara poner employer")

    let sql = 'INSERT INTO employer SET ?'
    //el problema debe estar aqui que no encuenta bien los nombres o algo
    //porque si imprime los nombres
    let post = {
        interests : request.query.interests,
        person_or_business : request.query.person_or_business,
        location : request.query.location,
        socials : request.query.socials
    }

    connection.query(sql, post, function (err, results) {
                if (err) {
                    console.log(err);
                    response.status(500).send('No se puede establecer conexion con base de datos');
                }
                else {
                    response.send(['Succesfully installed into id: ' + results.insertId]);
                }
    })
});


const port = 3000;
const host = "0.0.0.0"
app.listen(port, host, () => console.log(`Listening on port ${port}...`));
