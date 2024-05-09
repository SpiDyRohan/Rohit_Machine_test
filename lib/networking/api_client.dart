import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rohit_machine_test/response_model/login_response/login_response.dart';

import '../response_model/users_response/users_response.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: "https://reqres.in/api/")
abstract class ApiClient{
 factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;


 @POST('login')
 Future<LoginResponse> loginAPi();

 @GET('users')
 Future<UsersResponse> usersAPi();
}