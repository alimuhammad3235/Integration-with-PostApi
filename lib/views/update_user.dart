import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:postapi/services/user_services.dart';
import 'package:postapi/views/home_view.dart';

class UpdateUser extends StatelessWidget {
  int idd;
  String name,email,username;
  UpdateUser({super.key, required this.idd,required this.name,required this.email,required this.username});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update User"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: name,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: email,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: userNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: username,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await updateuser({
                  "name": nameController.text,
                  "email": emailController.text,
                  "username": userNameController.text,
                }, idd);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeView()));
              },
              child: Text("Update User"))
        ],
      ),
    );
  }
}
