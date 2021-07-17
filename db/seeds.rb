Address.delete_all

5.times do |i|
	Address.create cep: "BAA #{i}"
end