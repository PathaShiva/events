require "./lib/iterable.rb"

Iterable.configure do |conf|
  conf.token = ENV["ITETBLE_API_KEY"]
end
