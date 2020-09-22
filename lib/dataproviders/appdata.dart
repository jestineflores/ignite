import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ignite/datamodels/address.dart';
import 'package:provider/provider.dart';

class AppData extends ChangeNotifier {
  Address pickupAddress;

  Address destinationAddress;

  void updatePickupAddress(Address pickup) {
    pickupAddress = pickup;
    notifyListeners();
  }

  void updateDestinationAddress(Address destination) {
    destinationAddress = destination;
    notifyListeners();
  }
}
