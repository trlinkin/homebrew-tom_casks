cask :v1 => 'wkhtmltopdf-stable' do
  version '0.12.2.1'

  sha256 'c2fd9b39182453ba9672f528e7a503928e51bc6a45c3117da06a5193af338d35'
  # bitbucket.org is the official download host per the vendor homepage
  url "http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_osx-cocoa-x86-64.pkg"
  pkg "wkhtmltox-#{version}_osx-cocoa-x86-64.pkg"

  name 'wkhtmltopdf'
  homepage 'http://wkhtmltopdf.org/'
  license :gpl

  depends_on :macos => '>= :snow_leopard'

  uninstall :pkgutil => 'org.wkhtmltopdf.wkhtmltox',
            :delete  => [
                          '/usr/local/include/wkhtmltox',
                          '/usr/local/lib/libwkhtmltox.dylib',
                          "/usr/local/lib/libwkhtmltox.#{version.to_i}.dylib",
                          "/usr/local/lib/libwkhtmltox.#{version.to_f}.dylib",
                          "/usr/local/lib/libwkhtmltox.#{version.sub(%r{-.*$},'')}.dylib",
                          '/usr/local/bin/wkhtmltoimage',
                          '/usr/local/bin/wkhtmltopdf'
                        ]

  caveats do
    files_in_usr_local
  end
end
