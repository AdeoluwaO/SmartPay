import 'package:dio/dio.dart';

//TODO: USE TRY TO INTERCEPTORS FOR API CALLS WITH TOKEN
//TODO: WHEN A  USER WANTS TO DOWNLOAD CONTENT HOW WOULD API HANDLE IT
Future<T?> sendRequest<T>({
  required String method,
  required String endpoint,
  Map<String, dynamic>? data,
  Map<String, dynamic>? queryParams,
  Options? options,
  bool requiresAuth = true,
}) async {
  final methodToUppercase = method.toUpperCase();
  try {
    final baseApiSetup = Dio(BaseOptions(
        baseUrl: 'https://mobile-test-2d7e555a4f85.herokuapp.com/api/v1'));
    /*RUN A CHECK IF TOKEN IS NOT EMPTY 
    MEANING THE USER WOULD HAVE PROBABLY AUTHENTICATED
    if(token.isNotEmpty) headers: {"Authorization": "Bearer $testToken""}: null;
    */
    final testToken = 'Adeoluwa';
    final response = await baseApiSetup.request(
      endpoint,
      queryParameters: {
        ...?queryParams,
        'encode': 'url3986',
        'difficulty': 'easy'
      },
      options: options ??
          Options(
            method: methodToUppercase,
            headers:
                requiresAuth ? {"Authorization": "Bearer $testToken"} : null,
            contentType: Headers.formUrlEncodedContentType,
          ),
      data: data ?? {},
    );
    print('DECODED RESPONSE ${response.data}');
    return response.data as T;
  } on DioException catch (e) {
    // showToast(message: e.toString(), isError: true);
    // print('API ERROR IS THIS $e');
    return e as T;
  }
}
