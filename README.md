# CONFIGURACIÓN DE ENTORNO GNU/LINUX EN UBUNTU 20.04

<h3 align="center">BSPWM, POLYBAR, ROFI, DMENU, POWERMENU & SXHKD</h3>

<p align="center">
 <br></br>
 <img src="https://raw.githubusercontent.com/Fernand117/docfiles/main/screen.png">
</p>

## Descripción
Este repositorio contiene la configuración actual de mi entorno de escritorio GNU/Linux en Ubuntu 20.04,
de momento, dicha configuración es la que estaría usando por un tiempo, en caso de cambiarla, haría una actualización
al repositorio actual.

## Polybar
La polybar está configurada de una manera especial, en mi caso cuento con dos monitores, el principal es el de mi laptop y el secundario es
uno conectado mediante HDMI, por lo que en mi caso cuento con dos módulos iguales para cada escritorio, esto conlleva a que en el archivo de
configuración de bspwm indique que cada monitor tendrá 10 espacios de trabajo.

```
[bar/lap]
monitor = ${env:MONITOR:}
width = 100%
height = 30
radius = 0
fixed-center = true

[bar/monitor]
monitor = ${env:MONITOR:HDMI-1}
width = 100%
height = 30
radius = 0
fixed-center = true
```

Del resto la polybar tiene varios módulos que en lo personal me sirven para poder estar al tanto de algunas cosas relacionadas con el funcioamiento
del equipo, tal como lo es la batería, la temperatura, el volumen, procesador y memoria que está consumiento el equipo en tiempo real.
Cuenta además con dos módulos de redes.
- IP Local: Este lo que hace es verificar que en mi caso la wlo1 tenga una dirección IP asignada, de tenerla nos la pintará en la poly, en caso de no ser así este simplemente muestra un mensaje e icóno que nos indica que el equipo no está conectado a la red.
- IP HTB: Este hace la misma función que el anterior solo que está pensado para verificar si tenemos alguna conexión por tunel en la interfaz 0 con alguna vpn que en mi caso sería la de Hack The Box, pero funciona con cualquier otra conexión.

Estos módulos dependen de dos scripts que se encuentran en la carpeta BIN, los cuales se ejecutan en interválos de cada 2 segundos.

## Bspwm
Como mencioné en la parte de arriba, el Bspwm está configurado de tal forma que nos permite tener más de 20 espacios de trabajo, esto dependeŕa de cuantos monitores tengas conectados, más adelante veremos cómo es que hay que configurar el SXHKD para poder nevegar entre dichos espacios de trabajo

El archivo de configuración la verdad es que no tiene muchos cambios, la mayoría de los que se le hicieron fueron más que nada estéticos, sin embargo, hay una configuración muy importante que añadir en caso de que estemos haciendo uso de algunos programas escritos en Java tales como IntelliJ IDEA o Android Studio.

Para que estos puedan trabajar de manera correcta es necesario añadir la siguiente línea
```
#open Funny Java Things
wmname LG3D
```

Con ello ya podremos ver la interfaz de los programas que utilicen Java.

## SXHKD
Este archivo tiene varia modificaciones, te recomiendo revisarlo y cambiar algunas por las que sean de tu agrado, en micaso para lanzar un terminal utilizo Konsole que viene por defecto en KDE Plasma, mientras que para el navegador he seteado el Microsoft Edge, que por si no lo has visto, se encuentra en una versión Beta aún, pero se puede utilizar sin mayor problema.

En mi caso esta es la parte de la configuración básica personalizada que he hecho.

```
# terminal emulator
super + Return
	konsole

# program launcher
super + d
	rofi -show drun

super + e
	microsoft-edge
```

Pero después tenemos otras "cositas".

En el caso del power menu, lo lanzo de la siguiente manera. Has de saber que tienes que tenerlo instalado para poder utilizarlo, en la carpeta de configuración de Rofi, viene con un tema ya instalado que es el que yo utilizo, pero puedes cambiarlo por uno más de tu agrado.

```
super + p
	rofi -show power-menu -modi power-menu:~/.config/rofi/rofi-power-menu/rofi-power-menu

```

Luego tenemos otro par de configuraciones importantes.

```
# VOLUME KEYS
XF86AudioRaiseVolume
    pactl set-sink-volume 0 +5%
XF86AudioLowerVolume
    pactl set-sink-volume 0 -5%
XF86AudioMute
    pactl set-sink-mute 0 toggle

# BRIGHTNESS KEYS
XF86MonBrightnessUp
	brightnessctl set +10%
XF86MonBrightnessDown
	brightnessctl set 10%-
```

Como puedes observar, la primera parte consiste en setear las teclas de volumen en tu teclado para poder manipularlo sin necesidad de tener que utilizar alguna utilidad en el polybar.

La segunda parte consiste en setear las teclas de brillo en caso de que al igual que yo tengas una laptop. En esta parte he de señalar que es importante instalar Brightnessctl para poder hacer de esta función y conceder los permisos necesarios al archivo que se encuentra en los backlist de tu equipo.

## NAVEGACIÓN ENTRE ESPACIOS DE TRABAJO DE UNO O MÁS MONITORES
Como mencioné en un inicio, tengo dos monitores y por tanto 10 espacios de trabajo en cada uno, ¿Cómo he conseguido hacer eso y sobre todo navegar entre ellos?

```
super + {_,shift + } {1,2} ; {1-9,0}
	notify-send "changing desktop"; \
	bspc {desktop -f, node -d} "^{1,2}:^{1-9,10}"

```

Como puedes ver he cambiado la forma en que navegamos entre dichos espacios de trabajo, los números que se encuentran entre las dos llaves {1,2} hacen referencia a los escritorios, por lo que si tienes más monitores puedes indicar el número de monitor ej: {1,2,3}, para poder pasar un programa o ventana  entre ellos tendrás que usar la tecla super o windows + shift + el número del monitor al que quieres ir, una vez hecho esto soltarás la combinación de teclas e inmediatamente presionará el número de espacio de trabajo al que deseas enviar dicha ventana o programa.
Para la nevegación solo basta con hacer el mismo proceso pero sin presionar la tecla shift.

## ROFI
Aquí no hay mucho que decir, dentro de la carpeta encontrarás el archivo de configuración que te permite cambiar los temas tanto del DMenu como del PowerMenu.

## Neofetch
Al igual que Rofi, en el archivo de configuración podrás ver cómo es que está construido de tal forma que puedas visualizar en un formato distinto las características de tu equipo.