Usando Ubuntu
-----------

Adicionando o teclado em sistemas baseados no Ubuntu.

1. Copia o layout para a pasta do sistema
```
2. Atualize as configurações do sistema
```
sudo dpkg-reconfigure xkb-data
```
3. Seleciona a teclado
```
setxkbmap nativo-prog
```

Também é preciso atualizar o arquivo evdev.xml, dentro da lista de teclados BR e próximo oas teclados nativo.
`sudo vim /usr/share/X11/xkb/rules/evdev.xml`

```
<variant>
    <configItem>
        <name>nativo-prog</name>
        <description>Portuguese (Brazil, Nativo for programmers)</description>
    </configItem>
</variant>
```

