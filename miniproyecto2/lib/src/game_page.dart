import 'dart:async';
import 'package:flutter/material.dart';
import './card_widget.dart';
import './record_manager.dart';

class GamePage extends StatefulWidget {
  final int numPairs;

  GamePage({required this.numPairs});

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late Timer _timer;
  int _seconds = 0;
  bool _gameOver = false;
  late List<String> _images;
  late List<bool> _revealed;
  late List<bool> _matched; // Para controlar los pares encontrados
  int _firstCardIndex = -1;
  int _secondCardIndex = -1;
  bool _isCheckingPair = false;
  int _record = 0;

  @override
  void initState() {
    super.initState();
    _startGame();
    _loadRecord();
  }

  void _startGame() {
    _images = _generateImageList();
    _revealed = List.generate(widget.numPairs * 2, (_) => false);
    _matched = List.generate(widget.numPairs , (_) => false); // Inicializamos los pares como no encontrados
    _seconds = 0;
    _gameOver = false;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_gameOver) {
        timer.cancel(); // Detenemos el cronómetro si el juego termina
      } else {
        setState(() {
          _seconds++;
        });
      }
    });
  }

  Future<void> _loadRecord() async {
    int? record = await RecordManager.getRecord(widget.numPairs);
    setState(() {
      _record = record ?? 0; // Asigna 0 si no hay récord
    });
  }

  List<String> _generateImageList() {
    List<String> baseImages = [
      'cerdo.avif', 'gato.jpeg', 'leon.jpeg', 'perro.webp', 'pez.jpeg', 'tortuga.jpeg'
    ];

    List<String> selectedImages;
    if (widget.numPairs == 8) {
      selectedImages = baseImages.sublist(0, 4);
    } else if (widget.numPairs == 10) {
      selectedImages = baseImages.sublist(0, 5);
    } else if (widget.numPairs == 12) {
      selectedImages = baseImages.sublist(0, 6);
    } else {
      selectedImages = [];
    }

    List<String> imagePairs = [...selectedImages, ...selectedImages]..shuffle();
    return imagePairs;
  }
    void _resetSelections() {
    _firstCardIndex = -1;
    _secondCardIndex = -1;
    _isCheckingPair = false;
  }

  void _onCardTap(int index) {
    print('Carta tocada: $index'); // Verificar el índice de la carta tocada
    if (_isCheckingPair || _revealed[index] || _matched[index]) {
      print('Acción no permitida, verificando par o carta ya revelada/emparejada');
      return;
    }

    setState(() {
      _revealed[index] = true;
    });

    if (_firstCardIndex == -1) {
      print('Primera carta seleccionada: $index');
      _firstCardIndex = index;
    } else if (_secondCardIndex == -1) {
      print('Segunda carta seleccionada: $index');
      _secondCardIndex = index;
      _isCheckingPair = true;

      // Verificamos si las cartas son iguales
      if (_images[_firstCardIndex] == _images[_secondCardIndex]) {
        print('Pareja encontrada: $_firstCardIndex y $_secondCardIndex');
        setState(() {
          _matched[_firstCardIndex] = true;
          _matched[_secondCardIndex] = true;
        });

        // Resetear selección
        _resetSelections();

        // Verificar fin del juego después de actualizar el estado de las parejas
        Future.microtask(() {
          _checkGameOver();
        });
      } else {
        print('Pareja no encontrada: $_firstCardIndex y $_secondCardIndex');
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _revealed[_firstCardIndex] = false;
            _revealed[_secondCardIndex] = false;
          });
          _resetSelections();
        });
      }
    }
  }


  void _checkGameOver() {
    print('Verificando si el juego ha terminado...');
    if (_matched.every((element) => element)) {
      print('Juego terminado en $_seconds segundos');
      setState(() {
        _gameOver = true; // Marcamos el juego como terminado
      });
      _timer.cancel(); // Detenemos el cronómetro
      RecordManager.saveRecord(widget.numPairs, _seconds);
      _loadRecord(); // Cargar el récord actualizado
    } else {
      print('Aún quedan parejas por encontrar');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        title: Text('Memorama - ${widget.numPairs} pares'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            'Tiempo: $_seconds segundos',
            style: TextStyle(fontSize: 24),
          ),
          if (_record > 0)
            Text(
              'Récord actual: $_record segundos',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          Expanded(
            child: GridView.builder(
              itemCount: _images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return CardWidget(
                  imagePath: _images[index],
                  revealed: _revealed[index] || _matched[index], // Mostramos la carta si está revelada o emparejada
                  onTap: () {
                    _onCardTap(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
