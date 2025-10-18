import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/counter_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔍 context.watch() permet d’écouter les changements du provider
    final counterProvider = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Provider Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: ${counterProvider.count}',
                style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ⚡ context.read() ne reconstruit pas l’UI, juste exécute l’action
                context.read<CounterProvider>().increment();
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
