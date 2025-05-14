String? validateSearch(String value) {
  if (value.isEmpty || value.trim().isEmpty) {
    return null;
  }
  return value.trim();
}
