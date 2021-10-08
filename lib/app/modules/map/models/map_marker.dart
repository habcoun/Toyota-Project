import 'package:latlong2/latlong.dart';
import 'package:toyota/app/constants/app_images.dart';

class MapMarker {
  final String? image;
  final String? title;
  final String? adresse;
  final LatLng? location;

  MapMarker({
    required this.image,
    required this.title,
    required this.adresse,
    required this.location,
  });
}

final locations = [
  LatLng(35.806109, 10.6487853),
  LatLng(35.8853012, 10.5728457),
  LatLng(36.3999706, 10.5555891),
];

final mapMarkers = [
  MapMarker(
    image: AppImage.kSousseSud,
    title: 'TOYOTA Sousse SUD',
    adresse: "TOYOTA SOUSSE SUD, Boulevard de l'Environnement, Sousse",
    location: locations[0],
  ),
  MapMarker(
    image: AppImage.kSousseNord,
    title: 'TOYOTA Sousse',
    adresse: 'TOYOTA Sousse, Akouda',
    location: locations[1],
  ),
  MapMarker(
    image: AppImage.kSousseHammamet,
    title: 'TOYOTA HAMMAMET',
    adresse: 'Manaret el hammamet gp1 vers Sousse',
    location: locations[2],
  ),
];
