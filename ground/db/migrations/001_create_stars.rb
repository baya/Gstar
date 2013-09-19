Sequel.migration do
  up do
    create_table(:stars) do
      primary_key :id
      String   :name
      String   :full_name
      String   :html_url
      String   :description, text: true
      DateTime :source_created_at
      DateTime :source_updated_at
      DateTime :created_at
      DateTime :updated_at
      String   :source
      String   :source_id
    end
  end

  down do
    drop_table(:stars)
  end
end
