import 'package:trivia_app_with_flutter/src/features/message/data/sources/firestore_message_data_source_impl.dart';

abstract class FirestoreMessageDataSource {

  factory FirestoreMessageDataSource.create() {
    return FirestoreMessageDataSourceImpl();
  }
}