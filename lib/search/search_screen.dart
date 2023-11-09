import 'package:flutter/material.dart';
import 'package:movies_search/api/api_manager.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = 'search-screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  final ApiManager apiManager = ApiManager();
  dynamic searchResult;

  void _searchMovies() async {
    final query = searchController.text;
    if (query.isNotEmpty) {
      final result = await apiManager.searchMovies(query);
      setState(() {
        searchResult = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchBarController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Movie Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search for a movie',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onSubmitted: (_) => _searchMovies(),
            ),
            SizedBox(height: 20),
            searchResult != null
                ? Expanded(
                    child: ListView.builder(
                      itemCount: searchResult['results'].length,
                      itemBuilder: (context, index) {
                        final movie = searchResult['results'][index];
                        final posterPath = movie['poster_path'];
                        final posterUrl =
                            'https://image.tmdb.org/t/p/w500/$posterPath';

                        return ListTile(
                          leading: Container(
                              width: 100,
                              height: 100,
                              child: Image.network(
                                posterUrl,
                                fit: BoxFit.fill,
                              )),
                          title: Text(
                            movie['title'],
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            movie['overview'],
                            style: TextStyle(color: Colors.white70),
                          ),
                        );
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

//search UI
// return Scaffold(
// backgroundColor: Colors.black,
// body: Column(
// children: [
// SizedBox(
// height: 40,
// ),
// TextField(
// onTap: () {
// showSearch(context: context, delegate: SearchDeligate());
// },
// style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
// decoration: new InputDecoration(
// enabledBorder: OutlineInputBorder(
// borderSide: const BorderSide(color: Colors.grey, width: 2.0),
// borderRadius: BorderRadius.circular(8.0),
// ),
// labelText: "Search",
// labelStyle: TextStyle(color: Colors.grey),
// ),
// ),
// ],
// ),
// );

//=============================================
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

//search deligate
//
// import 'package:flutter/material.dart';
//
// class SearchDeligate extends SearchDelegate {
//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     return Theme.of(context).copyWith(
//         scaffoldBackgroundColor: Colors.black,
//         appBarTheme: AppBarTheme(color: Colors.black));
//   }
//
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {},
//           icon: Icon(
//             Icons.search,
//             color: Colors.white,
//           ))
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//         icon: Icon(
//           Icons.close,
//           color: Colors.white,
//         ));
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return Container();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Container();
//   }
// }
