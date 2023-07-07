import 'package:flutter/material.dart';


class Notes extends StatefulWidget {
  const Notes({Key? key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //debugShowCheckedModeBanner: false,
      //title: 'Not Defteri',
      //theme: ThemeData(
        //primarySwatch: Colors.lightGreen,
      //),
      body: const NoteListPage(title: 'Not Defteri'),
    );
  }
}

class NoteListPage extends StatefulWidget {
  const NoteListPage({Key? key, required this.title});

  final String title;

  @override
  _NoteListPageState createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  List<String> notes = [];
  List<String> filteredNotes = [];

  void _addNote() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddNotePage()),
    );

    if (result != null && result is String) {
      setState(() {
        notes.add(result);
        filteredNotes.add(result);
      });
    }
  }

  void _deleteNoteAtIndex(int index) {
    setState(() {
      notes.removeAt(index);
      filteredNotes.removeAt(index);
    });
  }

  void _editNoteAtIndex(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNotePage(initialNote: notes[index]),
      ),
    );

    if (result != null && result is String) {
      setState(() {
        notes[index] = result;
        filteredNotes[index] = result;
      });
    }
  }

  void _filterNotes(String query) {
    setState(() {
      filteredNotes = notes
          .where((note) => note.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: _filterNotes,
              decoration: const InputDecoration(
                labelText: 'Not Ara',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredNotes.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(filteredNotes[index]),
                  onDismissed: (direction) {
                    _deleteNoteAtIndex(index);
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 16.0),
                  ),
                  child: ListTile(
                    title: Text(filteredNotes[index]),
                    onTap: () {
                      _editNoteAtIndex(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        tooltip: 'Not Ekle',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddNotePage extends StatelessWidget {
  const AddNotePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Ekle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Not',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, textController.text);
              },
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditNotePage extends StatefulWidget {
  final String initialNote;

  const EditNotePage({Key? key, required this.initialNote});

  @override
  _EditNotePageState createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: widget.initialNote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notu Düzenle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Not',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, textController.text);
              },
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}