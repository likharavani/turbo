class AddColumnInArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :completed, :boolean, default: false
  end
end
