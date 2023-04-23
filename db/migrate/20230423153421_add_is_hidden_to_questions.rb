class AddIsHiddenToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :is_hidden, :boolean, default: false
  end
end
