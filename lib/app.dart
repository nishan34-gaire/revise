import 'package:flutter/material.dart';
import 'nishan.dart';
import 'service.dart';
import 'model.dart';
import 'package:http/http.dart' as http;

class app extends StatefulWidget {
  
  const app({super.key});

  @override
  State<app> createState() => _appState();
}

data() async {
  nis = await service().getpost();
}

Nishan nis = Nishan();

 Future<Nishan>getpost() async{
    var client =http.Client();
    var uri =Uri.parse('https://api.themoviedb.org/3/movie/550?api_key=8be08cce18954a0aecc4f2c57f7d992b');
    var responce=await client.get(uri);
     var json=responce.body;
    if(responce.statusCode==200){
     
      return nishanFromJson(json);
    }else {
    return nishanFromJson(json);
    }
  }

class _appState extends State<app> {
  @override
  initState() {
    data();
    
        getpost(); 
    super
        .initState(); //  this is the material super constructor for init state to link your instance initState to the global initState context
  }

  bool typing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          'WorldFree4u',
          style: TextStyle(
              color: Colors.orange, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'HOME',
                  style: TextStyle(
                      fontSize: 6,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 2,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'TRENDING',
                  style: TextStyle(
                      fontSize: 6,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 2,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'BROWSE',
                  style: TextStyle(
                      fontSize: 6,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 2,
              ),

              // TextField(
              //   decoration: InputDecoration(
              //     counter: Container(
              //       width: 10,
              //       height: 10,
              //       color: Colors.red,
              //     ),
              //     icon: Icon(
              //       Icons.search,
              //       color: Colors.white,
              //     ),
              //     hintText: 'Search for movies or tv show',
              //     hintStyle: TextStyle(
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
            ],
          )
        ],
        leading: IconButton(
            icon: Icon(typing ? Icons.done : Icons.search), onPressed: () {}),
      ),
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
            future: getpost(),
            builder: (context, snapshot) {
              
             
              if (snapshot.hasData) {
                var nis = snapshot.data;
                 
                if (nis != null) {
                  print( 'check ${nis.adult.toString()}');
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

                return  Column(
                  children: [
                    Container( child: Text(nis.originalTitle.toString(),
                                      style: TextStyle(color: Colors.amber)),),
                                      
                  ],
                ) ; 
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
