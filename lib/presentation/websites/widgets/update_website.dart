import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mad_mom_mag/cubitss/website_cubit/website_cubit.dart';
import 'package:mad_mom_mag/data/models/sites_model/filed_keys.dart';
import 'package:mad_mom_mag/data/models/form_status/form_status.dart';
import 'package:mad_mom_mag/data/models/sites_model/sites_model.dart';
import 'package:mad_mom_mag/presentation/websites/widgets/add_website_text_field.dart';
import 'package:mad_mom_mag/utils/constants/constants.dart';

class UpdateWebsite extends StatefulWidget {
  UpdateWebsite({super.key, required this.websiteModel});
  final WebsiteModel websiteModel;

  @override
  State<UpdateWebsite> createState() => _UpdateWebsiteState();
}

class _UpdateWebsiteState extends State<UpdateWebsite> {
  File? image;
  TextEditingController nameCont = TextEditingController();
  TextEditingController linkCont = TextEditingController();
  TextEditingController authorCont = TextEditingController();
  TextEditingController contactCont = TextEditingController();
  TextEditingController hashtagCont = TextEditingController();
  @override
  void initState() {
    nameCont.text = widget.websiteModel.name;
    linkCont.text = widget.websiteModel.link;
    authorCont.text = widget.websiteModel.author;
    contactCont.text = widget.websiteModel.contact;
    hashtagCont.text = widget.websiteModel.hashtag;

    super.initState();
  }

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
          "Update Website",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Visibility(
            visible: context.watch<WebsiteCubit>().state.status ==
                FormStatus.loading,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        WebsiteTextField(
                            controller: nameCont,
                            onChanged: (value) {
                              context.read<WebsiteCubit>().updateWebsiteField(
                                  fieldKey: WebsiteFieldKeys.name,
                                  value: value);
                            },
                            label: "  Site Name",
                            type: TextInputType.name),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        WebsiteTextField(
                            controller: linkCont,
                            onChanged: (value) {
                              context.read<WebsiteCubit>().updateWebsiteField(
                                  fieldKey: WebsiteFieldKeys.link,
                                  value: value);
                            },
                            label: "  Site Link",
                            type: TextInputType.phone),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.height *
                                              0.019),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.black.withOpacity(0.0),
                                  ),
                                ),
                                onPressed: () {
                                  showBottomSheetDialog();
                                },
                                child: const Center(
                                  child: Text(
                                    'Upload image',
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              width: 120,
                              child: image != null
                                  ? Image.file(image!)
                                  : CachedNetworkImage(
                                      imageUrl:
                                          "$baseUrl${widget.websiteModel.image}"),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        WebsiteTextField(
                          controller: authorCont,
                          onChanged: (value) {
                            context.read<WebsiteCubit>().updateWebsiteField(
                                fieldKey: WebsiteFieldKeys.author,
                                value: value);
                          },
                          label: "  Site Author",
                          type: TextInputType.text,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        WebsiteTextField(
                          controller: contactCont,
                          onChanged: (value) {
                            context.read<WebsiteCubit>().updateWebsiteField(
                                fieldKey: WebsiteFieldKeys.contact,
                                value: value);
                          },
                          label: "  Site Contact",
                          type: TextInputType.number,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        WebsiteTextField(
                          controller: hashtagCont,
                          onChanged: (value) {
                            context.read<WebsiteCubit>().updateWebsiteField(
                                fieldKey: WebsiteFieldKeys.hashtag,
                                value: value);
                          },
                          label: "  Site Hashtag",
                          type: TextInputType.text,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.065,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.height *
                                          0.031),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromRGBO(37, 43, 51, 1),
                              ),
                            ),
                            onPressed: () async {
                              context.read<WebsiteCubit>().updateWebsiteField(
                                  fieldKey: WebsiteFieldKeys.name,
                                  value: nameCont.text);
                              context.read<WebsiteCubit>().updateWebsiteField(
                                  fieldKey: WebsiteFieldKeys.link,
                                  value: linkCont.text);
                              context.read<WebsiteCubit>().updateWebsiteField(
                                  fieldKey: WebsiteFieldKeys.author,
                                  value: authorCont.text);
                              context.read<WebsiteCubit>().updateWebsiteField(
                                  fieldKey: WebsiteFieldKeys.contact,
                                  value: contactCont.text);
                              context.read<WebsiteCubit>().updateWebsiteField(
                                  fieldKey: WebsiteFieldKeys.hashtag,
                                  value: hashtagCont.text);

                              if (context.read<WebsiteCubit>().canRegister()) {
                                context.read<WebsiteCubit>().updateWebsite(
                                    context, widget.websiteModel.id);
                                context.read<WebsiteCubit>().getWebsites();

                                Navigator.pop(context);
                              }
                            },
                            child: const Center(
                              child: Text('Update Website'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showBottomSheetDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text("Select from Camera"),
              ),
              ListTile(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.photo),
                title: const Text("Select from Gallery"),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera() async {
    ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (xFile != null) {
      image = File(xFile.path);
      context.read<WebsiteCubit>().updateWebsiteField(
          fieldKey: WebsiteFieldKeys.image, value: xFile.path);
    }
  }

  Future<void> _getFromGallery() async {
    ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null && context.mounted) {
      image = File(xFile.path);
      context.read<WebsiteCubit>().updateWebsiteField(
          fieldKey: WebsiteFieldKeys.image, value: xFile.path);
    }
  }
}
