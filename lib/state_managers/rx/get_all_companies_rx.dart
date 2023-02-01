import 'package:rxdart/rxdart.dart';
import 'package:working_with_rxdart/data/models/companies_model/companies_model.dart';
import 'package:working_with_rxdart/data/models/my_response/my_response.dart';
import 'package:working_with_rxdart/data/repositories/companies_repository.dart';


class RxApiFetch {
  RxApiFetch({required this.companiesRepository}){
    fetchAllCompanies();
  }
  final  CompaniesRepository companiesRepository;

  final _companiesController = PublishSubject<List<CompaniesModel>>();

  Stream<List<CompaniesModel>> get carModelOneStream => _companiesController.stream;

  fetchAllCompanies() async {
    MyResponse myResponse = await companiesRepository.getAllCompanies();
    if(myResponse.error.isEmpty){
      _companiesController.sink.add(myResponse.data);
    }else{
      _companiesController.sink.addError(myResponse.error);
    }
  }
}