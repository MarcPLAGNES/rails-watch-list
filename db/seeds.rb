require 'open-uri'
require 'json'

# Movie.destroy.all

url = "https://tmdb.lewagon.com/movie/top_rated"
# puts url

movie_serialized = URI.parse(url).read
movies = JSON.parse(movie_serialized)['results']
# puts JSON.pretty_generate(movies)

movies.each do |movie|
  title = movie['title']
  overview = movie['overview']
  poster_url = "https://image.tmdb.org/t/p/original#{movie["/74hLDKjD5aGYOotO6esUVaeISa2.jpg"]}"
  rating = movie['vote_average']

  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)

  puts title: title, overview: overview, poster_url: poster_url, rating: rating
end
