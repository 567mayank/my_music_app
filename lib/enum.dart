enum FetchingStatus {
  nothing, // Initial state before any fetch attempt
  loading, // Currently fetching data
  success, // Data fetched successfully
  error, // Error occurred during fetch
}

enum SearchResultType {
  all, // Shows all types of search results
  songs, // Shows only song results
  albums, // Shows only album results
  artists, // Shows only artist results
  playlists, // Shows only playlist results
}
