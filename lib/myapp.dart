import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
 
  var output = "";
  List<dynamic> lst = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.pink[500],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                   Icon(FontAwesomeIcons.stream),
               SizedBox(
                    height: 10,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 60, bottom: 30),
                    child: Text(
                      "TodoApp",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: lst.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.pink[500],
                          ),
                          height: 50,
                          margin: const EdgeInsets.only(top: 15),
                          child: ListTile(
                            title: Text("${lst[index]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            trailing: Row(
                             children: [
                              GestureDetector(
                                  onTap: () {
                                    
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text("Edit Item"),
                                            content: TextField(
                                              decoration: const InputDecoration(
                                                  labelText:
                                                      'Enter Your Item',
                                                  labelStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black))),
                                              onChanged: (value) {
                                                output = value;
                                              },
                                            ),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop();
                                                  },
                                                  child: const Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                          primary: Colors
                                                              .pink[500])),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      lst.replaceRange(index, index+1, {output});
                                                    });
                                                    Navigator.of(context)
                                                        .pop();
                                                  },
                                                  child: const Text("Edit",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      )),
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                          primary: Colors
                                                              .pink[500]))
                                            ],
                                          );
                                        });
                                  },
                                  
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ),
                                ),
                                
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      lst.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[500],
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Add Item"),
                  content: TextField(
                    decoration: const InputDecoration(
                        labelText: 'Enter your item',
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.pink[500])),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            lst.add(output);
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("Add",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        style:
                            ElevatedButton.styleFrom(primary: Colors.pink[500]))
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
