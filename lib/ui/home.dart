import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            alignment: Alignment.center,
            child: ListView(
              scrollDirection: Axis.vertical,
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                    color: Color(0xffffe2e2),
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$ ${calculateTotalPerPerson(_billAmount, _tipPercentage, _personCounter)}",
                        style: TextStyle(
                            color: Color(0xff8785a2),
                            fontSize:
                                MediaQuery.of(context).size.height * 0.075),
                      ),
                      Text(
                        "Total per person",
                        style: TextStyle(
                            color: Color(0xff8785a2),
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: BoxDecoration(
                    color: Color(0xffffe2e2),
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: TextField(
                          style: TextStyle(
                              color: Color(0xff8785a2),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.029),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff8785a2))
                              ),
                              fillColor: Color(0xff8785a2),
                              prefixIcon: Icon(
                                Icons.attach_money,
                                color: Color(0xff8785a2),
                              ),
                              labelText: "Bill Amount",
                              labelStyle: TextStyle(color: Color(0xff8785a2),
                              fontSize: MediaQuery.of(context).size.height * 0.018)),
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          onChanged: (String value) {
                            try {
                              _billAmount = double.parse(value);
                            } catch (exception) {
                              _billAmount = 0;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Split",
                              style: TextStyle(
                                  color: Color(0xff8785a2),
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (_personCounter == 1)
                                        _personCounter = 1;
                                      else
                                        _personCounter--;
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xfff6f6f6),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(
                                      Icons.exposure_minus_1,
                                      color: Color(0xff8785a2),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "$_personCounter",
                                  style: TextStyle(
                                      color: Color(0xff8785a2),
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.025),
                                ),
                                SizedBox(width: 20),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _personCounter++;
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xfff6f6f6),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(
                                      Icons.exposure_plus_1,
                                      color: Color(0xff8785a2),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tip",
                              style: TextStyle(
                                  color: Color(0xff8785a2),
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025),
                            ),
                            Text(
                              "\$ ${(calculateTip(_billAmount, _tipPercentage)).toStringAsFixed(2)}",
                              style: TextStyle(
                                  color: Color(0xff8785a2),
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "$_tipPercentage%",
                        style: TextStyle(
                            color: Color(0xff8785a2),
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          inactiveColor: Color(0xfff6f6f6),
                          activeColor: Color(0xff8785a2),
                          value: _tipPercentage.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              _tipPercentage = value.round();
                            });
                          })
                    ],
                  ),
                )
              ],
            )));
  }

  calculateTip(double bill, int tipPercentage) {
    double tip = 0;
    if (bill < 0 || bill.toString().isEmpty) {
    } else
      tip = bill * tipPercentage / 100;
    return tip;
  }

  calculateTotalPerPerson(double bill, int tipPercentage, int splitsBy) {
    double totalPerPerson =
        (calculateTip(_billAmount, _tipPercentage) + bill) / splitsBy;
    return totalPerPerson.toStringAsFixed(2);
  }
}
