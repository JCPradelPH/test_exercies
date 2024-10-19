
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_exercies/bloc/main_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (context) => MainBloc(),
          child: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MainBloc? _bloc;

  @override
  void initState() {
    _bloc = context.read<MainBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('build rebuild');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            _counterText(),
          ],
        ),
      ),
      floatingActionButton: BlocConsumer<MainBloc, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: (){
              // int counter = state.counter;
              // _bloc!.add(OnIncrementCounter(newCounter: counter+1));
              _bloc!.add(const OnChangeColor(Colors.deepOrange));
            },
            tooltip: 'Increment',
            backgroundColor: state.color,
            child: const Icon(Icons.add),
          );
        }
      ),
    );
  }

  Widget _counterText() => BlocConsumer<MainBloc, MainState>(
    listener: (context, state) {},
    builder: (context, state) {
      log('_counterText rebuild');
      return Text(
        '${state.counter}',
        style: Theme.of(context).textTheme.headlineMedium,
      );
    }
  );
}
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
