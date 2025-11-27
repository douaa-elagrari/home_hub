enum SavedType { product, service, agency }

class SavedItem {
  final SavedType type;
  final dynamic item;

  SavedItem({required this.type, required this.item});
}

List<SavedItem> likedItems = [];
