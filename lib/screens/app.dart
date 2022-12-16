import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie/model/model.dart';
import 'package:movie/screens/page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/service.dart';

class app extends StatefulWidget {
  final int id;
  const app({super.key, required this.id});

  @override
  State<app> createState() => _appState();
}

data() async {
  nis = await service().getpost();
}


datagg(String id) async {
  List<String> strList = [];
  strList.add(id);
  print(id);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList("productList", strList);

}

//  const stringSharedPreference = "string shared preferences";

//   Future<List<int>> getList() async {
//   final prefs = await SharedPreferences.getInstance();
//  return prefs.getStringList(stringSharedPreference) ?? [];
// }
//  Future setList( {required String id, required String token}) async {
//   final prefs = await SharedPreferences.getInstance();

//   prefs.setStringList(stringSharedPreference, [id, token]);
// }

// const intSharedPreference = "integer shared preferences";

int movieId = 560;

Nishan nis = Nishan();

Future<Nishan> getpost(int movieId) async {
  var client = http.Client();
  var uri = Uri.parse(
      'https://api.themoviedb.org/3/movie/$movieId?api_key=8be08cce18954a0aecc4f2c57f7d992b');

  var responce = await client.get(uri);
  var json = responce.body;
  if (responce.statusCode == 200) {
    print('api responce $json');
    return nishanFromJson(json);
  } else {
    return nishanFromJson(json);
  }
}

class _appState extends State<app> {
  late String value;

  bool select = false;

  @override
  initState() {
    data();

    // getpost(movieId);
    super
        .initState(); //  this is the material super constructor for init state to link your instance initState to the global initState context
  }

  bool typing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 48, 14, 2),
      // appBar: AppBar(
      //   backgroundColor: Colors.black54,
      //   title: const Text(
      //     'WorldFree4u',
      //     style: TextStyle(
      //         color: Colors.orange, fontSize: 15, fontWeight: FontWeight.bold),
      //   ),
      //   actions: [
      //     Row(
      //       children: [
      //         TextButton(
      //           onPressed: () {},
      //           child: const Text(
      //             'HOME',
      //             style: TextStyle(
      //                 fontSize: 6,
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //         const SizedBox(
      //           width: 2,
      //         ),
      //         TextButton(
      //           onPressed: () {},
      //           child: const Text(
      //             'TRENDING',
      //             style: TextStyle(
      //                 fontSize: 6,
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //         const SizedBox(
      //           width: 2,
      //         ),
      //         TextButton(
      //           onPressed: () {},
      //           child: const Text(
      //             'BROWSE',
      //             style: TextStyle(
      //                 fontSize: 6,
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //         const SizedBox(
      //           width: 2,
      //         ),
      //         IconButton(
      //             onPressed: () {
      //               setState(() {
      //                 select = !select;
      //               });
      //             },
      //             icon: Icon(
      //               Icons.favorite,
      //               color: select ? Colors.red : Colors.white,
      //             ))
      //         // TextField(
      //         //   decoration: InputDecoration(
      //         //     counter: Container(
      //         //       width: 10,
      //         //       height: 10,
      //         //       color: Colors.red,
      //         //     ),
      //         //     icon: Icon(
      //         //       Icons.search,
      //         //       color: Colors.white,
      //         //     ),
      //         //     hintText: 'Search for movies or tv show',
      //         //     hintStyle: TextStyle(
      //         //       color: Colors.white,
      //         //     ),
      //         //   ),
      //         // ),
      //       ],
      //     )
      //   ],
      //   leading: IconButton(
      //       icon: Icon(typing ? Icons.done : Icons.search), onPressed: () {}),
      // ),
      // body: GridView.count(
      //   crossAxisCount: 2,
      //   crossAxisSpacing: 10.0,
      //   mainAxisSpacing: 10.0,
      //   shrinkWrap: true,
      //   children: List.generate(
      //     20,
      //     (index) {
      //       return Padding(
      //         padding: const EdgeInsets.all(10.0),
      //         child: InkWell(
      //           onTap: (){
      //             Navigator.push(context,
      //             MaterialPageRoute(builder: (context) => nishan(),),
      //             );
      //           },
      //           child: Container(
      //             decoration: BoxDecoration(
      //               image: DecorationImage(
      //               image:AssetImage('asset/nishan.jpg'),
      //                 fit: BoxFit.cover,
      //               ),
      //               borderRadius: BorderRadius.all(
      //                 Radius.circular(20.0),
      //               ),
      //             ),
      //           ),
      //         ),
      //       );
      //     },
      //   ),
      // ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => myapp(),
                        ));
                  },
                  icon: const Icon(
                    Icons.exit_to_app,
                    size: 40,
                    color: Colors.red,
                  )),
              const SizedBox(
                width: 250,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      // addto();
                      select = !select;

                      if (select == false) {
                      } else {
                        // Future setInt() async {
                        //   final prefs = await SharedPreferences.getInstance();
                        //   return prefs.setInt('movieId', widget.id);
                        // }

                        // nList.add(widget.id);

                        datagg(widget.id.toString());
                      }
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    size: 40,
                    color: select ? Colors.red : Colors.white,
                  )),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
          // SizedBox(
          //   height: 200,
          //   child: GridView.builder(
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          //     itemCount: nis.genres?.length ?? 10 ,
          //    itemBuilder: (context, index) {
          //     return Padding(
          //           padding: const EdgeInsets.all(10.0),
          //           child: InkWell(
          //             onTap: (){
          //               Navigator.push(context,
          //               MaterialPageRoute(builder: (context) => nishan(),),
          //               );
          //             },
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 // image: DecorationImage(
          //                 // image: NetworkImage('${nis.homepage}${nis.posterPath}'),
          //                 //   fit: BoxFit.cover,
          //                 // ),
          //                 borderRadius: BorderRadius.all(
          //                   Radius.circular(20.0),
          //                 ),
          //               ),
          //               child: Text(nis.genres![index].name.toString(),
          //               style: TextStyle(color: Colors.amber)),
          //             ),
          //           ),
          //         );
          //   },),
          // ),
          FutureBuilder<Nishan>(
            future: getpost(widget.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var nis = snapshot.data;

                if (nis != null) {
                  // print('check ${nis.adult.toString()}');
                  // return  SizedBox(

                  //   height: 300,
                  //   child: GridView.builder(
                  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           crossAxisCount: 2),
                  //       itemCount: nis.genres!.length,
                  //       itemBuilder: (context, index) {
                  //         return Padding(
                  //           padding: const EdgeInsets.all(10.0),
                  //           child: InkWell(
                  //             onTap: () {
                  //               Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                   builder: (context) => nishan(),
                  //                 ),
                  //               );
                  //             },
                  //             child: Container(
                  //               decoration: BoxDecoration(
                  //                 // image: DecorationImage(
                  //                 // image: NetworkImage('${nis.homepage}${nis.posterPath}'),
                  //                 //   fit: BoxFit.cover,
                  //                 // ),
                  //                 borderRadius: BorderRadius.all(
                  //                   Radius.circular(20.0),
                  //                 ),
                  //               ),
                  //               child: Text(nis.genres![index].name.toString(),
                  //                   style: TextStyle(color: Colors.amber)),
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //     ),
                  // );

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
                                  'https://image.tmdb.org/t/p/w600_and_h900_bestv2${nis.backdropPath}'),
                              fit: BoxFit.fill,
                            ),
                            border: Border.all(width: 3, color: Colors.orange),
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
                                            "https://image.tmdb.org/t/p/w600_and_h900_bestv2${nis.posterPath}"),
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
                        nis.title.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Text(
                        nis.releaseDate.toString(),
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
                            'rating: ${nis.voteAverage.toString()}',
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
                              border: Border.all(width: 3, color: Colors.black),
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
                              nis.releaseDate.toString(),
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
                                itemCount: nis.genres?.length ?? 1,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      nis.genres?[index].name.toString() ??
                                          'no genere found',
                                      style:
                                          const TextStyle(color: Colors.white),
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
                          '${nis.tagline}',
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
                        nis.overview.toString(),
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
    );
  }
}
