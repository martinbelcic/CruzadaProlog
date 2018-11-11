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
pos(1,9).
pos(2,7).
pos(3,10).
pos(4,6).
pos(5,6).
pos(6,6).
pos(7,5).
pos(8,9).
pos(9,7).
pos(10,9).
pos(11,5).
pos(12,9).
pos(13,9).
pos(14,5).
pos(15,9).
pos(16,7).
pos(17,7).
pos(18,6).
pos(19,6).
pos(20,5).
pos(21,4).
pos(22,6).
pos(23,5).
pos(24,10).
pos(25,8).
pos(26,6).
pos(27,8).
pos(28,6).
pos(29,6).
pos(30,5).
pos(31,4).
pos(32,8).
pos(33,4).
pos(34,5).
pos(35,4).
pos(36,6).
pos(37,5).
miembro(X,[X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(1,N),
  longitud(Lista,N).
miembro(X,[_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(2,N),
  longitud(Lista,N).
miembro(X,[_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(3,N),
  longitud(Lista,N).
miembro(X,[_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(4,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(5,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(6,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(7,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(8,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(9,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(10,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(11,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(12,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(13,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(14,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(15,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(16,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(17,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(18,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(19,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(20,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(21,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(22,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(23,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(24,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(25,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(26,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(27,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(28,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(29,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(30,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_]):-
  X = Lista,
  pos(31,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_]):-
  X = Lista,
  pos(32,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_]):-
  X = Lista,
  pos(33,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_]):-
  X = Lista,
  pos(34,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_]):-
  X = Lista,
  pos(35,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_]):-
  X = Lista,
  pos(36,N),
  longitud(Lista,N).
miembro(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X]):-
  X = Lista,
  pos(37,N),
  longitud(Lista,N).
ubicacion1(X,[X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(1,N),
  longitud(Lista,N).
ubicacion2(X,[_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(2,N),
  longitud(Lista,N).
ubicacion3(X,[_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(3,N),
  longitud(Lista,N).
ubicacion4(X,[_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(4,N),
  longitud(Lista,N).
ubicacion5(X,[_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(5,N),
  longitud(Lista,N).
ubicacion6(X,[_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(6,N),
  longitud(Lista,N).
ubicacion7(X,[_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(7,N),
  longitud(Lista,N).
ubicacion8(X,[_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(8,N),
  longitud(Lista,N).
ubicacion9(X,[_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(9,N),
  longitud(Lista,N).
ubicacion10(X,[_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(10,N),
  longitud(Lista,N).
ubicacion11(X,[_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(11,N),
  longitud(Lista,N).
ubicacion12(X,[_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(12,N),
  longitud(Lista,N).
ubicacion13(X,[_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(13,N),
  longitud(Lista,N).
ubicacion14(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(14,N),
  longitud(Lista,N).
ubicacion15(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(15,N),
  longitud(Lista,N).
ubicacion16(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(16,N),
  longitud(Lista,N).
ubicacion17(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(17,N),
  longitud(Lista,N).
ubicacion18(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(18,N),
  longitud(Lista,N).
ubicacion19(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(19,N),
  longitud(Lista,N).
ubicacion20(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(20,N),
  longitud(Lista,N).
ubicacion21(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(21,N),
  longitud(Lista,N).
ubicacion22(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(22,N),
  longitud(Lista,N).
ubicacion23(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(23,N),
  longitud(Lista,N).
ubicacion24(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(24,N),
  longitud(Lista,N).
ubicacion25(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(25,N),
  longitud(Lista,N).
ubicacion26(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(26,N),
  longitud(Lista,N).
ubicacion27(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(27,N),
  longitud(Lista,N).
ubicacion28(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(28,N),
  longitud(Lista,N).
ubicacion29(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(29,N),
  longitud(Lista,N).
ubicacion30(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_,_]):-
  X = Lista,
  pos(30,N),
  longitud(Lista,N).
ubicacion31(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_,_]):-
  X = Lista,
  pos(31,N),
  longitud(Lista,N).
ubicacion32(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_,_]):-
  X = Lista,
  pos(32,N),
  longitud(Lista,N).
ubicacion33(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_,_]):-
  X = Lista,
  pos(33,N),
  longitud(Lista,N).
ubicacion34(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_,_]):-
  X = Lista,
  pos(34,N),
  longitud(Lista,N).
ubicacion35(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_,_]):-
  X = Lista,
  pos(35,N),
  longitud(Lista,N).
ubicacion36(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X,_]):-
  X = Lista,
  pos(36,N),
  longitud(Lista,N).
ubicacion37(X,[_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,X]):-
  X = Lista,
  pos(37,N),
  longitud(Lista,N).
sol(C):-
ubicacion23([p,a,s,e,o],C),
  miembro([a,r,a,d],C),
  miembro([a,y,e,r],C),
  miembro([o,l,o,r],C),
  miembro([s,i,c,u],C),
  miembro([a,m,a,s,o],C),
  miembro([d,i,c,a,z],C),
  miembro([n,a,i,p,e],C),
  miembro([p,a,s,e,o],C),
  miembro([r,a,z,o,n],C),
  miembro([r,e,g,u,e],C),
  miembro([s,o,p,a,n],C),
  miembro([u,s,a,r,e],C),
  miembro([a,u,s,t,r,o],C),
  miembro([e,m,u,l,a,s],C),
  miembro([h,u,i,d,o,r],C),
  miembro([i,d,o,l,o,s],C),
  miembro([m,o,v,e,i,s],C),
  miembro([o,c,u,p,a,n],C),
  miembro([o,p,e,r,a,r],C),
  miembro([r,a,y,a,n,o],C),
  miembro([r,e,l,a,m,e],C),
  miembro([u,s,a,r,a,n],C),
  miembro([a,h,u,m,a,b,a],C),
  miembro([c,e,t,o,n,i,a],C),
  miembro([o,l,e,o,s,o,s],C),
  miembro([t,e,t,u,a,n,i],C),
  miembro([a,l,e,g,a,l,e,s],C),
  miembro([a,s,o,l,a,r,o,n],C),
  miembro([o,i,r,i,a,m,o,s],C),
  miembro([a,u,m,a,ñ,e,r,o],C),
  miembro([a,t,o,m,i,z,a,d,a],C),
  miembro([c,e,r,i,f,e,r,a,s],C),
  miembro([d,e,s,o,l,a,d,o,r],C),
  miembro([i,r,o,n,i,z,a,r,a],C),
  miembro([o,r,a,c,i,o,n,e,s],C),
  miembro([e,d,i,f,i,c,a,r,a,s],C),
  miembro([e,x,i,g,i,e,r,a,i,s],C),
 ubicacion1(X1,C),
    ubicacion17(Y1,C),
    posicion(X1,1,Letra1),
    posicion(Y1,1,Letra1),
 ubicacion1(X2,C),
    ubicacion20(Y2,C),
    posicion(X2,3,Letra2),
    posicion(Y2,1,Letra2),
 ubicacion1(X3,C),
    ubicacion25(Y3,C),
    posicion(X3,8,Letra3),
    posicion(Y3,1,Letra3),
 ubicacion2(X4,C),
    ubicacion29(Y4,C),
    posicion(X4,2,Letra4),
    posicion(Y4,1,Letra4),
 ubicacion2(X5,C),
    ubicacion33(Y5,C),
    posicion(X5,5,Letra5),
    posicion(Y5,1,Letra5),
 ubicacion2(X6,C),
    ubicacion36(Y6,C),
    posicion(X6,7,Letra6),
    posicion(Y6,1,Letra6),
 ubicacion3(X7,C),
    ubicacion25(Y7,C),
    posicion(X7,1,Letra7),
    posicion(Y7,3,Letra7),
 ubicacion3(X8,C),
    ubicacion29(Y8,C),
    posicion(X8,5,Letra8),
    posicion(Y8,3,Letra8),
 ubicacion3(X9,C),
    ubicacion33(Y9,C),
    posicion(X9,8,Letra9),
    posicion(Y9,3,Letra9),
 ubicacion3(X10,C),
    ubicacion36(Y10,C),
    posicion(X10,10,Letra10),
    posicion(Y10,3,Letra10),
 ubicacion4(X11,C),
    ubicacion17(Y11,C),
    posicion(X11,1,Letra11),
    posicion(Y11,4,Letra11),
 ubicacion4(X12,C),
    ubicacion20(Y12,C),
    posicion(X12,3,Letra12),
    posicion(Y12,4,Letra12),
 ubicacion4(X13,C),
    ubicacion23(Y13,C),
    posicion(X13,5,Letra13),
    posicion(Y13,2,Letra13),
 ubicacion5(X14,C),
    ubicacion23(Y14,C),
    posicion(X14,1,Letra14),
    posicion(Y14,4,Letra14),
 ubicacion5(X15,C),
    ubicacion25(Y15,C),
    posicion(X15,4,Letra15),
    posicion(Y15,6,Letra15),
 ubicacion5(X16,C),
    ubicacion27(Y16,C),
    posicion(X16,6,Letra16),
    posicion(Y16,2,Letra16),
 ubicacion6(X17,C),
    ubicacion29(Y17,C),
    posicion(X17,1,Letra17),
    posicion(Y17,6,Letra17),
 ubicacion6(X18,C),
    ubicacion31(Y18,C),
    posicion(X18,3,Letra18),
    posicion(Y18,2,Letra18),
 ubicacion6(X19,C),
    ubicacion34(Y19,C),
    posicion(X19,5,Letra19),
    posicion(Y19,1,Letra19),
 ubicacion6(X20,C),
    ubicacion36(Y20,C),
    posicion(X20,6,Letra20),
    posicion(Y20,6,Letra20),
 ubicacion7(X21,C),
    ubicacion17(Y21,C),
    posicion(X21,1,Letra21),
    posicion(Y21,7,Letra21),
 ubicacion7(X22,C),
    ubicacion19(Y22,C),
    posicion(X22,2,Letra22),
    posicion(Y22,1,Letra22),
 ubicacion7(X23,C),
    ubicacion21(Y23,C),
    posicion(X23,4,Letra23),
    posicion(Y23,1,Letra23),
 ubicacion7(X24,C),
    ubicacion23(Y24,C),
    posicion(X24,5,Letra24),
    posicion(Y24,5,Letra24),
 ubicacion8(X25,C),
    ubicacion24(Y25,C),
    posicion(X25,2,Letra25),
    posicion(Y25,1,Letra25),
 ubicacion8(X26,C),
    ubicacion25(Y26,C),
    posicion(X26,3,Letra26),
    posicion(Y26,8,Letra26),
 ubicacion8(X27,C),
    ubicacion27(Y27,C),
    posicion(X27,5,Letra27),
    posicion(Y27,4,Letra27),
 ubicacion8(X28,C),
    ubicacion30(Y28,C),
    posicion(X28,7,Letra28),
    posicion(Y28,1,Letra28),
 ubicacion8(X29,C),
    ubicacion31(Y29,C),
    posicion(X29,9,Letra29),
    posicion(Y29,4,Letra29),
 ubicacion9(X30,C),
    ubicacion19(Y30,C),
    posicion(X30,2,Letra30),
    posicion(Y30,4,Letra30),
 ubicacion9(X31,C),
    ubicacion21(Y31,C),
    posicion(X31,4,Letra31),
    posicion(Y31,4,Letra31),
 ubicacion9(X32,C),
    ubicacion24(Y32,C),
    posicion(X32,7,Letra32),
    posicion(Y32,3,Letra32),
 ubicacion10(X33,C),
    ubicacion27(Y33,C),
    posicion(X33,2,Letra33),
    posicion(Y33,6,Letra33),
 ubicacion10(X34,C),
    ubicacion30(Y34,C),
    posicion(X34,4,Letra34),
    posicion(Y34,3,Letra34),
 ubicacion10(X35,C),
    ubicacion32(Y35,C),
    posicion(X35,6,Letra35),
    posicion(Y35,1,Letra35),
 ubicacion10(X36,C),
    ubicacion34(Y36,C),
    posicion(X36,8,Letra36),
    posicion(Y36,5,Letra36),
 ubicacion10(X37,C),
    ubicacion37(Y37,C),
    posicion(X37,9,Letra37),
    posicion(Y37,1,Letra37),
 ubicacion11(X38,C),
    ubicacion18(Y38,C),
    posicion(X38,1,Letra38),
    posicion(Y38,1,Letra38),
 ubicacion11(X39,C),
    ubicacion19(Y39,C),
    posicion(X39,2,Letra39),
    posicion(Y39,6,Letra39),
 ubicacion11(X40,C),
    ubicacion22(Y40,C),
    posicion(X40,4,Letra40),
    posicion(Y40,1,Letra40),
 ubicacion12(X41,C),
    ubicacion24(Y41,C),
    posicion(X41,1,Letra41),
    posicion(Y41,5,Letra41),
 ubicacion12(X42,C),
    ubicacion26(Y42,C),
    posicion(X42,3,Letra42),
    posicion(Y42,1,Letra42),
 ubicacion12(X43,C),
    ubicacion27(Y43,C),
    posicion(X43,4,Letra43),
    posicion(Y43,8,Letra43),
 ubicacion12(X44,C),
    ubicacion28(Y44,C),
    posicion(X44,5,Letra44),
    posicion(Y44,1,Letra44),
 ubicacion12(X45,C),
    ubicacion30(Y45,C),
    posicion(X45,6,Letra45),
    posicion(Y45,5,Letra45),
 ubicacion12(X46,C),
    ubicacion32(Y46,C),
    posicion(X46,8,Letra46),
    posicion(Y46,3,Letra46),
 ubicacion13(X47,C),
    ubicacion22(Y47,C),
    posicion(X47,2,Letra47),
    posicion(Y47,3,Letra47),
 ubicacion13(X48,C),
    ubicacion24(Y48,C),
    posicion(X48,5,Letra48),
    posicion(Y48,7,Letra48),
 ubicacion13(X49,C),
    ubicacion26(Y49,C),
    posicion(X49,7,Letra49),
    posicion(Y49,3,Letra49),
 ubicacion13(X50,C),
    ubicacion28(Y50,C),
    posicion(X50,9,Letra50),
    posicion(Y50,3,Letra50),
 ubicacion14(X51,C),
    ubicacion32(Y51,C),
    posicion(X51,2,Letra51),
    posicion(Y51,5,Letra51),
 ubicacion14(X52,C),
    ubicacion35(Y52,C),
    posicion(X52,4,Letra52),
    posicion(Y52,1,Letra52),
 ubicacion14(X53,C),
    ubicacion37(Y53,C),
    posicion(X53,5,Letra53),
    posicion(Y53,5,Letra53),
 ubicacion15(X54,C),
    ubicacion18(Y54,C),
    posicion(X54,1,Letra54),
    posicion(Y54,5,Letra54),
 ubicacion15(X55,C),
    ubicacion22(Y55,C),
    posicion(X55,4,Letra55),
    posicion(Y55,5,Letra55),
 ubicacion15(X56,C),
    ubicacion24(Y56,C),
    posicion(X56,7,Letra56),
    posicion(Y56,9,Letra56),
 ubicacion15(X57,C),
    ubicacion26(Y57,C),
    posicion(X57,9,Letra57),
    posicion(Y57,5,Letra57),
 ubicacion16(X58,C),
    ubicacion28(Y58,C),
    posicion(X58,1,Letra58),
    posicion(Y58,5,Letra58),
 ubicacion16(X59,C),
    ubicacion32(Y59,C),
    posicion(X59,4,Letra59),
    posicion(Y59,7,Letra59),
 ubicacion16(X60,C),
    ubicacion35(Y60,C),
    posicion(X60,6,Letra60),
    posicion(Y60,3,Letra60).