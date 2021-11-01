import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = new TextEditingController();
  void initState() {
    super.initState();
  }

  var valid = false;
  String number = "";
  String localFormat = "";
  String internationalFormat = "";
  String countryPrefix = "";
  String countryCode = "";
  String countryName = "";
  String location = "";
  String carrier = "";
  String lineType = "";
  bool hasData = false;
  bool backPressed = false;
  String url =
      "http://apilayer.net/api/validate?access_key=79a8d010a5283fc829f206c90597662c&number=";
  String str = "&country_code=&format=1";
  // http://apilayer.net/api/validate?access_key=79a8d010a5283fc829f206c90597662c&number=14158586273&country_code=&format=1
  void getData(int num) async {
    var response = await Dio().get(url + num.toString() + str);
    var jsonMap = response.data;
    print(response.data);
    if (response.statusCode == 200) {
      setState(() {
        hasData = true;
        valid = jsonMap["valid"];
        number = jsonMap["number"];
        localFormat = jsonMap["local_format"].toString();
        internationalFormat = jsonMap["international_format"].toString();
        countryPrefix = jsonMap["country_prefix"].toString();
        countryCode = jsonMap["country_code"].toString();
        countryName = jsonMap["country_name"].toString();
        location = jsonMap["location"].toString();
        carrier = jsonMap["carrier"].toString();
        lineType = jsonMap["line_type"].toString();
      });
    }
  }

  int _pageState = 0;
  bool _imageShow = false;
  var _backColor = Color(0xFF5477E3);
  var _textColor = Color(0xFF8F7C7C);
  double windowHeight = 0;
  double _loginYOffset = 0;
  var windowWidth;
  double _loginOpacity = 1;
  bool isUp = true;
  @override
  Widget build(BuildContext context) {
    windowHeight = MediaQuery.of(context).size.height;
    windowWidth = MediaQuery.of(context).size.width;
    switch (_pageState) {
      case 0:
        _backColor = Colors.white;
        _textColor = Color(0xFF160623);
        _loginYOffset = windowHeight;
        _imageShow = false;
        break;
      case 1:
        _backColor = Color(0xFF160623);
        _textColor = Colors.white;
        _loginYOffset = 230;
        _imageShow = true;
        break;
    }
    return Stack(children: [
      AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(milliseconds: 1500),
        color: _backColor,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
                child: isUp
                    ? textBox(_textColor)
                    : Stack(
                        children: [
                          imageBox(_imageShow),
                          
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 100),
                              child: _imageShow
                                  ? Column(
                                      children: [
                                        Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 7),
                                              child: TextField(
                                                controller: searchController,
                                                keyboardType:
                                                    TextInputType.number,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                                decoration: InputDecoration(
                                                    hintText:
                                                        "Enter Mobile Number...",
                                                    hintStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                    filled: true,
                                                    border: InputBorder.none),
                                              ),
                                            )),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  if (searchController
                                                      .text.isNotEmpty) {
                                                    getData(int.parse(
                                                        searchController.text));
                                                  }
                                                },
                                                child: Text("Search")),
                                            ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    searchController.text = "";
                                                    number = "";
                                                    localFormat = "";
                                                    internationalFormat = "";
                                                    countryPrefix = "";
                                                    countryCode = "";
                                                    countryName = "";
                                                    location = "";
                                                    carrier = "";
                                                    lineType = "";
                                                    hasData = false;
                                                  });
                                                },
                                                child: Text("   New   "))
                                          ],
                                        ),
                                      ],
                                    )
                                  : Container()),
                        ],
                      )),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.all(50),
              child: Image(
                image: AssetImage('assets/splash.png'),
              ),
            ),
            SizedBox(height: 10),
            Container(
                child: GestureDetector(
              onTap: () {
                setState(() {
                  if (_pageState != 0) {
                    _pageState = 0;
                  } else {
                    _pageState = 1;
                    isUp = false;
                  }
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                        colors: [Color(0xFF5477E3), Color(0xFF0036CD)])),
                child: Center(
                    child: Text(
                  "Search Info",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            )),
          ],
        ),
      ),
      AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(milliseconds: 1500),
        transform: Matrix4.translationValues(0, _loginYOffset, 1),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(_loginOpacity),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: hasData
            ? dataShow(
                windowWidth,
                valid,
                countryCode,
                localFormat,
                internationalFormat,
                countryPrefix,
                countryName,
                location,
                carrier,
                lineType)
            : Center(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Icon(
                      Icons.sentiment_dissatisfied_outlined,
                      size: 30,
                      color: Colors.red,
                    ),
                    Text(
                      "No Data",
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                  ],
                ),
              ),
      )
    ]);
  }
}

Widget imageBox(bool _imageShow) {
  return _imageShow
      ? Image(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://source.unsplash.com/1600x1080/?nature,mountains,dark',
          ),
        )
      : Container();
}

Widget textBox(var _textColor) {
  return Container(
          margin: EdgeInsets.only(top: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Find Phone",
                style: TextStyle(
                    color: _textColor,
                    fontSize: 40,
                    fontFamily: 'Montserrat-Regular',
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "Number Information",
                style: TextStyle(
                    color: Color(0xFF8F7C7C),
                    fontSize: 18,
                    fontFamily: 'Montserrat-Regular',
                    fontWeight: FontWeight.w400),
              ),
            ],
          ));
}

Widget dataShow(
    var width,
    bool isValid,
    String countryCode,
    localFormat,
    internationalFormat,
    countryPrefix,
    countryName,
    location,
    carrier,
    lineType) {
  return isValid
      ? Container(
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                  child: Icon(Icons.sentiment_satisfied_outlined,
                      size: 30, color: Colors.green)),
              Center(
                child: Text(
                  "Data Available",
                  style: TextStyle(color: Colors.green, fontSize: 30),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Country Code: " + countryCode,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "Local Number Format: " + localFormat,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "International Format: " + internationalFormat,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "Country Prefix: " + countryPrefix,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "Country Name: " + countryName,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "Location: " + location,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "Name Of Carrier: " + carrier,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "Line Type: " + lineType,
                style: TextStyle(color: Colors.black, fontSize: 20),
              )
            ],
          ))
      : Container(
          child: Center(
            child: Text(
              "Invalid Number Entered!!" + "\n" + "Try adding Country Prefix.",
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
        );
}
