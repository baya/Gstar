# -*- coding: utf-8 -*-
Sequel.migration do
  up do
    create_table(:dic_stars) do
      primary_key :id
      Integer     :dic_id
      Integer     :star_id
      Integer     :tf      # 单词在文档中出现的频率
    end
  end

  down do
    drop_table(:dic_stars)
  end
end
