module AuthToken
	private
 def authToken_authencaticator
 	@token ||= request.headers['Authorization']
 
 	unless real_token?
 		render json: {errors: 'Acesso negado, Token invalido'},
 			   status: :unauthorized
 	end	
 end
 	def real_token?
 	@token.present? && @token.size >9
	end
end