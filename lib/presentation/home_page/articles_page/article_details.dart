import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad_mom_mag/data/models/articles_model/articles_model.dart';
import 'package:mad_mom_mag/utils/constants/constants.dart';

class ArticleDetails extends StatelessWidget {
  ArticleDetails({super.key, required this.articlesModel});

  ArticlesModel articlesModel;

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
            "Article Details",
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
                  imageUrl: "$baseUrl${articlesModel.image}"),
            ),
            Text(articlesModel.title),
            Text(articlesModel.profession),
            Text(articlesModel.username),
            Text(articlesModel.description),
          ],
        ),
      ),
    );
  }
}
