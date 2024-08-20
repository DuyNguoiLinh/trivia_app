class ModelWithPagination<T> {
  final int? nextPageKey;
  final List<T> data;

  const ModelWithPagination({required this.nextPageKey, required this.data});
}