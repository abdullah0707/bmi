import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double result;
  final bool isMale;
  final int age;

  const Result(this.result, this.isMale, this.age, {Key? key})
      : super(key: key);

  String get resultPhrase {
    String resultText = '';
    if (result < 18.5)
      resultText = 'Thin';
    else if (result >= 18.5 && result < 24.9)
      resultText = 'Normal';
    else if (result > 25 && result < 30)
      resultText = 'Overweight';
    else if (result >= 30) resultText = 'Obese';

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    const themeText = TextStyle(
        fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white60);

    // const themeText2 = TextStyle(
    //     fontSize: 40, fontWeight: FontWeight.bold, color: Colors.teal);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Gender: ${isMale ? 'Male' : 'Female'}',
              style: themeText,
            ),
            Text(
              'Result: ${result.toStringAsFixed(1)}',
              style: themeText,
            ),
            Text(
              'Healthiness: $resultPhrase',
              style: themeText,
              textAlign: TextAlign.center,
            ),
            Text(
              'Age: $age',
              style: themeText,
            ),
          ],
        ),
      )),
    );
  }
}
