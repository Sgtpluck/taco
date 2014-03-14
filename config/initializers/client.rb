Yelp.configure(
  yws_id:          Figaro.env.yelp_ywsid,
  consumer_key:    Figaro.env.yelp_consumer_key,
  consumer_secret: Figaro.env.yelp_consumer_secret,
  token:           Figaro.env.yelp_token,
  token_secret:    Figaro.env.yelp_token_secret)
