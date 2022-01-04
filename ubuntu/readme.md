Usando Ubuntu
-----------

### Script para Instalação 
É possível utilizar o script `install.sh` para instalar o layout.
1. Para instalação utilizar o comando:
```
sudo ./install.sh --install
```
2. O script faz um backup dos arquivos alterados, para retaurar utilizar o comando:
```
sudo ./install.sh --restore
```

### Instalação Manual
Adicionando o teclado em sistemas baseados no Ubuntu.

1. Copia o layout para o final do arquivo `/usr/share/X11/xkb/symbols/nativo-prog`
```
sudo nativo-prog >> /usr/share/X11/xkb/symbols/nativo-prog
```
2. Atualize as configurações do sistema
```
sudo dpkg-reconfigure xkb-data
```
3. Seleciona o teclado
```
setxkbmap nativo-prog
```

Também é preciso atualizar o arquivo evdev.xml, adicionando a variante nativo-prog dentro da lista de teclados BR e próximo aos teclados nativo.
`sudo vim /usr/share/X11/xkb/rules/evdev.xml`

```
<variant>
    <configItem>
        <name>nativo-prog</name>
        <description>Portuguese (Brazil, Nativo for programmers)</description>
    </configItem>
</variant>
```

