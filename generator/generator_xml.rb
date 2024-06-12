require 'nokogiri'

out_file = File.new("generated.wxs", "w")

builder = Nokogiri.XML(
    "<Wix xmlns='http://schemas.microsoft.com/wix/2006/wi'>
    <Product Name='Foobar 1.0' Id='ABCDDCBA-86C7-4D14-AEC0-86416A69ABDE' UpgradeCode='ABCDDCBA-7349-453F-94F6-BCB5110BA4FD'
    Language='1033' Codepage='1252' Version='1.0.0' Manufacturer='Acme Ltd.'>


    <Package Id='*' Keywords='Installer' Description='Acme Foobar 1.0 Installer'
    Comments='Foobar is a registered trademark of Acme Ltd.' Manufacturer='Acme Ltd.'
    InstallerVersion='100' Languages='1033' Compressed='yes' SummaryCodepage='1252'/>
    
    <Media Id='1' Cabinet='Sample.cab' EmbedCab='yes' DiskPrompt='CD-ROM #1' />
    <Property Id='DiskPrompt' Value='Acme Foobar 1.0 Installation [1]' />

    <Directory Id='TARGETDIR' Name='SourceDir'>
      <Directory Id='ProgramFilesFolder' Name='PFiles'>
        <Directory Id='Acme' Name='Acme'>
          <Directory Id='INSTALLDIR' Name='Foobar 1.0'>
            <Component Id='MainExecutable' Guid='ABCDDCBA-83F1-4F22-985B-FDB3C8ABD471'>
              <File Id='FoobarEXE' Name='FoobarAppl10.exe' DiskId='1' Source='FoobarAppl10.exe' KeyPath='yes'/>
            </Component>
          </Directory>
        </Directory>
      </Directory>
    </Directory>

    <Feature Id='Complete' Level='1'>
      <ComponentRef Id='MainExecutable' />
    </Feature>

    </Product>
    </Wix>",
     nil, 'windows-1252')

puts builder.to_xml

out_file.puts(builder.to_xml)
out_file.close