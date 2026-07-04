SiteSetting.current.update!(
  site_name: "Arcade Menu",
  headline: "Select Game",
  subheadline: "Boot menu ready. Choose a cabinet to launch.",
  accent_color: "#39ff14",
  secondary_color: "#ffcc00",
  background_color: "#07090f",
  footer_note: "Insert coin. Press start."
)

[
  {
    title: "Neon Runner",
    url: "/games/neon-runner",
    genre: "Runner",
    cabinet_code: "RUN-01",
    description: "A placeholder link for a fast reflex game.",
    position: 1
  },
  {
    title: "Meteor Break",
    url: "/games/meteor-break",
    genre: "Shooter",
    cabinet_code: "MET-02",
    description: "A placeholder link for a space shooter.",
    position: 2
  },
  {
    title: "Puzzle Grid",
    url: "/games/puzzle-grid",
    genre: "Puzzle",
    cabinet_code: "PUZ-03",
    description: "A placeholder link for a logic game.",
    position: 3
  }
].each do |attributes|
  Game.find_or_create_by!(title: attributes[:title]) do |game|
    game.assign_attributes(attributes)
  end
end
