import 'dart:io';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/exceptions.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Either<Exception, String>> updateCommandeStatusWS({required int id, required String status}) async {
  try {
    final response = await http.post(
      Uri.parse(
        '${Globals.baseUrl}/commande/${Globals.params.currentEstablishmentID.toString()}/$id',
      ),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
      },
      body: {
        'status': status,
      },
    );

    if (response.statusCode == 200) {
      if (!json.decode(response.body)['error']) {
        Globals.profile = await getUserWS();

        return Right(json.decode(response.body)['message']);
      } else {
        return Left(ApiException(message: json.decode(response.body)['message']));
      }
    } else {
      return Left(ApiException(message: json.decode(response.body)['message']));
    }
  } catch (e) {
    print(e);
    return Left(ApiException(message: e.toString()));
  }
}
