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
      // print('api responce $json');
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
                //  shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              icon: Icon(Icons.search),
                              hintText: 'Search Here',
                              hintStyle: TextStyle(
                                color: Colors.black,
                              )),
                          onFieldSubmitted: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: search(name),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data;
                        print('$data');
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height - 210,
                              child: GridView.builder(
                                // shrinkWrap: true,
                                // physics: const NeverScrollableScrollPhysics(),
                                itemCount: data!.results!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 200,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    child: Card(
                                      elevation: 4,
                                      shadowColor: Colors.red,
                                      color:
                                          const Color.fromARGB(255, 48, 14, 2),
                                      child: SizedBox(
                                        height: 100,
                                        child: ElevatedButton(
                                          onPressed: (() {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => app(
                                                      id: data
                                                          .results![index].id),
                                                ));
                                          }),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  255, 48, 14, 2),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 140,
                                                child: data.results![index]
                                                            .posterPath !=
                                                        null
                                                    ? Image.network(
                                                        'https://image.tmdb.org/t/p/w600_and_h900_bestv2${data.results![index].posterPath}',
                                                        height: 140,
                                                      )
                                                    : Image.network(
                                                        fit: BoxFit.fitHeight,
                                                        'https://th.bing.com/th/id/OIP.AC9frN1qFnn-I2JCycN8fwHaEK?w=321&h=180&c=7&r=0&o=5&pid=1.7'),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  data.results![index]
                                                      .originalTitle
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        return const Center(
                          child: SizedBox(
                              height: 200,
                              width: 200,
                              child: CircularProgressIndicator(
                                  color: Color.fromARGB(255, 247, 19, 3))),
                        );
                      }
                    },
                  ),
                ],
              )),
        ));
  }
}
