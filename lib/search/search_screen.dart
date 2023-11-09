import 'package:flutter/material.dart';
import 'package:movies_search/search/search_deligate.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = 'search-screen';

  @override
  Widget build(BuildContext context) {
    TextEditingController searchBarController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          TextField(
            onTap: () {
              showSearch(context: context, delegate: SearchDeligate());
            },
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            decoration: new InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              labelText: "Search",
              labelStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

//Widget build(BuildContext context) {
//     TextEditingController searchBarController = TextEditingController();
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.black,
//           title: Container(
//             margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
//             decoration: BoxDecoration(
//               color: Colors.black26,
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             padding: EdgeInsets.all(10.0),
//             child: InkWell(
//               onTap: (){
//                 showSearch(
//                     context: context,
//                     delegate: SearchDeligate()
//                 );
//
//               },
//               child: TextField(
//                 controller: searchBarController,
//                 decoration: InputDecoration(
//                     hintText: 'Search ',
//                     hintStyle: TextStyle(color: Colors.grey),
//                     border: InputBorder.none,
//                     // prefixIcon: Icon(
//                     //   Icons.search,
//                     //   color: Colors.white,
//                     // )
//                 ),
//                 autofocus: true,
//                 onChanged: (value) {
//                   // Handle search query
//                   showSearch(
//                       context: context,
//                       delegate: SearchDeligate()
//                   );
//                 },
//               ),
//             ),
//           )),
//     );
//   }
//

//  // InkWell(
//           //   onTap: () {
//           //     showSearch(context: context, delegate: SearchDeligate());
//           //   },
//           //
//           //   child: TextField(
//           //     controller: searchBarController,
//           //     decoration: InputDecoration(
//           //
//           //       hintText: 'Search ',
//           //       hintStyle: TextStyle(color: Colors.grey),
//           //       border: InputBorder.none,
//           //       prefixIcon: Icon(
//           //         Icons.search,
//           //         color: Colors.white,
//           //       )
//           //     ),
//           //     //  autofocus: true,
//           //   ),
//           // ),
