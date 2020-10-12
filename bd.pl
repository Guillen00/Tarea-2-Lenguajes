restaurante(bellaItalia).
restaurante(mcBurguesa).
restaurante(italianisimo).
restaurante(asadoCR).
restaurante(miTierra).


comida(bellaItalia,pizza,jamon).
comida(bellaItalia,calzone).
comida(bellaItalia,espagueti).
comida(bellaItalia,lazana).


comida(mcBurguesa,hamburguesas).
comida(mcBurguesa,hamburguesa).
comida(mcBurguesa,tacos).
comida(mcBurguesa,papas).
comida(mcBurguesa,pollofrito).
comida(mcBurguesa,salchipapas).

comida(italianisimo,calzone).
comida(italianisimo,espagueti).
comida(italianisimo,pizza).
comida(italianisimo,lazana).
comida(italianisimo,risoto).
comida(italianisimo,carpachio).

comida(asadoCR,lomo).
comida(asadoCR,chicharron).
comida(asadoCR,costilla).
comida(asadoCR,alistas).

comida(miTierra,casado).
comida(miTierra,galloPinto).
comida(miTierra,ollaCarne).
comida(miTierra,tortaHuevo).

bebida(bellaItalia,vinoTinto).
bebida(bellaItalia,cerveza).
bebida(bellaItalia,frescoNatural).


bebida(bellaItalia,frescoNatual).
bebida(bellaItalia,gaseosa).


bebida(italianisimo,vinoTinto).
bebida(italianisimo,cerveza).
bebida(italianisimo,frescoNatural).

bebida(asadoCR,vinoTinto).
bebida(asadoCR,cerveza).
bebida(asadoCR,guaro).
bebida(asadoCR,frescoNatural).

bebida(miTierra,vinoTinto).
bebida(miTierra,cerveza).
bebida(miTierra,guaro).
bebida(miTierra,frescoNatural).

bebida(mcBurguesa,gaseosa).
bebida(mcBurguesa,cerveza).
bebida(mcBurguesa,frescoNatural).

capacidad(bellaItalia,10).
capacidad(mcBurguesa,20).
capacidad(italianisimo,50).
capacidad(asadoCR,25).
capacidad(miTierra,30).

lugar(bellaItalia,sanPedro).
lugar(mcBurguesa,cartago).
lugar(italianisimo,alajuela).
lugar(asadoCR,cartago).
lugar(miTierra,heredia).

direccion(bellaItalia,"100m Norte de la entrada principal de la Ciudad de la Investigacion").
direccion(mcBurguesa,"50m Sur de la entrada Banco de Costa Rica").
direccion(italianisimo,"50m Sur del estadio Alejandro Morea Soto").
direccion(miTierra," 250m Sur de la Basilica de los Angeles").
direccion(asadoCR," 25m norte de la entrada principal de la UNA").

dispocisiones(bellaItalia,"Solo se permiten burbujas").
dispocisiones(mcBurguesa,"Solo se permiten burbujas recordar el uso de mascarilla y el lavado de manos antes de ingresar al local").
dispocisiones(italianisimo ,"Recordar el uso de mascarilla y el lavado de manos antes de ingresar al local").
dispocisiones(asadoCR," Recuerde que debemos cuidarnos, utilice la mascarilla y haga el lavado de manos adecuado antes de entrar al local").
dispocisiones(miTierra,"Venga con su burbuja social y protejamonos todos").




dondeComer(RESTAURANTE,COMIDA,LUGAR,BEBIDA,Npersonas,TP) :- restaurante(RESTAURANTE),
    comida(RESTAURANTE,COMIDA,TP);
    comida(RESTAURANTE,COMIDA),
    bebida(RESTAURANTE,BEBIDA),
    lugar(RESTAURANTE,LUGAR),
    capacidad(RESTAURANTE,Capacidad),Capacidad>Npersonas.

