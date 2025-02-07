class ModelFollowerWithPagination<T> {

  final int? nextPageKey;
  final List<T> data;

  const ModelFollowerWithPagination({required this.nextPageKey, required this.data});

}