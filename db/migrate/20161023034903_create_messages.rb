class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text          :body
      t.string        :image
      t.references    :user
      t.references    :group

      t.timestamps
    end
  end
end
