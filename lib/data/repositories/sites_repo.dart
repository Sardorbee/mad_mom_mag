import 'package:mad_mom_mag/data/models/sites_model/sites_model.dart';
import 'package:mad_mom_mag/data/models/universal_data.dart';
import 'package:mad_mom_mag/data/network/api_service.dart';
import 'package:mad_mom_mag/data/network/sites_api_service.dart';

class SitesRopsitory {
  final SitesApiService sitesApiService;

  SitesRopsitory({required this.sitesApiService});

  Future<UniversalData> getSites() async => await sitesApiService.getWebsites();
  Future<UniversalData> getSitesById(int id) async =>
      await sitesApiService.getWebsiteById(id);
  Future<UniversalData> createWebsites(WebsiteModel websiteModel) async =>
      await sitesApiService.createWebsite(websiteModel: websiteModel);
}
