import 'package:flutter/material.dart';
import 'package:nho_app/pages/models/event.dart';
import 'package:nho_app/pages/models/upcoming_list.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UpcomingItem extends StatefulWidget {
  Event event;
  UpcomingItem({super.key, required this.event});

  @override
  State<UpcomingItem> createState() => _UpcomingItemState();
}

class _UpcomingItemState extends State<UpcomingItem> {
  // remove event from upcoming events
  void removeEventFromUpcoming() {
    Provider.of<UpcomingList>(
      context,
      listen: false,
    ).removeEventFromUpcoming(widget.event);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.event.imagePath),
        title: Text(widget.event.name),
        subtitle: Text(widget.event.date),
        trailing: IconButton(
          onPressed: removeEventFromUpcoming,
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
