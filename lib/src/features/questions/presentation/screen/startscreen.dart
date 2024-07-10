import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Startscreen extends StatelessWidget {
  const Startscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
             Center(
               child: SizedBox(
                 height: 8000000,
                 child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/onBoarding1.png'),
                  )),),
               ),
               
             ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Center(
                  child: Text('Challenge yourself with our interactive quizzes and discover how much you know about various topics.',
                   style: TextStyle(fontSize: 15),
                  ),
                ),
                const SizedBox(height: 50,),
                const Text(
                  'Username',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.blue,
                        width: 2,
                      )),
                  child: const TextField(
                    decoration:
                        InputDecoration(label: Text('Enter your usename'),
                        border: InputBorder.none
                        ),
                  ),
                ),
                const SizedBox(
                  height: 100
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: const Text(
                      'Get Start',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
