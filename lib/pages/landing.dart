import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _selectedIndex = 0; // Default to Events tab

  final List<Map<String, String>> events = [
    {
      'name': 'Winter Hockey Championship',
      'location': 'Windhoek Stadium',
      'dateTime': 'May 20, 2025 | 18:00',
      'category': 'Men',
      'league': 'Prem',
    },
    {
      'name': 'National Women\'s League Final',
      'location': 'Coastal Arena',
      'dateTime': 'May 25, 2025 | 15:30',
      'category': 'Women',
      'league': 'Div 1',
    },
    {
      'name': 'Trans Hockey Invitational',
      'location': 'Central Sports Complex',
      'dateTime': 'June 2, 2025 | 14:00',
      'category': 'Trans',
      'league': 'Div 2',
    },
    {
      'name': 'Prem League Semifinals',
      'location': 'Namibia Hockey Center',
      'dateTime': 'June 10, 2025 | 19:00',
      'category': 'Men',
      'league': 'Prem',
    },
    {
      'name': 'Junior U/17 Cup Finals',
      'location': 'Capital Hockey Grounds',
      'dateTime': 'June 15, 2025 | 16:00',
      'category': 'Men',
      'league': 'U/17',
    },
    {
      'name': 'U/15 Regional Playoffs',
      'location': 'Namibia National Hockey Arena',
      'dateTime': 'June 22, 2025 | 14:00',
      'category': 'Women',
      'league': 'U/15',
    },
  ];

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/events'); // Navigate to Events Page
        break;
      case 1:
        Navigator.pushNamed(
          context,
          '/player',
        ); // Navigate to Player Registration Page
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        leading: Icon(Icons.sports_hockey_outlined, color: Colors.grey[300]),
        title: Text("Events", style: TextStyle(color: Colors.grey[300])),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, size: 30),
            color: Colors.grey[300],
            onPressed: () {
              // Handle profile icon press
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green[900],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event['name']!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[300],
                      ),
                    ),
                    Text(
                      event['location']!,
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    Text(
                      event['dateTime']!,
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        event['category']!,
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        event['league']!,
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.person_4), label: 'Player'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green[900],
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
