Sequel.migration do
  up do
    create_table(:dics) do
      primary_key :id
      String   :word
    end
  end

  down do
    drop_table(:dics)
  end
end
