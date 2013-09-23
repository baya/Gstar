class InsertStarFromGithub < Dun::Activity
  data_reader :name, :full_name, :description, :html_url
  data_reader :created_at, :updated_at
  data_reader :id

  set :source,  'github'
  set :data_set, Ground.db[:stars]

  def call
    star_id = data_set.insert star
    star.merge(id: star_id)
  end

  private

  def star
    @star ||= {
      name: name,
      full_name: full_name,
      description: description,
      html_url: html_url,
      source: source,
      source_id: "#{source}_#{id}",
      source_created_at: created_at,
      source_updated_at: updated_at,
      created_at: DateTime.now,
      updated_at: DateTime.now
    }
  end

end
