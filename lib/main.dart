import 'dart:io';
import 'package:bmi_calculator/card.dart';
import 'package:bmi_calculator/cardtile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'roundbtn.dart';
import 'result.dart';
import 'const.dart';
import 'bmibrane.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: appbarcolor),
        primaryColor: Color(0xff27374D),
        scaffoldBackgroundColor: Color(0xff526D82),
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

int height = 180;
int weight = 60;
int age = 20;

Color activslidecolor = appbarcolor;

enum Gender {
  male,
  female,
  none;
}

class _MyAppState extends State<MyApp> {
  Gender selectedGender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Bmi Calculator')),
        backgroundColor: appbarcolor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: card(
                  cardChild: Carddata(icon: FontAwesomeIcons.mars, txt: 'Male'),
                  colour: (selectedGender == Gender.male)
                      ? activetile
                      : inactivetile,
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                ),
              ),
              Expanded(
                child: card(
                  cardChild:
                      Carddata(icon: FontAwesomeIcons.venus, txt: "Female"),
                  colour: (selectedGender == Gender.female)
                      ? activetile
                      : inactivetile,
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                ),
              )
            ],
          )),
          Expanded(
            child: card(
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Height",
                    style: ktileheader,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kstyleinfo,
                      ),
                      Text('cm')
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: activslidecolor,
                      inactiveColor: Colors.white,
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      })
                ],
              ),
              colour: inactivetile,
              onPressed: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: card(
                  cardChild: Column(
                    children: [
                      Text(
                        'Weight',
                        style: ktileheader,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            weight.toString(),
                            style: kstyleinfo,
                          ),
                          Text(
                            'Kg',
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: Roundactionbtn(
                              icon: FontAwesomeIcons.plus,
                              operation: () {
                                weight++;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: Roundactionbtn(
                              icon: FontAwesomeIcons.minus,
                              operation: () {
                                weight--;
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  colour: Color(0xff9DB2BF),
                  onPressed: () {},
                )),
                Expanded(
                    child: card(
                  cardChild: Column(
                    children: [
                      Text(
                        'Age',
                        style: ktileheader,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            age.toString(),
                            style: kstyleinfo,
                          ),
                          Text(
                            'Years',
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: Roundactionbtn(
                              icon: FontAwesomeIcons.plus,
                              operation: () {
                                age++;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: Roundactionbtn(
                              icon: FontAwesomeIcons.minus,
                              operation: () {
                                age--;
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  colour: Color(0xff9DB2BF),
                  onPressed: () {},
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Bmibrane calc = Bmibrane(height: height, weight: weight);
              String bmi = calc.getBmi();
              String stats = calc.getCondition();

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          new Resultpage(bmi: bmi, status: stats)));
            },
            child: Container(
              child: Center(child: Text('Calculate', style: kstylebtn)),
              height: 100,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Color(0xffDDE6ED),
                  borderRadius: BorderRadius.circular(10)),
            ),
          )
        ],
      ),
    );
  }
}
