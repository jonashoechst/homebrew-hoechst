cask 'blennytv' do
  version '0.1'
  sha256 'b7984f3832977910ae30e54acfeffdf4d939de4a46a57e0bd800791b4a06e218'

  url "https://github.com/chschroeda/BlennyTV/releases/download/#{version}/BlennyTV_#{version}.zip"
  name 'BlennyTV'
  homepage 'https://github.com/chschroeda/BlennyTV'

  app 'BlennyTV.app'
end
