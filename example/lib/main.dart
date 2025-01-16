import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_keyboard_custom_layout/virtual_keyboard_custom_layout.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Keyboard Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Virtual Keyboard Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controllerField03 = TextEditingController();

  var isKeyboardVisible = false;
  var controllerKeyboard = TextEditingController();
  late TypeLayout typeLayout;

  @override
  void initState() {
    keyboardListeners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          isKeyboardVisible = false;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              TextField(),
              TextField(
                inputFormatters: [],
                keyboardType: TextInputType.none,
                controller: controllerField03,
                onTap: () {
                  _showKeyboardAndTextField(textController: controllerField03);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showKeyboardAndTextField({required TextEditingController textController}) {
    showDialog(
      barrierDismissible: true,
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Dialog(
          alignment: Alignment.bottomCenter,
          insetPadding: EdgeInsets.only(right: 8),
          backgroundColor: Colors.transparent,
          child: Container(
            width: double.infinity,
            height: 700,
            color: Colors.white.withAlpha(50),
            child: Row(children: [
              SizedBox(
                width: 8,
              ),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.purpleAccent,
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width * .70,
                  child: Center(child: Text("Content")),
                ),
              ),
              SizedBox(
                width: 8,
              ),

              //Numeric Keyboard
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white.withAlpha(50),
                      border: Border.all(color: Colors.pinkAccent)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 8),
                        ),
                        controller: controllerKeyboard,
                      ),
                      VirtualKeyboard(
                        height: 650,
                        width: double.infinity,
                        iconColor: Colors.black,
                        textStyle: TextStyle(color: Colors.black, fontSize: 50),
                        textController: controllerKeyboard,
                        defaultLayouts: const [
                          VirtualKeyboardDefaultLayouts.English,
                        ],
                        alwaysCaps: true,
                        borderColor: Colors.pink.withAlpha(100),
                        type: VirtualKeyboardType.Custom,
                        keys: TypeLayout.numeric.keyboard,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }

  keyboardListeners() {
    controllerField03.addListener(() {
      if (controllerField03.value.text.endsWith("\n")) {
        controllerField03.text =
            controllerField03.value.text.replaceAll("\n", "");
        setState(() {
          isKeyboardVisible = false;
        });
      }
    });
  }
}

enum TypeLayout { numeric }

extension TypeLayoutExtension on TypeLayout {
  List<List> get keyboard {
    return [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"],
      ["BACKSPACE", "0", "."],
    ];
  }
}
