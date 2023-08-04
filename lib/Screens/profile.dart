import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 133, 179, 232),
      body: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 3, 6, 50),
                  Color.fromARGB(255, 6, 24, 100),
                  Color.fromARGB(255, 10, 16, 150),
                  Color.fromARGB(255, 14, 22, 255),
                ],
                stops: [
                  0.1,
                  0.3,
                  0.6,
                  0.9,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 800,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 120,
                    child: Center(
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 8, 63, 110),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => ListTile(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => ,),);
                        },
                        contentPadding: EdgeInsets.all(2),
                        title: Text('data'),
                        trailing: Icon(Icons.panorama_horizontal_sharp),
                      ),
                      separatorBuilder: (context, index) => const Divider(
                          color: Color.fromARGB(255, 8, 63, 110),
                          indent: 5,
                          endIndent: 5,
                          thickness: 2,),
                      itemCount: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
