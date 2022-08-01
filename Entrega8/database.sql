# mongod

# mongod --dbpath "mongodb"

use ecommerce
# Creación de Tablas "mensajes" y "productos"
db.createCollection("mensajes")

db.createCollection("productos")

# 1 - Insertar los productos

db.productos.insertMany([{nombre: "Monitor", precio: "8000"}, 
{nombre: "Teclado", precio: "6000"}, 
{nombre: "Silla Gamer", precio: "85500"}, 
{nombre: "Notebook HP", precio: "120000"}, 
{nombre: "Notebook Lenovo", precio: "180000"}, 
{nombre: "Notebook TLC", precio: "192000"}, 
{nombre: "Parlante Bluetooh", precio: "15800"}, 
{nombre: "Escritorio PC", precio: "30000"}, 
{nombre: "Cargador Celular", precio: "800"}, 
{nombre: "Celular Samsung", precio: "48000"}])

# 1 - Insertar los mensajes

db.mensajes.insertMany([{email: "thor@bifrost.com", message: "Mjolnir come to me"},
{email: "spiderman@web.com", message: "Hey Daredevil why dont you read my messages?"},
{email: "thanos@infinity.com", message: "I dont even know who you are"},
{email: "steverogers@america.com", message: "I could do this all day"},
{email: "drstrange@mail.com", message: "Is the only way"},
{email: "hulk@gama.com", message: "Hulk smash"},
{email: "groot@mail.com", message: "Im groot"},
{email: "tevez@gmail.com", message: "Very dificul"},
{email: "messi@gmail.com", message: "No puedo, hoy tengo fulvo"},
{email: "dolarblue@gmail.com", message: "Nos vimo"},])

# Listar mensajes y formatear 
db.mensajes.find().pretty()

# Listar productos y formatear
db.productos.find().pretty()

# 4 - Mostrar la cantidad de docs que tienen las colecciones
db.mensajes.estimatedDocumentCount()
db.productos.estimatedDocumentCount()

# CRUD 
# 5 - A) Insertar un producto nuevo
db.productos.insertOne({nombre: "Celular Nokia 1100", precio: "1200"})

B) Realizar consulta por nombre específico de producto
db.productos.find({nombre: "Celular Nokia 1100"}).pretty()
i) Listar productos con precio menor a 1000
db.productos.find({precio: {$lt: 1000}}).pretty()
ii) Listar productos con precio 1000-3000
db.productos.find({precio: {$gt: 1000, $lt: 3000}}).pretty()
iii) Listar productos con precio <3000
db.productos.find({precio: {$gt: 3000}}).pretty()
iv) Mostrar nombre del tercer producto mas barato
{db.productos.find({}, {nombre: 1}).sort({precio: 1}).skip(2).limit(1).pretty()}

C) Actualizar todos los productos agregando el campo stock con un valor de 100
db.productos.updateMany({}, {$set: {stock: 100}})

D) Cambiar stock a 0 de todos los productos con precio >4000
db.productos.updateMany({precio: {$gt: 4000}, {$set: {stock: 0}}})

E) Borrar productos con el precio menos a 1000
db.productos.deleteMany({precio: {$lt: 1000}})

use ecommerce

db.createUser({
    user: "pepe",
    pwd: "asd456",
    roles: [{ role: "read", db: "ecommerce"}]
})