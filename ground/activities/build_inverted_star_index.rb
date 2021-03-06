class BuildInvertedStarIndex < Dun::Activity
  data_reader :star

  set :dics_set, Ground.db[:dics]
  set :stars_set, Ground.db[:stars]
  set :dic_star_set, Ground.db[:dic_stars]

  def call
    text = "#{star[:full_name]}\n#{star[:description]}"
    index_text text
    index_text text.downcase
  end

  def index_text(text)
    words = text.scan(/\w+/)
    words.each {|word|
      dic = dics_set.where(word: word).first
      if dic.nil?
        dic_id = dics_set.insert word: word
      else
        dic_id = dic[:id]
      end
      
      dic_star = dic_star_set.where(dic_id: dic_id, star_id: star[:id]).first
      tf = words.count(word)
      if dic_star.nil?
        dic_star_set.insert(dic_id: dic_id, star_id: star[:id], tf: tf)
      else
        dic_star_set.where(dic_id: dic_id, star_id: star[:id]).update(tf: tf)
      end
    }

  end
  
end
