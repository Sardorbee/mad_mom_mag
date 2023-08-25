import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mad_mom_mag/data/models/sites_model/sites_model.dart';
import 'package:mad_mom_mag/utils/constants/constants.dart';

class SitesDetails extends StatelessWidget {
  SitesDetails({super.key, required this.sitesModel});

  SitesModel sitesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          title: const Text(
            "Site Details",
            style: TextStyle(color: Colors.black),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: CachedNetworkImage(
                  imageUrl: "$baseUrl${sitesModel.image}"),
            
            ),
            Text(sitesModel.author),
            Text(sitesModel.contact),
            Text(sitesModel.hashtag),
            Text(sitesModel.name),
          ],
        ),
      ),
    );
  }
}
