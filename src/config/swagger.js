import swaggerAutogen from 'swagger-autogen'

const doc = {
  info: {
    title: 'Blogging System', // editamos como querramos
    description: 'Esta es la API para manejar los datos de el backend de Blogging System . ' // editamos como querramos
  },
  host: 'localhost:3000' // editamos como querramos
}

const outputFile = './swagger-output.json' // aqui hace ref. al archivo donde se guardara la documentacion
const routes = ['./src/index.js'] // editamos las rutas de las que quiero que se genere la doc. // hago caso de la 'NOTE'


swaggerAutogen(outputFile, routes, doc)