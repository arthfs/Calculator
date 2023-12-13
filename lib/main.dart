import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math' as math;
import 'dart:async';

void main() {
  runApp(const MyApp());
}

Color buttoncolor = Colors.black;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

List<String> results = [];
double operation_button_middle = 35;
bool isvisible = true;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String screenvalue = '|', result = '';

  int lastresult = 0;
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1, milliseconds: 500), (timer) {
      setState(() {
        isvisible = !isvisible;
        if (timer.tick == 1) timer.cancel();
      });
      //  print(isvisible);
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
          appBar: AppBar(
              title: const Text(
                'Simple calculator',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.blue),
          body: Column(children: [
            Container(
              height: 100,
              alignment: Alignment.center,
              child: const Text(
                'My calculator',
                style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                    shadows: [
                      Shadow(blurRadius: 10, color: Colors.white),
                      Shadow(blurRadius: 5, color: Colors.blue)
                    ]),
              ),
            ),
            Container(
              width: 370,
              height: 550,
              child: Column(children: [
                Column(
                  children: [
                    Container(
                        width: 370,
                        height: 80,
                        color: Colors.black12,
                        padding: const EdgeInsets.only(bottom: 20),
                        child: !isvisible &&
                                screenvalue.indexOf('|') !=
                                    screenvalue.length - 1
                            ? Text(
                                screenvalue.replaceRange(
                                    screenvalue.indexOf('|'),
                                    screenvalue.indexOf('|') + 1,
                                    ' '),
                                textAlign: TextAlign.end,
                                maxLines: 1,
                              )
                            : !isvisible
                                ? Text(
                                    screenvalue
                                        .substring(0, screenvalue.indexOf('|'))
                                        .padRight(screenvalue.length, ' ')
                                        .padLeft(screenvalue.length, ' '),
                                    textAlign: TextAlign.end,
                                    maxLines: 1,
                                  )
                                : Text(
                                    screenvalue,
                                    textAlign: TextAlign.end,
                                    maxLines: 1,
                                  )),
                    Container(
                        color: Colors.black12,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text(result)])),
                  ],
                ),
                Container(
                    height: 150,
                    color: Colors.black38,

                    // padding: const EdgeInsets.only(bottom: 500),
                    child: Row(children: [
                      Container(
                          width: 277,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    child: Row(
                                  children: [
                                    Container(
                                        width: 50,
                                        height: operation_button_middle,
                                        color: buttoncolor,
                                        child: TextButton(
                                            onPressed: () {
                                              if (screenvalue.length != 44) {
                                                setState(() {
                                                  int i =
                                                      screenvalue.indexOf('|');
                                                  screenvalue =
                                                      screenvalue.replaceRange(
                                                          i, i, 'sin');
                                                });
                                              }
                                            },
                                            child: const Text('Sin',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 12)))),
                                    const SizedBox(width: 20),
                                    Container(
                                        width: 50,
                                        height: operation_button_middle,
                                        color: buttoncolor,
                                        child: TextButton(
                                            onPressed: () {
                                              if (screenvalue.length != 44) {
                                                setState(() {
                                                  int i =
                                                      screenvalue.indexOf('|');
                                                  screenvalue =
                                                      screenvalue.replaceRange(
                                                          i, i, 'cos');
                                                });
                                              }
                                            },
                                            child: const Text('Cos',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 12)))),
                                    const SizedBox(width: 20),
                                    Container(
                                        width: 50,
                                        height: operation_button_middle,
                                        color: buttoncolor,
                                        child: TextButton(
                                            onPressed: () {
                                              if (screenvalue.length != 44) {
                                                setState(() {
                                                  int i =
                                                      screenvalue.indexOf('|');
                                                  screenvalue =
                                                      screenvalue.replaceRange(
                                                          i, i, 'tan');
                                                });
                                              }
                                            },
                                            child: const Text('Tan',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 12)))),
                                    const SizedBox(width: 20),
                                    Container(
                                        width: 50,
                                        height: operation_button_middle,
                                        color: buttoncolor,
                                        child: TextButton(
                                            onPressed: () {
                                              if (screenvalue.length != 44) {
                                                setState(() {
                                                  int i =
                                                      screenvalue.indexOf('|');
                                                  screenvalue =
                                                      screenvalue.replaceRange(
                                                          i,
                                                          i,
                                                          math.pi.toString());
                                                });
                                              }
                                            },
                                            child: const Text('π',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 12))))
                                  ],
                                )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                        child: Row(
                                      children: [
                                        Container(
                                            width: 50,
                                            height: operation_button_middle,
                                            color: buttoncolor,
                                            child: TextButton(
                                                onPressed: () {
                                                  if (screenvalue.length !=
                                                      44) {
                                                    setState((() {
                                                      int i = screenvalue
                                                          .indexOf('|');
                                                      screenvalue = screenvalue
                                                          .replaceRange(
                                                              i, i, '(');
                                                    }));
                                                  }
                                                },
                                                child: const Text('(',
                                                    style: TextStyle(
                                                        color: Colors.blue)))),
                                      ],
                                    )),
                                    const SizedBox(width: 20),
                                    Container(
                                        child: Row(
                                      children: [
                                        Container(
                                            width: 50,
                                            height: operation_button_middle,
                                            color: buttoncolor,
                                            child: TextButton(
                                                onPressed: () {
                                                  if (screenvalue.length !=
                                                      44) {
                                                    setState(() {
                                                      int i = screenvalue
                                                          .indexOf('|');
                                                      screenvalue = screenvalue
                                                          .replaceRange(
                                                              i, i, ')');
                                                    });
                                                  }
                                                },
                                                child: const Text(')',
                                                    style: TextStyle(
                                                        color: Colors.blue)))),
                                      ],
                                    )),
                                    const SizedBox(width: 20),
                                    Container(
                                        child: Row(
                                      children: [
                                        Container(
                                            width: 50,
                                            height: operation_button_middle,
                                            color: buttoncolor,
                                            child: TextButton(
                                                onPressed: () {
                                                  if (screenvalue.length !=
                                                      44) {
                                                    setState(() {
                                                      int i = screenvalue
                                                          .indexOf('|');
                                                      screenvalue = screenvalue
                                                          .replaceRange(
                                                              i, i, '!');
                                                    });
                                                  }
                                                },
                                                child: const Text('!',
                                                    style: TextStyle(
                                                        color: Colors.blue)))),
                                        const SizedBox(width: 20),
                                        Container(
                                            width: 50,
                                            height: operation_button_middle,
                                            color: buttoncolor,
                                            child: TextButton(
                                                onPressed: () {
                                                  if (screenvalue.length !=
                                                      44) {
                                                    setState(() {
                                                      int i = screenvalue
                                                          .indexOf('|');
                                                      screenvalue = screenvalue
                                                          .replaceRange(
                                                              i, i, '^');
                                                    });
                                                  }
                                                },
                                                child: const Text('^',
                                                    style: TextStyle(
                                                        color: Colors.blue)))),
                                      ],
                                    )),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                        child: Row(
                                      children: [
                                        Container(
                                            width: 50,
                                            height: operation_button_middle,
                                            color: buttoncolor,
                                            child: TextButton(
                                                onPressed: () {
                                                  if (screenvalue.length !=
                                                      44) {
                                                    setState((() {
                                                      int i = screenvalue
                                                          .indexOf('|');
                                                      screenvalue = screenvalue
                                                          .replaceRange(
                                                              i, i, '{');
                                                    }));
                                                  }
                                                },
                                                child: const Text('{',
                                                    style: TextStyle(
                                                        color: Colors.blue)))),
                                      ],
                                    )),
                                    const SizedBox(width: 20),
                                    Container(
                                        child: Row(
                                      children: [
                                        Container(
                                            width: 50,
                                            height: operation_button_middle,
                                            color: buttoncolor,
                                            child: TextButton(
                                                onPressed: () {
                                                  if (screenvalue.length !=
                                                      44) {
                                                    setState(() {
                                                      int i = screenvalue
                                                          .indexOf('|');
                                                      screenvalue = screenvalue
                                                          .replaceRange(
                                                              i, i, '}');
                                                    });
                                                  }
                                                },
                                                child: const Text('}',
                                                    style: TextStyle(
                                                        color: Colors.blue)))),
                                      ],
                                    )),
                                    const SizedBox(width: 20),
                                    Container(
                                        child: Row(
                                      children: [
                                        Container(
                                            width: 50,
                                            height: operation_button_middle,
                                            color: buttoncolor,
                                            child: TextButton(
                                                onPressed: () {
                                                  if (screenvalue.length !=
                                                      44) {
                                                    setState(() {
                                                      int i = screenvalue
                                                          .indexOf('|');
                                                      screenvalue = screenvalue
                                                          .replaceRange(
                                                              i, i, '%');
                                                    });
                                                  }
                                                },
                                                child: const Text('%',
                                                    style: TextStyle(
                                                        color: Colors.blue)))),
                                        const SizedBox(width: 20),
                                        Container(
                                            width: 50,
                                            height: operation_button_middle,
                                            color: buttoncolor,
                                            child: TextButton(
                                                onPressed: () {
                                                  if (screenvalue.length !=
                                                      44) {
                                                    setState(() {
                                                      int i = screenvalue
                                                          .indexOf('|');
                                                      screenvalue = screenvalue
                                                          .replaceRange(
                                                              i, i, 'ln');
                                                    });
                                                  }
                                                },
                                                child: const Text('Ln',
                                                    style: TextStyle(
                                                        color: Colors.blue))))
                                      ],
                                    )),
                                  ],
                                ),
                              ])),
                      Container(
                          width: 90,
                          //color: Colors.blue,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 30,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: IconButton(
                                      focusColor: Colors.blue,
                                      iconSize: 20,
                                      alignment: Alignment.center,
                                      icon: const Icon(
                                        Icons.arrow_drop_up,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          print(lastresult);
                                          try {
                                            result = results[--lastresult];
                                          } catch (e) {}
                                        });
                                      },
                                    )),
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 7, bottom: 7),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            height: 30,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white),
                                            child: IconButton(
                                              iconSize: 20,
                                              alignment: Alignment.center,
                                              icon:
                                                  const Icon(Icons.arrow_left),
                                              onPressed: () {
                                                setState(() {
                                                  int i =
                                                      screenvalue.indexOf('|');

                                                  if (i > 0) {
                                                    screenvalue = screenvalue
                                                        .replaceAll('|', "");
                                                    screenvalue = screenvalue
                                                        .replaceRange(
                                                            i - 1, i - 1, '|');
                                                    print(screenvalue +
                                                        ' ' +
                                                        i.toString());
                                                  }
                                                });
                                              },
                                            )),
                                        Container(
                                            height: 30,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.white),
                                            child: IconButton(
                                              iconSize: 20,
                                              alignment: Alignment.center,
                                              icon:
                                                  const Icon(Icons.arrow_right),
                                              onPressed: () {
                                                setState(() {
                                                  int i =
                                                      screenvalue.indexOf('|');

                                                  if (i <
                                                      screenvalue.length - 1) {
                                                    screenvalue = screenvalue
                                                        .replaceAll('|', "");
                                                    screenvalue = screenvalue
                                                        .replaceRange(
                                                            i + 1, i + 1, '|');
                                                    print(screenvalue +
                                                        ' ' +
                                                        i.toString());
                                                  }
                                                });
                                              },
                                            ))
                                      ],
                                    )),
                                Container(
                                    height: 30,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    child: IconButton(
                                      iconSize: 20,
                                      alignment: Alignment.center,
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          print(lastresult);
                                          try {
                                            result = results[++lastresult];
                                          } catch (e) {}
                                        });
                                      },
                                    ))
                              ]))
                    ])),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: Column(
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.only(bottom: 20, top: 30),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          height: 50,
                                          width: 50,
                                          color: buttoncolor,
                                          child: TextButton(
                                              onPressed: () {
                                                if (screenvalue.length != 44) {
                                                  setState(() {
                                                    int i = screenvalue
                                                        .indexOf('|');
                                                    screenvalue = screenvalue
                                                        .replaceRange(
                                                            i, i, '7');
                                                  });
                                                }
                                              },
                                              child: const Text('7'))),
                                      const SizedBox(width: 20),
                                      Container(
                                          height: 50,
                                          width: 50,
                                          color: buttoncolor,
                                          child: TextButton(
                                              onPressed: () {
                                                if (screenvalue.length != 44) {
                                                  setState(() {
                                                    int i = screenvalue
                                                        .indexOf('|');
                                                    screenvalue = screenvalue
                                                        .replaceRange(
                                                            i, i, '8');
                                                  });
                                                }
                                              },
                                              child: const Text('8'))),
                                      const SizedBox(width: 20),
                                      Container(
                                          height: 50,
                                          width: 50,
                                          color: buttoncolor,
                                          child: TextButton(
                                              onPressed: () {
                                                if (screenvalue.length != 44) {
                                                  setState(() {
                                                    int i = screenvalue
                                                        .indexOf('|');
                                                    screenvalue = screenvalue
                                                        .replaceRange(
                                                            i, i, '9');
                                                  });
                                                }
                                              },
                                              child: const Text('9'))),
                                      const SizedBox(width: 20),
                                      Container(
                                          height: 50,
                                          width: 50,
                                          color: buttoncolor,
                                          child: TextButton(
                                              onPressed: () {
                                                lastresult = results.isNotEmpty
                                                    ? results.length
                                                    : 0;
                                                setState(() {
                                                  screenvalue = '|';
                                                  result = '';
                                                });
                                              },
                                              child: const Text('AC'))),
                                      const SizedBox(width: 20),
                                      Container(
                                          height: 50,
                                          width: 60,
                                          color: buttoncolor,
                                          child: TextButton(
                                              onLongPress: (() {
                                                String test = screenvalue;
                                                int n =
                                                    screenvalue.indexOf('|');

                                                while (n > 0) {
                                                  setState(() {
                                                    test = test.replaceRange(
                                                        n - 1, n, '');
                                                  });
                                                  n = test.indexOf('|');
                                                  screenvalue = test;
                                                  print(test);
                                                }
                                                print(screenvalue +
                                                    ' ' +
                                                    screenvalue.length
                                                        .toString());
                                              }),
                                              onPressed: () {
                                                setState(() {
                                                  int n =
                                                      screenvalue.indexOf('|');
                                                  if (n > 0) {
                                                    RegExp re =
                                                        RegExp('[A-Za-z]');
                                                    if ((re.hasMatch(
                                                        screenvalue[n - 1]))) {
                                                      List<String> word = [];
                                                      while (n > 0 &&
                                                          re.hasMatch(
                                                              screenvalue[
                                                                  n - 1])) {
                                                        word.insert(0,
                                                            screenvalue[n - 1]);
                                                        n -= 1;

                                                        // print(word);
                                                      }

                                                      screenvalue = screenvalue
                                                          .replaceRange(
                                                              screenvalue
                                                                      .indexOf(
                                                                          '|') -
                                                                  word.length,
                                                              screenvalue
                                                                  .indexOf('|'),
                                                              '');
                                                    } else {
                                                      screenvalue = screenvalue
                                                          .replaceRange(
                                                              n - 1, n, '');
                                                    }
                                                  }
                                                  print(screenvalue +
                                                      ' ' +
                                                      screenvalue.length
                                                          .toString());
                                                });
                                              },
                                              child: const Text('DEL')))
                                    ])),
                            Container(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                  Container(
                                      height: 50,
                                      width: 50,
                                      color: buttoncolor,
                                      child: TextButton(
                                          onPressed: () {
                                            if (screenvalue.length != 44) {
                                              setState(() {
                                                int i =
                                                    screenvalue.indexOf('|');
                                                screenvalue = screenvalue
                                                    .replaceRange(i, i, '4');
                                              });
                                            }
                                          },
                                          child: const Text('4'))),
                                  const SizedBox(width: 20),
                                  Container(
                                      height: 50,
                                      width: 50,
                                      color: buttoncolor,
                                      child: TextButton(
                                          onPressed: () {
                                            if (screenvalue.length != 44) {
                                              setState(() {
                                                int i =
                                                    screenvalue.indexOf('|');
                                                screenvalue = screenvalue
                                                    .replaceRange(i, i, '5');
                                              });
                                            }
                                          },
                                          child: const Text('5'))),
                                  const SizedBox(width: 20),
                                  Container(
                                      height: 50,
                                      width: 50,
                                      color: buttoncolor,
                                      child: TextButton(
                                          onPressed: () {
                                            if (screenvalue.length != 44) {
                                              setState(() {
                                                int i =
                                                    screenvalue.indexOf('|');
                                                screenvalue = screenvalue
                                                    .replaceRange(i, i, '6');
                                              });
                                            }
                                          },
                                          child: const Text('6'))),
                                  const SizedBox(width: 20),
                                  Container(
                                      height: 50,
                                      width: 50,
                                      color: buttoncolor,
                                      child: TextButton(
                                          onPressed: () {
                                            if (screenvalue.length != 44) {
                                              setState(() {
                                                int i =
                                                    screenvalue.indexOf('|');
                                                screenvalue = screenvalue
                                                    .replaceRange(i, i, '*');
                                              });
                                            }
                                          },
                                          child: const Text('*'))),
                                  const SizedBox(width: 20),
                                  Container(
                                      height: 50,
                                      width: 60,
                                      color: buttoncolor,
                                      child: TextButton(
                                          onPressed: () {
                                            if (screenvalue.length != 44) {
                                              setState(() {
                                                int i =
                                                    screenvalue.indexOf('|');
                                                screenvalue = screenvalue
                                                    .replaceRange(i, i, '/');
                                              });
                                            }
                                          },
                                          child: const Text('/')))
                                ])),
                            Container(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          height: 50,
                                          width: 50,
                                          color: buttoncolor,
                                          child: TextButton(
                                              onPressed: () {
                                                if (screenvalue.length != 44) {
                                                  setState(() {
                                                    int i = screenvalue
                                                        .indexOf('|');
                                                    screenvalue = screenvalue
                                                        .replaceRange(
                                                            i, i, '1');
                                                  });
                                                }
                                              },
                                              child: const Text('1'))),
                                      const SizedBox(width: 20),
                                      Container(
                                          height: 50,
                                          width: 50,
                                          color: buttoncolor,
                                          child: TextButton(
                                              onPressed: () {
                                                if (screenvalue.length != 44) {
                                                  setState(() {
                                                    int i = screenvalue
                                                        .indexOf('|');
                                                    screenvalue = screenvalue
                                                        .replaceRange(
                                                            i, i, '2');
                                                  });
                                                }
                                              },
                                              child: const Text('2'))),
                                      const SizedBox(width: 20),
                                      Container(
                                          height: 50,
                                          width: 50,
                                          color: buttoncolor,
                                          child: TextButton(
                                              onPressed: () {
                                                if (screenvalue.length != 44) {
                                                  setState(() {
                                                    int i = screenvalue
                                                        .indexOf('|');
                                                    screenvalue = screenvalue
                                                        .replaceRange(
                                                            i, i, '3');
                                                  });
                                                }
                                              },
                                              child: const Text('3'))),
                                      const SizedBox(width: 20),
                                      Container(
                                          height: 50,
                                          width: 50,
                                          color: buttoncolor,
                                          child: TextButton(
                                              onPressed: () {
                                                if (screenvalue.length != 44) {
                                                  setState(() {
                                                    int i = screenvalue
                                                        .indexOf('|');
                                                    screenvalue = screenvalue
                                                        .replaceRange(
                                                            i, i, '+');
                                                  });
                                                }
                                              },
                                              child: const Text('+'))),
                                      const SizedBox(width: 20),
                                      Container(
                                          height: 50,
                                          width: 60,
                                          color: buttoncolor,
                                          child: TextButton(
                                              onPressed: () {
                                                if (screenvalue.length != 44) {
                                                  setState(() {
                                                    int i = screenvalue
                                                        .indexOf('|');
                                                    screenvalue = screenvalue
                                                        .replaceRange(
                                                            i, i, '-');
                                                  });
                                                }
                                              },
                                              child: const Text('-')))
                                    ])),
                            Container(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                          height: 50,
                                          width: 50,
                                          color: buttoncolor,
                                          child: TextButton(
                                              onPressed: () {
                                                if (screenvalue.length != 44) {
                                                  setState(() {
                                                    int i = screenvalue
                                                        .indexOf('|');
                                                    screenvalue = screenvalue
                                                        .replaceRange(
                                                            i, i, '0');
                                                  });
                                                }
                                              },
                                              child: const Text('0'))),
                                      const SizedBox(width: 20),
                                      Container(
                                          height: 50,
                                          width: 50,
                                          color: buttoncolor,
                                          child: TextButton(
                                              onPressed: () {
                                                if (screenvalue.length != 44) {
                                                  setState(() {
                                                    int i = screenvalue
                                                        .indexOf('|');
                                                    screenvalue = screenvalue
                                                        .replaceRange(
                                                            i, i, '.');
                                                  });
                                                }
                                              },
                                              child: const Text('.'))),
                                      const SizedBox(width: 20),
                                      Container(
                                          height: 50,
                                          width: 50,
                                          color: buttoncolor,
                                          child: TextButton(
                                              onPressed: () {
                                                setState(() {});
                                              },
                                              child: const Text(
                                                'EXP',
                                                style: TextStyle(fontSize: 12),
                                              ))),
                                      const SizedBox(width: 20),
                                      Container(
                                          height: 50,
                                          width: 50,
                                          color: buttoncolor,
                                          child: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  screenvalue += results.last;
                                                });
                                              },
                                              child: const Text('Ans',
                                                  style: TextStyle(
                                                      fontSize: 12)))),
                                      const SizedBox(width: 20),
                                      Container(
                                          height: 50,
                                          width: 60,
                                          color: buttoncolor,
                                          child: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  Parser p = Parser();
                                                  String screenval = '';
                                                  try {
                                                    screenval = screenvalue
                                                        .replaceAll('|', '');
                                                  } catch (e) {
                                                    screenval = screenvalue;
                                                  }

                                                  Expression exp =
                                                      p.parse(screenval);
                                                  try {
                                                    result = exp
                                                        .evaluate(
                                                            EvaluationType.REAL,
                                                            ContextModel())
                                                        .toString();
                                                    results.add(result);
                                                    lastresult =
                                                        results.length - 1;
                                                    screenvalue = '|';
                                                  } catch (e) {
                                                    screenvalue = '|';
                                                  }
                                                  print(result);
                                                });
                                              },
                                              child: const Text('=')))
                                    ]))
                          ],
                        )))
              ]),
              //color: Colors.amber,
            )
          ])),
    );
  }
}

/*
class button extends StatelessWidget {
  final String firsttouche, secondetouche;
  String screenvalue;
  button(this.firsttouche,
      {super.key, this.secondetouche = '', this.screenvalue = ''});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


           */
