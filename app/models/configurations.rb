class Configurations < ActiveRecord::Base
	class << self
		def available_modules
			modules = find_all_by_config_key("AvailableModules")
			modules.map(&:config_value)
		end
	end
end
