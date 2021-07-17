class Rack::Attack
 
 Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
 
 # permite que seja realizada requests locais ilimitadas
 
 safelist('allow-localhost') do |req|
 
   '127.0.0.1' == req.ip || '::1' == req.ip
 
 end
 
 #Limita requests externas
 
 throttle('req/ip', limit: 5, period: 5) do |req|
 
   req.ip
 
 end
end
