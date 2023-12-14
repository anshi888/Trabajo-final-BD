import mysql.connector

# Configuración de la conexión
conexion = mysql.connector.connect(
    host='',
    user='root',
    password='root',
    database='legos'
)

# Crear un cursor para ejecutar consultas SQL
cursor = conexion.cursor()

# Ejemplo de consulta para seleccionar todos los registros de la tabla usuarios
cursor.execute('SELECT * FROM colors')

# Obtener todos los resultados
resultados = cursor.fetchall()

# Mostrar los resultados
for resultado in resultados:
    print(resultado)

# Cerrar la conexión
conexion.close()
