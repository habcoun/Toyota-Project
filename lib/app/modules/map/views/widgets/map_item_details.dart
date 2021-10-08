import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toyota/app/constants/app_string.dart';
import 'package:toyota/app/modules/map/models/map_marker.dart';

class MapItemDetail extends StatelessWidget {
  const MapItemDetail({
    Key? key,
    required this.mapMarker,
  }) : super(key: key);

  final MapMarker mapMarker;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 20,
        margin: EdgeInsets.zero,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                              mapMarker.image!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              mapMarker.title!.toUpperCase(),
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: AppString.kPrimaryColors,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              mapMarker.adresse!,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: MaterialButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Text(
                        'Appeler'.toUpperCase(),
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  color: AppString.kPrimaryColors,
                  elevation: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
