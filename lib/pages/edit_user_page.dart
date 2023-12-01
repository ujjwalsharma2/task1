import 'package:chat/models/user.dart';
import 'package:chat/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({super.key, required this.id});

  final int id;

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  final UserService _service = UserService();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController catchPhraseController = TextEditingController();
  TextEditingController bsController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();

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
        title: const Text("User editor"),
      ),
      body: Consumer<UserProvider>(
        builder: (context, value, child) {
          final user = value.users[widget.id];
          initializecontrollerText(user);
          return ListView(
            //list
            children: [
              _textField(nameController, "name"),
              _textField(emailController, "email"),
              _textField(phoneController, "phone number"),
              _textField(companyNameController, "company name"),
              _textField(catchPhraseController, "catch phrase"),
              _textField(bsController, "aim"),
              _textField(latitudeController, "latitude"),
              _textField(longitudeController, "longitude"),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  child: const Text("Post changes"),
                  onPressed: () {
                    Fluttertoast.showToast(msg: "This does nothing");
                    // User newUserData = User(
                    //     id: user.id,
                    //     name: nameController.text,
                    //     email: emailController.text,
                    //     phone: phoneController.text,
                    //     bs: bsController.text,
                    //     website: user.website,
                    //     catchPhrase: catchPhraseController.text,
                    //     companyName: companyNameController.text,
                    //     latitude: latitudeController.text,
                    //     longitude: longitudeController.text);
                    // if (newUserData != user) {
                    //   Provider.of<UserProvider>(context, listen: false)
                    //       .updateUserData(newUserData);
                    //   Navigator.pop(context);
                    // }
                    // _service.postUser(newData);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Padding _textField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(label),
        ),
      ),
    );
  }

  void initializecontrollerText(User user) {
    nameController.text = user.name;
    emailController.text = user.email;
    phoneController.text = user.phone;
    companyNameController.text = user.companyName;
    catchPhraseController.text = user.catchPhrase;
    bsController.text = user.bs;
    latitudeController.text = user.latitude;
    longitudeController.text = user.longitude;
  }
}
