import 'package:flutter/material.dart';

import 'event.dart';

class UpcomingList extends ChangeNotifier {
  // list of events to join
  List<Event> events = [
    Event(
      name: 'Winter Hockey Championship',
      location: 'Windhoek Stadium',
      date: 'May 20,2025|15:30',
      gender: 'Men',
      league: 'Prem',
      imagePath: 'lib/images/men.jpeg',
    ),
    Event(
      name: "National Women's League Final",
      location: 'Coastal Area',
      date: 'May 25, 2025|15:30',
      gender: 'Woman',
      league: 'Div 1',
      imagePath: 'lib/images/women.webp',
    ),
    Event(
      name: 'Trans Hockey Invitational',
      location: 'Central Sports Complex',
      date: 'June 2,2025|15:30',
      gender: 'Trans',
      league: 'Prem',
      imagePath: 'lib/images/trans.webp',
    ),
    Event(
      name: 'Premier League Semifinals',
      location: 'Namibian Hockey Center',
      date: "June 2, 2025|14:00",
      gender: 'Men',
      league: 'Prem',
      imagePath: 'lib/images/men.jpeg',
    ),
    Event(
      name: 'Junior U/17 Cup Finals',
      location: 'Capital Hockey Grounds',
      date: 'June 15,2025|16:00',
      gender: 'Men',
      league: 'U/17',
      imagePath: 'lib/images/boys.jpg',
    ),
    Event(
      name: 'U/15 Regional Playoffs',
      location: 'Namibian National Hockey Arena',
      date: 'July 1,2025|10:00',
      gender: 'Women',
      league: 'U/15',
      imagePath: 'lib/images/girls.jpg',
    ),
  ];
  // list of events in upcoming for user
  List<Event> userUpcoming = [];

  // get list of events to join
  List<Event> getEvents() {
    return events;
  }

  // get upcoming
  List<Event> getUpcoming() {
    return userUpcoming;
  }

  // add event to upcoming
  void addEventToUpcoming(Event event) {
    userUpcoming.add(event);
    notifyListeners();
  }

  // remove item from cart
  void removeEventFromUpcoming(Event event) {
    userUpcoming.remove(event);
    notifyListeners();
  }
}
