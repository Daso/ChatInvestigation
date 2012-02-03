class Message < ActiveRecord::Base
	
  Pusher.app_id = '14730'
	Pusher.key = '2f17b09857e49c8b7a8a'
	Pusher.secret = '2d126226183a7dd59633'

	after_create :send_to_pusher
	
	def send_to_pusher
		logger.info "Hi?"
		Pusher['NewChat'].trigger("message:create",self.to_json)
	end
  
end