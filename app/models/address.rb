class Address < ApplicationRecord
 validates :cep, :token, presence: true
	scope :by_token, ->(token) { where(token: token) }
 private
 	def	self.get_information_address(cep)
 		address =self.new
	 	require 'rest-client'
	 	require 'json'
	 	baseUrl = 'https://ws.apicep.com/cep/'
	 	response RestClient.get "#{baseUrl}#{cep}.json"
	 	puts response.body
	 	response = JSON.parse(response.to_s)
	 	address.cep = response[:code]
	 	address.state = response[:state]
	 	address.city = response[:city]
	 	address.district = response[:district]
	 	address.street = response[:address]
	 	address.save
	 	if response.code ='200'
	 		puts "aeee"
	 	 else 
	 	 	puts "deu ruim"
	 	end
  end
 end

