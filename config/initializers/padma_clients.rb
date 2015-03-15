=begin
HYDRA = Typhoeus::Hydra.new

module Contacts
  HYDRA = ::HYDRA
  API_KEY = ENV['contacts_key']
end
=end
