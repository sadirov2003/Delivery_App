import 'package:flutter/material.dart';
import 'package:flutter_lavash/src/widgets/custom_list_tile_profile.dart';
import 'package:flutter_lavash/src/widgets/small_button_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool turnOfNotification = false;
  bool turnOfLocation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3,
                            offset: Offset(0, 4),
                            color: Colors.black38,
                          ),
                        ],
                        image: const DecorationImage(
                          image: AssetImage('assets/images/шаурма.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Истам Садиров',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '+79505472004',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        SmallButtonProfile(btnText: 'Edit'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'Аккаунт',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        CustomListTileProfile(
                            icon: Icons.location_on, text: 'Location'),
                        const Divider(color: Colors.grey, thickness: 1),
                        CustomListTileProfile(
                            icon: Icons.visibility, text: 'Change Password'),
                        const Divider(color: Colors.grey, thickness: 1),
                        CustomListTileProfile(
                            icon: Icons.shopping_cart, text: 'Shopping'),
                        const Divider(color: Colors.grey, thickness: 1),
                        CustomListTileProfile(
                            icon: Icons.payment, text: 'Payment'),
                        const Divider(color: Colors.grey, thickness: 1),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Notification',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('App Notification'),
                            Switch(
                              value: turnOfNotification,
                              onChanged: (bool newValue) {
                                setState(() {
                                  turnOfNotification = newValue;
                                });
                              },
                            )
                          ],
                        ),
                        const Divider(
                          height: 15,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Location Tracking'),
                            Switch(
                              value: turnOfLocation,
                              onChanged: (bool newValue) {
                                setState(() {
                                  turnOfLocation = newValue;
                                });
                              },
                            )
                          ],
                        ),
                        const Divider(
                          height: 15,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Other',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Language',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Divider(
                              height: 30,
                              color: Colors.grey,
                            ),
                            Text(
                              'Currency',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Divider(
                              height: 30,
                              color: Colors.grey,
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
