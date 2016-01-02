module ApplicationHelper
	def fix_url(url)
		url.starts_with?('http://') ? url : "http://#{url}"
	end

	def friendly_date(d)
		d.strftime("at %l:%M%p on %m/%d/%Y")
	end
end
