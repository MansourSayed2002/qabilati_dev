List<T> paginationPost<T>({
  required int point,
  required List<T> data,
  required int limit,
}) {
  if (point >= data.length) return [];
  var end = (point + limit >= data.length) ? data.length : point + limit;
  return data.sublist(point, end);
}
