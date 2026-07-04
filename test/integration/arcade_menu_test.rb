require "test_helper"

class ArcadeMenuTest < ActionDispatch::IntegrationTest
  test "public menu renders published games and settings" do
    SiteSetting.current.update!(
      site_name: "Test Cade",
      headline: "Pick Game",
      subheadline: "Choose a link.",
      footer_note: "Ready."
    )
    Game.create!(
      title: "Visible Game",
      url: "/games/visible",
      genre: "Action",
      cabinet_code: "VIS",
      position: 1,
      published: true
    )
    Game.create!(
      title: "Hidden Game",
      url: "/games/hidden",
      genre: "Puzzle",
      cabinet_code: "HID",
      position: 2,
      published: false
    )

    get root_path

    assert_response :success
    assert_select "h1", "Test Cade"
    assert_select "h2", "Pick Game"
    assert_select "a[href='/games/visible']", text: /Visible Game/
    assert_no_match "Hidden Game", response.body
  end
end
