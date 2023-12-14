class AddTranslationsToClients < ActiveRecord::Migration[7.0]
  def up
    unless table_exists?(:client_translations)
      Client.create_translation_table!({
        name: :string,
        address: :string,
        description: :text
      })
    end
  end

  def down
    Client.drop_translation_table! if table_exists?(:client_translations)
  end
end

