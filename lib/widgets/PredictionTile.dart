import 'package:flutter/material.dart';
import 'package:ignite/datamodels/address.dart';
import 'package:ignite/datamodels/prediction.dart';
import 'package:ignite/dataproviders/appdata.dart';
import 'package:ignite/helpers/requesthelper.dart';
import 'package:ignite/widgets/ProgressDialog.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:provider/provider.dart';

class PredictionTile extends StatelessWidget {
  final Prediction prediction;
  PredictionTile({this.prediction});

  void getPlaceDetails(String placeID, context) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => ProgressDialog(status: 'One second'),
    );
    String url =
        'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeID&key=AIzaSyBPXBAC60Xg1sqGg04tS4yFH5qSajx5VyE';
    var response = await RequestHelper.getRequest(url);

    Navigator.pop(context);

    if (response == 'failed') {
      return;
    }

    if (response['status'] == 'OK') {
      Address thisPlace = Address();
      thisPlace.placeName = response['result']['name'];
      thisPlace.placeId = placeID;
      thisPlace.latitude = response['result']['geometry']['location']['lat'];
      thisPlace.longitude = response['result']['geometry']['location']['lng'];

      Provider.of<AppData>(context, listen: false)
          .updateDestinationAddress(thisPlace);

      Navigator.pop(context, 'getDirection');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        getPlaceDetails(prediction.placeId, context);
      },
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 8),
            Row(
              children: <Widget>[
                Icon(
                  OMIcons.locationOn,
                  color: Colors.green[800],
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        prediction.mainText,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        prediction.secondaryText,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 12, color: Colors.green[800]),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
