import 'package:flutter/material.dart';
import 'package:nho_app/pages/models/event.dart';

import 'widgets/event_tile.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // search bar thats probably not gonna have a function
        // but it's gonna be used to find specific events
        Container(
          padding: EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Search', style: TextStyle(color: Colors.grey)),
              Icon(Icons.search, color: Colors.grey),
            ],
          ),
        ),

        // Adding this text just know i keep trak of where things are placed
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            '-"scorring a penalty corner is 1% skill and 99% not thinking about missing"',
            style: TextStyle(color: Colors.grey[900]),
          ),
        ),

        // main content of the page
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Events 🏑',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              Text(
                'See all',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        Expanded(
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              // create an event
              Event event = Event(
                name: 'Winter Hockey Championship',
                location: 'Windhoek Stadium',
                date: 'May 20,2025|15:30',
                gender: 'Men',
                league: 'Prem',
                imagePath: 'lib/images/men.jpeg',
              );
              return EventTile(event: event);
            },
          ),
        ),
      ],
    );
  }
}
