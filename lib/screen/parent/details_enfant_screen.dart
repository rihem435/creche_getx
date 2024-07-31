import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsEnfantScreen extends StatelessWidget {
  final String? nomEnfant;
  final String? prenomEnfant;
  final String? ageEnfant;
  final String? comportementEnfant;
  const DetailsEnfantScreen(
      {super.key,
      this.nomEnfant,
      this.prenomEnfant,
      this.ageEnfant,
      this.comportementEnfant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          'Details Enfants',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                "assets/images/enfant.jpg",
                width: 250,
              ),
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(
                    10,
                  ),
                  bottomRight: Radius.circular(
                    10,
                  ),
                  topLeft: Radius.circular(
                    10,
                  ),
                  topRight: Radius.circular(
                    10,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.person,
                  ),
                ),
              ),
              title: Text("$nomEnfant$prenomEnfant",
                  style: const TextStyle(fontSize: 20)),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(
                    10,
                  ),
                  bottomRight: Radius.circular(
                    10,
                  ),
                  topLeft: Radius.circular(
                    10,
                  ),
                  topRight: Radius.circular(
                    10,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.description,
                  ),
                ),
              ),
              title: Text("$comportementEnfant",
                  style: const TextStyle(fontSize: 20)),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(
                    10,
                  ),
                  bottomRight: Radius.circular(
                    10,
                  ),
                  topLeft: Radius.circular(
                    10,
                  ),
                  topRight: Radius.circular(
                    10,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.date_range,
                  ),
                ),
              ),
              title: Text("$ageEnfant", style: const TextStyle(fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}
