Ground do
  get '/', Home
  get '/stars', Stars::Index
  post '/saveStarDescription', Star::SaveDescription
end
