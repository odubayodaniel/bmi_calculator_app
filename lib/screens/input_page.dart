import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/widgets/calculate_result_button.dart';
import 'package:bmi_calculator/widgets/reusablecard.dart';
import 'package:bmi_calculator/widgets/rounded_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/widgets/constants.dart';
import 'package:bmi_calculator/calculator_logic/calculator_brain.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int _currentSliderValue = 180;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUsableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? CalculatorColor.kActiveColor
                        : CalculatorColor.kInActiveColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReUsableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? CalculatorColor.kActiveColor
                        : CalculatorColor.kInActiveColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReUsableCard(
              colour: CalculatorColor.kActiveColor,
              onPress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(
                        _currentSliderValue.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: CalculatorColor.kSliderOverlayColor,
                      activeTrackColor: CalculatorColor.kSliderActiveColor,
                      inactiveTrackColor: CalculatorColor.kSliderInactiveColor,
                      thumbColor: CalculatorColor.kSliderThumbColor,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    ),
                    child: Slider(
                        value: _currentSliderValue.toDouble(),
                        max: 220.0,
                        min: 120.0,
                        onChanged: (double newValue) {
                          setState(() {
                            _currentSliderValue = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUsableCard(
                    colour: CalculatorColor.kActiveColor,
                    onPress: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        const SizedBox(
                          height: 0.333,
                        ),
                        Row(
                          // verticalDirection: VerticalDirection.up,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onTapped: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTapped: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReUsableCard(
                    colour: CalculatorColor.kActiveColor,
                    onPress: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        const SizedBox(
                          height: 0.333,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTapped: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTapped: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateResultButton(
            text: 'CALCULATE',
            onPressed: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: _currentSliderValue, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
