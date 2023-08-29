// import 'dart:async';

// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../data/repositories/advertisements_local_repository_impl.dart';
// import '../../data/repositories/cart_local_repository_impl.dart';
// import '../../domain/repositories/advertisements_repository.dart';
// import '../../domain/use_cases/init_user_session_use_case.dart';

// final initUserSessionWithUserIdUseCaseProvider =
//     Provider.autoDispose<InitUserSessionWithUserIdUseCase>(
//   (ref) {
//     var advertisementsLocalRepository =
//         ref.watch(advertisementsLocalRepositoryProvider);
//     return InitUserSessionWithUserIdUseCaseImpl(
//       advertisementsLocalRepository,
//     );
//   },
// );

// class InitUserSessionWithUserIdUseCaseImpl
//     implements InitUserSessionWithUserIdUseCase {
//   final AdvertisementsRepository _advertisementsLocalRepository;
//   final AdvertisementsRepository _advertisementsRemoteRepository;

//   InitUserSessionWithUserIdUseCaseImpl(
//     AdvertisementsRepository advertisementsLocalRepository,
//     AdvertisementsRepository advertisementsRemoteRepository,
//   )   : _advertisementsLocalRepository = advertisementsLocalRepository,
//         _advertisementsRemoteRepository = advertisementsRemoteRepository;

//   @override
//   FutureOr<void> execute([void request]) {
//     // TODO: implement execute
//     throw UnimplementedError();
//   }
// }
