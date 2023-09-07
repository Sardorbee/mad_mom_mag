import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mad_mom_mag/cubitss/articles_cubit/articles_cubit.dart';
import 'package:mad_mom_mag/data/models/articles_model/filed_keys.dart';
import 'package:mad_mom_mag/data/models/form_status/form_status.dart';
import 'package:mad_mom_mag/presentation/websites/widgets/add_website_text_field.dart';

class AddArticle extends StatefulWidget {
  const AddArticle({
    super.key,
  });

  @override
  State<AddArticle> createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  File? image;
  TextEditingController titleCont = TextEditingController();
  TextEditingController descriptionCont = TextEditingController();
  TextEditingController hashtagCont = TextEditingController();
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
          "Add Article",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
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
                            controller: titleCont,
                            onChanged: (value) {
                              context.read<ArticleCubit>().updateArticleField(
                                  fieldKey: ArticleFieldKeys.title,
                                  value: value);
                            },
                            label: "  Article  title",
                            type: TextInputType.name),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        WebsiteTextField(
                            maxLines: 5,
                            controller: descriptionCont,
                            onChanged: (value) {
                              context.read<ArticleCubit>().updateArticleField(
                                  fieldKey: ArticleFieldKeys.description,
                                  value: value);
                            },
                            label: "  Article Description",
                            type: TextInputType.phone),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        WebsiteTextField(
                            controller: hashtagCont,
                            onChanged: (value) {
                              context.read<ArticleCubit>().updateArticleField(
                                  fieldKey: ArticleFieldKeys.hashtag,
                                  value: value);
                            },
                            label: "  Article Hashtag",
                            type: TextInputType.text),
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
                                  : const SizedBox(),
                            )
                          ],
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
                              if (context.read<ArticleCubit>().canRegister()) {
                                await context
                                    .read<ArticleCubit>()
                                    .createArticle();
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Article qo'shish haqidagi so'rovingiz Adminga yuborildi",
                                      ),
                                    ),
                                  );
                                  context.read<ArticleCubit>().getArticles();
                                  Navigator.pop(context);
                                }
                              }
                            },
                            child: const Center(
                              child: Text('Add Article'),
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
          Visibility(
            visible: context.watch<ArticleCubit>().state.status ==
                FormStatus.loading,
            child: const Center(
              child: CircularProgressIndicator(),
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
      if (context.mounted) {
        context.read<ArticleCubit>().updateArticleField(
            fieldKey: ArticleFieldKeys.image, value: xFile.path);
      }
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
      context.read<ArticleCubit>().updateArticleField(
          fieldKey: ArticleFieldKeys.image, value: xFile.path);
    }
  }
}
