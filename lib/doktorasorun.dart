import 'package:flutter/material.dart';


import 'package:flutter_application_1/utils/database_helper.dart';

void main() {
  runApp(const doktorasorun());
}



class doktorasorun extends StatefulWidget {
  const doktorasorun({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<doktorasorun> {
 
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;
  
  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals(); 
  }

  final TextEditingController _baslikController = TextEditingController();
  final TextEditingController _sorunuzController = TextEditingController();

  
  void _showForm(int? id) async {
    if (id != null) {
     
      final existingJournal =
          _journals.firstWhere((element) => element['id'] == id);
      _baslikController.text = existingJournal['baslik'];
      _sorunuzController.text = existingJournal['sorunuz'];
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
               
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _baslikController,
                    decoration: const InputDecoration(hintText: 'baslik'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _sorunuzController,
                    decoration: const InputDecoration(hintText: 'sorunuz'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      
                      if (id == null) {
                        await _addItem();
                      }

                      if (id != null) {
                        await _updateItem(id);
                      }

                      
                      _baslikController.text = '';
                      _sorunuzController.text = '';

                      
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Yeni Oluştur' : 'Güncelle'),
                  )
                ],
              ),
            ));
  }


  Future<void> _addItem() async {
    await SQLHelper.createItem(
        _baslikController.text, _sorunuzController.text);
    _refreshJournals();
  }

  
  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id, _baslikController.text, _sorunuzController.text);
    _refreshJournals();
  }

  
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Sorunuz Gönderildi !'),
    ));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushNamed(context, '/Menu',arguments: {}),
             ), 
          centerTitle: true,
          title:Text('Doktora Sorun',
            textAlign: TextAlign.center,
            style:TextStyle(
              color: Colors.black45,
              fontWeight:FontWeight.w800,
              fontSize: 30,
            ),
          ),
          backgroundColor:Color.fromARGB(136, 252, 155, 155) ,
        ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _journals.length,
              itemBuilder: (context, index) => Card(
                color: Colors.orange[200],
                margin: const EdgeInsets.all(15),
                child: ListTile(
                    title: Text(_journals[index]['baslik']),
                    subtitle: Text(_journals[index]['sorunuz']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => _showForm(_journals[index]['id']),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () =>
                                _deleteItem(_journals[index]['id']),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }
}