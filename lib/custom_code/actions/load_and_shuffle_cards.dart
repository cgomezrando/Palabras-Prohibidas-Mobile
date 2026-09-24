// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:math';

Future<List<QuestionStruct>> loadAndShuffleCards() async {
  const String questionsJson = r'''
[
  {
    "word": "Avión",
    "forbidden": [
      "volar",
      "piloto",
      "aeropuerto",
      "cielo"
    ]
  },
  {
    "word": "Pizza",
    "forbidden": [
      "queso",
      "masa",
      "tomate",
      "italiana"
    ]
  },
  {
    "word": "Médico",
    "forbidden": [
      "hospital",
      "doctor",
      "paciente",
      "enfermedad"
    ]
  },
  {
    "word": "Guitarra",
    "forbidden": [
      "música",
      "cuerdas",
      "tocar",
      "instrumento"
    ]
  },
  {
    "word": "Tiburón",
    "forbidden": [
      "mar",
      "pez",
      "aleta",
      "océano"
    ]
  },
  {
    "word": "Ordenador",
    "forbidden": [
      "computadora",
      "pantalla",
      "teclado",
      "internet"
    ]
  },
  {
    "word": "Chocolate",
    "forbidden": [
      "dulce",
      "cacao",
      "tableta",
      "postre"
    ]
  },
  {
    "word": "Biblioteca",
    "forbidden": [
      "libros",
      "leer",
      "silencio",
      "estudio"
    ]
  },
  {
    "word": "Bombero",
    "forbidden": [
      "fuego",
      "apagar",
      "manguera",
      "rescate"
    ]
  },
  {
    "word": "Castillo",
    "forbidden": [
      "rey",
      "princesa",
      "torre",
      "medieval"
    ]
  },
  {
    "word": "Helado",
    "forbidden": [
      "frío",
      "cono",
      "verano",
      "sabor"
    ]
  },
  {
    "word": "Tren",
    "forbidden": [
      "estación",
      "vías",
      "vagón",
      "locomotora"
    ]
  },
  {
    "word": "Montaña",
    "forbidden": [
      "cima",
      "escalar",
      "nieve",
      "altura"
    ]
  },
  {
    "word": "Espejo",
    "forbidden": [
      "reflejo",
      "cristal",
      "imagen",
      "baño"
    ]
  },
  {
    "word": "Tortuga",
    "forbidden": [
      "caparazón",
      "lenta",
      "reptil",
      "mar"
    ]
  },
  {
    "word": "Reloj",
    "forbidden": [
      "hora",
      "tiempo",
      "minutos",
      "muñeca"
    ]
  },
  {
    "word": "Semáforo",
    "forbidden": [
      "rojo",
      "verde",
      "tráfico",
      "coche"
    ]
  },
  {
    "word": "Policía",
    "forbidden": [
      "agente",
      "ley",
      "patrulla",
      "arresto"
    ]
  },
  {
    "word": "Cafetera",
    "forbidden": [
      "café",
      "desayuno",
      "máquina",
      "taza"
    ]
  },
  {
    "word": "Paraguas",
    "forbidden": [
      "lluvia",
      "agua",
      "mojarse",
      "tormenta"
    ]
  },
  {
    "word": "Dinosaurio",
    "forbidden": [
      "extinto",
      "fósil",
      "jurásico",
      "gigante"
    ]
  },
  {
    "word": "Globo",
    "forbidden": [
      "aire",
      "fiesta",
      "inflar",
      "cumpleaños"
    ]
  },
  {
    "word": "Canguro",
    "forbidden": [
      "Australia",
      "marsupial",
      "salto",
      "bolsa"
    ]
  },
  {
    "word": "Nevera",
    "forbidden": [
      "frío",
      "cocina",
      "congelador",
      "comida"
    ]
  },
  {
    "word": "Bicicleta",
    "forbidden": [
      "pedal",
      "rueda",
      "casco",
      "montar"
    ]
  },
  {
    "word": "Faro",
    "forbidden": [
      "luz",
      "costa",
      "mar",
      "barco"
    ]
  },
  {
    "word": "Pingüino",
    "forbidden": [
      "hielo",
      "Antártida",
      "ave",
      "negro"
    ]
  },
  {
    "word": "Astronauta",
    "forbidden": [
      "espacio",
      "cohete",
      "luna",
      "NASA"
    ]
  },
  {
    "word": "Murciélago",
    "forbidden": [
      "noche",
      "alas",
      "vampiro",
      "cueva"
    ]
  },
  {
    "word": "Perfume",
    "forbidden": [
      "olor",
      "fragancia",
      "colonia",
      "botella"
    ]
  },
  {
    "word": "Robot",
    "forbidden": [
      "máquina",
      "inteligencia",
      "automático",
      "tecnología"
    ]
  },
  {
    "word": "Hospital",
    "forbidden": [
      "médico",
      "enfermera",
      "paciente",
      "urgencias"
    ]
  },
  {
    "word": "Caracol",
    "forbidden": [
      "lento",
      "concha",
      "baba",
      "jardín"
    ]
  },
  {
    "word": "Piano",
    "forbidden": [
      "teclas",
      "música",
      "instrumento",
      "tocar"
    ]
  },
  {
    "word": "Playa",
    "forbidden": [
      "arena",
      "mar",
      "sol",
      "vacaciones"
    ]
  },
  {
    "word": "Tornado",
    "forbidden": [
      "viento",
      "tormenta",
      "desastre",
      "remolino"
    ]
  },
  {
    "word": "Abeja",
    "forbidden": [
      "miel",
      "colmena",
      "insecto",
      "picadura"
    ]
  },
  {
    "word": "Cohete",
    "forbidden": [
      "espacio",
      "lanzamiento",
      "astronauta",
      "combustible"
    ]
  },
  {
    "word": "Silla",
    "forbidden": [
      "sentarse",
      "mueble",
      "mesa",
      "respaldo"
    ]
  },
  {
    "word": "Fantasma",
    "forbidden": [
      "espíritu",
      "miedo",
      "casa",
      "aparecer"
    ]
  },
  {
    "word": "Camello",
    "forbidden": [
      "desierto",
      "joroba",
      "arena",
      "oasis"
    ]
  },
  {
    "word": "Pirata",
    "forbidden": [
      "barco",
      "tesoro",
      "parche",
      "capitán"
    ]
  },
  {
    "word": "Hospitalidad",
    "forbidden": [
      "recibir",
      "invitados",
      "amable",
      "atención"
    ]
  },
  {
    "word": "Diamante",
    "forbidden": [
      "joya",
      "brillante",
      "anillo",
      "piedra"
    ]
  },
  {
    "word": "Cebra",
    "forbidden": [
      "rayas",
      "África",
      "caballo",
      "blanco"
    ]
  },
  {
    "word": "Fotografía",
    "forbidden": [
      "cámara",
      "imagen",
      "foto",
      "retrato"
    ]
  },
  {
    "word": "Mago",
    "forbidden": [
      "truco",
      "magia",
      "ilusionista",
      "sombrero"
    ]
  },
  {
    "word": "Ascensor",
    "forbidden": [
      "edificio",
      "subir",
      "bajar",
      "botones"
    ]
  },
  {
    "word": "Volcán",
    "forbidden": [
      "lava",
      "erupción",
      "montaña",
      "fuego"
    ]
  },
  {
    "word": "Corbata",
    "forbidden": [
      "cuello",
      "traje",
      "elegante",
      "camisa"
    ]
  },
  {
    "word": "Telescopio",
    "forbidden": [
      "estrellas",
      "observar",
      "espacio",
      "astronomía"
    ]
  },
  {
    "word": "Cocodrilo",
    "forbidden": [
      "reptil",
      "río",
      "dientes",
      "verde"
    ]
  },
  {
    "word": "Martillo",
    "forbidden": [
      "clavo",
      "herramienta",
      "golpear",
      "carpintero"
    ]
  },
  {
    "word": "Cerebro",
    "forbidden": [
      "pensar",
      "mente",
      "inteligencia",
      "cabeza"
    ]
  },
  {
    "word": "Unicornio",
    "forbidden": [
      "cuerno",
      "mágico",
      "caballo",
      "fantasía"
    ]
  },
  {
    "word": "Ventilador",
    "forbidden": [
      "aire",
      "calor",
      "aspas",
      "refrescar"
    ]
  },
  {
    "word": "Panadería",
    "forbidden": [
      "pan",
      "horno",
      "bollos",
      "harina"
    ]
  },
  {
    "word": "Brújula",
    "forbidden": [
      "norte",
      "dirección",
      "mapa",
      "orientación"
    ]
  },
  {
    "word": "Delfín",
    "forbidden": [
      "mar",
      "mamífero",
      "inteligente",
      "saltar"
    ]
  },
  {
    "word": "Escalera",
    "forbidden": [
      "subir",
      "bajar",
      "peldaños",
      "altura"
    ]
  },
  {
    "word": "Cactus",
    "forbidden": [
      "desierto",
      "pinchos",
      "planta",
      "agua"
    ]
  },
  {
    "word": "Violín",
    "forbidden": [
      "cuerdas",
      "arco",
      "música",
      "instrumento"
    ]
  },
  {
    "word": "Hormiga",
    "forbidden": [
      "insecto",
      "colonia",
      "pequeña",
      "trabajo"
    ]
  },
  {
    "word": "Muralla",
    "forbidden": [
      "muro",
      "defensa",
      "piedra",
      "ciudad"
    ]
  },
  {
    "word": "Chimenea",
    "forbidden": [
      "humo",
      "fuego",
      "tejado",
      "casa"
    ]
  },
  {
    "word": "Sirena",
    "forbidden": [
      "mar",
      "cola",
      "pez",
      "canto"
    ]
  },
  {
    "word": "Imán",
    "forbidden": [
      "metal",
      "atraer",
      "magnetismo",
      "nevera"
    ]
  },
  {
    "word": "Satélite",
    "forbidden": [
      "órbita",
      "espacio",
      "comunicación",
      "tierra"
    ]
  },
  {
    "word": "Almohada",
    "forbidden": [
      "dormir",
      "cama",
      "cabeza",
      "suave"
    ]
  },
  {
    "word": "Panda",
    "forbidden": [
      "China",
      "oso",
      "bambú",
      "blanco"
    ]
  },
  {
    "word": "Submarino",
    "forbidden": [
      "agua",
      "océano",
      "barco",
      "profundidad"
    ]
  },
  {
    "word": "Calendario",
    "forbidden": [
      "fecha",
      "mes",
      "año",
      "días"
    ]
  },
  {
    "word": "Arcoíris",
    "forbidden": [
      "colores",
      "lluvia",
      "cielo",
      "sol"
    ]
  },
  {
    "word": "Escorpión",
    "forbidden": [
      "picadura",
      "desierto",
      "veneno",
      "cola"
    ]
  },
  {
    "word": "Linterna",
    "forbidden": [
      "luz",
      "pilas",
      "oscuridad",
      "iluminar"
    ]
  },
  {
    "word": "Dragón",
    "forbidden": [
      "fuego",
      "alas",
      "fantástico",
      "monstruo"
    ]
  },
  {
    "word": "Cepillo",
    "forbidden": [
      "dientes",
      "pelo",
      "peinar",
      "cerdas"
    ]
  },
  {
    "word": "Termómetro",
    "forbidden": [
      "temperatura",
      "fiebre",
      "grados",
      "medir"
    ]
  },
  {
    "word": "Lobo",
    "forbidden": [
      "manada",
      "bosque",
      "aullar",
      "animal"
    ]
  },
  {
    "word": "Batería",
    "forbidden": [
      "música",
      "tambor",
      "ritmo",
      "instrumento"
    ]
  },
  {
    "word": "Huevo",
    "forbidden": [
      "gallina",
      "desayuno",
      "cáscara",
      "yema"
    ]
  },
  {
    "word": "Radar",
    "forbidden": [
      "detectar",
      "señal",
      "avión",
      "pantalla"
    ]
  },
  {
    "word": "Mapa",
    "forbidden": [
      "país",
      "ciudad",
      "orientación",
      "ruta"
    ]
  },
  {
    "word": "Ballena",
    "forbidden": [
      "océano",
      "gigante",
      "mamífero",
      "agua"
    ]
  },
  {
    "word": "Cinturón",
    "forbidden": [
      "pantalón",
      "cintura",
      "hebilla",
      "sujetar"
    ]
  },
  {
    "word": "Hada",
    "forbidden": [
      "alas",
      "magia",
      "cuento",
      "varita"
    ]
  },
  {
    "word": "Escoba",
    "forbidden": [
      "barrer",
      "limpieza",
      "suelo",
      "palo"
    ]
  },
  {
    "word": "Sandía",
    "forbidden": [
      "fruta",
      "verano",
      "roja",
      "semillas"
    ]
  },
  {
    "word": "Helicóptero",
    "forbidden": [
      "hélice",
      "volar",
      "piloto",
      "rescate"
    ]
  },
  {
    "word": "Sardina",
    "forbidden": [
      "pez",
      "lata",
      "mar",
      "pequeña"
    ]
  },
  {
    "word": "Laberinto",
    "forbidden": [
      "salida",
      "camino",
      "perderse",
      "pasillos"
    ]
  },
  {
    "word": "Trompeta",
    "forbidden": [
      "instrumento",
      "viento",
      "música",
      "jazz"
    ]
  },
  {
    "word": "Caballero",
    "forbidden": [
      "espada",
      "caballo",
      "medieval",
      "armadura"
    ]
  },
  {
    "word": "Estrella",
    "forbidden": [
      "cielo",
      "noche",
      "espacio",
      "brillo"
    ]
  },
  {
    "word": "Semilla",
    "forbidden": [
      "planta",
      "crecer",
      "tierra",
      "árbol"
    ]
  },
  {
    "word": "Cartera",
    "forbidden": [
      "dinero",
      "billetera",
      "tarjetas",
      "bolsillo"
    ]
  },
  {
    "word": "Oso",
    "forbidden": [
      "animal",
      "bosque",
      "peluche",
      "grande"
    ]
  },
  {
    "word": "Eclipse",
    "forbidden": [
      "luna",
      "sol",
      "sombra",
      "astronomía"
    ]
  },
  {
    "word": "Antorcha",
    "forbidden": [
      "fuego",
      "llama",
      "luz",
      "olímpica"
    ]
  },
  {
    "word": "Globo terráqueo",
    "forbidden": [
      "mundo",
      "planeta",
      "mapa",
      "tierra"
    ]
  },
  {
    "word": "Aeropuerto",
    "forbidden": [
      "avión",
      "pista",
      "vuelo",
      "terminal"
    ]
  },
  {
    "word": "Cocinero",
    "forbidden": [
      "chef",
      "cocina",
      "restaurante",
      "receta"
    ]
  },
  {
    "word": "Ping-Pong",
    "forbidden": [
      "pelota",
      "mesa",
      "raqueta",
      "deporte"
    ]
  },
  {
    "word": "Jirafa",
    "forbidden": [
      "cuello",
      "alta",
      "África",
      "manchas"
    ]
  },
  {
    "word": "Aspiradora",
    "forbidden": [
      "limpiar",
      "polvo",
      "suelo",
      "electrodoméstico"
    ]
  },
  {
    "word": "Oveja",
    "forbidden": [
      "lana",
      "pastor",
      "rebaño",
      "campo"
    ]
  },
  {
    "word": "Cámara",
    "forbidden": [
      "foto",
      "objetivo",
      "imagen",
      "grabar"
    ]
  },
  {
    "word": "Patinaje",
    "forbidden": [
      "hielo",
      "patines",
      "deslizar",
      "deporte"
    ]
  },
  {
    "word": "Sardina",
    "forbidden": [
      "pez",
      "lata",
      "mar",
      "conserva"
    ]
  },
  {
    "word": "Búho",
    "forbidden": [
      "noche",
      "ave",
      "ojos",
      "sabio"
    ]
  },
  {
    "word": "Termita",
    "forbidden": [
      "madera",
      "insecto",
      "plaga",
      "comer"
    ]
  },
  {
    "word": "Pijama",
    "forbidden": [
      "dormir",
      "cama",
      "noche",
      "ropa"
    ]
  },
  {
    "word": "Trampolín",
    "forbidden": [
      "salto",
      "piscina",
      "rebote",
      "acrobacia"
    ]
  },
  {
    "word": "Aguacate",
    "forbidden": [
      "fruta",
      "verde",
      "guacamole",
      "hueso"
    ]
  },
  {
    "word": "Monopatín",
    "forbidden": [
      "ruedas",
      "tabla",
      "skate",
      "truco"
    ]
  },
  {
    "word": "Cueva",
    "forbidden": [
      "roca",
      "oscuridad",
      "murciélago",
      "montaña"
    ]
  },
  {
    "word": "Caramelo",
    "forbidden": [
      "dulce",
      "azúcar",
      "chuche",
      "golosina"
    ]
  },
  {
    "word": "Sirena",
    "forbidden": [
      "ambulancia",
      "policía",
      "sonido",
      "emergencia"
    ]
  },
  {
    "word": "Cebra",
    "forbidden": [
      "rayas",
      "caballo",
      "África",
      "blanco"
    ]
  },
  {
    "word": "Canoa",
    "forbidden": [
      "río",
      "remar",
      "agua",
      "embarcación"
    ]
  },
  {
    "word": "Camarero",
    "forbidden": [
      "restaurante",
      "mesa",
      "servir",
      "comida"
    ]
  },
  {
    "word": "Espantapájaros",
    "forbidden": [
      "campo",
      "pájaro",
      "paja",
      "cultivo"
    ]
  },
  {
    "word": "Cereza",
    "forbidden": [
      "fruta",
      "roja",
      "árbol",
      "hueso"
    ]
  },
  {
    "word": "Ducha",
    "forbidden": [
      "agua",
      "baño",
      "jabón",
      "lavar"
    ]
  },
  {
    "word": "Esquí",
    "forbidden": [
      "nieve",
      "montaña",
      "deporte",
      "descenso"
    ]
  },
  {
    "word": "Tostadora",
    "forbidden": [
      "pan",
      "desayuno",
      "cocina",
      "caliente"
    ]
  },
  {
    "word": "Rinoceronte",
    "forbidden": [
      "cuerno",
      "África",
      "animal",
      "grande"
    ]
  },
  {
    "word": "Cangrejo",
    "forbidden": [
      "mar",
      "pinzas",
      "playa",
      "crustáceo"
    ]
  },
  {
    "word": "Baloncesto",
    "forbidden": [
      "canasta",
      "balón",
      "deporte",
      "NBA"
    ]
  },
  {
    "word": "Semilla",
    "forbidden": [
      "planta",
      "tierra",
      "crecer",
      "árbol"
    ]
  },
  {
    "word": "Tornillo",
    "forbidden": [
      "herramienta",
      "rosca",
      "destornillador",
      "metal"
    ]
  },
  {
    "word": "Delfín",
    "forbidden": [
      "mar",
      "mamífero",
      "inteligente",
      "saltar"
    ]
  },
  {
    "word": "Sándwich",
    "forbidden": [
      "pan",
      "comida",
      "jamón",
      "queso"
    ]
  },
  {
    "word": "Pavo",
    "forbidden": [
      "Navidad",
      "ave",
      "plumas",
      "cena"
    ]
  },
  {
    "word": "Cascada",
    "forbidden": [
      "agua",
      "río",
      "caída",
      "naturaleza"
    ]
  },
  {
    "word": "Paraguas",
    "forbidden": [
      "lluvia",
      "agua",
      "abrir",
      "mojarse"
    ]
  },
  {
    "word": "Robot",
    "forbidden": [
      "máquina",
      "tecnología",
      "automático",
      "inteligencia"
    ]
  },
  {
    "word": "Manta",
    "forbidden": [
      "frío",
      "sofá",
      "cama",
      "abrigo"
    ]
  },
  {
    "word": "Hámster",
    "forbidden": [
      "jaula",
      "rueda",
      "mascota",
      "pequeño"
    ]
  },
  {
    "word": "Peonza",
    "forbidden": [
      "girar",
      "juguete",
      "cuerda",
      "suelo"
    ]
  },
  {
    "word": "Loro",
    "forbidden": [
      "ave",
      "hablar",
      "plumas",
      "mascota"
    ]
  },
  {
    "word": "Puente",
    "forbidden": [
      "río",
      "cruzar",
      "estructura",
      "carretera"
    ]
  },
  {
    "word": "Croqueta",
    "forbidden": [
      "comida",
      "frita",
      "bechamel",
      "tapa"
    ]
  },
  {
    "word": "Zumo",
    "forbidden": [
      "fruta",
      "beber",
      "naranja",
      "vaso"
    ]
  },
  {
    "word": "Tractor",
    "forbidden": [
      "campo",
      "agricultor",
      "máquina",
      "tierra"
    ]
  },
  {
    "word": "Vela",
    "forbidden": [
      "fuego",
      "cera",
      "luz",
      "cumpleaños"
    ]
  },
  {
    "word": "Nido",
    "forbidden": [
      "pájaro",
      "huevos",
      "árbol",
      "ramas"
    ]
  },
  {
    "word": "Botella",
    "forbidden": [
      "agua",
      "vidrio",
      "bebida",
      "tapón"
    ]
  },
  {
    "word": "Pescador",
    "forbidden": [
      "pez",
      "caña",
      "río",
      "mar"
    ]
  },
  {
    "word": "Carpa",
    "forbidden": [
      "tienda",
      "camping",
      "lona",
      "acampar"
    ]
  },
  {
    "word": "Escultura",
    "forbidden": [
      "arte",
      "piedra",
      "estatua",
      "museo"
    ]
  },
  {
    "word": "Pizarra",
    "forbidden": [
      "escuela",
      "escribir",
      "tiza",
      "aula"
    ]
  },
  {
    "word": "Mandarina",
    "forbidden": [
      "fruta",
      "naranja",
      "gajos",
      "cítrico"
    ]
  },
  {
    "word": "Sótano",
    "forbidden": [
      "casa",
      "debajo",
      "oscuro",
      "almacén"
    ]
  },
  {
    "word": "Bicicleta",
    "forbidden": [
      "pedal",
      "rueda",
      "cadena",
      "casco"
    ]
  },
  {
    "word": "Cenicero",
    "forbidden": [
      "cigarro",
      "ceniza",
      "fumar",
      "mesa"
    ]
  },
  {
    "word": "Tortilla",
    "forbidden": [
      "huevo",
      "cocina",
      "patata",
      "sartén"
    ]
  },
  {
    "word": "Pulpo",
    "forbidden": [
      "mar",
      "tentáculos",
      "animal",
      "océano"
    ]
  },
  {
    "word": "Escorpión",
    "forbidden": [
      "veneno",
      "cola",
      "picadura",
      "desierto"
    ]
  },
  {
    "word": "Alfombra",
    "forbidden": [
      "suelo",
      "decorar",
      "salón",
      "tela"
    ]
  },
  {
    "word": "Sardina",
    "forbidden": [
      "pez",
      "mar",
      "lata",
      "pequeña"
    ]
  },
  {
    "word": "Ventana",
    "forbidden": [
      "cristal",
      "abrir",
      "casa",
      "aire"
    ]
  },
  {
    "word": "Caravana",
    "forbidden": [
      "camping",
      "remolque",
      "viaje",
      "vacaciones"
    ]
  },
  {
    "word": "Batería",
    "forbidden": [
      "música",
      "tambor",
      "ritmo",
      "instrumento"
    ]
  },
  {
    "word": "Pincel",
    "forbidden": [
      "pintura",
      "artista",
      "brocha",
      "cuadro"
    ]
  },
  {
    "word": "Calabaza",
    "forbidden": [
      "Halloween",
      "naranja",
      "huerto",
      "vegetal"
    ]
  },
  {
    "word": "Tiburón",
    "forbidden": [
      "mar",
      "aleta",
      "dientes",
      "pez"
    ]
  },
  {
    "word": "Castillo",
    "forbidden": [
      "rey",
      "princesa",
      "torre",
      "medieval"
    ]
  },
  {
    "word": "Patinete",
    "forbidden": [
      "ruedas",
      "calle",
      "eléctrico",
      "transporte"
    ]
  },
  {
    "word": "Nuez",
    "forbidden": [
      "fruto seco",
      "cáscara",
      "árbol",
      "comer"
    ]
  },
  {
    "word": "Globo",
    "forbidden": [
      "inflar",
      "aire",
      "fiesta",
      "cumpleaños"
    ]
  },
  {
    "word": "Taladro",
    "forbidden": [
      "agujero",
      "herramienta",
      "pared",
      "broca"
    ]
  },
  {
    "word": "Pingüino",
    "forbidden": [
      "hielo",
      "Antártida",
      "ave",
      "negro"
    ]
  },
  {
    "word": "Bufanda",
    "forbidden": [
      "cuello",
      "invierno",
      "frío",
      "lana"
    ]
  },
  {
    "word": "Semáforo",
    "forbidden": [
      "rojo",
      "verde",
      "tráfico",
      "calle"
    ]
  },
  {
    "word": "Volcán",
    "forbidden": [
      "lava",
      "erupción",
      "montaña",
      "fuego"
    ]
  },
  {
    "word": "Dominó",
    "forbidden": [
      "fichas",
      "juego",
      "puntos",
      "mesa"
    ]
  },
  {
    "word": "Escalera",
    "forbidden": [
      "subir",
      "bajar",
      "peldaños",
      "altura"
    ]
  },
  {
    "word": "Cactus",
    "forbidden": [
      "planta",
      "pinchos",
      "desierto",
      "agua"
    ]
  },
  {
    "word": "Acuario",
    "forbidden": [
      "peces",
      "agua",
      "cristal",
      "tanque"
    ]
  },
  {
    "word": "Horno",
    "forbidden": [
      "cocina",
      "calor",
      "comida",
      "cocinar"
    ]
  },
  {
    "word": "Silla",
    "forbidden": [
      "sentarse",
      "mueble",
      "patas",
      "respaldo"
    ]
  },
  {
    "word": "Ardilla",
    "forbidden": [
      "árbol",
      "nuez",
      "cola",
      "bosque"
    ]
  },
  {
    "word": "Chicle",
    "forbidden": [
      "masticar",
      "goma",
      "sabor",
      "globo"
    ]
  },
  {
    "word": "Faro",
    "forbidden": [
      "luz",
      "costa",
      "barco",
      "mar"
    ]
  },
  {
    "word": "Murciélago",
    "forbidden": [
      "alas",
      "noche",
      "cueva",
      "volar"
    ]
  },
  {
    "word": "Carretilla",
    "forbidden": [
      "obra",
      "rueda",
      "carga",
      "jardín"
    ]
  },
  {
    "word": "León",
    "forbidden": [
      "selva",
      "melena",
      "rey",
      "animal"
    ]
  },
  {
    "word": "Pera",
    "forbidden": [
      "fruta",
      "árbol",
      "verde",
      "dulce"
    ]
  },
  {
    "word": "Chimenea",
    "forbidden": [
      "humo",
      "fuego",
      "casa",
      "calor"
    ]
  },
  {
    "word": "Caracol",
    "forbidden": [
      "lento",
      "concha",
      "jardín",
      "baba"
    ]
  },
  {
    "word": "Escoba",
    "forbidden": [
      "barrer",
      "limpieza",
      "suelo",
      "palo"
    ]
  },
  {
    "word": "Telaraña",
    "forbidden": [
      "araña",
      "hilo",
      "insecto",
      "red"
    ]
  },
  {
    "word": "Maleta",
    "forbidden": [
      "viaje",
      "equipaje",
      "ropa",
      "aeropuerto"
    ]
  },
  {
    "word": "Tortuga",
    "forbidden": [
      "caparazón",
      "reptil",
      "lenta",
      "animal"
    ]
  },
  {
    "word": "Arcoíris",
    "forbidden": [
      "colores",
      "lluvia",
      "cielo",
      "sol"
    ]
  },
  {
    "word": "Cucharón",
    "forbidden": [
      "sopa",
      "cocina",
      "servir",
      "olla"
    ]
  },
  {
    "word": "Hada",
    "forbidden": [
      "magia",
      "alas",
      "cuento",
      "fantástica"
    ]
  },
  {
    "word": "Columpio",
    "forbidden": [
      "parque",
      "balancear",
      "cadena",
      "niños"
    ]
  },
  {
    "word": "Linterna",
    "forbidden": [
      "luz",
      "oscuridad",
      "pilas",
      "iluminar"
    ]
  },
  {
    "word": "Ancla",
    "forbidden": [
      "barco",
      "mar",
      "fondo",
      "puerto"
    ]
  },
  {
    "word": "Aguja",
    "forbidden": [
      "coser",
      "hilo",
      "pinchar",
      "médico"
    ]
  },
  {
    "word": "Alce",
    "forbidden": [
      "cuernos",
      "bosque",
      "animal",
      "Canadá"
    ]
  },
  {
    "word": "Almendra",
    "forbidden": [
      "fruto seco",
      "árbol",
      "turrón",
      "cáscara"
    ]
  },
  {
    "word": "Ambulancia",
    "forbidden": [
      "emergencia",
      "hospital",
      "sirena",
      "médico"
    ]
  },
  {
    "word": "Armario",
    "forbidden": [
      "ropa",
      "puerta",
      "mueble",
      "colgar"
    ]
  },
  {
    "word": "Atajo",
    "forbidden": [
      "camino",
      "corto",
      "ruta",
      "llegar"
    ]
  },
  {
    "word": "Azafata",
    "forbidden": [
      "avión",
      "vuelo",
      "pasajero",
      "cabina"
    ]
  },
  {
    "word": "Balanza",
    "forbidden": [
      "peso",
      "medir",
      "kilos",
      "báscula"
    ]
  },
  {
    "word": "Barril",
    "forbidden": [
      "madera",
      "vino",
      "cerveza",
      "tonel"
    ]
  },
  {
    "word": "Bastón",
    "forbidden": [
      "caminar",
      "apoyo",
      "anciano",
      "madera"
    ]
  },
  {
    "word": "Búfalo",
    "forbidden": [
      "animal",
      "cuernos",
      "manada",
      "pradera"
    ]
  },
  {
    "word": "Cachorro",
    "forbidden": [
      "perro",
      "pequeño",
      "mascota",
      "joven"
    ]
  },
  {
    "word": "Caleidoscopio",
    "forbidden": [
      "colores",
      "formas",
      "tubo",
      "espejo"
    ]
  },
  {
    "word": "Candado",
    "forbidden": [
      "llave",
      "cerrar",
      "puerta",
      "seguridad"
    ]
  },
  {
    "word": "Canoa",
    "forbidden": [
      "remar",
      "río",
      "agua",
      "embarcación"
    ]
  },
  {
    "word": "Capucha",
    "forbidden": [
      "cabeza",
      "abrigo",
      "sudadera",
      "cubrir"
    ]
  },
  {
    "word": "Carretera",
    "forbidden": [
      "coche",
      "asfalto",
      "conducir",
      "viaje"
    ]
  },
  {
    "word": "Catapulta",
    "forbidden": [
      "lanzar",
      "piedra",
      "medieval",
      "guerra"
    ]
  },
  {
    "word": "Cebolla",
    "forbidden": [
      "llorar",
      "cocina",
      "vegetal",
      "capas"
    ]
  },
  {
    "word": "Cementerio",
    "forbidden": [
      "tumbas",
      "muertos",
      "entierro",
      "lápida"
    ]
  },
  {
    "word": "Cepo",
    "forbidden": [
      "trampa",
      "cazar",
      "animal",
      "atrapar"
    ]
  },
  {
    "word": "Chimpancé",
    "forbidden": [
      "mono",
      "selva",
      "primate",
      "animal"
    ]
  },
  {
    "word": "Chubasquero",
    "forbidden": [
      "lluvia",
      "impermeable",
      "agua",
      "abrigo"
    ]
  },
  {
    "word": "Cigarra",
    "forbidden": [
      "insecto",
      "verano",
      "cantar",
      "árbol"
    ]
  },
  {
    "word": "Cinturón",
    "forbidden": [
      "pantalón",
      "hebilla",
      "cintura",
      "sujetar"
    ]
  },
  {
    "word": "Cometa",
    "forbidden": [
      "cielo",
      "volar",
      "hilo",
      "viento"
    ]
  },
  {
    "word": "Conejera",
    "forbidden": [
      "conejo",
      "jaula",
      "granja",
      "animal"
    ]
  },
  {
    "word": "Corcho",
    "forbidden": [
      "botella",
      "vino",
      "tapón",
      "madera"
    ]
  },
  {
    "word": "Corredor",
    "forbidden": [
      "atleta",
      "carrera",
      "correr",
      "deporte"
    ]
  },
  {
    "word": "Coyote",
    "forbidden": [
      "animal",
      "desierto",
      "lobo",
      "aullar"
    ]
  },
  {
    "word": "Cúpula",
    "forbidden": [
      "techo",
      "edificio",
      "redonda",
      "arquitectura"
    ]
  },
  {
    "word": "Dado",
    "forbidden": [
      "juego",
      "número",
      "lanzar",
      "mesa"
    ]
  },
  {
    "word": "Dedal",
    "forbidden": [
      "coser",
      "dedo",
      "aguja",
      "costura"
    ]
  },
  {
    "word": "Delantal",
    "forbidden": [
      "cocina",
      "ropa",
      "proteger",
      "chef"
    ]
  },
  {
    "word": "Dromedario",
    "forbidden": [
      "desierto",
      "joroba",
      "camello",
      "arena"
    ]
  },
  {
    "word": "Eclipse",
    "forbidden": [
      "sol",
      "luna",
      "sombra",
      "astronomía"
    ]
  },
  {
    "word": "Embudo",
    "forbidden": [
      "líquido",
      "botella",
      "verter",
      "cocina"
    ]
  },
  {
    "word": "Encendedor",
    "forbidden": [
      "fuego",
      "llama",
      "cigarro",
      "gas"
    ]
  },
  {
    "word": "Enredadera",
    "forbidden": [
      "planta",
      "trepar",
      "pared",
      "jardín"
    ]
  },
  {
    "word": "Espiral",
    "forbidden": [
      "forma",
      "vuelta",
      "curva",
      "círculo"
    ]
  },
  {
    "word": "Estanque",
    "forbidden": [
      "agua",
      "peces",
      "jardín",
      "lago"
    ]
  },
  {
    "word": "Estetoscopio",
    "forbidden": [
      "médico",
      "corazón",
      "escuchar",
      "hospital"
    ]
  },
  {
    "word": "Estornudo",
    "forbidden": [
      "nariz",
      "gripe",
      "salud",
      "aire"
    ]
  },
  {
    "word": "Fideo",
    "forbidden": [
      "pasta",
      "sopa",
      "comida",
      "cocina"
    ]
  },
  {
    "word": "Foca",
    "forbidden": [
      "mar",
      "animal",
      "hielo",
      "mamífero"
    ]
  },
  {
    "word": "Fogata",
    "forbidden": [
      "fuego",
      "camping",
      "madera",
      "noche"
    ]
  },
  {
    "word": "Frisbee",
    "forbidden": [
      "disco",
      "lanzar",
      "parque",
      "jugar"
    ]
  },
  {
    "word": "Gacela",
    "forbidden": [
      "África",
      "animal",
      "correr",
      "cuernos"
    ]
  },
  {
    "word": "Galleta",
    "forbidden": [
      "dulce",
      "horno",
      "chocolate",
      "comer"
    ]
  },
  {
    "word": "Garganta",
    "forbidden": [
      "cuello",
      "tragar",
      "voz",
      "boca"
    ]
  },
  {
    "word": "Gaviota",
    "forbidden": [
      "mar",
      "playa",
      "ave",
      "volar"
    ]
  },
  {
    "word": "Gema",
    "forbidden": [
      "joya",
      "piedra",
      "brillante",
      "preciosa"
    ]
  },
  {
    "word": "Góndola",
    "forbidden": [
      "Venecia",
      "canal",
      "barco",
      "remar"
    ]
  },
  {
    "word": "Grillo",
    "forbidden": [
      "insecto",
      "saltar",
      "cantar",
      "campo"
    ]
  },
  {
    "word": "Guante",
    "forbidden": [
      "mano",
      "frío",
      "dedo",
      "ropa"
    ]
  },
  {
    "word": "Hamaca",
    "forbidden": [
      "descansar",
      "colgar",
      "jardín",
      "balancear"
    ]
  },
  {
    "word": "Harina",
    "forbidden": [
      "pan",
      "trigo",
      "cocina",
      "polvo"
    ]
  },
  {
    "word": "Herradura",
    "forbidden": [
      "caballo",
      "hierro",
      "suerte",
      "casco"
    ]
  },
  {
    "word": "Hoguera",
    "forbidden": [
      "fuego",
      "madera",
      "camping",
      "calor"
    ]
  },
  {
    "word": "Iguana",
    "forbidden": [
      "reptil",
      "verde",
      "cola",
      "animal"
    ]
  },
  {
    "word": "Invernadero",
    "forbidden": [
      "plantas",
      "cristal",
      "cultivo",
      "calor"
    ]
  },
  {
    "word": "Jabalí",
    "forbidden": [
      "bosque",
      "colmillos",
      "cerdo",
      "salvaje"
    ]
  },
  {
    "word": "Jarra",
    "forbidden": [
      "agua",
      "bebida",
      "recipiente",
      "vaso"
    ]
  },
  {
    "word": "Jeringuilla",
    "forbidden": [
      "médico",
      "aguja",
      "inyección",
      "vacuna"
    ]
  },
  {
    "word": "Joroba",
    "forbidden": [
      "camello",
      "espalda",
      "bulto",
      "desierto"
    ]
  },
  {
    "word": "Kayak",
    "forbidden": [
      "remar",
      "río",
      "agua",
      "embarcación"
    ]
  },
  {
    "word": "Kiwi",
    "forbidden": [
      "fruta",
      "verde",
      "Nueva Zelanda",
      "semillas"
    ]
  },
  {
    "word": "Laberinto",
    "forbidden": [
      "salida",
      "camino",
      "perderse",
      "pasillos"
    ]
  },
  {
    "word": "Laguna",
    "forbidden": [
      "agua",
      "lago",
      "naturaleza",
      "paisaje"
    ]
  },
  {
    "word": "Lámpara",
    "forbidden": [
      "luz",
      "iluminar",
      "bombilla",
      "mesa"
    ]
  },
  {
    "word": "Langosta",
    "forbidden": [
      "marisco",
      "pinzas",
      "mar",
      "restaurante"
    ]
  },
  {
    "word": "Leopardo",
    "forbidden": [
      "manchas",
      "felino",
      "África",
      "animal"
    ]
  },
  {
    "word": "Liana",
    "forbidden": [
      "selva",
      "colgar",
      "árbol",
      "cuerda"
    ]
  },
  {
    "word": "Limonada",
    "forbidden": [
      "limón",
      "bebida",
      "verano",
      "azúcar"
    ]
  },
  {
    "word": "Luciérnaga",
    "forbidden": [
      "insecto",
      "luz",
      "noche",
      "brillar"
    ]
  },
  {
    "word": "Madriguera",
    "forbidden": [
      "conejo",
      "agujero",
      "refugio",
      "animal"
    ]
  },
  {
    "word": "Malabarista",
    "forbidden": [
      "circo",
      "lanzar",
      "pelotas",
      "equilibrio"
    ]
  },
  {
    "word": "Marmota",
    "forbidden": [
      "animal",
      "madriguera",
      "invierno",
      "roedor"
    ]
  },
  {
    "word": "Menhir",
    "forbidden": [
      "piedra",
      "prehistoria",
      "monumento",
      "vertical"
    ]
  },
  {
    "word": "Meteorito",
    "forbidden": [
      "espacio",
      "roca",
      "caer",
      "planeta"
    ]
  },
  {
    "word": "Molino",
    "forbidden": [
      "viento",
      "harina",
      "aspas",
      "campo"
    ]
  },
  {
    "word": "Mosquetón",
    "forbidden": [
      "escalada",
      "metal",
      "cuerda",
      "seguridad"
    ]
  },
  {
    "word": "Naranja",
    "forbidden": [
      "fruta",
      "cítrico",
      "zumo",
      "color"
    ]
  },
  {
    "word": "Noria",
    "forbidden": [
      "feria",
      "girar",
      "cabina",
      "atracción"
    ]
  },
  {
    "word": "Nutria",
    "forbidden": [
      "río",
      "animal",
      "agua",
      "mamífero"
    ]
  },
  {
    "word": "Oasis",
    "forbidden": [
      "desierto",
      "agua",
      "palmera",
      "descanso"
    ]
  },
  {
    "word": "Oruga",
    "forbidden": [
      "mariposa",
      "insecto",
      "hoja",
      "transformar"
    ]
  },
  {
    "word": "Pala",
    "forbidden": [
      "cavar",
      "tierra",
      "herramienta",
      "jardín"
    ]
  },
  {
    "word": "Palomitas",
    "forbidden": [
      "cine",
      "maíz",
      "comer",
      "snack"
    ]
  },
  {
    "word": "Pantano",
    "forbidden": [
      "agua",
      "barro",
      "rana",
      "húmedo"
    ]
  },
  {
    "word": "Papagayo",
    "forbidden": [
      "loro",
      "ave",
      "colores",
      "hablar"
    ]
  },
  {
    "word": "Paracaídas",
    "forbidden": [
      "saltar",
      "avión",
      "caer",
      "aire"
    ]
  },
  {
    "word": "Periscopio",
    "forbidden": [
      "submarino",
      "mirar",
      "agua",
      "tubo"
    ]
  },
  {
    "word": "Pétalo",
    "forbidden": [
      "flor",
      "rosa",
      "planta",
      "color"
    ]
  },
  {
    "word": "Puercoespín",
    "forbidden": [
      "púas",
      "animal",
      "bosque",
      "defensa"
    ]
  },
  {
    "word": "Remolino",
    "forbidden": [
      "agua",
      "girar",
      "corriente",
      "círculo"
    ]
  },
  {
    "word": "Salamandra",
    "forbidden": [
      "anfibio",
      "cola",
      "animal",
      "húmedo"
    ]
  },
  {
    "word": "Trombón",
    "forbidden": [
      "instrumento",
      "música",
      "metal",
      "orquesta"
    ]
  },
  {
    "word": "Zepelín",
    "forbidden": [
      "aire",
      "dirigible",
      "volar",
      "globo"
    ]
  },
  {
    "word": "Abanico",
    "forbidden": [
      "aire",
      "calor",
      "mano",
      "verano"
    ]
  },
  {
    "word": "Acantilado",
    "forbidden": [
      "mar",
      "roca",
      "altura",
      "costa"
    ]
  },
  {
    "word": "Agenda",
    "forbidden": [
      "citas",
      "calendario",
      "organizar",
      "notas"
    ]
  },
  {
    "word": "Albóndiga",
    "forbidden": [
      "carne",
      "comida",
      "salsa",
      "cocina"
    ]
  },
  {
    "word": "Almeja",
    "forbidden": [
      "marisco",
      "concha",
      "mar",
      "molusco"
    ]
  },
  {
    "word": "Alpaca",
    "forbidden": [
      "lana",
      "animal",
      "Perú",
      "cuello"
    ]
  },
  {
    "word": "Anillo",
    "forbidden": [
      "dedo",
      "boda",
      "joya",
      "oro"
    ]
  },
  {
    "word": "Antena",
    "forbidden": [
      "televisión",
      "señal",
      "techo",
      "radio"
    ]
  },
  {
    "word": "Arpón",
    "forbidden": [
      "pesca",
      "lanza",
      "mar",
      "caza"
    ]
  },
  {
    "word": "Arrecife",
    "forbidden": [
      "coral",
      "mar",
      "peces",
      "océano"
    ]
  },
  {
    "word": "Babero",
    "forbidden": [
      "bebé",
      "comer",
      "ropa",
      "manchar"
    ]
  },
  {
    "word": "Bacalao",
    "forbidden": [
      "pescado",
      "mar",
      "cocina",
      "salado"
    ]
  },
  {
    "word": "Bambú",
    "forbidden": [
      "panda",
      "planta",
      "caña",
      "Asia"
    ]
  },
  {
    "word": "Baraja",
    "forbidden": [
      "cartas",
      "juego",
      "póker",
      "naipes"
    ]
  },
  {
    "word": "Barbacoa",
    "forbidden": [
      "carne",
      "parrilla",
      "fuego",
      "jardín"
    ]
  },
  {
    "word": "Berenjena",
    "forbidden": [
      "vegetal",
      "morada",
      "cocina",
      "huerto"
    ]
  },
  {
    "word": "Bisonte",
    "forbidden": [
      "animal",
      "cuernos",
      "pradera",
      "grande"
    ]
  },
  {
    "word": "Boomerang",
    "forbidden": [
      "Australia",
      "lanzar",
      "volver",
      "juguete"
    ]
  },
  {
    "word": "Borrador",
    "forbidden": [
      "lápiz",
      "goma",
      "escuela",
      "borrar"
    ]
  },
  {
    "word": "Brócoli",
    "forbidden": [
      "vegetal",
      "verde",
      "comida",
      "árbol"
    ]
  },
  {
    "word": "Bufón",
    "forbidden": [
      "rey",
      "chiste",
      "medieval",
      "corte"
    ]
  },
  {
    "word": "Caballete",
    "forbidden": [
      "pintura",
      "artista",
      "cuadro",
      "soporte"
    ]
  },
  {
    "word": "Cabina",
    "forbidden": [
      "teléfono",
      "cristal",
      "espacio",
      "pequeño"
    ]
  },
  {
    "word": "Cacahuete",
    "forbidden": [
      "fruto seco",
      "cáscara",
      "snack",
      "mantequilla"
    ]
  },
  {
    "word": "Calendario",
    "forbidden": [
      "mes",
      "año",
      "fecha",
      "días"
    ]
  },
  {
    "word": "Campana",
    "forbidden": [
      "iglesia",
      "sonar",
      "metal",
      "torre"
    ]
  },
  {
    "word": "Canica",
    "forbidden": [
      "cristal",
      "bola",
      "juego",
      "niños"
    ]
  },
  {
    "word": "Cantimplora",
    "forbidden": [
      "agua",
      "excursión",
      "botella",
      "montaña"
    ]
  },
  {
    "word": "Caparazón",
    "forbidden": [
      "tortuga",
      "protección",
      "duro",
      "animal"
    ]
  },
  {
    "word": "Carambola",
    "forbidden": [
      "billar",
      "golpe",
      "bolas",
      "mesa"
    ]
  },
  {
    "word": "Carburador",
    "forbidden": [
      "coche",
      "motor",
      "gasolina",
      "mecánica"
    ]
  },
  {
    "word": "Carrusel",
    "forbidden": [
      "feria",
      "girar",
      "caballos",
      "atracción"
    ]
  },
  {
    "word": "Castor",
    "forbidden": [
      "presa",
      "río",
      "animal",
      "dientes"
    ]
  },
  {
    "word": "Catalejo",
    "forbidden": [
      "observar",
      "barco",
      "mar",
      "lente"
    ]
  },
  {
    "word": "Cazuela",
    "forbidden": [
      "cocina",
      "olla",
      "comida",
      "recipiente"
    ]
  },
  {
    "word": "Cebra",
    "forbidden": [
      "rayas",
      "África",
      "caballo",
      "blanco"
    ]
  },
  {
    "word": "Centinela",
    "forbidden": [
      "vigilar",
      "guardia",
      "torre",
      "seguridad"
    ]
  },
  {
    "word": "Cerilla",
    "forbidden": [
      "fuego",
      "caja",
      "encender",
      "madera"
    ]
  },
  {
    "word": "Chacal",
    "forbidden": [
      "animal",
      "África",
      "carroñero",
      "salvaje"
    ]
  },
  {
    "word": "Charco",
    "forbidden": [
      "agua",
      "lluvia",
      "suelo",
      "mojado"
    ]
  },
  {
    "word": "Chistera",
    "forbidden": [
      "sombrero",
      "mago",
      "elegante",
      "copa"
    ]
  },
  {
    "word": "Chorizo",
    "forbidden": [
      "embutido",
      "comida",
      "cerdo",
      "rojo"
    ]
  },
  {
    "word": "Cigüeña",
    "forbidden": [
      "bebé",
      "ave",
      "nido",
      "patas"
    ]
  },
  {
    "word": "Colmena",
    "forbidden": [
      "abeja",
      "miel",
      "insecto",
      "panal"
    ]
  },
  {
    "word": "Comadrona",
    "forbidden": [
      "parto",
      "bebé",
      "embarazo",
      "hospital"
    ]
  },
  {
    "word": "Compás",
    "forbidden": [
      "dibujo",
      "círculo",
      "escuela",
      "geometría"
    ]
  },
  {
    "word": "Cóndor",
    "forbidden": [
      "ave",
      "Andes",
      "volar",
      "grande"
    ]
  },
  {
    "word": "Conejo",
    "forbidden": [
      "orejas",
      "zanahoria",
      "madriguera",
      "animal"
    ]
  },
  {
    "word": "Cornisa",
    "forbidden": [
      "edificio",
      "borde",
      "ventana",
      "fachada"
    ]
  },
  {
    "word": "Cosechadora",
    "forbidden": [
      "campo",
      "agricultura",
      "máquina",
      "cereal"
    ]
  },
  {
    "word": "Costurera",
    "forbidden": [
      "coser",
      "ropa",
      "hilo",
      "aguja"
    ]
  },
  {
    "word": "Cucharilla",
    "forbidden": [
      "café",
      "pequeña",
      "cubierto",
      "remover"
    ]
  },
  {
    "word": "Dálmata",
    "forbidden": [
      "perro",
      "manchas",
      "blanco",
      "negro"
    ]
  },
  {
    "word": "Dique",
    "forbidden": [
      "agua",
      "presa",
      "río",
      "contener"
    ]
  },
  {
    "word": "Dominó",
    "forbidden": [
      "fichas",
      "juego",
      "puntos",
      "mesa"
    ]
  },
  {
    "word": "Escafandra",
    "forbidden": [
      "buceo",
      "casco",
      "agua",
      "submarino"
    ]
  },
  {
    "word": "Escarabajo",
    "forbidden": [
      "insecto",
      "caparazón",
      "pequeño",
      "patas"
    ]
  },
  {
    "word": "Espantapájaros",
    "forbidden": [
      "campo",
      "paja",
      "pájaro",
      "cultivo"
    ]
  },
  {
    "word": "Espinaca",
    "forbidden": [
      "verde",
      "vegetal",
      "Popeye",
      "hoja"
    ]
  },
  {
    "word": "Estalactita",
    "forbidden": [
      "cueva",
      "roca",
      "techo",
      "formación"
    ]
  },
  {
    "word": "Estrella de mar",
    "forbidden": [
      "océano",
      "animal",
      "brazos",
      "playa"
    ]
  },
  {
    "word": "Fagot",
    "forbidden": [
      "instrumento",
      "música",
      "orquesta",
      "viento"
    ]
  },
  {
    "word": "Faisán",
    "forbidden": [
      "ave",
      "plumas",
      "caza",
      "campo"
    ]
  },
  {
    "word": "Farol",
    "forbidden": [
      "luz",
      "calle",
      "lámpara",
      "iluminar"
    ]
  },
  {
    "word": "Fiambrera",
    "forbidden": [
      "comida",
      "colegio",
      "recipiente",
      "almuerzo"
    ]
  },
  {
    "word": "Flamenco",
    "forbidden": [
      "ave",
      "rosa",
      "patas",
      "laguna"
    ]
  },
  {
    "word": "Flauta",
    "forbidden": [
      "instrumento",
      "música",
      "viento",
      "tocar"
    ]
  },
  {
    "word": "Fregona",
    "forbidden": [
      "limpiar",
      "suelo",
      "agua",
      "cubo"
    ]
  },
  {
    "word": "Galápago",
    "forbidden": [
      "tortuga",
      "caparazón",
      "reptil",
      "agua"
    ]
  },
  {
    "word": "Garfio",
    "forbidden": [
      "pirata",
      "mano",
      "gancho",
      "metal"
    ]
  },
  {
    "word": "Gazpacho",
    "forbidden": [
      "sopa",
      "tomate",
      "frío",
      "Andalucía"
    ]
  },
  {
    "word": "Girasol",
    "forbidden": [
      "flor",
      "amarillo",
      "sol",
      "semillas"
    ]
  },
  {
    "word": "Góndola",
    "forbidden": [
      "Venecia",
      "canal",
      "barco",
      "Italia"
    ]
  },
  {
    "word": "Granero",
    "forbidden": [
      "campo",
      "trigo",
      "almacén",
      "granja"
    ]
  },
  {
    "word": "Grapadora",
    "forbidden": [
      "papel",
      "oficina",
      "grapa",
      "unir"
    ]
  },
  {
    "word": "Guacamayo",
    "forbidden": [
      "loro",
      "colores",
      "ave",
      "tropical"
    ]
  },
  {
    "word": "Hacha",
    "forbidden": [
      "cortar",
      "madera",
      "herramienta",
      "árbol"
    ]
  },
  {
    "word": "Helecho",
    "forbidden": [
      "planta",
      "bosque",
      "verde",
      "hojas"
    ]
  },
  {
    "word": "Hipopótamo",
    "forbidden": [
      "río",
      "África",
      "animal",
      "grande"
    ]
  },
  {
    "word": "Hojaldre",
    "forbidden": [
      "masa",
      "horno",
      "pastel",
      "capas"
    ]
  },
  {
    "word": "Jabalina",
    "forbidden": [
      "lanzar",
      "atletismo",
      "deporte",
      "competición"
    ]
  },
  {
    "word": "Jacinto",
    "forbidden": [
      "flor",
      "planta",
      "jardín",
      "perfume"
    ]
  },
  {
    "word": "Jirafa",
    "forbidden": [
      "cuello",
      "manchas",
      "África",
      "alta"
    ]
  },
  {
    "word": "Junco",
    "forbidden": [
      "planta",
      "agua",
      "río",
      "pantano"
    ]
  },
  {
    "word": "Kiosco",
    "forbidden": [
      "prensa",
      "revistas",
      "calle",
      "vender"
    ]
  },
  {
    "word": "Ladrillo",
    "forbidden": [
      "construcción",
      "pared",
      "obra",
      "edificio"
    ]
  },
  {
    "word": "Lagarto",
    "forbidden": [
      "reptil",
      "cola",
      "verde",
      "animal"
    ]
  },
  {
    "word": "Lavanda",
    "forbidden": [
      "flor",
      "morada",
      "aroma",
      "planta"
    ]
  },
  {
    "word": "Lechuza",
    "forbidden": [
      "ave",
      "noche",
      "ojos",
      "búho"
    ]
  },
  {
    "word": "Limonero",
    "forbidden": [
      "árbol",
      "limón",
      "fruta",
      "jardín"
    ]
  },
  {
    "word": "Lombriz",
    "forbidden": [
      "tierra",
      "gusano",
      "pesca",
      "suelo"
    ]
  },
  {
    "word": "Lucero",
    "forbidden": [
      "estrella",
      "cielo",
      "brillo",
      "noche"
    ]
  },
  {
    "word": "Maceta",
    "forbidden": [
      "planta",
      "tierra",
      "jardín",
      "flor"
    ]
  },
  {
    "word": "Mandolina",
    "forbidden": [
      "instrumento",
      "cuerdas",
      "música",
      "tocar"
    ]
  },
  {
    "word": "Manglar",
    "forbidden": [
      "agua",
      "raíces",
      "costa",
      "bosque"
    ]
  },
  {
    "word": "Marmol",
    "forbidden": [
      "piedra",
      "suelo",
      "escultura",
      "blanco"
    ]
  },
  {
    "word": "Menú",
    "forbidden": [
      "restaurante",
      "comida",
      "carta",
      "elegir"
    ]
  },
  {
    "word": "Meteorólogo",
    "forbidden": [
      "tiempo",
      "clima",
      "lluvia",
      "pronóstico"
    ]
  },
  {
    "word": "Morsa",
    "forbidden": [
      "colmillos",
      "hielo",
      "mar",
      "mamífero"
    ]
  },
  {
    "word": "Nabo",
    "forbidden": [
      "vegetal",
      "huerto",
      "raíz",
      "cocina"
    ]
  },
  {
    "word": "Abogado",
    "forbidden": [
      "juicio",
      "ley",
      "juez",
      "tribunal"
    ]
  },
  {
    "word": "Actor",
    "forbidden": [
      "película",
      "cine",
      "interpretar",
      "escenario"
    ]
  },
  {
    "word": "Aeróbic",
    "forbidden": [
      "ejercicio",
      "música",
      "gimnasio",
      "movimiento"
    ]
  },
  {
    "word": "Ajedrez",
    "forbidden": [
      "rey",
      "tablero",
      "piezas",
      "jaque"
    ]
  },
  {
    "word": "Alpinista",
    "forbidden": [
      "montaña",
      "escalar",
      "cima",
      "cuerda"
    ]
  },
  {
    "word": "Amazonas",
    "forbidden": [
      "río",
      "selva",
      "Brasil",
      "bosque"
    ]
  },
  {
    "word": "Arqueólogo",
    "forbidden": [
      "excavación",
      "fósil",
      "historia",
      "ruinas"
    ]
  },
  {
    "word": "Ascensor",
    "forbidden": [
      "edificio",
      "subir",
      "bajar",
      "botones"
    ]
  },
  {
    "word": "Astrónomo",
    "forbidden": [
      "estrellas",
      "telescopio",
      "espacio",
      "planeta"
    ]
  },
  {
    "word": "Atleta",
    "forbidden": [
      "deporte",
      "competición",
      "correr",
      "medalla"
    ]
  },
  {
    "word": "Bumerán",
    "forbidden": [
      "Australia",
      "lanzar",
      "volver",
      "aire"
    ]
  },
  {
    "word": "Buzón",
    "forbidden": [
      "carta",
      "correo",
      "enviar",
      "postal"
    ]
  },
  {
    "word": "Cacique",
    "forbidden": [
      "tribu",
      "jefe",
      "indígena",
      "líder"
    ]
  },
  {
    "word": "Cafetería",
    "forbidden": [
      "café",
      "mesa",
      "desayuno",
      "camarero"
    ]
  },
  {
    "word": "Camuflaje",
    "forbidden": [
      "ocultar",
      "militar",
      "colores",
      "esconder"
    ]
  },
  {
    "word": "Canguro",
    "forbidden": [
      "Australia",
      "salto",
      "bolsa",
      "marsupial"
    ]
  },
  {
    "word": "Carnaval",
    "forbidden": [
      "disfraz",
      "fiesta",
      "desfile",
      "máscara"
    ]
  },
  {
    "word": "Cartógrafo",
    "forbidden": [
      "mapa",
      "geografía",
      "dibujar",
      "territorio"
    ]
  },
  {
    "word": "Catamarán",
    "forbidden": [
      "barco",
      "vela",
      "mar",
      "navegación"
    ]
  },
  {
    "word": "Centauro",
    "forbidden": [
      "caballo",
      "mitología",
      "humano",
      "criatura"
    ]
  },
  {
    "word": "Cerrajero",
    "forbidden": [
      "llave",
      "puerta",
      "cerradura",
      "abrir"
    ]
  },
  {
    "word": "Chubasco",
    "forbidden": [
      "lluvia",
      "tormenta",
      "agua",
      "nube"
    ]
  },
  {
    "word": "Ciclista",
    "forbidden": [
      "bicicleta",
      "pedal",
      "casco",
      "carrera"
    ]
  },
  {
    "word": "Cineasta",
    "forbidden": [
      "director",
      "película",
      "cine",
      "rodaje"
    ]
  },
  {
    "word": "Clarinete",
    "forbidden": [
      "instrumento",
      "música",
      "viento",
      "orquesta"
    ]
  },
  {
    "word": "Compositor",
    "forbidden": [
      "música",
      "canción",
      "crear",
      "notas"
    ]
  },
  {
    "word": "Conserje",
    "forbidden": [
      "edificio",
      "llave",
      "portero",
      "mantenimiento"
    ]
  },
  {
    "word": "Corsario",
    "forbidden": [
      "barco",
      "mar",
      "pirata",
      "navegación"
    ]
  },
  {
    "word": "Cráter",
    "forbidden": [
      "volcán",
      "luna",
      "agujero",
      "impacto"
    ]
  },
  {
    "word": "Cuarteto",
    "forbidden": [
      "cuatro",
      "música",
      "grupo",
      "instrumentos"
    ]
  },
  {
    "word": "Dardo",
    "forbidden": [
      "lanzar",
      "diana",
      "juego",
      "punta"
    ]
  },
  {
    "word": "Decatlón",
    "forbidden": [
      "atletismo",
      "diez",
      "pruebas",
      "deporte"
    ]
  },
  {
    "word": "Detective",
    "forbidden": [
      "investigar",
      "pistas",
      "crimen",
      "policía"
    ]
  },
  {
    "word": "Dictador",
    "forbidden": [
      "gobierno",
      "poder",
      "país",
      "autoridad"
    ]
  },
  {
    "word": "Dinosaurio",
    "forbidden": [
      "extinto",
      "fósil",
      "reptil",
      "jurásico"
    ]
  },
  {
    "word": "Director",
    "forbidden": [
      "empresa",
      "jefe",
      "cine",
      "gestión"
    ]
  },
  {
    "word": "Eclipse",
    "forbidden": [
      "luna",
      "sol",
      "sombra",
      "ocultar"
    ]
  },
  {
    "word": "Economista",
    "forbidden": [
      "dinero",
      "mercado",
      "finanzas",
      "análisis"
    ]
  },
  {
    "word": "Electricista",
    "forbidden": [
      "cables",
      "corriente",
      "enchufe",
      "instalación"
    ]
  },
  {
    "word": "Embajador",
    "forbidden": [
      "país",
      "diplomacia",
      "extranjero",
      "representante"
    ]
  },
  {
    "word": "Emperador",
    "forbidden": [
      "imperio",
      "rey",
      "corona",
      "gobernante"
    ]
  },
  {
    "word": "Escorpión",
    "forbidden": [
      "veneno",
      "cola",
      "picadura",
      "desierto"
    ]
  },
  {
    "word": "Esgrimista",
    "forbidden": [
      "espada",
      "deporte",
      "duelo",
      "máscara"
    ]
  },
  {
    "word": "Estatua",
    "forbidden": [
      "escultura",
      "piedra",
      "monumento",
      "figura"
    ]
  },
  {
    "word": "Everest",
    "forbidden": [
      "montaña",
      "Himalaya",
      "cima",
      "altura"
    ]
  },
  {
    "word": "Explorador",
    "forbidden": [
      "aventura",
      "descubrir",
      "mapa",
      "viaje"
    ]
  },
  {
    "word": "Farmacéutico",
    "forbidden": [
      "farmacia",
      "medicamento",
      "receta",
      "salud"
    ]
  },
  {
    "word": "Filósofo",
    "forbidden": [
      "pensar",
      "ideas",
      "reflexión",
      "conocimiento"
    ]
  },
  {
    "word": "Flautista",
    "forbidden": [
      "música",
      "instrumento",
      "viento",
      "tocar"
    ]
  },
  {
    "word": "Fotógrafo",
    "forbidden": [
      "cámara",
      "imagen",
      "retrato",
      "fotografía"
    ]
  },
  {
    "word": "Futbolista",
    "forbidden": [
      "balón",
      "gol",
      "deporte",
      "equipo"
    ]
  },
  {
    "word": "Ganadero",
    "forbidden": [
      "vacas",
      "campo",
      "granja",
      "animales"
    ]
  },
  {
    "word": "Geólogo",
    "forbidden": [
      "rocas",
      "tierra",
      "minerales",
      "estudio"
    ]
  },
  {
    "word": "Gladiador",
    "forbidden": [
      "Roma",
      "lucha",
      "arena",
      "espada"
    ]
  },
  {
    "word": "Gobernador",
    "forbidden": [
      "política",
      "región",
      "autoridad",
      "gobierno"
    ]
  },
  {
    "word": "Helicóptero",
    "forbidden": [
      "hélice",
      "volar",
      "rescate",
      "piloto"
    ]
  },
  {
    "word": "Historiador",
    "forbidden": [
      "pasado",
      "documentos",
      "investigación",
      "historia"
    ]
  },
  {
    "word": "Holograma",
    "forbidden": [
      "imagen",
      "tecnología",
      "proyección",
      "tridimensional"
    ]
  },
  {
    "word": "Huracán",
    "forbidden": [
      "viento",
      "tormenta",
      "desastre",
      "ciclón"
    ]
  },
  {
    "word": "Ilusionista",
    "forbidden": [
      "magia",
      "truco",
      "espectáculo",
      "desaparecer"
    ]
  },
  {
    "word": "Ingeniero",
    "forbidden": [
      "diseño",
      "construcción",
      "proyecto",
      "técnico"
    ]
  },
  {
    "word": "Inspector",
    "forbidden": [
      "revisar",
      "control",
      "supervisar",
      "investigar"
    ]
  },
  {
    "word": "Inventor",
    "forbidden": [
      "crear",
      "idea",
      "patente",
      "innovación"
    ]
  },
  {
    "word": "Jockey",
    "forbidden": [
      "caballo",
      "carrera",
      "montar",
      "hipódromo"
    ]
  },
  {
    "word": "Juez",
    "forbidden": [
      "tribunal",
      "ley",
      "sentencia",
      "juicio"
    ]
  },
  {
    "word": "Malabarista",
    "forbidden": [
      "circo",
      "pelotas",
      "lanzar",
      "equilibrio"
    ]
  },
  {
    "word": "Maratonista",
    "forbidden": [
      "correr",
      "kilómetros",
      "deporte",
      "resistencia"
    ]
  },
  {
    "word": "Marinero",
    "forbidden": [
      "barco",
      "mar",
      "navegación",
      "puerto"
    ]
  },
  {
    "word": "Matemático",
    "forbidden": [
      "números",
      "cálculo",
      "ecuaciones",
      "ciencia"
    ]
  },
  {
    "word": "Mecánico",
    "forbidden": [
      "coche",
      "reparar",
      "taller",
      "motor"
    ]
  },
  {
    "word": "Meteorólogo",
    "forbidden": [
      "clima",
      "tiempo",
      "pronóstico",
      "lluvia"
    ]
  },
  {
    "word": "Minero",
    "forbidden": [
      "mina",
      "carbón",
      "excavación",
      "tierra"
    ]
  },
  {
    "word": "Músico",
    "forbidden": [
      "instrumento",
      "concierto",
      "canción",
      "tocar"
    ]
  },
  {
    "word": "Navegador",
    "forbidden": [
      "barco",
      "mar",
      "ruta",
      "brújula"
    ]
  },
  {
    "word": "Novelista",
    "forbidden": [
      "libro",
      "escribir",
      "autor",
      "historia"
    ]
  },
  {
    "word": "Orfebre",
    "forbidden": [
      "joya",
      "oro",
      "metal",
      "artesano"
    ]
  },
  {
    "word": "Paleontólogo",
    "forbidden": [
      "fósil",
      "dinosaurio",
      "excavación",
      "ciencia"
    ]
  },
  {
    "word": "Paracaidista",
    "forbidden": [
      "salto",
      "avión",
      "caída",
      "aire"
    ]
  },
  {
    "word": "Periodista",
    "forbidden": [
      "noticia",
      "reportero",
      "información",
      "entrevista"
    ]
  },
  {
    "word": "Pianista",
    "forbidden": [
      "piano",
      "teclas",
      "música",
      "concierto"
    ]
  },
  {
    "word": "Piloto",
    "forbidden": [
      "avión",
      "vuelo",
      "cabina",
      "aeropuerto"
    ]
  },
  {
    "word": "Pintor",
    "forbidden": [
      "cuadro",
      "pincel",
      "arte",
      "lienzo"
    ]
  },
  {
    "word": "Poeta",
    "forbidden": [
      "versos",
      "poesía",
      "escribir",
      "rima"
    ]
  },
  {
    "word": "Programador",
    "forbidden": [
      "código",
      "software",
      "ordenador",
      "aplicación"
    ]
  },
  {
    "word": "Psicólogo",
    "forbidden": [
      "mente",
      "terapia",
      "paciente",
      "emociones"
    ]
  },
  {
    "word": "Químico",
    "forbidden": [
      "laboratorio",
      "ciencia",
      "sustancias",
      "reacción"
    ]
  },
  {
    "word": "Rector",
    "forbidden": [
      "universidad",
      "educación",
      "académico",
      "institución"
    ]
  },
  {
    "word": "Reportero",
    "forbidden": [
      "noticia",
      "televisión",
      "entrevista",
      "periodista"
    ]
  },
  {
    "word": "Sastre",
    "forbidden": [
      "ropa",
      "traje",
      "coser",
      "medida"
    ]
  },
  {
    "word": "Saxofonista",
    "forbidden": [
      "jazz",
      "música",
      "instrumento",
      "viento"
    ]
  },
  {
    "word": "Sheriff",
    "forbidden": [
      "pueblo",
      "estrella",
      "policía",
      "oeste"
    ]
  },
  {
    "word": "Socorrista",
    "forbidden": [
      "playa",
      "piscina",
      "rescate",
      "salvamento"
    ]
  },
  {
    "word": "Taquígrafo",
    "forbidden": [
      "escribir",
      "rápido",
      "notas",
      "discurso"
    ]
  },
  {
    "word": "Torero",
    "forbidden": [
      "toro",
      "plaza",
      "capote",
      "corrida"
    ]
  },
  {
    "word": "Traductor",
    "forbidden": [
      "idioma",
      "lengua",
      "texto",
      "interpretar"
    ]
  },
  {
    "word": "Trompetista",
    "forbidden": [
      "música",
      "instrumento",
      "viento",
      "jazz"
    ]
  },
  {
    "word": "Veterinario",
    "forbidden": [
      "animal",
      "mascota",
      "consulta",
      "salud"
    ]
  },
  {
    "word": "Violinista",
    "forbidden": [
      "cuerdas",
      "arco",
      "música",
      "instrumento"
    ]
  },
  {
    "word": "Vulcanólogo",
    "forbidden": [
      "volcán",
      "lava",
      "erupción",
      "geología"
    ]
  },
  {
    "word": "Zoológico",
    "forbidden": [
      "animales",
      "parque",
      "jaula",
      "visitantes"
    ]
  }
]
''';

  final List<dynamic> jsonList = jsonDecode(questionsJson) as List<dynamic>;

  final questions = <QuestionStruct>[];

  for (var i = 0; i < jsonList.length; i++) {
    final item = jsonList[i] as Map<String, dynamic>;
    final forbidden = (item['forbidden'] as List<dynamic>)
        .map((value) => value.toString())
        .toList();

    questions.add(
      createQuestionStruct(
        id: i,
        palabraAdivinar: item['word']?.toString() ?? '',
        palabraProhibida1: forbidden.isNotEmpty ? forbidden[0] : '',
        palabraProhibida2: forbidden.length > 1 ? forbidden[1] : '',
        palabraProhibida3: forbidden.length > 2 ? forbidden[2] : '',
        palabraProhibida4: forbidden.length > 3 ? forbidden[3] : '',
      ),
    );
  }

  questions.shuffle(Random());

  return questions;
}
