import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie/model/latest.dart';
import 'package:movie/screens/favourite.dart';
import 'package:movie/screens/trending.dart';

class myapp extends StatefulWidget {
  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Latest les = Latest();
  Future<Latest> lates() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/latest?api_key=8be08cce18954a0aecc4f2c57f7d992b&language=en-US');

    var responce = await client.get(uri);
    var json = responce.body;
    if (responce.statusCode == 200) {
      print('api responce $json');
      return latestFromJson(json);
    } else {
      return latestFromJson(json);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 48, 14, 2),
          appBar: AppBar(
            backgroundColor: Colors.black54,
            title: const Text(
              'WorldFree4u',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'HOME',
                      style: TextStyle(
                          fontSize: 6,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => wish(),
                          ));
                    },
                    child: const Text(
                      'Wishlist',
                      style: TextStyle(
                          fontSize: 6,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'BROWSE',
                      style: TextStyle(
                          fontSize: 6,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                ],
              )
            ],
            leading: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => first(),
                      ));
                }),
          ),
          body: Column(
            children: [
              FutureBuilder<Latest>(
                // future:lates(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var les = snapshot.data;

                    if (les != null) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: const Color(0xff7c94b6),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w600_and_h900_bestv2${les.backdropPath}'),
                                  fit: BoxFit.fill,
                                ),
                                border:
                                    Border.all(width: 3, color: Colors.orange),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      height: 150,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 3, color: Colors.orange),
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://image.tmdb.org/t/p/w600_and_h900_bestv2${les.posterPath}"),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                              child: Text(
                            les.title.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                          Center(
                              child: Text(
                            les.releaseDate.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'rating: ${les.voteAverage.toString()}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Container(
                                height: 40,
                                width: 2,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  border:
                                      Border.all(width: 3, color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Text(
                                      'Play Trailer',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.brown[900],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  les.releaseDate.toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 40,
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return const VerticalDivider(
                                        color: Colors.white,
                                      );
                                    },
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: les.genres?.length ?? 1,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          les.genres?[index].name.toString() ??
                                              'no genere found',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.brown[400],
                            ),
                            height: 50,
                            child: Text(
                              '${les.tagline}',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              style: const TextStyle(
                                fontSize: 10,
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Overeview',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            les.overview.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      );
                    }
                  }

                  return const CircularProgressIndicator();
                },
              )
            ],
          ),
        ));
  }
}
