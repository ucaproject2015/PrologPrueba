mario:-
	new(Ventana, dialog('Labo 7')),
	send(Ventana, size(size(170, 170))),
	new(Icono, device),
	new(Imagen, image('mario.bmp')),
	send(Icono, display, bitmap(Imagen)),
	send(Icono, flush),
	send(Ventana, display,  Icono, point(0, 0)),
	send(Ventana, open),
	flush_output,
	animacion(Ventana,Icono, 0).
%%%%HOLA ESTA ES UNA PRUEBA DE CAMBIOS
CAMBIASFJKGNKNFBKG

animacion(Ventana,_,40):-
	free(Ventana).

animacion(Ventana,Icono, Cont):-
	new(Imagen2, image('mario2.bmp')),
	sleep(0.1),
	send(Icono, display, bitmap(Imagen2)),
	send(Ventana, display,  Icono, point(0, 0)),
	new(Imagen3, image('mario3.bmp')),
	sleep(0.1),
	send(Icono, display, bitmap(Imagen3)),
	send(Ventana, display,  Icono, point(0, 0)),
	new(Imagen4, image('mario4.bmp')),
	sleep(0.1),
	send(Icono, display, bitmap(Imagen4)),
	send(Ventana, display,  Icono, point(0, 0)),
	is(Aux, +(Cont, 1)),
	animacion(Ventana, Icono, Aux).

iniciar:-
	new(Ventana, dialog('Labo 7')),
	send(Ventana, size(size(300, 300))),
	new(Nombre, text_item(nombre)),
	new(Apellido, text_item(apellido)),
	new(Direccion, text_item(direcion)),
	new(Sexo, menu(sexo, mark)),
	send_list(Sexo, append, [hombre, mujer]),
	new(Dia, menu(dia, cycle)),
	send_list(Dia, append, [lunes, martes, miercoles, jueves, viernes, sabado, domingo]),
	new(Mes, menu(mes, cycle)),
	send_list(Mes, append, [enero, febrero, marzo, abril, mayo, junio, julio, agosto, septiembre, octubre, noviembre, diciembre]),
	new(Ano, menu(año, cycle)),
	anos(Anos),
	send_list(Ano, append, Anos),
	new(Aceptar, button(aceptar, and( message(@prolog,printf,Nombre?selection,Apellido?selection,Direccion?selection,Sexo?selection,Dia?selection,Mes?selection,Ano?selection), message(Ventana, destroy) ))),
	new(Cancelar, button(cancelar, message(Ventana, destroy))),

	send(Ventana, append(Nombre)),
	send(Ventana, append(Apellido)),
	send(Ventana, append(Direccion)),
	send(Ventana, append(Sexo)),
	send(Ventana, append(Dia)),
	send(Ventana, append(Mes)),
	send(Ventana, append(Ano)),
	send(Ventana, append(Aceptar)),
	send(Ventana, append(Cancelar)),
	send(Ventana, open).

printf(Nombre, Apellido, Direccion, Sexo, Dia, Mes, Ano):-
	writeln('Los datos son'),
	write('Nombre: '), writeln(Nombre),
	write('Apellido: '), writeln(Apellido),
	write('Direccion: '), writeln(Direccion),
	write('Sexo: '), writeln(Sexo),
	write('Dia: '), writeln(Dia),
	write('Mes: '), writeln(Mes),
	write('Año: '), writeln(Ano).

anos(LS):-
	llenar(LP, 1930),
	reverse(LP, LS).

llenar(LS, Ano):-
	<(Ano, 2016),
	is(AnoAux, +(Ano, 1)),
	llenar(Aux,AnoAux),
	=(LS, [Ano|Aux]).

llenar([2015],2015):- !.

%%
%*Nombre,Apellidos y Direccion (3 TextBox)
%            *Sexo (ComboBox con 3 Opciones)
%            *Dia, Mes, Año (3 Listas desplegables)
%	     *Boton Aceptar( que debera llamar una clausula que haga que
%	     muestre el contenido que se ha introducido)
%            *Boton
%	     Cancelar( que simplemente cierra el formulario)
%
