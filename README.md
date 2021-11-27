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
Del resto la polybar tiene varios módulos que en lo personal me sirven para poder estar al tanto de algunas cosas relacionadas con el funcioamiento
del equipo, tal como lo es la batería, la temperatura, el volumen, procesador y memoria que está consumiento el equipo en tiempo real.
Cuenta además con dos módulos de redes.
- IP Local: Este lo que hace es verificar que en mi caso la wlo1 tenga una dirección IP asignada, de tenerla nos la pintará en la poly, en caso de no ser así este simplemente muestra un mensaje e icóno que nos indica que el equipo no está conectado a la red.
- IP HTB: Este hace la misma función que el anterior solo que está pensado para verificar si tenemos alguna conexión por tunel en la interfaz 0 con alguna vpn que en mi caso sería la de Hack The Box, pero funciona con cualquier otra conexión.

Estos módulos dependen de dos scripts que se encuentran en la carpeta BIN, los cuales se ejecutan en interválos de cada 2 segundos.

