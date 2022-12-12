import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie/model/search.dart';
import 'package:movie/screens/app.dart';

class myapp extends StatefulWidget {
  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  initState() {
    search(name);

    // getpost(movieId);
    super
        .initState(); //  this is the material super constructor for init state to link your instance initState to the global initState context
  }

  String name = 'wakanda';
  Future<Find> search(String name) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=8be08cce18954a0aecc4f2c57f7d992b&language=en-US&query=$name&page=1&include_adult=false');

    var responce = await client.get(uri);
    var json = responce.body;
    if (responce.statusCode == 200) {
      print('api responce $json');
      return findFromJson(json);
    } else {
      return findFromJson(json);
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
                    onPressed: () {},
                    child: const Text(
                      'TRENDING',
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
            leading:
                IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ),
          body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Form(
                    child: TextFormField(
                      onFieldSubmitted: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                  ),
                  FutureBuilder(
                    future: search(name),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data;
                        print('$data');
                        return SizedBox(
                          height: 800,
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: data!.results!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 2.0,
                                    mainAxisSpacing: 2.0),
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                elevation: 4,
                                shadowColor: Colors.red,
                                color: const Color.fromARGB(255, 48, 14, 2),
                                child: SizedBox(
                                  height: 500,
                                  child: ElevatedButton(
                                    onPressed: (() {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => app(
                                                id: data.results![index].id),
                                          ));
                                    }),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        const Color.fromARGB(255, 48, 14, 2),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          child: Image.network(
                                            'https://image.tmdb.org/t/p/w600_and_h900_bestv2${data.results![index].posterPath}',
                                            height: 140,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            data.results![index].originalTitle
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return const Text('No result found');
                      }
                    },
                  ),
                ],
              )),
        ));
  }
}
