

import 'package:mad_mom_mag/data/models/universal_data.dart';
import 'package:mad_mom_mag/data/network/api_service.dart';

class ProfileRepository {
  final ApiService apiService;

  ProfileRepository({required this.apiService});

  Future<UniversalData> getUserData() async => apiService.getProfileData();
}