Sequel.migration do
  up do
    alter_table(:stars) do
      add_index :source_id
      add_index :name
      add_index :description
    end

    alter_table(:reindex_stars) do
      add_index :status
    end

    alter_table(:q_star_assocs) do
      add_index :q
      add_index :star_id
      add_index :score
      add_index [:q, :star_id]
    end

    alter_table(:dic_stars) do
      add_index :star_id
      add_index :dic_id
    end

    alter_table(:dics) do
      add_index :word
    end
    
  end

  down do
    alter_table(:stars) do
      drop_index :source_id
      drop_index :name
      drop_index :description
    end

    alter_table(:reindex_stars) do
      drop_index :status
    end

    alter_table(:q_star_assocs) do
      drop_index :q
      drop_index :star_id
      drop_index :score
      drop_index [:q, :star_id]
    end

    alter_table(:dic_stars) do
      drop_index :star_id
      drop_index :dic_id
    end

    alter_table(:dics) do
      drop_index :word
    end
    
  end
end
