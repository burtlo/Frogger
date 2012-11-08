class GameScene < Metro::Scene

  event :on_up, KbEscape do
    exit
  end

  event :on_up, KbR do
    Metro.reload!
    transition_to scene_name
  end

end