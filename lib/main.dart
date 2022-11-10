import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _index = 0;
  int _pressed = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Image(
              image: AssetImage("assets/djvm-mini.png"),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: _pressed > 0 ? Text("$_pressed") : SizedBox.shrink(),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 640,
              ),
              child: Column(
                children: [
                  Container(
                  margin: const EdgeInsets.only(bottom: 48),
                  child: Column(
                    children: [
                      Text(
                        "djvm",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        "自作JVM (はりぼて)",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Text("ソースコード : https://github.com/yamader/djvm"),
                    ],
                  ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("JVMとは，Javaのプログラムを実行するソフトウェアのことです。\nこれははりぼてなのでhello, worldすらできません。"),
                  ),
                  Stepper(
                    currentStep: _index,
                    onStepCancel: () {
                      if(_index > 0) {
                        setState(() {
                          _index -= 1;
                        });
                      }
                    },
                    onStepContinue: () {
                      if(_index <= 0) {
                        setState(() {
                          _index += 1;
                        });
                      }
                    },
                    onStepTapped: (int index) {
                      setState(() {
                        _index = index;
                      });
                    },
                    steps: [
                      Step(
                        title: const Text("クラスファイルの解析"),
                        content: Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              const Image(image: AssetImage("assets/helloworld.png")),
                              const Text("クラスファイルってこんなの"),
                            ],
                          ),
                        ),
                      ),
                      Step(
                        title: const Text("メソッドの情報の解析"),
                        content: Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              const Image(image: AssetImage("assets/methods.png")),
                              const Text("クラスファイルに含まれるメソッド一覧(とその内容)"),
                            ],
                          ),
                        ),
                      ),
                      Step(
                        title: const Text("コードの実行"),
                        content: Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              const Image(image: AssetImage("assets/code.png")),
                              const Text("mainメソッドに含まれるコード"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _pressed++;
          });
          Fluttertoast.showToast(
            msg: "👍",
            gravity: ToastGravity.CENTER,
          );
        },
        label: const Text("+1"),
        icon: const Icon(Icons.thumb_up),
      ),
    );
  }
}
