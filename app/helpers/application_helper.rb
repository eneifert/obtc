module ApplicationHelper
	def img_url_for_env name
		return "/#{name}"
		# if Rails.env == 'development'			
		# 	image_path(name)
		# else
		# 	"http://obtc.com.kg/obtc/images/#{name}"
		# end
	end

	def validation_message_for record, field
		if record.errors.messages[field][0] != nil
			 content_tag(:p, :class => "error_msg") do
			 	'*' + record.errors.messages[field][0]
			 end
		else
			nil
		end
	end

end
	