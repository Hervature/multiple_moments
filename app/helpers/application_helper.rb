module ApplicationHelper
	def flash_class(level)
    case level
      when :notice then 'uk-alert uk-alert-info'
      when :success then 'uk-alert uk-alert-success'
      when :error then 'uk-alert uk-alert-danger'
      when :alert then 'uk-alert uk-alert-warning'
    end
  end
end
