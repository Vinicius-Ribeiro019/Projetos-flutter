import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ContadorTela(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContadorTela extends StatefulWidget {
  const ContadorTela({super.key});

  @override
  _CurtidasTelaState createState() => _CurtidasTelaState();
}

class _CurtidasTelaState extends State<ContadorTela> {
  int curtidas = 0;

  void incrementar() {
    setState(() {
      curtidas++;
    });
  }

  void decrementar() {
    setState(() {
      if (curtidas > 0) {
        curtidas--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplicativo de Curtidas"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.favorite, color: Colors.red, size: 80),
            const SizedBox(height: 10),
            Text("$curtidas curtidas", style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: incrementar,
                  child: const Text("Curtir", style: TextStyle(color: Colors.black)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: decrementar,
                  child: const Text("Descurtir", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
