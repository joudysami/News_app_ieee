
import 'dart:developer';
import 'package:hive_flutter/adapters.dart';


class SavePost {
  static const String _boxName = 'savedPosts';

  Future<void> savePost(Map article) async {
    try {
      final box = await Hive.openBox(_boxName);
      await box.put(article['title'] ?? DateTime.now().toString(), article);
    } catch (e) {
      log('Error saving post: $e');
      rethrow;
    }
  }

  Future<List<dynamic>> getSavedPosts() async {
    try {
      final box = await Hive.openBox(_boxName);
      return box.values.toList();
    } catch (e) {
      log('Error retrieving saved posts: $e');
      return [];
    }
  }

  Future<void> removePost(Map article) async {
    try {
      final box = await Hive.openBox(_boxName);
      await box.delete(article['title'] ?? '');
    } catch (e) {
      log('Error deleting post: $e');
      rethrow;
    }
  }
}
