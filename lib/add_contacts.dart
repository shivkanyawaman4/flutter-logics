import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'add_contacts.g.dart';

const String contactsBoxName = "contacts";

@HiveType(typeId: 1)
enum Relationship {
  @HiveField(0)
  Family,
  @HiveField(1)
  Friend,
}
const relationships = <Relationship, String>{
  Relationship.Family: "Family",
  Relationship.Friend: "Friend",
};

@HiveType(typeId: 0)
class Contact {
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  @HiveField(2)
  Relationship relationship;
  @HiveField(3)
  String phoneNumber;

  Contact(this.name, this.age, this.phoneNumber, this.relationship);
}

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildDivider() => const SizedBox(height: 5);

    return MaterialApp(
      title: 'Contacts App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contacts App with Hive'),
        ),
        body: ValueListenableBuilder(
          valueListenable: Hive.box<Contact>(contactsBoxName).listenable(),
          builder: (context, Box<Contact> box, _) {
            if (box.values.isEmpty) {
              return const Center(
                child: Text("No contacts"),
              );
            }
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                Contact? c = box.getAt(index);
                String relationship = relationships[c!.relationship] ?? "";
                return InkWell(
                  onLongPress: () {
                    showDialog(
                      builder: (context) => AlertDialog(
                        content: Text(
                          "Do you want to delete ${c.name}?",
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: const Text("No"),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          FlatButton(
                            child: const Text("Yes"),
                            onPressed: () async {
                              Navigator.of(context).pop();
                              await box.deleteAt(index);
                            },
                          ),
                        ],
                      ),
                      context: context,
                      barrierDismissible: true,
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _buildDivider(),
                          Text(c.name),
                          _buildDivider(),
                          Text(c.phoneNumber),
                          _buildDivider(),
                          Text("Age: ${c.age}"),
                          _buildDivider(),
                          Text("Relationship: $relationship"),
                          _buildDivider(),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddContact()),
                );
              },
            );
          },
        ),
        bottomNavigationBar: InkWell(
          onTap: () async {
            final box = Hive.box<Contact>(contactsBoxName);

            final Map<dynamic, Contact> deliveriesMap = box.toMap();
            dynamic desiredKey;
            deliveriesMap.forEach((key, value) {
              if (value.name == "name") {
                desiredKey = key;
              } else {
                desiredKey = null;
              }
            });
            if (desiredKey != null) {
              box.putAt(desiredKey,
                  Contact("rishi", 3, "gjhfzrusf", Relationship.Family));
            }
            print(desiredKey.toString());
            // box.delete(desiredKey);
          },
          child: BottomAppBar(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: 50,
              width: 50,
              color: Colors.amber,
              child: const Text("Update "),
            ),
          ),
        ),
      ),
    );
  }
}

class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  String name = "";
  int age = 0;
  String phoneNumber = "";
  Relationship relationship = Relationship.Friend;

  void onFormSubmit() {
    Box<Contact> contactsBox = Hive.box<Contact>(contactsBoxName);
    contactsBox.add(Contact(name, age, phoneNumber, relationship));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            TextField(
              // initialValue: "",
              decoration: const InputDecoration(
                labelText: "Name",
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            TextField(
              
              keyboardType: TextInputType.number,
              // initialValue: "",
              maxLength: 3,
              decoration: const InputDecoration(
                labelText: "Age",
              ),
              onChanged: (value) {
                setState(() {
                  age = int.parse(value);
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.phone,
              // initialValue: "",
              decoration: const InputDecoration(
                labelText: "Phone",
              ),
              onChanged: (value) {
                setState(() {
                  phoneNumber = value;
                });
              },
            ),
            DropdownButtonFormField(
              items: relationships.keys.map((Relationship value) {
                return DropdownMenuItem<Relationship>(
                  value: value,
                  child: Text(relationships[value] ?? ""),
                );
              }).toList(),
              value: relationship,
              hint: const Text("Relationship"),
              onChanged: (value) {
                setState(() {
                  relationship = value as Relationship;
                });
              },
            ),
            OutlineButton(
              child: const Text("Submit"),
              onPressed: () {
                onFormSubmit();
              },
            ),
          ],
        ),
      ),
    );
  }
}
