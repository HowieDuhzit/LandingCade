require "test_helper"

class AdminConsoleTest < ActionDispatch::IntegrationTest
  test "admin dashboard requires login" do
    get admin_root_path

    assert_redirected_to admin_login_path
  end

  test "admin can login and add a game" do
    post admin_login_path, params: { password: "arcade-admin" }
    assert_redirected_to admin_root_path

    assert_difference "Game.count", 1 do
      post admin_games_path, params: {
        game: {
          title: "Launch Link",
          url: "/games/launch-link",
          genre: "Arcade",
          cabinet_code: "LNK",
          description: "A test game link.",
          position: 4,
          published: "1"
        }
      }
    end

    assert_redirected_to admin_root_path
    follow_redirect!
    assert_match "Launch Link", response.body
  end

  test "admin can edit page settings" do
    post admin_login_path, params: { password: "arcade-admin" }

    patch admin_settings_path, params: {
      site_setting: {
        site_name: "Rebrand Cade",
        headline: "Load Something",
        subheadline: "New message.",
        accent_color: "#00ffaa",
        secondary_color: "#ffdd22",
        background_color: "#050505",
        footer_note: "New footer."
      }
    }

    assert_redirected_to admin_root_path
    follow_redirect!
    assert_match "Rebrand Cade", response.body
  end
end
