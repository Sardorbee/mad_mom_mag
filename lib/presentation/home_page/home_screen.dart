import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_mom_mag/cubitss/tab_bar_cubit/tabbar_cubit.dart';
import 'package:mad_mom_mag/cubitss/website_cubit/website_cubit.dart';
import 'package:mad_mom_mag/data/models/form_status/form_status.dart';
import 'package:mad_mom_mag/data/models/sites_model/sites_model.dart';
import 'package:mad_mom_mag/presentation/articles/articles_page.dart';
import 'package:mad_mom_mag/presentation/websites/widgets/sites_details.dart';
import 'package:mad_mom_mag/utils/constants/constants.dart';
import 'package:mad_mom_mag/utils/loading_page.dart';
import 'package:mad_mom_mag/utils/server_error_page.dart';
import 'widgets/list_monts.dart';

class MainDrwPage extends StatelessWidget {
  const MainDrwPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<WebsiteCubit, WebsiteState>(
          listener: (context, state) {},
          builder: (context, state) {
            // context.read<SitesCubit>().getSites();
            if (state.status == FormStatus.success) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [

                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.02),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text('Member'),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.005,
                                  ),
                                  const Text("name")
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.56,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () {},
                                  child: IconButton(
                                      splashRadius: 20,
                                      onPressed: () {},
                                      icon: const Icon(
                                        CupertinoIcons.bell_solid,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildSearchBar(context),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        MonthsList(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Exclusively for you',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.024,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          0.02),
                                  child: Text(
                                    'See more',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.016,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        const SizedBox(height: 200, child: ArticlesData()),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sites',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.024,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  context.read<NavbarCubit>().updateScreen(1);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      right: MediaQuery.of(context).size.width *
                                          0.02),
                                  child: Text(
                                    'See more',
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.016,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        WebsiteModel sitesModel = state.websites[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SitesDetails(sitesModel: sitesModel),
                                ),
                              );
                            },
                            leading: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.height * 0.12,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.height * 0.015,
                                ),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                    errorWidget: (context, url, error) => const FlutterLogo(),

                                    imageUrl: "$baseUrl${sitesModel.image}"),
                              ),
                            ),
                            title: Text(
                              sitesModel.name,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.03),
                            ),
                            trailing: Column(
                              children: [
                                Text(
                                  sitesModel.contact,
                                  style: TextStyle(
                                      color: Colors.blue.shade600,
                                      fontSize: MediaQuery.of(context).size.height *
                                          0.03),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: state.websites.length,
                    ),
                  ),
                ],
              );
            } else if (state.status == FormStatus.failure) {
              return const ErrorServerPage();
            } else {
              return const LoadingPage();
            }
          },
        ),
      ),
    );
  }
}

Widget _buildSearchBar(BuildContext context) {
  return SliverPersistentHeader(
    pinned: true,
    delegate: _SearchBarDelegate(
      minHeight: 80,
      maxHeight: 80,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black12,
                ),
                child: TextFormField(
                  onTap: () {},
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    labelText: 'Search Your own Mad Mom Mag',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black87,
                ),
                child: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _SearchBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SearchBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SearchBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
