cask 'syncthing-brewbar' do
  version 'beta5'
  sha256 'f0d43249274b811c637cb401a689cef0f735550bf9c53004ddd03dd15079de0f'

  url "https://github.com/jonashoechst/syncthing-brew-gui/releases/download/#{version}/Syncthing-BrewBar.zip"
  name 'Syncthing BrewBar'
  homepage 'https://github.com/jonashoechst/Syncthing-BrewBar'

  depends_on formula: 'syncthing'

  app 'Syncthing BrewBar.app'
end
