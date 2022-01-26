How to install in Ubuntu
-----------

### Installation script 

It's possible to use the `install.sh` to install layout. 

1. To install, use command: 
```
sudo ./install.sh --install
```
2. The script will make files' backup, to restore use command: 
```
sudo ./install.sh --restore
```

### Manual Installation

1. Copy the layout to end of file `/usr/share/X11/xkb/symbols/br`
```
sudo nativo-prog >> /usr/share/X11/xkb/symbols/br
```
2. Update system configuration 
```
sudo dpkg-reconfigure xkb-data
```
3. After restart, select layout in menu or: 
```
setxkbmap -layout br -variant nativo-prog
```


4. You need to update the `envdev.xml` file and add a variant `nativo-prog` inside br variantlist tag.
`sudo vim /usr/share/X11/xkb/rules/evdev.xml`
```xml
<name>br</name>
<!-- Keyboard indicator for Portuguese layouts -->
	<shortDescription>pt</shortDescription>
        <description>Portuguese (Brazil)</description>
        <languageList>
          <iso639Id>por</iso639Id>
        </languageList>
      </configItem>
      <variantList>

 	// Put the variant inside this tag

      </variantList>
```

5. Put this variant inside:
```xml
<variant>
    <configItem>
        <name>nativo-prog</name>
        <description>Portuguese (Brazil, Nativo for programmers)</description>
    </configItem>
</variant>
```

