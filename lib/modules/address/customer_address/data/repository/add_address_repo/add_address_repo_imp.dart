import 'package:dio/src/response.dart';
import 'package:either_dart/src/either.dart';
import 'package:market_app/core/constants/app_languages.dart';
import 'package:market_app/core/constants/variables.dart';
import 'package:market_app/core/services/failures.dart';
import 'package:market_app/core/services/newwork/dio_helper.dart';
import 'package:market_app/core/services/newwork/endpoints.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/modules/address/customer_address/data/repository/add_address_repo/add_address_repo.dart';

class AddAddressRepo extends AddAddressAbstractRepo {
  @override
  Future<Either<Response, ServerFailure>> getCountries() async {
    // Check internet connection
    if (await AppUtilities.checkInternet()) {
      Response response = await DioHelper.get(
        endPoint: Endpoints.getCountries,
        // Todo: Manage Language
        lang: AppLanguages.english,
      );
      if (response.statusCode != 200) {
        return Right(ServerFailure(response.statusMessage));
      }
      return Left(response);
    }
    return Right(ServerFailure(AppVariables.noInternetConnectionText));
  }

  @override
  Future<Either<Response, ServerFailure>> getCitiesInCountry(
      {required String countryId}) async {
    // Check internet connection
    if (await AppUtilities.checkInternet()) {
      Response response = await DioHelper.get(
        endPoint: Endpoints.getCountriesCities(countryId),
        // Todo: Manage Language
        lang: AppLanguages.english,
      );
      if (response.statusCode != 200) {
        return Right(ServerFailure(response.statusMessage));
      }
      return Left(response);
    }
    return Right(ServerFailure(AppVariables.noInternetConnectionText));
  }

  @override
  Future<Either<Response, ServerFailure>> getDistrictsInCity(
      {required String cityId}) async {
    // Check internet connection
    if (await AppUtilities.checkInternet()) {
      Response response = await DioHelper.get(
        endPoint: Endpoints.getDistrictsInCity(cityId),
        // Todo: Manage Language
        lang: AppLanguages.english,
      );
      if (response.statusCode != 200) {
        return Right(ServerFailure(response.statusMessage));
      }
      return Left(response);
    }
    return Right(ServerFailure(AppVariables.noInternetConnectionText));
  }

  @override
  Future<Either<Response, ServerFailure>> getSubDistrictsInDistricts(
      {required String districtsId}) async {
    // Check internet connection
    if (await AppUtilities.checkInternet()) {
      Response response = await DioHelper.get(
        endPoint: Endpoints.getSubDistricstInDistricts(districtsId),
        // Todo: Manage Language
        lang: AppLanguages.english,
      );
      if (response.statusCode != 200) {
        return Right(ServerFailure(response.statusMessage));
      }
      return Left(response);
    }
    return Right(ServerFailure(AppVariables.noInternetConnectionText));
  }
}
