import 'package:flutter/material.dart';
import 'package:flutter_fetch_moviewdb/movie_module/models/movie_model.dart';
import 'package:flutter_fetch_moviewdb/movie_module/services/movie_service.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Screen'),
      ),
      body: _buildBody(),
    );
  }

Widget _buildBody() {
  return Center(
    child: FutureBuilder<MovieModel>(
      future: MovieService.getAPI(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error Movie Reading: ${snapshot.error.toString()}");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return _buildListView(snapshot.data);
        } else {
          return CircularProgressIndicator(); // Added return statement here
        }
      },
    ),
  );
}

  Widget _buildListView(MovieModel? movieModel) {
    if (movieModel == null) {
      return SizedBox();
    }

    return ListView.builder(
        itemCount: movieModel.results.length,
        itemBuilder: (context, index) {
          return _buildItem(movieModel.results[index]);
        });
  }

  Widget _buildItem(Result item) {
    return Card(
      child: ListTile(
        title: Text("${item.title}"),
        subtitle: Text("${item.name}"),
      ),
    );
  }
}
