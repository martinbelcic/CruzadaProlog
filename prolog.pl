longitud([],0).
longitud(Lista,N):-
    Lista = [_|Col],
    longitud(Col,M),
    N is M+1.
posicion([Cabeza|_],1,Cabeza).
posicion([_|Cola],N,X):-
    N>0,
    N1 is N-1,
    posicion(Cola,N1,X1),
    X=X1.
pos(1,4).
pos(2,4).
miembro(X,(X,_)):-
  X = Lista,
  pos(1,N),
  longitud(Lista,N).
miembro(X,(_,X)):-
  X = Lista,
  pos(2,N),
  longitud(Lista,N).
ubicacion1(X,(X,_)):-
  X = Lista,
  pos(1,N),
  longitud(Lista,N).
ubicacion2(X,(_,X)):-
  X = Lista,
  pos(2,N),
  longitud(Lista,N).
sol(C):-
ubicacion1([c,h,a,u],C),
  miembro([h,o,l,a],C),
  miembro([c,h,a,u],C),
 ubicacion1(X1,C),
    ubicacion2(Y1,C),
    posicion(X1,2,Letra1),
    posicion(Y1,1,Letra1).