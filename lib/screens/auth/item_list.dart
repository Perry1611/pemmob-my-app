import 'package:flutter/material.dart';
import 'package:my_app/service/firestore_service.dart';

class ItemListScreen extends StatefulWidget {
  ItemListScreen({super.key});

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final FirestoreService _firestoreService = FirestoreService();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _pointController = TextEditingController();

  void _showDialog({Item? item}) {
    if(item != null){
      _nameController.text = item.name;
      _pointController.text = item.point.toString();
    } else {
      _nameController.clear();
      _pointController.clear();
    }

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(item == null ? 'Tambah Data' : 'Edit Data'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama Item'
                ),
              ),
              TextField(
                controller: _pointController,
                decoration: InputDecoration(
                    labelText: 'Poin Item'
                ),
              )
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Batal')
            ),
            ElevatedButton(
                onPressed: (){
                  final String name = _nameController.text;
                  final int point = int.tryParse(_pointController.text) ?? 0;

                  if (name.isNotEmpty){
                    if (item == null){
                      _firestoreService.addItem(name, point);
                    } else {
                      _firestoreService.updateItem(item.id, name, point);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text('Simpan'),
            )
          ],
        )
    );
  }

  void _showDeleteConfirmation(String id, String name){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Hapus Item?'),
          content: Text("Apakah anda yakin ingin menghapus $name?, data tidak dapat dikembalikan"),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Batal')
            ),
            ElevatedButton(
                onPressed: () {
                  _firestoreService.deleteItem(id);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Hapus', style: TextStyle(color: Colors.white),),
            )
          ],
        )
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _pointController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Item'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add, color: Colors.white,),
      ),

      body: StreamBuilder<List<Item>>(
          stream: _firestoreService.getItems(),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Terjadi kesalahan: ${snapshot.error}'),
              );
            }

            final List<Item> items = snapshot.data ?? [];
            if (items.isEmpty){
              return Center(
                child: Text('Tidak ada item yang dapat ditampilkan'),
              );
            }

            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index){
                final Item item = items[index];

                return Card(
                  child: ListTile(
                    title: Text(
                        item.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      item.id,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${item.point} Poin',
                          style: TextStyle(
                              color: Colors.green[700],
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        IconButton(
                          onPressed: () => _showDeleteConfirmation(item.id, item.name),
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                    onTap: () => _showDialog(item: item),
                  ),
                );
              },
            );
          },
      )
    );
  }
}
