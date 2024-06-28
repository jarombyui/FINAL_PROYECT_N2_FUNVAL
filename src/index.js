import express from 'express'
import { PORT } from './config/config.js'
import { createUser, updateUser, partialUpdateUser, deleteCountById, createNewPost, updatePost, deletePosttById, getAllPosts, getPostsByCategory, getPostsByTitle, createComment, updateComment, deleteComment, getAllUsers, createCategory, getAllCategories, updateCategoryById, deleteCategoryById } from './controller.js'
import swaggerUi from 'swagger-ui-express'
import jsonDocs from './config/swagger-output.json' assert {type: 'json'}

// Crear la aplicación
const app = express()
// Middleware para parsear el cuerpo de las peticiones como JSON
app.use(express.json())

// GESTION DE CUENTAS (USUARIOS)
// GESTION DE CUENTAS (USUARIOS)

// Ruta para crear un usuario
app.post('/api/user/', createUser)
// Ruta para actulizar datos de usuario
app.put('/api/user/:id', updateUser)
// Ruta para actulizar datos de usuario parcialmente
app.patch('/api/user/:id', partialUpdateUser)
// Ruta para eliminar cuenta de usuario por id
app.delete('/api/user/:id', deleteCountById)

// GESTION DE PUBLICACIONES (USUARIOS)
// GESTION DE PUBLICACIONES (USUARIOS)

// Ruta para crear una post/publicacion
app.post('/api/post/', createNewPost)
// Ruta para actulizar post/publicacion
app.put('/api/post/:id', updatePost)
// Ruta para eliminar un post/publicacion por id
app.delete('/api/post/:id', deletePosttById)
// Ruta obtener todas los/las post/publicacion 
app.get('/api/post/', getAllPosts)
// Ruta obtener post/publicacion por categoria
app.get('/posts/by/category', getPostsByCategory)
// Ruta obtener post/publicacion por titulo
app.get('/posts/by/title', getPostsByTitle)
// Ruta obtener comentar post/publicacion
app.post('/post/comment', createComment)
//actualizar comentario de post/publicacion
app.put('/api/upddate/comment/:id', updateComment)
// Ruta para eliminar su propio comentario por id
app.delete('/api/deleteComent/:id', deleteComment)

// ADMIN
app.get('/api/admin/getAll/', getAllUsers)

// GESTION DE CATEGORIAS
app.post('/api/admin/newCategory', createCategory)
app.get('/api/admin/readAllCategory', getAllCategories)
app.put('/api/admin/updateCategory/:id', updateCategoryById)
app.delete('/api/admin/deleteCategorie/:id', deleteCategoryById)

app.use('/documentation', swaggerUi.serve, swaggerUi.setup(jsonDocs))
// Iniciar el servidor
app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`))

