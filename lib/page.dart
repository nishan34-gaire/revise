import 'package:flutter/material.dart';
import 'package:movie/app.dart';

class myapp extends StatefulWidget {
  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
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
            child: Container(
              child: GridView.builder(
                itemCount: 50,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 4,
                    shadowColor: Colors.red,
                    color: const Color.fromARGB(255, 48, 14, 2),
                    child: ElevatedButton(
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => app(id: index + 550),
                            ));
                      }),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 48, 14, 2),
                        ),
                      ),
                      child: Image.network(
                          'https://i0.wp.com/dailyresearchplot.com/wp-content/uploads/2022/08/Kung-Fu-Panda-4.jpg?fit=1920%2C1080&ssl=1'),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
