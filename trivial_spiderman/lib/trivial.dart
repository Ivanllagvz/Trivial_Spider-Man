import 'package:flutter/material.dart';
import 'package:trivial_spiderman/main.dart';

class TrivialScreen extends StatefulWidget {
  const TrivialScreen({super.key});

  @override
  _TrivialScreenState createState() => _TrivialScreenState();
}

class _TrivialScreenState extends State<TrivialScreen> {
  int _currentQuestionIndex = 0; // Índice de la pregunta actual
  bool _answered = false; // Saber si ya se respondió la pregunta
  int _selectedAnswerIndex = -1; // Opción seleccionada
  bool _correctAnswer = false; // Saber si la respuesta es correcta
  int _correctCount = 0; // Contador de respuestas correctas
  int _incorrectCount = 0; // Contador de respuestas incorrectas

  // Lista de preguntas y respuestas
  final List<Map<String, dynamic>> _questions = [
    {
      'question':
          '¿En qué cómic hizo su primera aparición el personaje de Venom?',
      'answers': [
        {'text': 'The Amazing Spider-Man #252', 'isCorrect': false},
        {'text': 'The Amazing Spider-Man #300', 'isCorrect': true},
        {'text': 'The Spectacular Spider-Man #90', 'isCorrect': false},
        {'text': 'Secret Wars #8', 'isCorrect': false},
      ],
      'background': 'assets/imagenes/venom.jpg',
    },
    {
      'question':
          '¿Cómo descubre el Doctor Octopus que Peter Parker es Spider-Man en la historia "Superior Spider-Man"?',
      'answers': [
        {'text': 'Descubre archivos secretos de SHIELD', 'isCorrect': false},
        {'text': 'Interroga a Mary Jane Watson', 'isCorrect': false},
        {
          'text':
              'Transfiere su conciencia al cuerpo de Peter Parker y accede a sus recuerdos',
          'isCorrect': true
        },
        {'text': 'Hackea los servidores de Oscorp', 'isCorrect': false},
      ],
      'background': 'assets/imagenes/superior.jpg',
    },
    {
      'question':
          '¿Qué superhéroe ayudó a Peter Parker a construir su icónico traje negro en la saga "Guerras Secretas"?',
      'answers': [
        {'text': 'Reed Richards', 'isCorrect': false},
        {'text': 'Tony Stark', 'isCorrect': false},
        {
          'text':
              'Ningún superhéroe, Peter encontró el traje en un dispositivo alienígena',
          'isCorrect': true
        },
        {'text': 'Hank Pym', 'isCorrect': false},
      ],
      'background': 'assets/imagenes/negro.jpg',
    },
    {
      'question':
          '¿Cuál es el verdadero nombre del villano conocido como El Chacal, responsable de la Saga del Clon?',
      'answers': [
        {'text': 'Norman Osborn', 'isCorrect': false},
        {'text': 'Miles Warren', 'isCorrect': true},
        {'text': 'Otto Octavius', 'isCorrect': false},
        {'text': 'Harry Osborn', 'isCorrect': false},
      ],
      'background': 'assets/imagenes/chacal.jpg',
    },
    {
      'question':
          '¿En qué historia de Spider-Man se revela la existencia del "Spider-Verse"?',
      'answers': [
        {'text': 'The Clone Saga', 'isCorrect': false},
        {'text': 'Maximum Carnage', 'isCorrect': false},
        {'text': 'Spider-Verse', 'isCorrect': true},
        {'text': 'Spider-Man: Blue', 'isCorrect': false},
      ],
      'background': 'assets/imagenes/verse.jpg',
    },
    // Preguntas adicionales
    {
      'question':
          '¿Cómo obtiene Peter Parker sus poderes en los cómics originales?',
      'answers': [
        {'text': 'Un experimento fallido de Tony Stark', 'isCorrect': false},
        {'text': 'Una mordida de araña radiactiva', 'isCorrect': true},
        {'text': 'Un accidente en los laboratorios Oscorp', 'isCorrect': false},
        {'text': 'Un ataque del Duende Verde', 'isCorrect': false},
      ],
      'background': 'assets/imagenes/peter.jpg',
    },
    {
      'question': '¿Quién fue el primer amor de Peter Parker en los cómics?',
      'answers': [
        {'text': 'Gwen Stacy', 'isCorrect': false},
        {'text': 'Mary Jane Watson', 'isCorrect': false},
        {'text': 'Betty Brant', 'isCorrect': true},
        {'text': 'Felicia Hardy', 'isCorrect': false},
      ],
      'background': 'assets/imagenes/gwen.jpg',
    },
    {
      'question':
          '¿Cuál es el nombre del periódico en el que Peter Parker trabaja como fotógrafo?',
      'answers': [
        {'text': 'Daily Globe', 'isCorrect': false},
        {'text': 'Daily Bugle', 'isCorrect': true},
        {'text': 'New York Times', 'isCorrect': false},
        {'text': 'The Daily Planet', 'isCorrect': false},
      ],
      'background': 'assets/imagenes/bugle.jpg',
    },
    {
      'question': '¿Cómo es capaz Spider-Man de adherirse a las superficies?',
      'answers': [
        {
          'text':
              'Posee pequeños pelitos en las yemas de los dedos como muchas especies de arañas.',
          'isCorrect': false
        },
        {
          'text':
              'Es capaz de sostenerse debido a la gran fuerza de agarre que posee.',
          'isCorrect': false
        },
        {
          'text':
              'El traje tiene ventosas minúsculas pero con gran capacidad de succión en las extremidades.',
          'isCorrect': false
        },
        {
          'text':
              'Una mutación en su cerebelo le permite controlar el flujo intermolecular entre las superficies y el mismo, aumentando la fricción.',
          'isCorrect': true
        },
      ],
      'background': 'assets/imagenes/spidey.jpg',
    },
    {
      'question': '¿Qué villano mata a Gwen Stacy en los cómics?',
      'answers': [
        {'text': 'Duende Verde (Norman Osborn)', 'isCorrect': true},
        {'text': 'Doctor Octopus', 'isCorrect': false},
        {'text': 'Venom', 'isCorrect': false},
        {'text': 'Mysterio', 'isCorrect': false},
      ],
      'background': 'assets/imagenes/muerte.jpg',
    },
  ];

  // Función para seleccionar respuesta
  void _selectAnswer(int index) {
    if (_answered) return; // Si ya se ha respondido, no hacer nada

    setState(() {
      _answered = true;
      _selectedAnswerIndex = index;
      _correctAnswer =
          _questions[_currentQuestionIndex]['answers'][index]['isCorrect'];

      // Contar respuestas correctas e incorrectas
      if (_correctAnswer) {
        _correctCount++;
      } else {
        _incorrectCount++;
      }

      // Pasar a la siguiente pregunta tras 2 segundos
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          if (_currentQuestionIndex < _questions.length - 1) {
            _currentQuestionIndex++;
          } else {
            _showResults(); // Mostrar los resultados al final
          }
          _answered = false;
          _selectedAnswerIndex = -1;
        });
      });
    });
  }

  // Función para mostrar la pantalla de resultados
  void _showResults() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(
          correctCount: _correctCount,
          incorrectCount: _incorrectCount,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(currentQuestion['background']),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Mostrar la pregunta con fondo semitransparente
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color:
                      Colors.black.withOpacity(0.6), // Fondo semitransparente
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  currentQuestion['question'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              // Solo el contenedor de respuestas necesita scroll
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      children: List.generate(currentQuestion['answers'].length,
                          (index) {
                    final answer = currentQuestion['answers'][index];
                    final isSelected = _selectedAnswerIndex == index;
                    final isCorrect = answer['isCorrect'];

                    return GestureDetector(
                      onTap: () => _selectAnswer(index),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _answered
                              ? (isCorrect
                                  ? Colors.green.withOpacity(0.7)
                                  : (isSelected
                                      ? Colors.red.withOpacity(0.7)
                                      : Colors.black.withOpacity(0.4)))
                              : Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white24),
                        ),
                        child: Text(
                          answer['text'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  })),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Pantalla de resultados
class ResultsScreen extends StatelessWidget {
  final int correctCount;
  final int incorrectCount;

  const ResultsScreen({
    Key? key,
    required this.correctCount,
    required this.incorrectCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
      ),
      body: Stack(
        children: [
          // Fondo de imagen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/imagenes/resultados.jpg"), // Ajusta la ruta a tu imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido principal
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    height: 50), // Esto eleva los resultados hacia arriba
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(
                        0.7), // Fondo semitransparente para legibilidad
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Respuestas Correctas: $correctCount',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white, // Texto en blanco
                        ),
                      ),
                      Text(
                        'Respuestas Incorrectas: $incorrectCount',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white, // Texto en blanco
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navegar de vuelta a la pantalla inicial
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SplashScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text('Regresar al Trivial'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
