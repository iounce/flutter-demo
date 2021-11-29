import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Components Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.deepOrange,
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'Flutter Components Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  var labelText = '请输入内容';
  var errorText = '这里是错误文本提示';
  var defaultText = '默认';
  var inputText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 32.0),
              child: TextField(
                autofocus: true,
                //obscureText: true,
                //maxLines: 1,
                //maxLength: 100,
                //inputFormatters: [LengthLimitingTextInputFormatter(32)],
                //textInputAction: TextInputAction.done,
                //keyboardType: TextInputType.phone,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                ),
                decoration: InputDecoration(
                    icon: Icon(Icons.text_fields),
                    //prefixIcon: Icon(Icons.edit),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          inputText = '';
                        });
                      },
                    ),
                    //prefixIconConstraints: BoxConstraints(),
                    labelText: labelText,
                    errorText: errorText,
                    contentPadding: EdgeInsets.all(0.0),
                    labelStyle: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 16.0,
                      decoration: TextDecoration.none,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                    )),
                controller: TextEditingController.fromValue(TextEditingValue(
                    text: inputText,
                    selection: TextSelection.fromPosition(TextPosition(
                      affinity: TextAffinity.downstream,
                      offset: inputText.length,
                    )))),
                onTap: () {
                  setState(() {
                    inputText = '';
                  });
                },
                onChanged: (text) {
                  print(text);
                  setState(() {
                    inputText = text;
                  });
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 32.0),
              child: TextField(
                cursorColor: Colors.deepOrange,
                enabled: false,
                //readOnly: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.text_snippet),
                    labelText: '内容',
                    contentPadding: EdgeInsets.all(0.0),
                    labelStyle:
                        TextStyle(color: Colors.deepOrange, fontSize: 16.0),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                    )),
                controller: TextEditingController.fromValue(
                    TextEditingValue(text: inputText)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
