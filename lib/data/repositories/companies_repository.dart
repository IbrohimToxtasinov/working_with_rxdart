import 'package:working_with_rxdart/data/models/my_response/my_response.dart';
import 'package:working_with_rxdart/data/services/api_service.dart';

class CompaniesRepository {
  CompaniesRepository({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getAllCompanies() => apiService.getAllCompanies();

  Future<MyResponse> getSingleCompany({required int id}) => apiService.getSingleCompany(id: id);
}
