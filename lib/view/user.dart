import 'package:ceramic_shop/helper/sized_box_enum.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../services/utils.dart';
import '../widget/text_widget.dart';

class UserScreen extends StatefulWidget {

  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressController =
      TextEditingController(text: '');

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final utils =Utils(context);
   final setDarkTheme= Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                15.height,
                RichText(
                  text: TextSpan(
                    text: 'Hi,  ',
                    style: const TextStyle(
                      color: Colors.cyan,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'MyName',
                        style: TextStyle(
                          color: utils.color,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('My name is pressed');
                      },
                  ),
                ),
                5.height,
                TextWidget(
                  text: 'Email@gmail.com',
                  color: utils.color,
                  textSize: 18,
                ),
                20.height,
                const Divider(
                  thickness: 2,
                ),
                20.height,
                _listTiles(
                    title: 'Address',
                    subtitle: 'SubTitle here',
                    leading: IconlyLight.profile,
                    onPressed: () async {
                      await _showAddressDialog();
                    },
                    color: utils.color),
                _listTiles(
                    title: 'Orders',
                    leading: IconlyLight.bag,
                    onPressed: () {},
                    color: utils.color),
                _listTiles(
                    title: 'Wishlist',
                    leading: IconlyLight.heart,
                    onPressed: () {},
                    color: utils.color),
                _listTiles(
                    title: 'Viewed',
                    leading: IconlyLight.show,
                    onPressed: () {},
                    color: utils.color),
                _listTiles(
                    title: 'Forget password',
                    leading: IconlyLight.unlock,
                    onPressed: () {},
                    color: utils.color),
                SwitchListTile(
                    title: TextWidget(
                      text:  utils.getTheme ? 'Dark model' : 'Light model',
                      color: utils.color,
                      textSize: 18,
                    ),
                    secondary: Icon(utils.getTheme
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined),
                    onChanged: (bool value) {
                      setState(() {
                        setDarkTheme.setDarkTheme = value;
                      });
                    },
                    value: utils.getTheme),
                _listTiles(
                    title: 'Logout',
                    leading: IconlyLight.logout,
                    onPressed: () {
                      _showSignOutDialog();
                    },
                    color: utils.color),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showAddressDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Update'),
              content: TextField(
                onChanged: (value) {
                  print('_addressController.text ${_addressController.text}');
                  _addressController.text = value;
                },
                controller: _addressController,
                maxLines: 5,
                decoration: const InputDecoration(hintText: 'Your Address'),
              ),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Update'),
                )
              ],
            ));
  }

  Future<void> _showSignOutDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Row(
                children: [
                  Container(
                      child: Image.asset(
                    'assets/images/warning-sign.png',
                    height: 20,
                    width: 20,
                    fit: BoxFit.fill,
                  )),
                  8.width,
                  Text('Sign Out'),
                ],
              ),
              content: Text('Sign out'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.canPop(context)?
                    Navigator.pop(context):null;
                  },
                  child: TextWidget(
                    text: 'Cancel',
                    color: Colors.cyan,
                    textSize: 18,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: TextWidget(
                    text: 'OK',
                    color: Colors.red,
                    textSize: 18,
                  ),
                )
              ],
            ));
  }

  Widget _listTiles({
    required String title,
    String? subtitle,
    required Function onPressed,
    required IconData leading,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(
        color: color,
        text: title,
        textSize: 22,
        isTitle: true,
      ),
      subtitle: TextWidget(
        color: color,
        text: subtitle ?? '',
        textSize: 16,
      ),
      leading: Icon(leading),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
