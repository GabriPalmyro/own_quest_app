class AssetData<T> {
  const AssetData({
    required this.extensionType,
    required this.identifier,
  });

  final String extensionType;
  final T identifier;
}
