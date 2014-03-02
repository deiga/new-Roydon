ENV!.config do
  # These need to ve specified in ENV or in an .env or .env.<test|development|etc.> file
  use :GOOGLE_ACCOUNT_ID
  use :MONGOLAB_URI
  use :SECRET_TOKEN
end
