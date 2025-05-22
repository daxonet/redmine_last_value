module RedmineLastValue
  module Patches
    module CustomFieldPatch
      def self.included(base)      
        base.class_eval do
          
          safe_attributes 'show_last_value'
        end
      end
    end
  end
end

 
CustomField.send(:include, RedmineLastValue::Patches::CustomFieldPatch)

