module Pond
  extend self

  def lillypads
    
  end

  def logs

  end

  def sample
    send [ :lillypads, :logs ].sample
  end

end