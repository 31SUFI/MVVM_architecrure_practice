import 'package:flutter/material.dart';
import 'package:mvvm_architecture/data/response/status.dart';
import 'package:mvvm_architecture/util/routes/routes-name.dart';
import 'package:mvvm_architecture/util/routes/utils.dart';
import 'package:mvvm_architecture/view_model/home_view_model.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel? homeViewViewModel = HomeViewViewModel();
  @override
  void initState() {
    // TODO: implement initState
    homeViewViewModel!.fetchMoviesListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              userPreference.remove().then((value) {
                Navigator.pushNamed(context, RoutesNames.login);
              });
            },
            child: Center(
                child: Text('Logout',
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ), //
          SizedBox(width: 20),
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel!,
        child: Consumer<HomeViewViewModel>(
          builder: (context, value, child) {
            switch (value.moviesList?.status) {
              case Status.loading:
                return Center(child: CircularProgressIndicator());
              case Status.error:
                return Center(child: Text(value.moviesList?.message ?? ''));
              case Status.completed:
                return ListView.builder(
                  itemCount: value.moviesList?.data?.movies?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          value.moviesList?.data?.movies?[index].posterurl ??
                              'https://via.placeholder.com/150',
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            return Icon(Icons.error, color: Colors.red);
                          },
                        ),
                        title: Text(
                            value.moviesList?.data?.movies?[index].title ??
                                'No title'),
                        subtitle: Text(
                            value.moviesList?.data?.movies?[index].year ??
                                'No year'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star,
                                color: Colors.amber,
                                size: 20.0,
                                semanticLabel: 'Star'),
                            Text(Utils.avgRating(value.moviesList?.data
                                        ?.movies?[index].ratings ??
                                    [0])
                                .toStringAsFixed(1)),
                          ],
                        ),
                      ),
                    );
                  },
                );
              default:
                return Center(child: Text('No data available'));
            }
          },
        ),
      ),
    ); // Scaffold
  }
}
