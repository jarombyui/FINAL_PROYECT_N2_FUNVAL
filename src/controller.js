import { pool } from "../src/config/db.js"


// GESTION DE CUENTAS (USUARIOS)
// CREATE
export const createUser = async (req, res) => {
    try {
        // Validación de que el formulario no esté incompleto
        const { username, email, password, role } = req.body;
        if (!username || !email || !password || !role) {
            return res.status(400).json({ message: 'Faltan datos en el formulario' });
        }

        // Armando query de inserción de datos a BD
        const [resultado] = await pool.execute(
            'INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)',
            [username, email, password, role]
        );

        // Valida el cambio ejecutado en la base de datos, si no lanza error
        if (resultado.affectedRows !== 1) {
            return res.status(500).json({ message: "Hubo un error al crear el usuario" });
        }
        
        res.status(201).json({ message: "Usuario guardado", userId: resultado.insertId });
    } catch (error) {
        return res.status(500).json({ message: 'Error interno', details: error.message });
    }
}

// ACTUALIZAR DATOS DE USUARIO
export const updateUser = async (req, res) => {
    try {
      const { id } = req.params
      const { username, email, password, role, created_at, updated_at } = req.body
    
      if (!username || !email || !password || !role) {
        return res.status(400).json({ message: ' Faltan datos en el formulario' })
      }
    
      const [resultado] = await pool.execute(
        'UPDATE users SET username=?, email=?, password=?, role=?, created_at=?, updated_at=? WHERE id=?',
        [username, email, password, role, created_at ?? null, updated_at ?? null, id] // con esto ?? hacemos que si pasamos valor nulo lo acepte como nulo
      )
    
      if(resultado.affectedRows !== 1) {
        return res.status(500).json({ message: "No se pudo actualizar el usuario" })
      }
      res.json({ message: "usuario actualizado" })
     } catch (error) {
      return res.status(500).json({ message: 'Error interno', details: error.message})
      
     }
    }

 // PARCIUAL UPDATE ACTUALIZAR DATOS DE USUARIO
 export const partialUpdateUser = async (req, res) => {
    try {
      const { id } = req.params
      const { username, email, password, role, created_at, updated_at } = req.body
  
      let query = 'UPDATE users SET'
      const params = []
  
      if (username) {
        query += ' username=?,'
        params.push(username)
      }
  
      if (email) {
        query += ' email=?,'
        params.push(email)
      }
  
      if (password) {
        query += ' password=?,'
        params.push(password)
      }
  
      if (role) {
        query += ' role=?,'
        params.push(role)
      }
  
      if (created_at) {
        query += ' created_at=?,'
        params.push(created_at)
      }
  
      if (updated_at) {
        query += ' updated_at=?,'
        params.push(updated_at)
      }

      // eliminar la ultima coma
      query = query.slice(0, -1)
      query += ' WHERE id=?'
      console.log(query)
      params.push(id)
  
      const [resultado] = await pool.execute(query, params)
  
      if (resultado.affectedRows !== 1){
        return req.status(500).json({ message: 'No se pudo actualizar el artista'})
      }
  
      res.json({ message: 'Usuario actualizado'})
      console.log(query)
    } catch (error) {
      return res
      .status(500)
      .json({ message: 'Error interno', details: error.message})
    }
  }

  // ELIMINACION DE CUENTAS
  export const deleteCountById = async (req, res) => {
    const { id } = req.params
  
    const [resultado] = await pool.execute(
      "DELETE FROM users WHERE id = ?",
      [id]
    );
    // manejando  respuesta segun el request emviado
    if (resultado.affectedRows === 1) {
      return res.json({ message: "Usuario eliminado" })
    }
  
    return res.status(500).json({ message: "No se pudo eliminar el Usuario" })
  }

// GESTION DE PUBLICACIONES (USUARIOS)
// Crear nuevo post/publicacion

export const createNewPost = async (req, res) => {
  try {
      // Validación de que el formulario no esté incompleto
      const { user_id, title, content } = req.body;
      if (!user_id || !title || !content) {
          return res.status(400).json({ message: 'Faltan datos en el formulario' });
      }

      // Armando query de inserción de datos a BD
      const [resultado] = await pool.execute(
          'INSERT INTO posts (user_id, title, content) VALUES (?, ?, ?)',
          [user_id, title, content]
      );

      // Valida el cambio ejecutado en la base de datos, si no lanza error
      if (resultado.affectedRows !== 1) {
          return res.status(500).json({ message: 'Hubo un error al crear la publicación' });
      }

      res.status(201).json({ message: 'Publicación guardada', postId: resultado.insertId });
  } catch (error) {
      console.error('Error al crear la publicación:', error);
      return res.status(500).json({ message: 'Error interno', details: error.message });
  }
};

// Actualizar post/publicacion

export const updatePost = async (req, res) => {
  try {
    const { id } = req.params;
    const { user_id, title, content } = req.body;

    if (!user_id || !title || !content) {
      return res.status(400).json({ message: 'Faltan datos en el formulario' });
    }

    // Verificar si el post existe antes de intentar actualizarlo
    const [postCheck] = await pool.execute('SELECT id FROM posts WHERE id = ?', [id]);
    if (postCheck.length === 0) {
      return res.status(404).json({ message: 'Publicación no encontrada' });
    }

    // Actualizar la publicación, excluyendo created_at
    const [resultado] = await pool.execute(
      'UPDATE posts SET user_id = ?, title = ?, content = ?, updated_at = NOW() WHERE id = ?',
      [user_id, title, content, id]
    );

    if (resultado.affectedRows !== 1) {
      return res.status(500).json({ message: 'No se pudo actualizar la publicación' });
    }

    res.json({ message: 'Publicación actualizada' });
  } catch (error) {
    console.error('Error al actualizar la publicación:', error);
    return res.status(500).json({ message: 'Error interno', details: error.message });
  }
};

// Eliminacion de  post/publicacion
export const deletePosttById = async (req, res) => {
  const { id } = req.params

  const [resultado] = await pool.execute(
    "DELETE FROM posts WHERE id = ?",
    [id]
  );
  // manejando  respuesta segun el request emviado
  if (resultado.affectedRows === 1) {
    return res.json({ message: "Publicacion eliminada" })
  }

  return res.status(500).json({ message: "No se pudo eliminar la publicacion" })
}


// Obtencion de todas las publicaciones
export const getAllPosts = async (req, res) => {
  try {
    const { user_id } = req.query; // Obtener el user_id de los parámetros de consulta

    let query = 'SELECT * FROM posts';
    let queryParams = [];

    // Si se proporciona un user_id, agregarlo a la consulta
    if (user_id) {
      query += ' WHERE user_id = ?';
      queryParams.push(user_id);
    }

    const [posts] = await pool.execute(query, queryParams);

    res.json(posts);
  } catch (error) {
    console.error('Error al obtener publicaciones:', error);
    return res.status(500).json({ message: 'Error interno', details: error.message });
  }
};

export const getPostsByCategory = async (req, res) => {
  try {
    const { category_id } = req.query; // Obtener el category_id de los parámetros de consulta

    // Validar que se haya proporcionado un category_id
    if (!category_id) {
      return res.status(400).json({ message: 'category_id es requerido' });
    }

    // Armando query para obtener publicaciones filtradas por categoría
    const query = `
      SELECT posts.*, categories.name as category_name
      FROM posts
      INNER JOIN post_categories ON posts.id = post_categories.post_id
      INNER JOIN categories ON post_categories.category_id = categories.id
      WHERE post_categories.category_id = ?
    `;

    const [posts] = await pool.execute(query, [category_id]);

    res.json(posts);
  } catch (error) {
    console.error('Error al obtener publicaciones:', error);
    return res.status(500).json({ message: 'Error interno', details: error.message });
  }
};

// Obtencion de publicaiones por titulo
// Función para obtener publicaciones filtradas por título
export const getPostsByTitle = async (req, res) => {
  try {
    const { title } = req.query; // Obtener el title de los parámetros de consulta

    // Validar que se haya proporcionado un título
    if (!title) {
      return res.status(400).json({ message: 'title es requerido' });
    }

    // Armando query para buscar publicaciones por título
    const query = `
      SELECT posts.*, categories.name as category_name
      FROM posts
      LEFT JOIN post_categories ON posts.id = post_categories.post_id
      LEFT JOIN categories ON post_categories.category_id = categories.id
      WHERE posts.title LIKE ?
    `;

    const [posts] = await pool.execute(query, [`%${title}%`]);

    res.json(posts);
  } catch (error) {
    console.error('Error al obtener publicaciones:', error);
    return res.status(500).json({ message: 'Error interno', details: error.message });
  }
};

export const createComment = async (req, res) => {
  try {
    const { post_id, user_id, content } = req.body; // Obtener los datos del cuerpo de la solicitud

    // Validación de que el formulario no esté incompleto
    if (!post_id || !user_id || !content) {
      return res.status(400).json({ message: 'Faltan datos en el formulario' });
    }

    // Armando query de inserción de datos a BD
    const [resultado] = await pool.execute(
      'INSERT INTO comments (post_id, user_id, content) VALUES (?, ?, ?)',
      [post_id, user_id, content]
    );

    // Valida el cambio ejecutado en la base de datos, si no lanza error
    if (resultado.affectedRows !== 1) {
      return res.status(500).json({ message: "Hubo un error al crear el comentario" });
    }

    res.status(201).json({ message: "Comentario guardado", commentId: resultado.insertId });
  } catch (error) {
    console.error('Error al crear comentario:', error);
    return res.status(500).json({ message: 'Error interno', details: error.message });
  }
};


export const updateComment = async (req, res) => {
  const { id } = req.params;
  const { user_id, content } = req.body;

  if (!user_id || !content) {
    return res.status(400).json({ message: 'Todos los campos son obligatorios' });
  }

  try {
    // Verificar si el comentario existe y pertenece al usuario
    const [comment] = await pool.query(
      'SELECT user_id FROM comments WHERE id = ?',
      [id]
    );

    if (comment.length === 0) {
      return res.status(404).json({ message: 'Comentario no encontrado' });
    }

    if (comment[0].user_id !== user_id) {
      return res.status(403).json({ message: 'No tienes permiso para actualizar este comentario' });
    }

    // Actualizar el comentario
    await pool.query(
      'UPDATE comments SET content = ?, updated_at = NOW() WHERE id = ?',
      [content, id]
    );

    res.status(200).json({ message: 'Comentario actualizado exitosamente' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error al actualizar el comentario' });
  }
};

export const deleteComment = async (req, res) => {
  const { id } = req.params;
  const { user_id } = req.body;

  if (!user_id) {
    return res.status(400).json({ message: 'El ID de usuario es obligatorio' });
  }

  try {
    // Verificar si el comentario existe y pertenece al usuario
    const [comment] = await pool.query(
      'SELECT user_id FROM comments WHERE id = ?',
      [id]
    );

    if (comment.length === 0) {
      return res.status(404).json({ message: 'Comentario no encontrado' });
    }

    if (comment[0].user_id !== user_id) {
      return res.status(403).json({ message: 'No tienes permiso para eliminar este comentario' });
    }

    // Eliminar el comentario
    await pool.query(
      'DELETE FROM comments WHERE id = ?',
      [id]
    );

    res.status(200).json({ message: 'Comentario eliminado exitosamente' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error al eliminar el comentario' });
  }
};

// ADMIN

export const getAllUsers = async (req, res) => {
  try {
    // Verificar si el usuario tiene permisos de administrador (esto debería ser manejado por el middleware isAdmin)
    const [users] = await pool.query(
      'SELECT id, username, email, role, created_at, updated_at FROM users'
    );

    res.status(200).json(users); // Devolver la lista de usuarios en formato JSON
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error al obtener los usuarios' });
  }
};

/// Gestion de categorias

export const createCategory = async (req, res) => {
  const { name } = req.body;
  try {
    const [result] = await pool.query(
      'INSERT INTO categories (name, created_at, updated_at) VALUES (?, NOW(), NOW())',
      [name]
    );
    res.status(201).json({ id: result.insertId, name });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error al crear la categoría' });
  }
};


export const getAllCategories = async (req, res) => {
  try {
    const [categories] = await pool.query('SELECT id, name, created_at, updated_at FROM categories');
    res.status(200).json(categories);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error al obtener las categorías' });
  }
};


export const updateCategoryById = async (req, res) => {
  const { id } = req.params;
  const { name } = req.body;
  try {
    const [result] = await pool.query(
      'UPDATE categories SET name = ?, updated_at = NOW() WHERE id = ?',
      [name, id]
    );
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Categoría no encontrada' });
    }
    res.status(200).json({ message: 'Categoría actualizada exitosamente' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error al actualizar la categoría' });
  }
};

export const deleteCategoryById = async (req, res) => {
  const { id } = req.params;
  try {
    const [result] = await pool.query('DELETE FROM categories WHERE id = ?', [id]);
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Categoría no encontrada' });
    }
    res.status(200).json({ message: 'Categoría eliminada exitosamente' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error al eliminar la categoría' });
  }
};



