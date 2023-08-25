import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mad_mom_mag/data/models/sites_model/sites_model.dart';
import 'package:mad_mom_mag/presentation/websites/widgets/sites_details.dart';
import 'package:mad_mom_mag/utils/constants/constants.dart';



class GlobalMason extends StatefulWidget {
  const GlobalMason({super.key, required this.websites});

  final List<WebsiteModel> websites;

  @override
  State<GlobalMason> createState() => _GlobalMasonState();
}

class _GlobalMasonState extends State<GlobalMason> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: MasonryGridView.count(
        itemCount: widget.websites.length,
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 16.w,
        itemBuilder: (context, index) {
          WebsiteModel x = widget.websites[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SitesDetails(
                     sitesModel: x,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: "$baseUrl${x.image}",
                      errorWidget: (context, url, error) => Placeholder(fallbackHeight: 100,fallbackWidth: 150,),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          x.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),

                      ]),
                  SizedBox(height: 4.h),
                  Text(
                    x.hashtag,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 4.h),
                  Text(x.author),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}