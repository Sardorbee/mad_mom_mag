import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mad_mom_mag/data/models/sites_model/filed_keys.dart';
import 'package:mad_mom_mag/data/models/form_status/form_status.dart';
import 'package:mad_mom_mag/data/models/sites_model/sites_model.dart';
import 'package:mad_mom_mag/data/models/universal_data.dart';
import 'package:mad_mom_mag/data/repositories/sites_repo.dart';
import 'package:mad_mom_mag/utils/ui_utils/error_message_dialog.dart';

part 'website_state.dart';

class WebsiteCubit extends Cubit<WebsiteState> {
  WebsiteCubit({required this.websiteRepository})
      : super(
          WebsiteState(
            websiteModel: WebsiteModel(
              name: "",
              image: "",
              author: "",
              hashtag: "",
              contact: "",
              likes: "",
              link: "",
            ),
            websites: const [],
          ),
        ) {
    getWebsites();
  }

  final SitesRopsitory websiteRepository;

  createWebsite() async {
    emit(state.copyWith(
      status: FormStatus.loading,
      statusText: "",
    ));
    UniversalData response =
        await websiteRepository.createWebsites(state.websiteModel);
    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: "website_added",
        ),
      );
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
        statusText: response.error,
      ));
    }
  }

  updateWebsite(BuildContext context, int id) async {
    emit(state.copyWith(
      status: FormStatus.loading,
      statusText: "",
    ));
    UniversalData response =
        await websiteRepository.updateWebsite(state.websiteModel, id);
    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: "website_updated",
        ),
      );
    } else {
     if(context.mounted) showErrorMessage(message: response.error, context: context);
      emit(state.copyWith(
        status: FormStatus.failure,
        statusText: response.error,
      ));
    }
  }

  getWebsites() async {
    emit(state.copyWith(
      status: FormStatus.loading,
      statusText: "",
    ));

    UniversalData response = await websiteRepository.getSites();

    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: "get_website",
          websites: response.data as List<WebsiteModel>,
        ),
      );
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
        statusText: response.error,
      ));
    }
  }

  getWebsiteById(int websiteId) async {
    emit(state.copyWith(
      status: FormStatus.loading,
      statusText: "",
    ));
    UniversalData response = await websiteRepository.getSitesById(websiteId);
    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: "get_website_by_id",
          websiteDetail: response.data as WebsiteModel,
        ),
      );
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
        statusText: response.error,
      ));
    }
  }

  updateWebsiteField({
    required WebsiteFieldKeys fieldKey,
    required dynamic value,
  }) {
    WebsiteModel currentWebsite = state.websiteModel;

    switch (fieldKey) {
      case WebsiteFieldKeys.hashtag:
        {
          currentWebsite = currentWebsite.copyWith(hashtag: value as String);
          break;
        }
      case WebsiteFieldKeys.contact:
        {
          currentWebsite = currentWebsite.copyWith(contact: value as String);
          break;
        }
      case WebsiteFieldKeys.link:
        {
          currentWebsite = currentWebsite.copyWith(link: value as String);
          break;
        }
      case WebsiteFieldKeys.author:
        {
          currentWebsite = currentWebsite.copyWith(author: value as String);
          break;
        }
      case WebsiteFieldKeys.name:
        {
          currentWebsite = currentWebsite.copyWith(name: value as String);
          break;
        }
      case WebsiteFieldKeys.image:
        {
          currentWebsite = currentWebsite.copyWith(image: value as String);
          break;
        }
      case WebsiteFieldKeys.likes:
        {
          currentWebsite = currentWebsite.copyWith(likes: value as String);
          break;
        }
    }

    debugPrint("WEBSITE: ${currentWebsite.toString()}");

    emit(state.copyWith(websiteModel: currentWebsite));
  }

  bool canRegister() {
    WebsiteModel website = state.websiteModel;
// ! Errorlarni chiqarish kerak
    return website.contact.length >= 9 &&
        website.name.isNotEmpty &&
        website.image.isNotEmpty &&
        website.link.isNotEmpty &&
        website.author.isNotEmpty &&
        website.hashtag.isNotEmpty;
  }
}
