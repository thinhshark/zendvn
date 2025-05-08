import 'package:calculator_app/widgets/input_field.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalculatorScreen> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  String result = '';
  final List<String> history = [];

  void _calculate(String operator) {
    double num1 = double.tryParse(controller1.text) ?? 0;
    double num2 = double.tryParse(controller2.text) ?? 0;
    double res;

    switch (operator) {
      case '+':
        res = num1 + num2;
        break;
      case '-':
        res = num1 - num2;
        break;
      case '*':
        res = num1 * num2;
        break;
      case '/':
        res = num2 != 0 ? num1 / num2 : 0;
        break;
      default:
        res = 0;
    }

    String resultText = '$num1 $operator $num2 = $res';

    setState(() {
      result = resultText;
      history.insert(0, resultText);
    });
  }

  void clearHistory() {
    setState(() {
      history.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/cal-bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 160),
            Text(
              'Calculate',
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: InputField(
                    controller: controller1,
                    hint: 'nhập số thứ 1',
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InputField(
                    controller: controller2,
                    hint: 'nhập số thứ 2',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  ['+', '-', '*', '/'].map((op) {
                    return ElevatedButton(
                      onPressed: () => _calculate(op),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(op),
                    );
                  }).toList(),
            ),

            SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                result,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 20),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color.fromARGB(255, 255, 255, 255),
                      const Color.fromARGB(0, 255, 255, 255),
                    ],
                  ),
                ),
                // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  children: [
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 4,
                      child: ListView.builder(
                        itemCount: history.length,
                        itemBuilder:
                            (_, index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                history[index],
                                style: TextStyle(
                                  fontSize: 22,
                                  color: index == 0 ? Colors.red : Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        alignment: Alignment.topRight,
                        onPressed: clearHistory,
                        icon: Icon(Icons.delete_outline),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
