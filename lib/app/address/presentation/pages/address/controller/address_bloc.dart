import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/shared/base_state.dart';
import '../../../../domain/usecases/get_address_usecase.dart';

class AddressBloc extends Cubit<BaseState> {
  final GetAddressUsecase _getAddressUsecase;
  AddressBloc(this._getAddressUsecase) : super(const EmptyState());

  Future<void> getAddress(String cep) async {
    emit(const LoadingState());
    final result = await _getAddressUsecase(cep: cep);
    if (result.isSuccess) {
      emit(SuccessState(result.getSuccessData));
    } else {
      emit(ErrorState(result.getErrorData.message));
    }
  }
}
