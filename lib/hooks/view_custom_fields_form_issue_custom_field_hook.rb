module RedmineLastValue
  module Hooks
    class ViewCustomFieldsFormIssueCustomFieldHook < Redmine::Hook::ViewListener
      render_on :view_custom_fields_form_issue_custom_field, :partial => 'custom_fields/last_value_flag'
    end
  end
end
