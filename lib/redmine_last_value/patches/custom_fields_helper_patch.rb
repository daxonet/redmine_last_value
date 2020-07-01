module RedmineLastValue
  module Patches
    module CustomFieldsHelperPatch
      def self.included(base)
        base.send(:include, InstanceMethods)

        base.class_eval do
          unloadable

          alias_method :custom_field_tag_with_label_without_last_value, :custom_field_tag_with_label
          alias_method :custom_field_tag_with_label, :custom_field_tag_with_label_with_last_value
        end
      end 

      module InstanceMethods
        def custom_field_tag_with_label_with_last_value(name, custom_value, options={})
          tag = custom_field_tag_with_label_without_last_value(name,custom_value,options)
          if custom_value.custom_field.show_last_value
            value = CustomValue
              .joins("JOIN #{table_name_prefix}issues#{table_name_suffix} as issues on issues.id = custom_values.customized_id")
              .select("MAX(value) value")
              .where(custom_field_id: custom_value.custom_field.id)
              .where("issues.project_id=?",custom_value.customized.project_id)
              .first
              .attributes
              if value["value"] 
                tag = tag + content_tag('p', "Last Value: " + value["value"])
              end
          end
          tag
        end
      end
    end
  end
end
  
#unless CustomFieldsHelper.included_modules.include?(RedmineLastValue::Patches::CustomFieldsHelperPatch)
CustomFieldsHelper.send(:include, RedmineLastValue::Patches::CustomFieldsHelperPatch)
#end