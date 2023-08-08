import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 63, 110),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Container(
          height: 750,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 20.0, // soften the shadow
                spreadRadius: 5.0, //extend the shadow
              )
            ],
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 28.0,bottom: 28),
                child: Center(
                  child: Text(
                    'Settings',
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
                    contentPadding: const EdgeInsets.all(2),
                    title: const Text('data'),
                    trailing: const Icon(Icons.panorama_horizontal_sharp),
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    color: Color.fromARGB(255, 8, 63, 110),
                    indent: 5,
                    endIndent: 5,
                    thickness: 2,
                  ),
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
