Redmine::Plugin.register :redmine_last_value do
  name 'Redmine Last Value plugin'
  author 'LS MARK'
  description 'This is a plugin for to show custom field last value per project'
  version '1.1.0'
  url 'https://daxonet.com'
  author_url 'https://daxonet.com/about'
end

require_dependency File.dirname(__FILE__) + '/lib/redmine_last_value/hooks/view_custom_fields_form_issue_custom_field_hook'
require_dependency File.dirname(__FILE__) + '/lib/redmine_last_value/patches/custom_fields_helper_patch'
require_dependency File.dirname(__FILE__) + '/lib/redmine_last_value/patches/custom_field_patch'
