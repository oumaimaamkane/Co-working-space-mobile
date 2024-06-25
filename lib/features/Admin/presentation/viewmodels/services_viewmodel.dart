import 'package:get/get.dart';
import 'package:coworking_space_mobile/core/models/service_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:coworking_space_mobile/config/services/service_service.dart';

class ServiceViewModel extends GetxController {
  final ServiceService _serviceService = ServiceService();
  final BehaviorSubject<List<Service>> _servicesSubject = BehaviorSubject<List<Service>>();
  Stream<List<Service>> get servicesStream => _servicesSubject.stream;

  ServiceViewModel() {
    _serviceService.fetchServices().then((data) {
      _servicesSubject.add(data);
    });
  }

  Future<void> updateService(String id, String name) async {
    try {
      await _serviceService.updateService(id, name);
      final updatedData = await _serviceService.fetchServices();
      _servicesSubject.add(updatedData);
    } catch (e) {
      // Handle error
    }
  }

  Future<void> addService(String name) async {
    try {
      await _serviceService.addService(name);
      final updatedData = await _serviceService.fetchServices();
      _servicesSubject.add(updatedData);
    } catch (e) {
      throw Exception('Failed to add service');
    }
  }

  Future<void> deleteService(String id) async {
    try {
      await _serviceService.deleteService(id);
      final updatedData = await _serviceService.fetchServices();
      _servicesSubject.add(updatedData);
    } catch (e) {
      throw Exception('Failed to delete service');
    }
  }
}
