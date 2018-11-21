pos(1,7).
pos(2,5).
pos(3,5).
pos(4,7).
pos(5,8).
pos(6,4).
pos(7,5).
pos(8,5).
pos(9,4).
pos(10,8).
pos(11,7).
pos(12,5).
pos(13,5).
pos(14,7).
pos(15,5).
pos(16,7).
pos(17,7).
pos(18,5).
pos(19,8).
pos(20,4).
pos(21,5).
pos(22,5).
pos(23,4).
pos(24,8).
pos(25,5).
pos(26,7).
pos(27,7).
pos(28,5).
gratis(23,[n,i,ñ,o]).
interseccion(Palabra1, Palabra2, Lugar1, Lugar2):-
	nth1(Lugar1, Palabra1, Letra),
	nth1(Lugar2, Palabra2, Letra).

tomarPalabra(Lista, Palabra, Tam, Nueva):-
	select(Palabra, Lista, Nueva),
	length(Palabra, Tam).

tomaListaIntersecciones(ListaIntersecciones,Interseccion,PosGratis,NuevaListaIntersecciones):-
	select(Interseccion,ListaIntersecciones,NuevaListaIntersecciones),
	Interseccion=inter(PosGratis,_,_,_),!.

tomaListaIntersecciones(ListaIntersecciones,Interseccion,PosGratis,NuevaListaIntersecciones):-
	select(Interseccion,ListaIntersecciones,NuevaListaIntersecciones),
	Interseccion=inter(_,PosGratis,_,_),!.

agregaSolucionHorizontal(ListaSolucion,PalabraObtenida,PosPal,NuevaSolucion, ListaIntersecciones, NuevaListaIntersecciones):-
	verificaInterseccionesHorizontal(PalabraObtenida, PosPal, ListaSolucion, ListaIntersecciones, NuevaListaIntersecciones),
	sacarListaPosicion(ListaSolucion,PosPal,NuevaSolucionAux),
	agregarListaPosicion(NuevaSolucionAux,PosPal,PalabraObtenida,NuevaSolucion).

agregaSolucionVertical(ListaSolucion,PalabraObtenida,PosPal,NuevaSolucion, ListaIntersecciones, NuevaListaIntersecciones):-
	verificaInterseccionesVertical(PalabraObtenida, PosPal, ListaSolucion, ListaIntersecciones, NuevaListaIntersecciones),
	sacarListaPosicion(ListaSolucion,PosPal,NuevaSolucionAux),
	agregarListaPosicion(NuevaSolucionAux,PosPal,PalabraObtenida,NuevaSolucion).

sacarListaPosicion([[]|Cola],1,Cola).

sacarListaPosicion([Cabeza|Cola],Pos,NuevaLista):-
	Pos>1,
	PosAux is Pos -1,
	sacarListaPosicion(Cola,PosAux,NuevaListaAux),
	NuevaLista=[Cabeza|NuevaListaAux].

agregarListaPosicion(Lista,1,PalabraObtenida,NuevaLista):-
	NuevaLista=[PalabraObtenida|Lista].
	
agregarListaPosicion([Cabeza|Cola],Pos,PalabraObtenida,NuevaLista):-
	Pos>1,
	PosAux is Pos - 1,
	agregarListaPosicion(Cola,PosAux,PalabraObtenida,NuevaListaAux),
	NuevaLista=[Cabeza|NuevaListaAux].

/*horizontal*/

solucionGratis(ListaPalabras, ListaSolucion, Solucion, ListaIntersecciones):-
	gratis(PosGratis,PalabraGratis),
	agregaSolucionHorizontal(ListaSolucion, PalabraGratis, PosGratis, ListaSolAux, ListaIntersecciones,_),
	tomaListaIntersecciones(ListaIntersecciones,Interseccion,PosGratis, AuxListaIntersecciones),
	inter(PosGratis,PosPalVertical,PosLetraHorizontal,PosLetraVertical)=Interseccion,
	pos(PosPalVertical,Tam),
	tomarPalabra(ListaPalabras,PalabraObtenida,Tam,NuevaListaPalabras),
	interseccion(PalabraGratis,PalabraObtenida,PosLetraHorizontal,PosLetraVertical),
	agregaSolucionVertical(ListaSolAux,PalabraObtenida,PosPalVertical,NuevaSolucion, AuxListaIntersecciones, NuevaListaIntersecciones),
	solucion(NuevaListaPalabras,NuevaSolucion,SolucionAux,NuevaListaIntersecciones),
	Solucion = SolucionAux.

/*vertical*/
solucionGratis(ListaPalabras, ListaSolucion, Solucion, ListaIntersecciones):-
	gratis(PosGratis,PalabraGratis),
	agregaSolucionVertical(ListaSolucion, PalabraGratis, PosGratis, ListaSolAux, ListaIntersecciones,_),!,
	tomaListaIntersecciones(ListaIntersecciones,Interseccion,PosGratis,AuxListaIntersecciones),
	inter(PosPalHorizontal, PosGratis, PosLetraHorizontal, PosLetraVertical) = Interseccion,
	pos(PosPalHorizontal,Tam),
	tomarPalabra(ListaPalabras,PalabraObtenida,Tam,NuevaListaPalabras),
	interseccion(PalabraObtenida, PalabraGratis, PosLetraHorizontal, PosLetraVertical),
	agregaSolucionHorizontal(ListaSolAux, PalabraObtenida, PosPalHorizontal, NuevaSolucion, AuxListaIntersecciones, NuevaListaIntersecciones),
	solucion(NuevaListaPalabras, NuevaSolucion, SolucionAux, NuevaListaIntersecciones),
	Solucion = SolucionAux.
solucion([], Solucion, Solucion,_).

/* horizontal */
solucion(ListaPalabras, ListaSolucion, Solucion, ListaIntersecciones):-
	tomarPalabra(ListaSolucion, Palabra,Aux,_),
	Aux > 0,
	nth1(PosPalabra, ListaSolucion, Palabra),
	tomaListaIntersecciones(ListaIntersecciones,Interseccion,PosPalabra,AuxListaIntersecciones),
	inter(PosPalabra, PosPalVertical,PosLetraHorizontal,PosLetraVertical)=Interseccion,
	pos(PosPalVertical,Tam),
	tomarPalabra(ListaPalabras,PalabraObtenida,Tam,NuevaListaPalabras),
	interseccion(Palabra,PalabraObtenida,PosLetraHorizontal,PosLetraVertical),
	agregaSolucionVertical(ListaSolucion,PalabraObtenida,PosPalVertical,NuevaSolucion, AuxListaIntersecciones, NuevaListaIntersecciones),
	solucion(NuevaListaPalabras,NuevaSolucion,SolucionAux,NuevaListaIntersecciones),
	Solucion = SolucionAux.

/*vertical*/
solucion(ListaPalabras, ListaSolucion, Solucion, ListaIntersecciones):-
	tomarPalabra(ListaSolucion, Palabra,Aux,_),
	Aux > 0,
	nth1(PosPalabra, ListaSolucion, Palabra),
	tomaListaIntersecciones(ListaIntersecciones,Interseccion,PosPalabra,AuxListaIntersecciones),!,
	inter(PosPalHorizontal,PosPalabra, PosLetraHorizontal,PosLetraVertical)=Interseccion,
	pos(PosPalHorizontal,Tam),
	tomarPalabra(ListaPalabras,PalabraObtenida,Tam,NuevaListaPalabras),
	interseccion(PalabraObtenida,Palabra,PosLetraHorizontal,PosLetraVertical),
	agregaSolucionHorizontal(ListaSolucion,PalabraObtenida,PosPalHorizontal,NuevaSolucion, AuxListaIntersecciones, NuevaListaIntersecciones),
	solucion(NuevaListaPalabras,NuevaSolucion,SolucionAux,NuevaListaIntersecciones),
	Solucion = SolucionAux.
    
resolver(ListaPalabras, Aux, Solucion, ListaIntersecciones):-
	solucionGratis(ListaPalabras, Aux, Solucion, ListaIntersecciones).

noHayInterseccionesHorizontal(_,[]).
noHayInterseccionesHorizontal(PosPal,[Cabeza|Cola]):-
	Cabeza = inter(Pos,_,_,_),
	PosPal \= Pos,
	noHayInterseccionesHorizontal(PosPal, Cola).	

verificaInterseccionesHorizontal(_,PosPal,_, ListaIntersecciones, ListaIntersecciones):-
	noHayInterseccionesHorizontal(PosPal,ListaIntersecciones).

verificaInterseccionesHorizontal(Palabra, PosPal, ListaSolucion, ListaIntersecciones, NuevaListaIntersecciones):-
	tomaListaIntersecciones(ListaIntersecciones, inter(PosPal, PosOtra, PosLetraPal, PosLetraOtra), PosPal, AuxListaIntersecciones),
	nth1(PosOtra, ListaSolucion, Otra),
	interseccion(Palabra, Otra, PosLetraPal, PosLetraOtra),
	verificaInterseccionesHorizontal(Palabra, PosPal, ListaSolucion, AuxListaIntersecciones, Aux2ListaIntersecciones),
	NuevaListaIntersecciones = Aux2ListaIntersecciones.

verificaInterseccionesHorizontal(Palabra, PosPal, ListaSolucion, ListaIntersecciones, NuevaListaIntersecciones):-
	tomaListaIntersecciones(ListaIntersecciones, inter(PosPal, PosOtra, PosLetraPal, PosLetraOtra), PosPal, AuxListaIntersecciones),
	nth1(PosOtra, ListaSolucion, []),
	verificaInterseccionesHorizontal(Palabra, PosPal, ListaSolucion, AuxListaIntersecciones, Aux2ListaIntersecciones),
	NuevaListaIntersecciones = [inter(PosPal, PosOtra, PosLetraPal, PosLetraOtra)|Aux2ListaIntersecciones].

noHayInterseccionesVertical(_,[]).
noHayInterseccionesVertical(PosPal,[Cabeza|Cola]):-
	Cabeza = inter(_,Pos,_,_),
	PosPal \= Pos,
	noHayInterseccionesVertical(PosPal, Cola).

verificaInterseccionesVertical(_,PosPal,_, ListaIntersecciones, ListaIntersecciones):-
	noHayInterseccionesVertical(PosPal,ListaIntersecciones).

verificaInterseccionesVertical(Palabra, PosPal, ListaSolucion, ListaIntersecciones, NuevaListaIntersecciones):-
	tomaListaIntersecciones(ListaIntersecciones, inter(PosOtra, PosPal, PosLetraOtra, PosLetraPal), PosPal, AuxListaIntersecciones),
	nth1(PosOtra, ListaSolucion, Otra),
	interseccion(Otra, Palabra, PosLetraOtra, PosLetraPal),
	verificaInterseccionesVertical(Palabra, PosPal, ListaSolucion, AuxListaIntersecciones, Aux2ListaIntersecciones),
	NuevaListaIntersecciones = Aux2ListaIntersecciones.

verificaInterseccionesVertical(Palabra, PosPal, ListaSolucion, ListaIntersecciones, NuevaListaIntersecciones):-
	tomaListaIntersecciones(ListaIntersecciones, inter(PosOtra, PosPal, PosLetraOtra, PosLetraPal), PosPal, AuxListaIntersecciones),
	nth1(PosOtra, ListaSolucion, []),
	verificaInterseccionesVertical(Palabra, PosPal, ListaSolucion, AuxListaIntersecciones, Aux2ListaIntersecciones),
	NuevaListaIntersecciones = [inter(PosOtra, PosPal, PosLetraOtra, PosLetraPal)|Aux2ListaIntersecciones].