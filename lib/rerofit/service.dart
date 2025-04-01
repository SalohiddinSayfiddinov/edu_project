import 'package:dio/dio.dart';
import 'package:edu_project/rerofit/model.dart';
import 'package:retrofit/retrofit.dart';
part 'service.g.dart';
@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/users")
  Future<List<User>> getUsers();
}
void main() async {
  final dio = Dio(); // Provide a Dio instance
  final apiService = ApiService(dio);

  final users = await apiService.getUsers();
  print(users);
}