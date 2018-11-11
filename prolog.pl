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
pos(1,3).
pos(2,4).
pos(3,4).
pos(4,4).
miembro(X,[X,_,_,_]):-
  X = Lista,
  pos(1,N),
  longitud(Lista,N).
miembro(X,[_,X,_,_]):-
  X = Lista,
  pos(2,N),
  longitud(Lista,N).
miembro(X,[_,_,X,_]):-
  X = Lista,
  pos(3,N),
  longitud(Lista,N).
miembro(X,[_,_,_,X]):-
  X = Lista,
  pos(4,N),
  longitud(Lista,N).
ubicacion1(X,[X,_,_,_]).
ubicacion2(X,[_,X,_,_]).
ubicacion3(X,[_,_,X,_]).
ubicacion4(X,[_,_,_,X]).
sol(C):-
ubicacion3([a,s,n,o],C),
  miembro([a,s,n,o],C),
  miembro([c,o,m,o],C),
  miembro([l,e,o,n],C),
  miembro([s,o,l],C),
 ubicacion1(X1,C),
    ubicacion3(Y1,C),
    posicion(X1,1,Letra1),
    posicion(Y1,2,Letra1),
 ubicacion1(X2,C),
    ubicacion4(Y2,C),
    posicion(X2,3,Letra2),
    posicion(Y2,1,Letra2),
 ubicacion2(X3,C),
    ubicacion3(Y3,C),
    posicion(X3,2,Letra3),
    posicion(Y3,4,Letra3),
 ubicacion2(X4,C),
    ubicacion4(Y4,C),
    posicion(X4,4,Letra4),
    posicion(Y4,3,Letra4).
