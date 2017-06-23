cask 'syncthing-brewbar' do
  version 'beta3'
  sha256 'a678b17359846491a6fd25880268d5b276630df8a766cb5f8ef4bf78fe9f55c4'

  url "https://github.com/jonashoechst/syncthing-brew-gui/releases/download/#{version}/Syncthing-BrewBar.zip"
  name 'Syncthing BrewBar'
  homepage 'https://github.com/jonashoechst/Syncthing-BrewBar'

  depends_on formula: 'syncthing'

  app 'Syncthing BrewBar.app'
end
