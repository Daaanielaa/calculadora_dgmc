import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '0';
        _num1 = 0;
        _num2 = 0;
        _operator = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == 'x' ||
          buttonText == '/') {
        _operator = buttonText;
        _num1 = double.parse(_output);
        _output = '0';
      } else if (buttonText == '=') {
        _num2 = double.parse(_output);
        if (_operator == '+') {
          _output = (_num1 + _num2).toString();
        } else if (_operator == '-') {
          _output = (_num1 - _num2).toString();
        } else if (_operator == 'x') {
          _output = (_num1 * _num2).toString();
        } else if (_operator == '/') {
          _output = (_num1 / _num2).toString();
        }
        _num1 = 0;
        _num2 = 0;
        _operator = '';
      } else {
        if (_output == '0') {
          _output = buttonText;
        } else {
          _output += buttonText;
        }
      }
    });
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20.0),
        ),
        onPressed: () => _buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('/'),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('x'),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-'),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton('C'),
              _buildButton('0'),
              _buildButton('='),
              _buildButton('+'),
            ],
          ),
        ],
      ),
    );
  }
}
