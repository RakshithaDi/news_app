import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/common/widgets/common_alert_boxes.dart';
import 'package:news_app/features/authentication/providers/sign_in_provider.dart';
import 'package:news_app/features/home/providers/hot_updates_provider.dart';
import 'package:news_app/features/home/widgets/custom_save_button.dart';
import 'package:news_app/features/home/widgets/profile_item_tile.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<SigninProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Align(
                child: CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.person_2_sharp,
                    size: 60,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ProfileItemTile(
                titie: "User Name",
                subtitle: profileProvider.loggedInUser.name ?? "N/A",
              ),
              ProfileItemTile(
                titie: "Email",
                subtitle: profileProvider.loggedInUser.email ?? "N/A",
              ),
              ProfileItemTile(
                titie: "Password",
                subtitle: "*************",
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: CustomSaveButton(
                  buttonTitle: "Signout",
                  onPressed: () {
                    Alerts.showConfirmationAlert(context,
                        content:
                            "Are you sure you want to sign out from the application?",
                        onPressed: () {
                      profileProvider.signOut(context);
                    }, title: "Sign Out?");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
