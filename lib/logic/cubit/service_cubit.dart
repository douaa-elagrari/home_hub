import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homehub/data/models/service.dart';
import 'package:homehub/data/repositories/service_repo.dart';
import 'package:homehub/logic/cubit/service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  final ServiceRepository _repo;

  ServiceCubit({ServiceRepository? repo})
    : _repo = repo ?? ServiceRepository(),
      super(ServiceInitial());

  /// Add a new service
  Future<void> addService(
    String name,
    String description,
    String username,
  ) async {
    emit(ServiceLoading());

    try {
      final service = Service(
        name: name,
        description: description,
        username: username,
      );

      await _repo.addService(service);

      // Reload services after adding
      await loadServicesForUser(username);
    } catch (e) {
      emit(ServiceError(e.toString()));
    }
  }

  /// Load services for a specific user
  Future<void> loadServicesForUser(String username) async {
    emit(ServiceLoading());

    try {
      final services = await _repo.getServicesForUser(username);
      emit(ServiceLoaded(services));
    } catch (e) {
      emit(ServiceError(e.toString()));
    }
  }
}
