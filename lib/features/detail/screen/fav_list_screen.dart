import 'package:flutter/material.dart';
import 'package:movie_app_test_getx/features/sqlite/database_helper.dart';
import 'package:movie_app_test_getx/features/widgets/product_card.dart';
import 'package:movie_app_test_getx/network/url.dart';

class FavouriteListScreen extends StatefulWidget {
  const FavouriteListScreen({
    Key? key,
  }) : super(key: key);

  @override
  _FavouriteListScreenState createState() => _FavouriteListScreenState();
}

class _FavouriteListScreenState extends State<FavouriteListScreen> {
  List<Map<String, dynamic>> myFavoutriteListData = [];

  @override
  void initState() {
    super.initState();
    getAllFavouriteMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Favourite Movie List')),
      body: myFavoutriteListData.isNotEmpty
          ? ListView.builder(
              itemCount: myFavoutriteListData.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ObjectKey(myFavoutriteListData[index]),
                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.endToStart) {
                      removeItem(myFavoutriteListData[index]['movieId']);
                    }
                  },
                  child: ProductCard(
                    image: myFavoutriteListData[index]['image'] != null
                        ? 'https://image.tmdb.org/t/p/w185${myFavoutriteListData[index]['image']}'
                        : Url.appLogoUrl,
                    title: myFavoutriteListData[index]['movieName'] ?? "",
                    vote: "",
                    releaseDate: "",
                    overview: myFavoutriteListData[index]['movieDesc'] ?? "",
                    genre: [],
                    aspectRatio: 2.0,
                    onTap: () {},
                  ),
                );
              },
            )
          : const Center(
              child: Text(
              'No any Favourite Movie',
              style: TextStyle(color: Colors.black),
            )),
    );
  }

// Remove a data to the database
  Future<void> removeItem(String movieId) async {
    await DatabaseHelper.deleteItem(movieId);
    getAllFavouriteMovies();
  }

  // This function is used to fetch all data from the database
  getAllFavouriteMovies() async {
    final data = await DatabaseHelper.getItems();
    setState(() {
      myFavoutriteListData = data;
    });
  }
}
