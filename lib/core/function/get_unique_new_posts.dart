getUniqueNewPosts({required List posts, required List newPosts}) {
  final existingIds = posts.map((e) => e.postId).toSet();
  final uniqueNewPosts =
      newPosts.where((p) => !existingIds.contains(p.postId)).toList();
  return uniqueNewPosts;
}
