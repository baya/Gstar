# -*- coding: utf-8 -*-
Sequel.migration do
  up do
    create_table(:reindex_stars) do
      primary_key :id
      Integer :star_id
      Integer :status  # 0 defaul, 1 已经完成索引
    end
  end

  down do
    drop_table(:reindex_stars)
  end
end
