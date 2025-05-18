import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _selectedIndex = 0; // Track the selected bottom navigation item

  // Sample hockey events
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
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        leading: Icon(
          Icons.sports_hockey_outlined,
          color: Colors.grey[300], // Light grey icon
        ),
        title: Text(
          "Events",
          style: TextStyle(color: Colors.grey[300]), // Light grey text
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, size: 30),
            color: Colors.grey[300], // Light grey profile icon
            onPressed: () {
              // Handle profile icon press
            },
          ),
        ],
      ),

      // Scrollable List of Events
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
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Team'),
          BottomNavigationBarItem(icon: Icon(Icons.person_4), label: 'Player'),
        ],
        currentIndex: _selectedIndex, // Highlight selected item
        onTap: _onItemTapped, // Handle tap
        selectedItemColor: Colors.green[900], // Highlight color
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
