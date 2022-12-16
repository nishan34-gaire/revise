import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class wish extends StatefulWidget {
  @override
  State<wish> createState() => _wishState();
}

class _wishState extends State<wish> {
  @override
  initState() {
    searchById(mov);
    datagg();
    // getInt();

    // getpost(movieId);
    super
        .initState(); //  this is the material super constructor for init state to link your instance initState to the global initState context
  }

  // Future<int> getInt() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   mov = prefs.getInt('movieId') ?? 550;
  //   return prefs.getInt('movieId') ?? 550;
  // }

  List<int> intProductList = [550];

  datagg() async {
    List<String> strList = [
      '',
      '',
    ];
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> savedStrList = prefs.getStringList('productList') ?? [];

    intProductList = savedStrList.map((i) => int.parse(i)).toList();
    print("ggg ${intProductList.toString()}");
    
  }

  int mov = 550;

  Future<Nishan> searchById(int mov) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/$mov?api_key=8be08cce18954a0aecc4f2c57f7d992b');

    var responce = await client.get(uri);
    var json = responce.body;
    if (responce.statusCode == 200) {
      print('api responce $json');
      return nishanFromJson(json);
    } else {
      return nishanFromJson(json);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 48, 14, 2),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black54,
            title: const Text(
              'WishList',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              //  shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              children: List<Widget>.generate(intProductList.length, (index) {

                return FutureBuilder(
                  future: searchById(intProductList[index]),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height - 210,
                              child: SizedBox(
                                child: Card(
                                  elevation: 4,
                                  shadowColor: Colors.red,
                                  color: const Color.fromARGB(255, 48, 14, 2),
                                  child: SizedBox(
                                    height: 100,
                                    child: ElevatedButton(
                                      onPressed: (() {}),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          const Color.fromARGB(255, 48, 14, 2),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 140,
                                            child: data!.posterPath != null
                                                ? Image.network(
                                                    'https://image.tmdb.org/t/p/w600_and_h900_bestv2${data.posterPath}',
                                                    height: 140,
                                                  )
                                                : Image.network(
                                                    fit: BoxFit.fitHeight,
                                                    'https://th.bing.com/th/id/OIP.AC9frN1qFnn-I2JCycN8fwHaEK?w=321&h=180&c=7&r=0&o=5&pid=1.7'),
                                          ),
                                          Expanded(
                                            child: Text(
                                              data.originalTitle.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )),
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
                );
              }),
            ),
          ),
        ));
  }
}
