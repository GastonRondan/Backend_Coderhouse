import { CarritoArchivo } from "./carrito/CarritoArchivo.js";
import { CarritoMongo } from "./carrito/CarritoMongo.js"; 
import { ProductoArchivo } from "./productos/ProductoArchivo.js"; 
import { ProductoMongo } from "./productos/ProductoMongo.js";

const DATABASES = {
    mongo: {
        carritoApi: new CarritoMongo(),
        productoApi: new ProductoMongo()
    },
    archivo: {
        carritoApi: new CarritoArchivo(),
        productoApi: new ProductoArchivo()
    }
}

const DB = process.env.SELECTED_DB || 'mongo'

const {carritoApi, productoApi} = DATABASES[DB]

export {carritoApi, productoApi}