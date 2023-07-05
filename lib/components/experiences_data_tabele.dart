import 'package:flutter/material.dart';
import 'package:flutter_app/providers/experiences.dart';
import 'package:provider/provider.dart';

class ExperiencesDataTabele extends StatefulWidget {
  const ExperiencesDataTabele({Key? key}) : super(key: key);

  @override
  State<ExperiencesDataTabele> createState() => _ExperiencesDataTabeleState();
}

class _ExperiencesDataTabeleState extends State<ExperiencesDataTabele> {
  @override
  void initState() {
    print('init experiences');
    getAllParcs();
    super.initState();
  }

  void getAllParcs() {
    Provider.of<ExperiencesProvider>(context, listen: false)
        .getAllExperiences();
  }

  @override
  Widget build(BuildContext context) {
    // var experiences = context.watch<ExperiencesProvider>().experiences;
    // print(experiences);
    double screenWidth = MediaQuery.of(context).size.width;
    double columnWidth = screenWidth / 3;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ExperiencesProvider>(builder: ((context, value, child) {
          return DataTable(
            columnSpacing: columnWidth * 0.5,
            columns: const <DataColumn>[
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Titre',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Description',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ],
            rows: value.experiences
                .map(
                  (experience) => DataRow(
                    cells: <DataCell>[
                      DataCell(SizedBox(
                        width: columnWidth,
                        child: Text(experience.titre.toString()),
                      )),
                      DataCell(SizedBox(
                        width: columnWidth,
                        child: Text(experience.description.toString()),
                      )),
                    ],
                  ),
                )
                .toList(),
          );
        })));
  }
}
