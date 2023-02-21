import 'package:digicard/app/models/address.model.dart';
import 'package:latlong2/latlong.dart';

extension AddressHelper on Address? {
  String displaySafe() {
    return "${this!.placeName}, ${this!.stateCode}, ${this!.postcode}";
  }

  String displayFull() {
    return "#${this!.fullAddress}, ${this!.placeName}, ${this!.stateCode}, ${this!.postcode}";
  }

  double? distanceFrom({double? lat, double? long}) {
    const Distance distance = Distance();
    return (this?.latitude != null && this?.longitude != null) &&
            (lat != null && long != null)
        ? distance.as(LengthUnit.Kilometer, LatLng(lat, long),
            LatLng(this?.latitude ?? 0, this?.longitude ?? 0))
        : null;
  }
}
