import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/equipements_viewmodel.dart';
import 'package:coworking_space_mobile/core/models/equipement_model.dart';
import 'package:coworking_space_mobile/core/layout/dash_layout.dart';

class EquipementsScreen extends StatelessWidget {
  final EquipementViewModel viewModel = EquipementViewModel();
  final TextEditingController nameController = TextEditingController();

  EquipementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashLayout(
      body: Scaffold(
        body: StreamBuilder<List<Equipement>>(
          stream: viewModel.equipementsStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading data'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No equipements available'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final equipement = snapshot.data![index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(equipement.name),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              nameController.text = equipement.name;
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Edit Equipement'),
                                    content: TextField(
                                      controller: nameController,
                                      decoration: const InputDecoration(
                                        hintText: 'Equipement Name',
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          nameController.clear();
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          viewModel.updateEquipement(
                                            equipement.id,
                                            nameController.text,
                                          );
                                          nameController.clear();
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Save'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Confirm Delete'),
                                    content: const Text(
                                        'Are you sure you want to delete this equipement?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          viewModel.deleteEquipement(equipement.id);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add Equipement'),
                  content: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Equipement Name',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        nameController.clear();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        await viewModel.addEquipement(nameController.text);
                        nameController.clear();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
