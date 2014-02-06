module ApplicationHelper
	def img_url_for_env name
		if Rails.env == 'development'			
			image_path(name)
		else
			"http://obtc.com.kg/obtc/images/#{name}"
		end
	end
end
	