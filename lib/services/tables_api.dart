import 'dart:io';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/exceptions.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Either<Exception, String>> addTableWS({required String name, required String nbPeople}) async {
  try {
    final response = await http.post(
      Uri.parse(
        '${Globals.baseUrl}/tables',
      ),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
      },
      body: {
        'establishment_id': Globals.params.currentEstablishmentID.toString(),
        'name': name,
        'nb_people': nbPeople,
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

// Future<Either<Exception, String>> updatePlanningWS({required Planning planning, bool? monthly}) async {
//   try {
//     final response = await http.post(
//       Uri.parse(
//         '${Globals.baseUrl}/planning/${planning.id}',
//       ),
//       headers: {
//         HttpHeaders.acceptHeader: 'application/json',
//         HttpHeaders.authorizationHeader: 'Bearer ${Globals.token}',
//       },
//       body: {
//         'should_start_at': DateFormat.Hm().format(planning.shouldStartAt),
//         'should_finish_at': DateFormat.Hm().format(planning.shouldFinishAt!),
//         if (monthly != null) 'monthly': monthly ? "1" : "0",
//       },
//     );

//     if (response.statusCode == 200) {
//       if (!json.decode(response.body)['error']) {
//         Globals.profile = await getUserWS();

//         return Right(json.decode(response.body)['message']);
//       } else {
//         return Left(ApiException(message: json.decode(response.body)['message']));
//       }
//     } else {
//       return Left(ApiException(message: json.decode(response.body)['message']));
//     }
//   } catch (e) {
//     print(e);
//     return Left(ApiException(message: e.toString()));
//   }
// }
