import 'package:flutter/material.dart';

class TeamManage extends StatefulWidget {
  const TeamManage({super.key});

  @override
  State<TeamManage> createState() => TeamManageState();
}

class TeamManageState extends State<TeamManage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Switch up the team'));
  }
}
