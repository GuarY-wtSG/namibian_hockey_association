import 'package:flutter/material.dart';

class TeamManage extends StatefulWidget {
  const TeamManage({super.key});

  @override
  State<TeamManage> createState() => TeamManageState();
}

class TeamManageState extends State<TeamManage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Goalkeepers',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Icon(Icons.person);
              //return PlayerTile();
            },
          ),
        ),
        Text(
          'Fullbacks',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        Text(
          'Halfbacks',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        Text(
          'Right Wing Forward',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        Text(
          'Left Wing Forward',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        Text(
          'Center Forward',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[950],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/player');
            },
            child: const Text(
              'Player Registration',
              style: TextStyle(color: Color.fromARGB(255, 11, 93, 13)),
            ),
          ),
        ),
      ],
    );
  }
}
