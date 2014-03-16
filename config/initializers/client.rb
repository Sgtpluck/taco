Yelp.configure(
  # yws_id:          Figaro.env.yelp_ywsid,
  # consumer_key:    Figaro.env.yelp_consumer_key,
  # consumer_secret: Figaro.env.yelp_consumer_secret,
  # token:           Figaro.env.yelp_token,
  # token_secret:    Figaro.env.yelp_token_secret)
  yws_id:           ENV["YELP_YWSID"],
  consumer_key:     ENV["YELP_CONSUMER_KEY"],
  consumer_secret:  ENV["YELP_CONSUMER_SECRET"],
  token:            ENV["YELP_TOKEN"],
  token_secret:     ENV["YELP_TOKEN_SECRET"]
  )