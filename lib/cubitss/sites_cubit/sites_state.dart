part of 'sites_cubit.dart';

@immutable
sealed class SitesState {}

final class SitesInitial extends SitesState {}



final class SitesLoading extends SitesState {}

final class SitesError extends SitesState {
  final String errorText;
  SitesError({required this.errorText});
}

final class SitesLoaded extends SitesState {
  final List<dynamic> sites;

  SitesLoaded({required this.sites});
}

