import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/domain/usecases/makecall/makecall.dart';
import 'package:random_user/presentation/presentation.dart';

class MakeCallNotifier extends StateNotifier<MakeCallState> {
  MakeCallNotifier(this._makeCallUseCase) : super(MakeCallState());

  final MakeCallUseCase _makeCallUseCase;

  Future<void> makeCall(String phoneNumber) async {
    final result = await _makeCallUseCase.execute(phoneNumber);

    state = result.fold(
      (failure) => MakeCallState(
        erroMessage: Helpers.failureToMessage(failure),
      ),
      (isMakingCall) => MakeCallState(result: isMakingCall),
    );
  }
}
