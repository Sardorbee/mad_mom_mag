import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double responsiveheight = MediaQuery.of(context).size.height;
    double responsivewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(responsiveheight * 0.02),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: responsiveheight * 0.07,
          ),
          Text(
            'Bookmarks',
            style: TextStyle(
                fontFamily: 'Fjalla',
                fontSize: responsiveheight * 0.03,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: responsiveheight * 0.02,
          ),
          const Text(
            'Saved magazines to the library',
            style: TextStyle(
              fontFamily: 'Fjalla',
            ),
          ),
          SizedBox(
            height: responsiveheight * 0.03,
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: responsiveheight * 0.14,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(responsiveheight * 0.015)),
                padding: EdgeInsets.only(
                    left: responsiveheight * 0.005,
                    top: responsiveheight * 0.015,
                    right: responsiveheight * 0.015,
                    bottom: responsiveheight * 0.015),
                child: Row(children: [
                  SizedBox(
                    height: responsiveheight * 0.15,
                    width: responsivewidth * 0.32,
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(responsiveheight * 0.015),
                        child: const Placeholder()),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: responsiveheight * 0.012,
                        right: responsiveheight * 0.012,
                        bottom: responsiveheight * 0.012),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2023'),
                        Text('MMM March'),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: responsiveheight * 0.14,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(responsiveheight * 0.015)),
                padding: EdgeInsets.only(
                    left: responsiveheight * 0.005,
                    top: responsiveheight * 0.015,
                    right: responsiveheight * 0.015,
                    bottom: responsiveheight * 0.015),
                child: Row(children: [
                  SizedBox(
                    height: responsiveheight * 0.15,
                    width: responsivewidth * 0.32,
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(responsiveheight * 0.015),
                        child: const Placeholder()),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: responsiveheight * 0.012,
                        right: responsiveheight * 0.012,
                        bottom: responsiveheight * 0.012),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2023'),
                        Text('MMM May'),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: responsiveheight * 0.14,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(responsiveheight * 0.015)),
                padding: EdgeInsets.only(
                    left: responsiveheight * 0.005,
                    top: responsiveheight * 0.015,
                    right: responsiveheight * 0.015,
                    bottom: responsiveheight * 0.015),
                child: Row(children: [
                  SizedBox(
                    height: responsiveheight * 0.15,
                    width: responsivewidth * 0.32,
                    child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(responsiveheight * 0.015),
                        child: const Placeholder()),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: responsiveheight * 0.012,
                        right: responsiveheight * 0.012,
                        bottom: responsiveheight * 0.012),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2023'),
                        Text('MMM April'),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
