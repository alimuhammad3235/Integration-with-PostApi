import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:postapi/model/user_model.dart';
import 'package:postapi/services/user_services.dart';
import 'package:postapi/views/add_user_view.dart';
import 'package:postapi/views/update_user.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddUser()));
            setState(() {});
          },
          child: Icon(Icons.add),
        ),
        body: FutureBuilder(
          future: getuser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        shape: RoundedRectangleBorder(side: BorderSide(width: 2,color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(10),
                        ),
                          title: Text(snapshot.data.data[index].name),
                          subtitle: Text(snapshot.data.data[index].id.toString()),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UpdateUser(
                                              idd: snapshot.data.data[index].id,
                                              name: snapshot.data.data[index].name,
                                              email: snapshot.data.data[index].email,
                                              username: snapshot.data.data[index].username,
                                    )));
                                  },
                                  child: Icon(Icons.edit)),
                              GestureDetector(
                                  onTap: () async {
                                    await deleteuser(
                                        snapshot.data.data[index].id);
                                    setState(() {});
                                  },
                                  child: Icon(Icons.delete)),
                            ],
                          )),
                    );
                  }));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
