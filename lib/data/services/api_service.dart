import 'package:dio/dio.dart';
import 'package:working_with_rxdart/data/models/companies_model/companies_model.dart';
import 'package:working_with_rxdart/data/models/company_model/company_model.dart';
import 'package:working_with_rxdart/data/models/my_response/my_response.dart';
import 'package:working_with_rxdart/data/services/api_client.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getAllCompanies() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("https://easyenglishuzb.free.mockoapp.net/companies");
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        myResponse.data = ((response.data)["data"] as List?)
                ?.map((e) => CompaniesModel.fromJson(e))
                .toList() ??
            [];
        print(myResponse.data.toString());
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }

  Future<MyResponse> getSingleCompany({required int id}) async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio
          .get("https://easyenglishuzb.free.mockoapp.net/companies/$id");
      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        myResponse.data = CompanyModel.fromJson(response.data);
      }
    } catch (error) {
      myResponse.error = error.toString();
    }
    return myResponse;
  }
}
