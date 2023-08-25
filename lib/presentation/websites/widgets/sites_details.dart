import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_mom_mag/cubitss/website_cubit/website_cubit.dart';
import 'package:mad_mom_mag/data/models/form_status/form_status.dart';
import 'package:mad_mom_mag/data/models/sites_model/sites_model.dart';
import 'package:mad_mom_mag/presentation/websites/widgets/update_website.dart';
import 'package:mad_mom_mag/utils/constants/constants.dart';
import 'package:mad_mom_mag/utils/server_error_page.dart';

class SitesDetails extends StatelessWidget {
  SitesDetails({super.key, required this.sitesModel});

  WebsiteModel sitesModel;

  @override
  Widget build(BuildContext context) {
    context.read<WebsiteCubit>().getWebsiteById(sitesModel.id);
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
      body: BlocConsumer<WebsiteCubit, WebsiteState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.status == FormStatus.success) {
            WebsiteModel websiteModel = state.websiteDetail!;
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        child: CachedNetworkImage(
                            imageUrl: "$baseUrl${websiteModel.image}"),
                      ),
                      Text(websiteModel.author),
                      Text(websiteModel.contact),
                      Text(websiteModel.hashtag),
                      Text(websiteModel.name),
                      TextButton(
                        onPressed: () {
                          launchInBrowser(Uri.parse(websiteModel.link));
                        },
                        child: Text(websiteModel.link),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UpdateWebsite(
                                websiteModel: websiteModel,
                              ),
                            ));
                      },
                      child: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state.status == FormStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: ErrorServerPage(),
            );
          }
        },
      ),
    );
  }
}
