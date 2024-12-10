import 'package:bmi_calculator/Screens/result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _height = 177;
  int weight = 80;
  int age = 40;
  double bmi = 0;
  String bmiResult = '';
  String bmiMessage = '';
  void calculateBMI() {
    setState(() {
      bmi = weight / ((_height / 100) * (_height / 100));
      if (bmi < 18.5) {
        bmiResult = 'Underweight';
        bmiMessage =
            ' Increase calorie intake with nutrient-dense foods (e.g., nuts, seeds, whole grains, avocados)';
      } else if (bmi >= 18.5 && bmi < 24.9) {
        bmiResult = 'Normal';
        bmiMessage =
            'Follow a balanced diet with the right mix of proteins, carbs, and healthy fats.';
      } else if (bmi >= 25 && bmi < 29.9) {
        bmiResult = 'Overweight';
        bmiMessage =
            ' Opt for portion control, reduce sugar and processed foods, and include more vegetables and lean proteins.';
      } else {
        bmiResult = 'Obese';
        bmiMessage =
            'Consult a doctor to assess underlying conditions (e.g., hormonal imbalances)';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090C20), // Hex code for dark blue/navy

      appBar: AppBar(
        backgroundColor: const Color(0xFF090C20),
        centerTitle: true,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.green,
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 80,
                            ),
                            Text(
                              "Male",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D1D33),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 80,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                color: const Color(0xFF1D1D33),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Height',
                          style: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        Row(
                          children: [
                            Text(
                              ' ${_height.toStringAsFixed(1)}',
                              style: const TextStyle(
                                  fontSize: 40, color: Colors.white),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'cm',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                        Slider(
                          value: _height,
                          min: 100,
                          max: 250,
                          onChanged: (val) {
                            setState(() {
                              _height = val;
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const   SizedBox(
            height: 10,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF1D1D33),
                      borderRadius: BorderRadius.circular(20)),
                  width: 200,
                  child: Column(
                    children: [
                      const Text(
                        'Weight',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          '$weight',
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: const Icon(Icons.add),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: const Icon(Icons.remove),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFF1D1D33),
                        borderRadius: BorderRadius.circular(20)),
                    width: 200,
                    child: Column(
                      children: [
                        const Text(
                          'Age',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            '$age',
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Icon(Icons.add),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: const Icon(Icons.remove),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                calculateBMI();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(
                              bmi: bmi,
                              bmiResult: bmiResult,
                              bmiMessage: bmiMessage,
                            )));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                "Calculate",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
