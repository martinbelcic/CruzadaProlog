pos(1,4).
pos(2,4).
pos(3,5).
pos(4,8).
pos(5,8).
pos(6,7).
pos(7,4).
pos(8,5).
pos(9,4).
gratis(5,[p,i,j,a,b,a,b,a]).
interseccion(Palabra1, Palabra2, Lugar1, Lugar2):-
	nth1(Lugar1, Palabra1, Letra),
	nth1(Lugar2, Palabra2, Letra).

tomarPalabra(Lista, Palabra, Tam, Nueva):-
	select(Palabra, Lista, Nueva),
	length(Palabra, Tam).

tomaListaIntersecciones(ListaIntersecciones,Interseccion,PosGratis,NuevaListaIntersecciones):-
	select(Interseccion,ListaIntersecciones,NuevaListaIntersecciones),
	Interseccion=inter(PosGratis,_,_,_).

tomaListaIntersecciones(ListaIntersecciones,Interseccion,PosGratis,NuevaListaIntersecciones):-
	select(Interseccion,ListaIntersecciones,NuevaListaIntersecciones),
	Interseccion=inter(_,PosGratis,_,_).

agregaSolucion(ListaSolucion,PalabraObtenida,PosPalVertical,NuevaSolucion):-
	sacarListaPosicion(ListaSolucion,PosPalVertical,NuevaSolucionAux),
	agregarListaPosicion(NuevaSolucionAux,PosPalVertical,PalabraObtenida,NuevaSolucion).

sacarListaPosicion([_|Cola],1,Cola).

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
	agregaSolucion(ListaSolucion, PalabraGratis, PosGratis, ListaSolAux),
	tomaListaIntersecciones(ListaIntersecciones,Interseccion,PosGratis,NuevaListaIntersecciones),
	inter(PosGratis,PosPalVertical,PosLetraHorizontal,PosLetraVertical)=Interseccion,
	pos(PosPalVertical,Tam),
	tomarPalabra(ListaPalabras,PalabraObtenida,Tam,NuevaListaPalabras),
	interseccion(PalabraGratis,PalabraObtenida,PosLetraHorizontal,PosLetraVertical),
	agregaSolucion(ListaSolAux,PalabraObtenida,PosPalVertical,NuevaSolucion),
	solucion(NuevaListaPalabras,NuevaSolucion,SolucionAux,NuevaListaIntersecciones),
	Solucion = SolucionAux.

/*vertical*/
solucionGratis(ListaPalabras, ListaSolucion, Solucion, ListaIntersecciones):-
	gratis(PosGratis,PalabraGratis),
	agregaSolucion(ListaSolucion, PalabraGratis, PosGratis, ListaSolAux),
	tomaListaIntersecciones(ListaIntersecciones,Interseccion,PosGratis,NuevaListaIntersecciones),
	inter(PosPalHorizontal, PosGratis, PosLetraHorizontal, PosLetraVertical) = Interseccion,
	pos(PosPalHorizontal,Tam),
	tomarPalabra(ListaPalabras,PalabraObtenida,Tam,NuevaListaPalabras),
	interseccion(PalabraObtenida, PalabraGratis, PosLetraHorizontal, PosLetraVertical),
	agregaSolucion(ListaSolAux, PalabraObtenida, PosPalHorizontal, NuevaSolucion),
	solucion(NuevaListaPalabras, NuevaSolucion, SolucionAux, NuevaListaIntersecciones),
	Solucion = SolucionAux.
solucion([], Solucion, Solucion,_).

/* horizontal */
solucion(ListaPalabras, ListaSolucion, Solucion, ListaIntersecciones):-
	tomarPalabra(ListaSolucion, Palabra,_,_),
	nth1(PosPalabra, ListaSolucion, Palabra),
	tomaListaIntersecciones(ListaIntersecciones,Interseccion,PosPalabra,NuevaListaIntersecciones),
	inter(PosPalabra, PosPalVertical,PosLetraHorizontal,PosLetraVertical)=Interseccion,
	pos(PosPalVertical,Tam),
	tomarPalabra(ListaPalabras,PalabraObtenida,Tam,NuevaListaPalabras),
	interseccion(Palabra,PalabraObtenida,PosLetraHorizontal,PosLetraVertical),
	agregaSolucion(ListaSolucion,PalabraObtenida,PosPalVertical,NuevaSolucion),
	solucion(NuevaListaPalabras,NuevaSolucion,SolucionAux,NuevaListaIntersecciones),
	Solucion = SolucionAux.

/*vertical*/
solucion(ListaPalabras, ListaSolucion, Solucion, ListaIntersecciones):-
	tomarPalabra(ListaSolucion, Palabra,_,_),
	nth1(PosPalabra, ListaSolucion, Palabra),
	tomaListaIntersecciones(ListaIntersecciones,Interseccion,PosPalabra,NuevaListaIntersecciones),
	inter(PosPalHorizontal,PosPalabra, PosLetraHorizontal,PosLetraVertical)=Interseccion,
	pos(PosPalHorizontal,Tam),
	tomarPalabra(ListaPalabras,PalabraObtenida,Tam,NuevaListaPalabras),
	interseccion(PalabraObtenida,Palabra,PosLetraHorizontal,PosLetraVertical),
	agregaSolucion(ListaSolucion,PalabraObtenida,PosPalHorizontal,NuevaSolucion),
	solucion(NuevaListaPalabras,NuevaSolucion,SolucionAux,NuevaListaIntersecciones),
	Solucion = SolucionAux.
    
resolver(ListaPalabras, Aux, Solucion, ListaIntersecciones):-
	solucionGratis(ListaPalabras, Aux, Solucion, ListaIntersecciones).