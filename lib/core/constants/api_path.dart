// this is our main endpoints
// we don't uses it by it's own instead use it with other requests
const String baseEndpoint = "https://api.themoviedb.org/3/movie/";

//////////////////////////////// * API KEY * ///////////////////////////////
// we don't uses it by it's own instead use it with other requests
// we should not put it here but for demonstration purpose we keep it here.
const String apiKey = "066b4a61e8994da906854c500c33f9de";

////////////////////// //// * REQUESTS * ////////////////////////////////
const String popularMovies = baseEndpoint + "popular";
const String whereApiKeyQuery = "?api_key=" + apiKey;
const String imagesStoragePath = "https://image.tmdb.org/t/p/original";


