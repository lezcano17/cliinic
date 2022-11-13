import 'dart:developer';

import 'package:cliinic/pages/common/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../config/routes.dart';
import '../../../models/lista.dart';
import '../../../services/remote_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  Post? personas;
  var isLoaded = false;

  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;
  void _onTapNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _refreshJournals() async {
    /** Load */
    setState(() {
      _isLoading = false;
    });
  }

  void get_personas() async {
    personas = await RemoteService().getPersonas();
    print('xd');
    if (personas != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
    get_personas();
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _showForm(int? id) async {
    if (id != null) {
      log("FUNCA");
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(hintText: 'Title'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Save new journal
                      if (id == null) {
                        await _addItem();
                      }

                      if (id != null) {
                        await _updateItem(id);
                      }

                      // Clear the text fields
                      _titleController.text = '';
                      _descriptionController.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Create New' : 'Update'),
                  )
                ],
              ),
            ));
  }

  // Insert a new journal to the database
  Future<void> _addItem() async {
    /*Create*/
  }

  // Update an existing journal
  Future<void> _updateItem(int id) async {
    /*update*/
  }

  // Delete an item
  void _deleteItem(int id) async {
    /*DELETE*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: personas?.lista.length,
          itemBuilder: (context, index) {
            return Text(personas!.lista[index].nombreCompleto);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add), onPressed: () => _showForm(0)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.cyan,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
          size: 25,
          opacity: 1,
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.blue,
          size: 30,
          opacity: 1,
        ),
        currentIndex: _selectedIndex,
        onTap: (index) => _onTapNavBar(index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note_outlined),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.outbox_rounded),
            label: 'Prueba',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuario',
          ),
        ],
      ),
    );
  }
}
