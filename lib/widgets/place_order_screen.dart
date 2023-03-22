import 'package:flutter/material.dart';

class PlaceOrderScreen extends StatefulWidget {
  @override
  _PlaceOrderScreenState createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  TextEditingController shopController =  TextEditingController();
  final List<Map<String, dynamic>> _stops = [];
  final int _maxStops = 5;
  final double _defaultPrice = 20.0;

  void _addStop() {
    if (_stops.length < _maxStops) {
      setState(() {
        _stops.add({
          'shop': shopController.text,
          'stopName': '',
          'shopName': '',
          'items': [
            {
              'itemName': '',
              'minOrderQty': 1,
              'price': _defaultPrice,
            },
          ],
        });
      });
    }
  }

  void _addItem(int stopIndex) {
    setState(() {
      _stops[stopIndex]['items'].add({
        'itemName': '',
        'minOrderQty': 1,
        'price': _defaultPrice,
      });
    });
  }

  void _removeItem(int stopIndex, int itemIndex) {
    setState(() {
      _stops[stopIndex]['items'].removeAt(itemIndex);
    });
  }

  void _removeStop(int stopIndex) {
    setState(() {
      _stops.removeAt(stopIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Place Order'),
      ),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _addStop,
              child: const Text('Add Stop'),
            ),
          ),
          ..._stops.asMap().entries.map((entry) {
            final index = entry.key;
            final stop = entry.value;
            return Card(
              margin: const EdgeInsets.all(16.0),
              child: Container(
                height: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Stop name',
                              ),
                              initialValue: stop['stopName'],
                              onChanged: (value) {
                                setState(() {
                                  _stops[index]['stopName'] = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Shop name',
                              ),
                              initialValue: stop['shopName'],
                              onChanged: (value) {
                                setState(() {
                                  _stops[index]['shopName'] = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...stop['items'].asMap().entries.map((itemEntry) {
                      final itemIndex = itemEntry.key;
                      final item = itemEntry.value;
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Item name',
                                ),
                                initialValue: item['itemName'],
                                onChanged: (value) {
                                  setState(() {
                                    _stops[index]['items'][itemIndex]
                                        ['itemName'] = value;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                decoration: const InputDecoration(),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _stops.length,
                        itemBuilder: (context, stopIndex) {
                          final stop = _stops[stopIndex];
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.location_on),
                                      title: Text(
                                        stop['stopName'] == ''
                                            ? 'Stop ${stopIndex + 1}'
                                            : stop['stopName'],
                                      ),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.close),
                                        onPressed: () => _removeStop(stopIndex),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        initialValue: stop['shopName'],
                                        decoration: const InputDecoration(
                                          labelText: 'Shop Name',
                                          border: OutlineInputBorder(),
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            stop['shopName'] = value;
                                          });
                                        },
                                      ),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: stop['items'].length,
                                      itemBuilder: (context, itemIndex) {
                                        final item = stop['items'][itemIndex];
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Card(
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  leading:
                                                      const Icon(Icons.shopping_cart),
                                                  title: TextFormField(
                                                    initialValue:
                                                        item['itemName'],
                                                    decoration: const InputDecoration(
                                                      labelText: 'Item Name',
                                                      border: InputBorder.none,
                                                    ),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        item['itemName'] =
                                                            value;
                                                      });
                                                    },
                                                  ),
                                                  trailing: IconButton(
                                                    icon: const Icon(Icons.close),
                                                    onPressed: () =>
                                                        _removeItem(stopIndex,
                                                            itemIndex),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: TextFormField(
                                                          initialValue: item[
                                                                  'minOrderQty']
                                                              .toString(),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          decoration:
                                                              const InputDecoration(
                                                            labelText:
                                                                'Minimum Order Quantity',
                                                            border:
                                                                OutlineInputBorder(),
                                                          ),
                                                          onChanged: (value) {
                                                            setState(() {
                                                              item['minOrderQty'] =
                                                                  int.parse(
                                                                      value);
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                      const SizedBox(width: 8.0),
                                                      Expanded(
                                                        child: TextFormField(
                                                          initialValue:
                                                              item['price']
                                                                  .toString(),
                                                          keyboardType:
                                                              const TextInputType
                                                                  .numberWithOptions(
                                                            decimal: true,
                                                          ),
                                                          decoration:
                                                              const InputDecoration(
                                                            labelText: 'Price',
                                                            border:
                                                                OutlineInputBorder(),
                                                            prefixText: '\$ ',
                                                          ),
                                                          onChanged: (value) {
                                                            setState(() {
                                                              item['price'] =
                                                                  double.parse(
                                                                      value);
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: () => _addItem(stopIndex),
                                        child: const Text('Add Item'),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              ), // added closing brace
            );
          }),
        ]),
      ),
    );
  }
}
