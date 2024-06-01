def leer_calificaciones(nombre_archivo):
    calificaciones = {}
    try:
        with open(nombre_archivo, 'r') as archivo:
            for linea in archivo:
                materia, calificacion = linea.rsplit(' ', 1)
                calificaciones[materia.strip()] = float(calificacion.strip())
    except FileNotFoundError:
        print(f"El archivo {nombre_archivo} no se encontró.")
    return calificaciones

def calcular_promedio(calificaciones):
    total = sum(calificaciones.values())
    numero_materias = len(calificaciones)
    promedio = total / numero_materias
    return promedio

def añadir_calificacion(nombre_archivo, materia, calificacion):
    with open(nombre_archivo, 'a') as archivo:
        archivo.write(f"{materia} {calificacion}\n")

def actualizar_calificaciones(nombre_archivo):
    calificaciones = leer_calificaciones(nombre_archivo)
    return calificaciones

# Nombre del archivo de calificaciones
nombre_archivo = 'calificaciones.txt'

# Leer calificaciones del archivo y calcular el promedio inicial
calificaciones = leer_calificaciones(nombre_archivo)
if calificaciones:
    promedio_inicial = calcular_promedio(calificaciones)
    print(f"Promedio inicial: {promedio_inicial:.2f}")

# Función para añadir nuevas calificaciones de forma interactiva
def añadir_calificaciones_interactivas(nombre_archivo):
    while True:
        materia = input("Ingrese el nombre de la materia (o 'salir' para terminar): ")
        if materia.lower() == 'salir':
            break
        try:
            calificacion = float(input(f"Ingrese la calificación para {materia}: "))
            añadir_calificacion(nombre_archivo, materia, calificacion)
            calificaciones = actualizar_calificaciones(nombre_archivo)
            nuevo_promedio = calcular_promedio(calificaciones)
            print(f"Nuevo promedio después de añadir {materia}: {nuevo_promedio:.2f}")
        except ValueError:
            print("Calificación inválida. Por favor, ingrese un número.")

# Añadir calificaciones de forma interactiva
añadir_calificaciones_interactivas(nombre_archivo)
