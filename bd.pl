%--------------------------------------------------Hechos----------------------------------------------------------------------------------------------------------

%Restaurantes
%Se guarda en la bd los 5 restaunrestes que va a manejar nuestra aplicacion 
%restaurante(X) X= alguno de los restaurantes 

restaurante(bellaItalia).
restaurante(mcBurguesa).
restaurante(italianisimo).
restaurante(asadoCR).
restaurante(miTierra).

%Comidas
%Se guarda el tipo de comida segun el restaurante  
%comida(X,Y) X= restaurante, Y = la comida.
 
comida(bellaItalia,pizza,jamon).
comida(bellaItalia,calzone).
comida(bellaItalia,espagueti).
comida(bellaItalia,lazana).

%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
comida(mcBurguesa,hamburguesas).
comida(mcBurguesa,hamburguesa).
comida(mcBurguesa,tacos).
comida(mcBurguesa,papas).
comida(mcBurguesa,pollofrito).
comida(mcBurguesa,salchipapas).

%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

comida(italianisimo,calzone).
comida(italianisimo,espagueti).
comida(italianisimo,pizza).
comida(italianisimo,lazana).
comida(italianisimo,risoto).
comida(italianisimo,carpachio).

%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

comida(asadoCR,lomo).
comida(asadoCR,chicharron).
comida(asadoCR,costilla).
comida(asadoCR,alistas).

%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

comida(miTierra,casado).
comida(miTierra,galloPinto).
comida(miTierra,ollaCarne).
comida(miTierra,tortaHuevo).

%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

%Se gurada el tipo de bebida segun el restaurante
%bebida(X,Z) donde X = restaurante, Y = topo de bebida
bebida(bellaItalia,vinoTinto).
bebida(bellaItalia,cerveza).
bebida(bellaItalia,frescoNatural).
bebida(bellaItalia,gaseosa).

%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

bebida(italianisimo,vinoTinto).
bebida(italianisimo,cerveza).
bebida(italianisimo,frescoNatural).

%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

bebida(asadoCR,vinoTinto).
bebida(asadoCR,cerveza).
bebida(asadoCR,guaro).
bebida(asadoCR,frescoNatural).

%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

bebida(miTierra,vinoTinto).
bebida(miTierra,cerveza).
bebida(miTierra,guaro).
bebida(miTierra,frescoNatural).

%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

bebida(mcBurguesa,gaseosa).
bebida(mcBurguesa,cerveza).
bebida(mcBurguesa,frescoNatural).

%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

%Capacidad de un local 
%capacidad(X,Num) X = restaunraten , Num = numero maximo de persona que recibe el restaurante 
capacidad(bellaItalia,10).
capacidad(mcBurguesa,20).
capacidad(italianisimo,50).
capacidad(asadoCR,25).
capacidad(miTierra,30).

%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

%Lugar en el cual se encuntra el restaurante 
lugar(X,W) X = restaurante , W = lugar donde se encuantra el restuarante   
lugar(bellaItalia,sanPedro).
lugar(mcBurguesa,cartago).
lugar(italianisimo,alajuela).
lugar(asadoCR,cartago).
lugar(miTierra,heredia).

%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

%Direcion excata donde se encuanta cada restaunrante 

direccion(bellaItalia,"100m Norte de la entrada principal de la Ciudad de la Investigacion").
direccion(mcBurguesa,"50m Sur de la entrada Banco de Costa Rica").
direccion(italianisimo,"50m Sur del estadio Alejandro Morea Soto").
direccion(miTierra," 250m Sur de la Basilica de los Angeles").
direccion(asadoCR," 25m norte de la entrada principal de la UNA").

%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

%Dispociosiones salubles impuestas por cada restaurante a sus clientes 
dispocisiones(bellaItalia,"Solo se permiten burbujas").
dispocisiones(mcBurguesa,"Solo se permiten burbujas recordar el uso de mascarilla y el lavado de manos antes de ingresar al local").
dispocisiones(italianisimo ,"Recordar el uso de mascarilla y el lavado de manos antes de ingresar al local").
dispocisiones(asadoCR," Recuerde que debemos cuidarnos, utilice la mascarilla y haga el lavado de manos adecuado antes de entrar al local").
dispocisiones(miTierra,"Venga con su burbuja social y protejamonos todos").

%---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

%Funcio utilizada para que el ordenaor descua segun los echos de la base de datos y las reglas impelementadas en la funcion
%un restaurante que cumpla con todos los requisitos
dondeComer(RESTAURANTE,COMIDA,LUGAR,BEBIDA,Npersonas,TP) :- restaurante(RESTAURANTE),
    comida(RESTAURANTE,COMIDA,TP);
    comida(RESTAURANTE,COMIDA),
    bebida(RESTAURANTE,BEBIDA),
    lugar(RESTAURANTE,LUGAR),
    capacidad(RESTAURANTE,Capacidad),Capacidad>Npersonas.

