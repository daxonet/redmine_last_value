class AddShowLastValueToCustomFields < Rails.version < '5.1' ? ActiveRecord::Migration : ActiveRecord::Migration[4.2]
  def change
    add_column :custom_fields, :show_last_value, :boolean, :default => false
  end
end
