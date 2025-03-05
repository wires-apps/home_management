import 'package:home_management/core/di/dependency_injection.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaint/bloc/complaint_bloc.dart';
import 'package:home_management/features/complaints_suggestions/presentation/complaint/details_complaint/bloc/complaint_details_bloc.dart';

void initComplaint(){

  getIt.registerFactory<ComplaintBloc>(() => ComplaintBloc());
  getIt.registerFactory<ComplaintDetailsBloc>(() => ComplaintDetailsBloc());
}