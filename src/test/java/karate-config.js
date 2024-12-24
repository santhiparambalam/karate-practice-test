function configuration() {
  var env = karate.env;
  var urlConfig = karate.read('classpath:urlConfig.json')// Read the config.json file
  karate.log('karate.env is set to:', env);

  if (!env) {
    env = 'localhost'; // Default to 'local' if karate.env is not set
  }

  // Iterate over all keys in the URLS object and replace "localhost" with the current environment
  for (var key in urlConfig.URLS) {
    if (urlConfig.URLS[key].includes('localhost')) {
      urlConfig.URLS[key] = urlConfig.URLS[key].replace('localhost', env);
    }
  }

  // Add the URLs directly as variables
  var config = { ...urlConfig.URLS };

  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);

  return config;
}