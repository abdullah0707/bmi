import 'dart:math';

import 'package:flutter/material.dart';
import 'result.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double heighValue = 170;
  bool isMale = true;
  int weight = 81;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    final themeText = Theme.of(context).textTheme.bodyLarge;
    final themeText2 = Theme.of(context).textTheme.bodyMedium;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.cyan,
        title: const Text(
          "Body Mass Index",
          style: TextStyle(color: Colors.white70),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    newExpanded(themeText, 'Male'),
                    const SizedBox(width: 15),
                    newExpanded(themeText, 'Female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height', style: themeText),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            heighValue.toStringAsFixed(1),
                            style: themeText2,
                          ),
                          const Text(' CM',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900)),
                        ],
                      ),
                      Slider(
                        value: heighValue,
                        onChanged: (newValue) =>
                            setState(() => heighValue = newValue),
                        min: 50,
                        max: 220,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    new2Expanded(themeText, themeText2, 'Weight'),
                    const SizedBox(width: 15),
                    new2Expanded(themeText, themeText2, 'Age'),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                  onPressed: () {
                    final result = weight / pow(heighValue / 100, 2);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Result(result, isMale, age),
                        ));
                  },
                  icon: const Icon(
                    Icons.calculate_outlined,
                    size: 35,
                    weight: 600,
                  ),
                  label: const Text('Calculate'),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.black54,
                      // minimumSize: const Size(380, 0),
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
            )
          ],
        ),
      ),
    );
  }

  Expanded newExpanded(TextStyle? themeText, String typeText) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() {
          isMale = (typeText == 'Male') ? true : false;
        }),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                isMale && typeText == 'Male' || !isMale && typeText == 'Female'
                    ? Colors.teal
                    : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                typeText == 'Male' ? Icons.male : Icons.female,
                size: 90,
              ),
              const SizedBox(height: 10),
              Text(
                typeText,
                style: themeText,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded new2Expanded(
      TextStyle? themeText, TextStyle? themeText2, String typeText) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              typeText,
              style: themeText,
            ),
            const SizedBox(height: 5),
            Text(
              typeText == 'Age' ? '$age' : '$weight',
              style: themeText2,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => setState(() {
                    typeText == 'Age'
                        ? age != 0
                            ? age--
                            : age
                        : weight != 0
                            ? weight--
                            : weight;
                  }),
                  heroTag: typeText == 'Age' ? 'age--' : 'weight--',
                  mini: true,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () =>
                      setState(() => typeText == 'Age' ? age++ : weight++),
                  heroTag: typeText == 'Age' ? 'age++' : 'weight++',
                  mini: true,
                  child: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
