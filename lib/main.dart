import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,

      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );

  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late int firstnum;
  late int secondnum;
  String texttodisplay = "";
  late String res;
  late String operatortoperform;
  void btnclicked(String btnval){
    if(btnval=="C"){
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    }
    else if(btnval == "+"|| btnval == "-"|| btnval== "x" || btnval == "/"){
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = btnval;
    }
    else if(btnval == "="){
      secondnum = int.parse(texttodisplay);
      if(operatortoperform == "+"){
        res = (firstnum + secondnum).toString();
      }
      if(operatortoperform == "-"){
        res = (firstnum - secondnum).toString();
      }
      if(operatortoperform == "x"){
        res = (firstnum * secondnum).toString();
      }
      if(operatortoperform == "/"){
        res = (firstnum / secondnum).toString();
      }
    }
    else{
      res = int.parse(texttodisplay + btnval).toString();

    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget custombutton(String btnval){
    return Expanded(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: OutlinedButton(
            onPressed: () => btnclicked(btnval),
            child: Text(
              "$btnval",
              style: TextStyle(
                fontSize:25.0
              )
            ),
          ),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",

        ),
      ),
      body: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600
                  ),

                ),
              )
          ),

            Row(
              children: <Widget> [
                custombutton('9'),
                custombutton('8'),
                custombutton('7'),
                custombutton('+'),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('6'),
                custombutton('5'),
                custombutton('4'),
                custombutton('-')
              ],
            ),
            Row(
              children: <Widget> [
                custombutton('3'),
                custombutton('2'),
                custombutton('1'),
                custombutton('x'),

              ],
            ),
            Row(
              children: <Widget> [
                custombutton('C'),
                custombutton('0'),
                custombutton('='),
                custombutton('/'),
              ],
            )

          ],
        ),
      ),
    );
  }
}



