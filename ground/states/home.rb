class Home < Ground::State

  def call
    html plain('app/index.html')
  end

end
