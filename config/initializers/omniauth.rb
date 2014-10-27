OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	
	#provider :twitter, ENV['G7wFqd9MDPhvIUVGu9T5nVBdF'], ENV['ot9gPzMWUGQMuRafg5vxAwWpFDVIVMLHSitR8uie1JAMJsuXl0']
	provider :google_oauth2, '341502072674-1adcn3ga8d51474qrsksnp14nut8om6n.apps.googleusercontent.com', 'ePgBwWU4yrzqRKaFYeT9TGKe'
	#localhost
	provider :facebook, '281783672006763', '6a63c1628abe7157f9d673c975bad6aa'
	#produccion
	#provider :facebook, '490103561092106', '6254ea4d5f447c698ddab1d51241f0e5'
	#provider :identity, on_failed_registration: lambda { |env|    UsersController.action(:new).call(env)}
end


OmniAuth.config do |config|
  config.on_failure do
   redirect_to root_path
  end
end