import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {

  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
      ],
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 0.0),
              alignment: Alignment.topCenter,
              child: Image.asset('assets/dimsum_log in.png',
                width: 230, height: 230,),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: const Text(
                "WELCOME",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
              child: const Text(
                "Nice to See You in Our App",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 0.0),
              child: TextField(
                keyboardType: TextInputType.text,
                autocorrect: true,
                onChanged: (value) {
                  controller.name.value = value;
                },
                decoration: const InputDecoration(
                  labelText: "NAME",
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 0.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: true,
                onChanged: (value) {
                  controller.email.value = value;
                },
                decoration: const InputDecoration(
                  labelText: "EMAIL",
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),


            Container(
              margin: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
              child: InkWell(
                onTap: () {
                  controller.kliklogin();
                },
                child: SizedBox(
                  height: 60.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    shadowColor: Colors.blue[800],
                    color: Colors.blue,
                    elevation: 7.0,
                    child: const Center(
                      child: Text(
                        'Enter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
