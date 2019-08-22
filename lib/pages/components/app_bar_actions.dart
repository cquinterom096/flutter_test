import 'package:flutter/material.dart';

class AppBarActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 315,
        top: 68.0
      ),
      child: Row(children: <Widget>[
        SizedBox(
          width: 15,
        ),
        Container(
          height: 30,
          width: 30,
          child: FloatingActionButton(
            heroTag:
                'btn1', // THIS IS IMPORTANT IT GETS CONFUSED IN THE WIDGET TREE
            mini: true,
            shape: RoundedRectangleBorder(),
            backgroundColor: Colors.white,
            hoverElevation: 100.0,
            onPressed: () {
              Navigator.pushNamed(context, '/top_scorers');
            },
            child: SizedBox(
              child: Text('T'),
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Container(
          height: 24,
          width: 24,
          child: FloatingActionButton(
            heroTag: 'btn2',
            mini: true,
            shape: RoundedRectangleBorder(),
            backgroundColor: Colors.white,
            hoverElevation: 100.0,
            onPressed: () {
              Navigator.pushNamed(context, '/fixtures');
            },
            child: SizedBox(
              child: Text('F'),
            ),
          ),
        ),
      ]),
    );
  }
}
