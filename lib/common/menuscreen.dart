import 'package:app_flutter/config/app_menucard.dart';
import 'package:app_flutter/common/app_colors.dart';
import 'package:app_flutter/modules/login/presenter/login.dart';
import 'package:app_flutter/config/home_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Menu',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkGrey),
              ),
              SizedBox(height: 20),
              SizedBox(height: 30),
              OrgsMenuCard(
                text: 'Início',
                icon: Icons.home,
                action: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                ),
              ),
              Divider(),
              OrgsMenuCard(
                text: 'Favoritos',
                icon: Icons.favorite,
                action: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                ),
              ),
              Divider(),
              OrgsMenuCard(
                text: 'Sair',
                icon: Icons.logout,
                action: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
