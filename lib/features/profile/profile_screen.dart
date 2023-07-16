
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_cupertino/features/auth/auth_screen.dart';


class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key, required this.email, required this.nickname});
  final String email;
  final String nickname;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border(),
        middle: Text('Профиль', style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500
        ),),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 38,),
          const Icon(CupertinoIcons.profile_circled, color: Colors.black, size: 64,),
          const SizedBox(height: 15,),
          Text(
            widget.nickname,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 12,),
          Text(
            widget.email,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF929292)
            ),
          ),
          const SizedBox(height: 27,),
          CupertinoButton(
            color: Colors.white,
              child: Row(
                children: const [
                  Text(
                    "Выйти",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffEC3A4D)
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AuthScreen()));
              }
          )

        ],
      ),
    );
  }
}