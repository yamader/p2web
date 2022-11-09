import "package:flutter/material.dart";

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "djvm",
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.orange,
        brightness: Brightness.dark,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
          image: AssetImage("assets/djvm-mini.png"),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "djvm",
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              "自作JVM",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => {},
        label: const Text("Good"),
        icon: const Icon(Icons.thumb_up),
      ),
    );
  }
}
