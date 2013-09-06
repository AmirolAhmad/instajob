module ApplicationHelper
	# make devise form work in any page in your application
	# Thanks to http://pupeno.com/2010/08/29/show-a-devise-log-in-form-in-another-page/
	def resource_name
	  :member
	end

	def resource
	  @resource ||= Member.new
	end

	def devise_mapping
	  @devise_mapping ||= Devise.mappings[:member]
	end
end
