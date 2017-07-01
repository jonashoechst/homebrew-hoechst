cask 'syncthing-brewbar' do
  version 'beta4'
  sha256 '75c781252bb36312cf29c7522580848991934db2c321db1c84f62c390732d615'

  url "https://github.com/jonashoechst/syncthing-brew-gui/releases/download/#{version}/Syncthing-BrewBar.zip"
  name 'Syncthing BrewBar'
  homepage 'https://github.com/jonashoechst/Syncthing-BrewBar'

  depends_on formula: 'syncthing'

  app 'Syncthing BrewBar.app'
end
