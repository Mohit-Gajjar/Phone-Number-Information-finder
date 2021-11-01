
// import 'package:flutter/material.dart';

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             alignment: Alignment.topCenter,
//             child: Stack(
//               children: [
//                 Image(
//                   fit: BoxFit.cover,
//                   image: NetworkImage(
//                     'https://source.unsplash.com/1600x900/?nature,mountains,dark',
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
//                   child: Container(
//                       height: 50,
//                       decoration: BoxDecoration(
//                           border: Border.all(width: 2, color: Colors.white),
//                           borderRadius: BorderRadius.circular(25)),
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: TextField(
//                           controller: searchController,
//                           keyboardType: TextInputType.number,
//                           style: TextStyle(color: Colors.white, fontSize: 20),
//                           decoration: InputDecoration(
//                               hintText: "Enter Mobile Number...",
//                               hintStyle:
//                                   TextStyle(color: Colors.white, fontSize: 20),
//                               filled: true,
//                               border: InputBorder.none),
//                         ),
//                       )),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 30),
          
//         ],
//       ),
//       bottomSheet: Container(
//         height: 60,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               GestureDetector(
//                 onTap: () => onTextFieldSubmitted(),
//                 child: Container(
//                   height: 60,
//                   width: 150,
//                   child: Center(
//                       child: Text(
//                     "Search",
//                     style: TextStyle(color: Colors.black, fontSize: 17),
//                   )),
//                   decoration: BoxDecoration(
//                       border: Border.all(width: 2, color: Colors.blue),
//                       borderRadius: BorderRadius.circular(30)),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     searchController.text = "";
//                     number = "";
//                     localFormat = "";
//                     internationalFormat = "";
//                     countryPrefix = "";
//                     countryCode = "";
//                     countryName = "";
//                     location = "";
//                     carrier = "";
//                     hasData = false;
//                   });
//                 },
//                 child: Container(
//                   height: 60,
//                   width: 150,
//                   child: Center(
//                       child: Text(
//                     "New Search",
//                     style: TextStyle(color: Colors.black, fontSize: 17),
//                   )),
//                   decoration: BoxDecoration(
//                       border: Border.all(width: 2, color: Colors.blue),
//                       borderRadius: BorderRadius.circular(30)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }


// }
