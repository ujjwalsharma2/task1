import 'package:chat/pages/edit_user_page.dart';
import 'package:chat/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProvider>(context, listen: false).getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users and Company"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  Provider.of<UserProvider>(context, listen: false).getUsers();
                });
              },
              icon: const Icon(
                Icons.replay,
                size: 28,
              )),
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (context, value, child) {
          final users = value.users;
          return ListView.builder(
            itemCount: value.users.length,
            // itemCount: users.length > 5 ? 5 : users.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        offset: const Offset(10, 0),
                        blurRadius: 6,
                        color: Colors.grey.shade100,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(users[index].name),
                      Text(users[index].email),
                      Text(users[index].phone),
                      Text(users[index].companyName),
                      Text(users[index].catchPhrase),
                      Text(users[index].bs),
                      Text(users[index].latitude),
                      Text(users[index].longitude),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditUserPage(
                                          id: index,
                                        )));
                          },
                          icon: const Icon(Icons.edit),
                          label: const Text("edit"),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      // body: ListView.builder(
      //   itemCount: users.length,
      //   // itemCount: users.length > 5 ? 5 : users.length,
      //   itemBuilder: (context, index) {
      //     return Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(20),
      //           boxShadow: [
      //             BoxShadow(
      //               spreadRadius: 5,
      //               offset: const Offset(6, 0),
      //               blurRadius: 6,
      //               color: Colors.grey.shade200,
      //             ),
      //           ],
      //         ),
      //         padding: const EdgeInsets.all(10.0),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(users[index].name),
      //             Text(users[index].email),
      //             Text(users[index].phone),
      //             Text(users[index].companyName),
      //             Text(users[index].catchPhrase),
      //             Text(users[index].bs),
      //             Text(users[index].latitude),
      //             Text(users[index].longitude),
      //             Align(
      //               alignment: Alignment.center,
      //               child: ElevatedButton.icon(
      //                 onPressed: () {
      //                   Navigator.push(
      //                       context,
      //                       MaterialPageRoute(
      //                           builder: (context) => EditUserPage(
      //                                 user: users[index],
      //                               )));
      //                 },
      //                 icon: const Icon(Icons.edit),
      //                 label: const Text("edit"),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
