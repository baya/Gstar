Sequel.migration do
  up do
    create_table(:q_star_assocs) do
      primary_key :id
      Integer :star_id
      Integer :score
      String  :q
    end
  end

  down do
    drop_table(:q_star_assocs)
  end
end
