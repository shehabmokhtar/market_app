import 'package:bloc/bloc.dart';
import 'package:market_app/core/functions/get_list_from_json.dart';
import 'package:market_app/core/services/chache_helper.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/address/customer_address/data/models/address_model.dart';
import 'package:market_app/modules/address/customer_address/data/models/customer_address_model.dart';
import 'package:market_app/modules/address/customer_address/data/repository/addresses_repo/address_repo_imp.dart';
import 'package:meta/meta.dart';
part 'addresses_states.dart';

class AddressesCubit extends Cubit<AddressesStates> {
  AddressesCubit() : super(AddressesCubitInitial());

  String currentAddressId = '';
  double currentLatutude = 0;
  double currentLongtude = 0;
  String currentSubDistrictId = '';
  List<CustomerAddressModel> customerAddresses = [];

// Change the current address id
  changeCurrentAddress(CustomerAddressModel addressModel) {
    emit(ChangeCurrentAddressLoadingState());

    try {
      // Assign the new address id to currentAddressId variable
      currentAddressId = addressModel.id!;
      currentLatutude = addressModel.lat!;
      currentLatutude = addressModel.lng!;
      currentSubDistrictId = addressModel.subDistrict!.id!;
      // Save current address id
      CacheHelper.saveData(
        key: 'currentAddressId',
        value: currentAddressId,
      );
      // Save current address latutude
      CacheHelper.saveData(
        key: 'lat',
        value: currentLatutude,
      );
      // Save current address longtude
      CacheHelper.saveData(
        key: 'lng',
        value: currentLongtude,
      );
      // Save current sub district id
      CacheHelper.saveData(
        key: 'currentSubDistrictId',
        value: currentSubDistrictId,
      );

      emit(ChangeCurrentAddressSuccessState());
    } catch (e) {
      emit(ChangeCurrentAddressErrorState(e.toString()));
    }
  }

  // get customer addresses
  Future<void> getCustomerAddresses() async {
    emit(GetAddressesLoadingState());

    customerAddresses.clear();
    // Addresses repo result
    var result = await sl<AddressesRepo>().getCustomerAddresses();

    result.fold((left) {
      customerAddresses = getListFromJson(
        data: left.data,
        fromJson: (e) => CustomerAddressModel.fromJson(e),
      );
      emit(GetAddressesSuccessState());
    }, (right) => GetAddressesErrorState(right.errorMessage));
  }

  // delete address
  Future<void> deleteAddress(String id) async {
    emit(DeleteAddressLoadingState());
    // Addresses repo result
    var result = await sl<AddressesRepo>().deleteAddress(id);

    result.fold((left) {
      emit(DeleteAddressSuccessState('Address deleted successfully'));
    }, (right) => DeleteAddressErrorState(right.errorMessage));
  }
}
