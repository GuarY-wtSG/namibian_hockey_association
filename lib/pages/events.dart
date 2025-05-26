import 'package:flutter/material.dart';
import 'package:nho_app/pages/models/event.dart';
import 'package:nho_app/pages/models/upcoming_list.dart';
import 'package:provider/provider.dart';

import 'widgets/event_tile.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  // add event to upcoming list
  void addEventToUpcoming(Event event) {
    Provider.of<UpcomingList>(context, listen: false).addEventToUpcoming(event);

    // alert user of update
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Successfully added'),
            content: Text('Check Upcoming events'),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UpcomingList>(
      builder:
          (context, value, child) => Column(
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // get an event from Upcoming_list
                    Event event = value.getEvents()[index];
                    // return that event
                    return EventTile(
                      event: event,
                      onTap: () => addEventToUpcoming(event),
                    );
                  },
                ),
              ),
            ],
          ),
    );
  }
}
