import 'package:flutter/material.dart';

class DesktopBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // info column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // welcome text + hello emoji hand
                  Row(
                    children: [
                      const Text("Welcome to my portfolio!",
                          style: TextStyle(fontSize: 30)),
                      const SizedBox(width: 5),
                      Image.asset('hello_hand_emoji_web.webp',
                          width: 20, height: 20),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // name text
                  const Text("Costelas", style: TextStyle(fontSize: 35)),
                  const SizedBox(height: 5),
                  const Text("Denis",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 3),
                  Row(
                    children: const [
                      Icon(Icons.arrow_right_rounded, color: Colors.deepPurple),
                      Text("Flutter Developer")
                    ],
                  ),
                  // social links
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    // color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('facebook_blackWeb.webp',
                            width: 35, height: 35),
                        Image.asset('githubWeb.webp', width: 35, height: 35),
                        Image.asset('linkedinWeb.webp', width: 35, height: 35),
                      ],
                    ),
                  ),
                ],
              ),
              // Image with me
              SizedBox(
                width: 200,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'pozaCuMnLow.jpg',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
