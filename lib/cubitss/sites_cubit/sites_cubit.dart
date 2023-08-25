import 'package:bloc/bloc.dart';
import 'package:mad_mom_mag/data/models/universal_data.dart';
import 'package:mad_mom_mag/data/repositories/sites_repo.dart';
import 'package:meta/meta.dart';

part 'sites_state.dart';

class SitesCubit extends Cubit<SitesState> {
  SitesCubit({required this.sitesRopsitory}) : super(SitesInitial()) {
    getSites();
  }
  final SitesRopsitory sitesRopsitory;

  Future<void> getSites() async {
    emit(SitesLoading());
    UniversalData universalData = await sitesRopsitory.getSites();
    if (universalData.error.isEmpty) {
      emit(SitesLoaded(sites: universalData.data));
    } else {
      emit(SitesError(errorText: universalData.error));
    }
  }
}
