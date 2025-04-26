enum FetchingStatus {
  nothing, // Initial state before any fetch attempt
  loading, // Currently fetching data
  success, // Data fetched successfully
  error, // Error occurred during fetch
}