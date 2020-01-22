cask 'syncthing-brewbar' do
  version 'beta6'
  sha256 '317da70220c56c7f8fa4cf1f3e23e9563f339c098aefecc972b9faef2e3c8cb6'

  url "https://github.com/jonashoechst/syncthing-brew-gui/releases/download/#{version}/Syncthing-BrewBar.zip"
  name 'Syncthing BrewBar'
  homepage 'https://github.com/jonashoechst/Syncthing-BrewBar'

  depends_on formula: 'syncthing'

  app 'Syncthing BrewBar.app'
end
