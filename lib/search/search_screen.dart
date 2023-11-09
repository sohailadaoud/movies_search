import 'package:flutter/material.dart';
import 'package:movies_search/search/search_deligate.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = 'search-screen';

  @override
  Widget build(BuildContext context) {
    TextEditingController searchBarController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //     elevation: 0,
      //     backgroundColor: Colors.black,)
      //,
      body: InkWell(
        onTap: () {
          showSearch(context: context, delegate: SearchDeligate());
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.all(10.0),
          child: TextField(
            controller: searchBarController,
            decoration: InputDecoration(
              hintText: 'Search ',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              // prefixIcon: Icon(
              //   Icons.search,
              //   color: Colors.white,
              // )
            ),
            //  autofocus: true,
          ),
        ),
      ),
    );
  }

  //TextEditingController searchBarController = TextEditingController();
  bool searchBarVisibile = false;

  void searchBar() {}
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
