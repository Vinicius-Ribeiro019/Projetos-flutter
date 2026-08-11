import 'package:flutter/material.dart';

// Trabalho de Flutter - Agendador de Tarefas
// Tudo em um arquivo só mesmo, pra ficar mais simples

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agendador de Tarefas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TelaTarefas(),
    );
  }
}

class TelaTarefas extends StatefulWidget {
  const TelaTarefas({super.key});

  @override
  State<TelaTarefas> createState() => _TelaTarefasState();
}

class _TelaTarefasState extends State<TelaTarefas> {
  // guardando as tarefas em uma lista de Map, sem criar classe separada
  List<Map<String, dynamic>> tarefas = [
    {
      'titulo': 'Estudar para a prova',
      'descricao': 'Revisar capítulo 5 e 6',
      'data': '12/08/2026',
      'feita': false,
    },
    {
      'titulo': 'Entregar trabalho de Flutter',
      'descricao': 'Terminar a interface do app',
      'data': '13/08/2026',
      'feita': false,
    },
  ];

  final controllerTitulo = TextEditingController();
  final controllerDescricao = TextEditingController();
  final controllerData = TextEditingController();

  void adicionarTarefa() {
    if (controllerTitulo.text == '') {
      return;
    }

    setState(() {
      tarefas.add({
        'titulo': controllerTitulo.text,
        'descricao': controllerDescricao.text,
        'data': controllerData.text,
        'feita': false,
      });
    });

    controllerTitulo.clear();
    controllerDescricao.clear();
    controllerData.clear();

    Navigator.pop(context);
  }

  void removerTarefa(int index) {
    setState(() {
      tarefas.removeAt(index);
    });
  }

  void mudarStatus(int index) {
    setState(() {
      tarefas[index]['feita'] = !tarefas[index]['feita'];
    });
  }

  void abrirFormulario() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Nova Tarefa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controllerTitulo,
                decoration: const InputDecoration(labelText: 'Título'),
              ),
              TextField(
                controller: controllerDescricao,
                decoration: const InputDecoration(labelText: 'Descrição'),
              ),
              TextField(
                controller: controllerData,
                decoration: const InputDecoration(
                  labelText: 'Data (ex: 20/08/2026)',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: adicionarTarefa,
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
        backgroundColor: Colors.blue,
      ),
      body: tarefas.isEmpty
          ? const Center(child: Text('Nenhuma tarefa cadastrada ainda'))
          : ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                final tarefa = tarefas[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Checkbox(
                      value: tarefa['feita'],
                      onChanged: (valor) {
                        mudarStatus(index);
                      },
                    ),
                    title: Text(
                      tarefa['titulo'],
                      style: TextStyle(
                        decoration: tarefa['feita']
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    subtitle: Text(
                      '${tarefa['descricao']}\nData: ${tarefa['data']}',
                    ),
                    isThreeLine: true,
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        removerTarefa(index);
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: abrirFormulario,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}