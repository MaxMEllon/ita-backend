Hanami::Model.migration do
  change do
    create_table :todos do
      primary_key :id
      column :user_id, Integer, null: false
      column :title, String, null: false
      column :progress, Integer, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
