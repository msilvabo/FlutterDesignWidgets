import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// void main() => runApp(AprobacionesApp());

// class AprobacionesApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Aprobaciones',
//       theme: ThemeData(
//         primarySwatch: Colors.indigo,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: PaginaAprobaciones(),
//     );
//   }
// }

class Item {
  final int codigo;
  final String nombre;
  final DateTime fecha;
  final bool estado;

  Item({
    required this.codigo,
    required this.nombre,
    required this.fecha,
    required this.estado,
  });
}

class tarjetListPage extends StatefulWidget {
  @override
  _PaginaAprobacionesState createState() => _PaginaAprobacionesState();
}

class _PaginaAprobacionesState extends State<tarjetListPage> {
  final List<Item> _todosLosItems = List.generate(
    20,
    (index) => Item(
      codigo: 1000 + index,
      nombre: 'Documento ${index + 1}',
      fecha: DateTime.now().subtract(Duration(days: index * 2)),
      estado: index % 2 == 0,
    ),
  );

  List<Item> _itemsFiltrados = [];
  final TextEditingController _controladorBusqueda = TextEditingController();
  final List<String> _filtrosActivos = [];

  @override
  void initState() {
    super.initState();
    _itemsFiltrados = List.from(_todosLosItems);
  }

  void _aplicarFiltro(String filtro) {
    if (filtro.isEmpty) return;
    setState(() {
      _filtrosActivos.add(filtro);
      _filtrarItems();
    });
    _controladorBusqueda.clear();
  }

  void _eliminarFiltro(String filtro) {
    setState(() {
      _filtrosActivos.remove(filtro);
      _filtrarItems();
    });
  }

  void _filtrarItems() {
    setState(() {
      _itemsFiltrados = _todosLosItems.where((item) {
        return _filtrosActivos.every((filtro) {
          final filtroMinuscula = filtro.toLowerCase();
          return item.codigo.toString().contains(filtroMinuscula) ||
              item.nombre.toLowerCase().contains(filtroMinuscula) ||
              DateFormat('dd/MM/yyyy').format(item.fecha).contains(filtroMinuscula) ||
              (item.estado ? 'aprobado' : 'pendiente').contains(filtroMinuscula);
        });
      }).toList();
    });
  }

  void _mostrarMenuAcciones(Item item) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.check_circle, color: Colors.green),
                title: Text('Aprobar'),
                onTap: () {
                  Navigator.pop(context);
                  // Lógica para aprobar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Item ${item.codigo} aprobado')),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.cancel, color: Colors.red),
                title: Text('Rechazar'),
                onTap: () {
                  Navigator.pop(context);
                  // Lógica para rechazar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Item ${item.codigo} rechazado')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _construirTarjeta(Item item) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        onTap: () => _mostrarMenuAcciones(item),
        title: Text(
          item.nombre,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Código: ${item.codigo}\nFecha: ${DateFormat('dd/MM/yyyy').format(item.fecha)}\nEstado: ${item.estado ? 'Aprobado' : 'Pendiente'}',
        ),
        trailing: Icon(
          item.estado ? Icons.check_circle : Icons.hourglass_bottom,
          color: item.estado ? Colors.green : Colors.orange,
        ),
        isThreeLine: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aprobaciones'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controladorBusqueda,
                    decoration: InputDecoration(
                      hintText: 'Buscar por código, nombre, fecha o estado',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: _aplicarFiltro,
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => _aplicarFiltro(_controladorBusqueda.text),
                ),
              ],
            ),
          ),
          if (_filtrosActivos.isNotEmpty)
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _filtrosActivos
                    .map(
                      (filtro) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: InputChip(
                          label: Text(filtro),
                          onDeleted: () => _eliminarFiltro(filtro),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          Expanded(
            child: _itemsFiltrados.isEmpty
                ? Center(child: Text('No se encontraron resultados'))
                : ListView.builder(
                    itemCount: _itemsFiltrados.length,
                    itemBuilder: (context, index) {
                      return _construirTarjeta(_itemsFiltrados[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
