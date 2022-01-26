SubProceso misiles <- radarEnemigos ( contadorDeEnemigos ) // el subproceso o funcion o metodo (puede llevar esos 3 nombres)
	
	definir misiles Como Entero;                            // devuelve el valor de la variable contador de enemigos 
	misiles = contadorDeEnemigos;                                                           // lleva el nombre de contador de enemigos
	
FinSubProceso

Algoritmo Battleship
	
	definir a,b,c como real;
	definir linea,i,p,j,k,f,l,m,q,mapa,fuerzaDeLanzamiento,lanzamiento,puntaje,enemigos,contador,contadorDeEnemigos,identificador,puntajeFallos,intentos,puntajeAcertados como entero;
	definir logo,mono,continuar,animacion,fail Como Caracter;
	Dimension mapa[10,10];
	dimension logo[25];
	Dimension mono[10];
	dimension animacion[10];
	dimension fail[11];
	
	escribir "bienvenido a.... !!Battleship¡¡";
	Escribir "este programa permite entender el funcionamiento de arreglos de forma facil y entretenida";
	Escribir " ";
	
	logo[0]<- "111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111       " ;
	logo[1]<- "11                                                                                               11       " ;
	logo[2]<- "11                                                                                               11       " ;
	logo[3]<- "11     11111111111111   1111111111111  11111111   1111    1111     1111   1111111111111111       11       " ;
	logo[4]<- "11     11111111111111   1111111111111  11111111   1111    1111    1111    1111111111111111       11       " ;
	logo[5]<- "11     1111             1111           1111 1111  1111    1111   1111     1111        1111       11       " ;
	logo[6]<- "11     1111             1111           1111  1111 1111    1111  1111      1111        1111       11       " ;
	logo[7]<- "11     1111             1111           1111   11111111    1111 1111       1111        1111       11       " ;
	logo[8]<- "11     11111111111111   1111111111111  1111    1111111    11111111        1111        1111       11       " ;
	logo[9]<- "11     11111111111111   1111111111111  1111    1111111    11111111        1111        1111       11       " ;
	logo[10]<-"11               1111   1111           1111    1111111    1111 1111       1111        1111       11       " ; 
	logo[11]<-"11               1111   1111           1111    1111111    1111  1111      1111        1111       11       " ;
	logo[12]<-"11               1111   1111           1111    1111111    1111   1111     1111        1111       11       " ;
	logo[13]<-"11     11111111111111   1111111111111  1111    1111111    1111    1111    1111111111111111       11       " ;
	logo[14]<-"11     11111111111111   1111111111111  1111    1111111    1111     1111   1111111111111111       11       " ;
	logo[15]<-"11                                                                                               11       " ;
	logo[16]<-"11          1111111111111111  111111111111   1111       1111  11111111111   11111111             11       " ;
	logo[17]<-"11          1111              1111    1111   1111111 1111111  1111          1111                 11       " ;
	logo[18]<-"11          1111              1111    1111   1111 11111 1111  1111          1111                 11       " ;
	logo[19]<-"11          1111        1111  111111111111   1111  111  1111  11111111111   11111111             11       " ;
	logo[20]<-"11          1111        1111  1111    1111   1111       1111  1111              1111             11       " ;
	logo[21]<-"11          1111111111111111  1111    1111   1111       1111  1111              1111             11       " ;
	logo[22]<-"11          1111111111111111  1111    1111   1111       1111  11111111111   11111111             11       " ;
	logo[23]<-"11                                                                                               11       " ;
	logo[24]<-"111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111       " ;
	
	mono[0] = "  )___(                                           ";
	mono[1] = "                       ___/__/_                   ";
	mono[2] = "               ___    /=======|   ___             ";
	mono[3] = " ____    __   [\\\]__/________|__[///]   __       ";             //este es el barco dibujado en pantalla
	mono[4] = " \   \__[\\]__/______________________\__[//]___   ";
	mono[5] = "  \40A                                         |  ";
	mono[6] = "   \              SeNKoX  GameS inc           /   ";
	mono[7] = "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~";
	mono[8] = "                                                  ";
	mono[9] = "                                                  ";
	
	animacion[0] = "          XX                XX               ";
	animacion[1] = "            XX            XX                 ";
	animacion[2] = "              XX        XX                   ";
	animacion[3] = "                XX    XX                     ";             //animacion de eliminacion
	animacion[4] = "                  XXXX                       ";
	animacion[5] = "                  XXXX                       ";
	animacion[6] = "                XX    XX                     ";
	animacion[7] = "              XX        XX                   ";
	animacion[8] = "            XX            XX                 ";
	animacion[9] = "          XX                XX               ";
	
	
	fail[0] = 	"     .-.        .-¯¯¯¯¯¯-.        ";
	fail[1] =   "     |U|      .            .      ";
	fail[2] =   "     | |     /   O    -=-   \     ";
	fail[3] =   "     | |    :                :    ";
	fail[4] =   "    _| |_   |                |    ";
	fail[5] =   "   | | | |-.:  ,          ,  :    ";
	fail[6] =   "  /|     ` | \   -......-   /     ";
	fail[7] =   " | |       |   .          .       ";
	fail[8] =   " |         |     -......-         ";
	fail[9] =   " \         /                      ";
	fail[10]=   "  |       |                       ";
	
	
	Para i<-0 Hasta 24 Con Paso 1 Hacer  // este es el logo de inicio (SenkoGames) Que le da el toque al inicio del juego
		                                  // usaremos este PARA ... para entender como usar los arreglos
		escribir logo[i];               // como se ve la instruccion -escribir- tiene encerrada una variable llamada i
		// como se ve en inicio del -para- ella de autoincrementa hasta 24 y hace 1 proceso mientras sube
		// esta es la magia del -para- entonces esto dice que cuando la posicion del arreglo sea 1 escribira lo que contiene 
		// el arreglo logo[0], y luego logo[1] ... así sucesivamente 
		// entonces el para es como lanzar un misil y el -hasta- es cuan lejos puede llegar
		// el resultado de esta instruccion lanza el misil y muestra en pantalla todo lo que encuentra mientras avanza
		// el maximo al cual podemos lanzar el misil es el maximo del arreglo en este caso es de 25
		// si nos pasamos de eso mostrar un error
		// podemos usar estos valores para decidir que tan fuerte lanzamos dentro de un arreglo
		
		
		Esperar 50 milisegundos;
		
		
		
	FINPARA 
	escribir "                  Diseñado para INACAP  por Camilo Henriquez N seccion 132V                       ";
	esperar 2000 Milisegundos;
	escribir "                             Para continuar pulse enter";
	esperar tecla;
	identificador = -50;
	puntajeFallos =0;
	puntaje=0;
	intentos=0;
	puntajeAcertados=0;// aqui inicializamos el puntaje en 0 .. como se ve este comienza antes de la instruccion -repetir- 
			     //con el fin que guarde el puntaje mientras el usuario juega  
	para j<-0 hasta 9 Hacer    // constructor de mapa de juego
		
		para k<-0 hasta 9 hacer
			enemigos = azar(30);
			
			si enemigos < 10 Entonces
				mapa[j,k] = 0;
			sino
				
				mapa[j,k]= enemigos; 
			finsi	
		FinPara
		
	FinPara
	repetir
		contadorDeEnemigos = 0;
		limpiar pantalla; // aqui limpiamos la pantalla para poder usar el juego y que el senko no moleste
	
		
	
	// aqui le ingresaremos numero de forma aleatoria a nuestro arreglo para darle las condiciones al mapa y a los misiles  ---
	
	
	 //--construiremos el mapa -  este para es para que muestre en pantalla el mapa para atacar 
	para j<-0 hasta 9 Hacer  // como se puede ver en este -para- hay otro -para- dentro de el esto es por
							// cuando graficamos algo lo hacemos en eje - x - y eje - y -
		escribir sin saltar mono[j];
		para k<-0 hasta 9 hacer
			
			si mapa[j,k] = 0 entonces
				escribir Sin Saltar " ~" , " ~ ", "~" ; 
				//escribir "x" , j ," y",k;
			FinSi
			
			si mapa[j,k] = -50 entonces
				
				escribir sin saltar " ~", "<xxx>" , "~";
				
			finsi
			si mapa[j,k] >0 entonces
				
				escribir sin saltar " ~", "<__>" , "~";
				
			finsi
		FinPara

		
		escribir "       Coordenadas ", j;    // este dibuja el salto en pantalla que tiene el eje x y dice la linea en la cual tirar el misil
	FinPara
	para l = 0 hasta 9 Hacer
		para m = 0 hasta 9 Hacer
			si mapa[l,m] > 10 Entonces
				contadorDeEnemigos = contadorDeEnemigos + 1;
			FinSi
			
		FinPara
		
	FinPara
	
	repetir
		// aqui le preguntamos al usuario que linea escojera para atacar
	escribir "Nuestro radar indica: " ,radarEnemigos(contadorDeEnemigos), " por destruir";	
	escribir "En que linea desea Atacar";

	
	leer linea;
	
	si linea   >9 o linea <0 Entonces         // aqui validamos que el usuario entre un valor en el rango correcto
		escribir "valor ingresado no es correcto";
	finsi	
		
	HASTA QUE (linea  <10 );  // repetiremos el enunciado hasta que se cumpla la condicion
    Repetir
		
	 
	Escribir  "la distancia del mortero depende de la fuerza que apliques al disparar";
	Escribir  "tus enemigos se encuentran a la derecha ... machacarlos es tu mision";
	escribir  " para baja  fuerza ingrese 1";
	escribir  " para media fuerza ingrese 2";
	escribir  " para mucha fuerza ingrese 3";
	 
	
	leer fuerzaDeLanzamiento;   // pediremos al usuario que decida la fuerza con la cual lanzara el misil
    Hasta Que (fuerzaDeLanzamiento =1 o fuerzaDeLanzamiento = 2 o fuerzaDeLanzamiento = 3);
    
	para f=0 hasta 15 Hacer
		escribir Sin Saltar "~"; //~
		esperar 80 Milisegundos;
	FinPara
	Escribir ">>======>";  // misil
	si fuerzaDeLanzamiento = 1 Entonces  // validamos la fuerza que escogio el usuario 
		
		lanzamiento = azar(3);             // poca fuerza .. un numero entre 0 y 3
		escribir "has utilizado poca fuerza";
	FinSi
	
	si fuerzaDeLanzamiento = 2 Entonces
		
		lanzamiento = azar(3) + 3;   // media fuerza .. un numero entre 3 y 6
		escribir "has utilizado media fuerza";
	FinSi
	si fuerzaDeLanzamiento = 3 Entonces
		
		lanzamiento = azar(3) + 7;   // un numero entre 7 y 10
		escribir "has utilizado mucha fuerza";
	FinSi
	
	
	
	// cuando ya tenemos el dato lo filtraremos para decirle al usuario que fue lo que pudo atacar
	puntaje = puntaje + mapa[linea,lanzamiento];
	si mapa[linea,lanzamiento] < 10  entonces    //si falla un tiro le daremos esto al usuario
		contador = 0;
		Repetir
			
			limpiar pantalla;
			
			
			esperar 200 Milisegundos;
			
			para i=0 hasta 9 Hacer
				
				escribir mono[i];
			FinPara
			
			esperar 200 Milisegundos;
			
			limpiar pantalla;
			
			para p=0 hasta 9 Hacer
				escribir fail[p];
			FinPara
			
			esperar 200 Milisegundos;
			
			contador = contador+1;
		Hasta Que (contador = 10);
		Limpiar Pantalla;
		para j<-0 hasta 9 Hacer  // como se puede ver en este -para- hay otro -para- dentro de el esto es por
			
			escribir sin saltar mono[j];
			
			para k<-0 hasta 9 hacer
				
				si mapa[j,k] = 0 entonces
					escribir Sin Saltar " ~" , " ~ ", "~" ; 
					//escribir "x" , j ," y",k;
				FinSi
				
				si mapa[j,k] = -50 entonces
					
					escribir sin saltar " ~", "<xxx>" , "~";
					
				finsi
			    si mapa[j,k] >0 entonces
					
					escribir sin saltar " ~", "<__>" , "~";
					
				finsi
			FinPara
			escribir "       Coordenadas ", j;    // este dibuja el salto en pantalla que tiene el eje x y dice la linea en la cual tirar el misil
		FinPara
		puntajeFallos = puntajeFallos +1;
		escribir "haz fallado el tiro .. mejora tu punteria ";
		escribir  mapa[linea,lanzamiento] , " enemigos destruidos";
		
		
		
	FinSi
	
	si mapa[linea,lanzamiento] > 10  entonces // si el barco es destruido le daremos esto al usuario
		contador = 0;
		
		mapa[linea,lanzamiento] = identificador;
		esperar 800 Milisegundos;
		
		
		Repetir
			
			limpiar pantalla;
			
			
		         esperar 200 Milisegundos;
		
		            para i=0 hasta 9 Hacer
						
						escribir mono[i];
		            FinPara
		
		esperar 200 Milisegundos;
		
		           limpiar pantalla;
		
		              para p=0 hasta 9 Hacer
	                   escribir animacion[p];
				      FinPara
					  
		esperar 200 Milisegundos;
					  
					  contador = contador+1;
		Hasta Que (contador = 10);
				  
		Limpiar Pantalla;;
		para j<-0 hasta 9 Hacer  // como se puede ver en este -para- hay otro -para- dentro de el esto es por
			
			escribir sin saltar mono[j];
			
			para k<-0 hasta 9 hacer
				
				si mapa[j,k] = 0 entonces
					escribir Sin Saltar " ~" , " ~ ", "~" ; 
					//escribir "x" , j ," y",k;
				FinSi
				
				   si mapa[j,k] = -50 entonces
					
					escribir sin saltar " ~", "<xxx>" , "~";
					
				    finsi
			    si mapa[j,k] >0 entonces
					
				   escribir sin saltar " ~", "<__>" , "~";
			    
				finsi
			FinPara
			escribir "       Coordenadas ", j;    // este dibuja el salto en pantalla que tiene el eje x y dice la linea en la cual tirar el misil
		FinPara
		escribir "has dado en el blanco .... has destruido un enemigo";
		escribir puntaje , " puntos " , puntaje , " quedaron nadando en el agua";
		puntajeAcertados = puntajeAcertados + 1;
		contadorDeEnemigos = contadorDeEnemigos -1; 
	FinSi //todo esto es lo que pasa si el jugador destrulle uno
	intentos = intentos + 1;
	
	escribir "tu puntaje actual es: ", puntaje;
	si mapa[linea,lanzamiento] >10 Entonces
		mapa[linea,lanzamiento] = 0;
	FinSi
	
	escribir "quedan ",radarEnemigos(contadorDeEnemigos), " enemigos por destruir ";
	Repetir
		
	
	escribir "¿quieres seguir Conquistando los mares?.... quedan muchos por conquistar";
	escribir "para continuar escribe (y) , para finalizar escribe (n)";
	leer continuar;
    Hasta Que (continuar = "y" o continuar = "n");
    HASTA QUE (continuar = "n" );
    Escribir " Gracias por jugar ";
	escribir " Tus intentos fallidos son: ", puntajeFallos;
	Escribir " Tus intentos acertados son: ",puntajeAcertados;
	Escribir " Tu cantidad de intentos son: ", intentos;
	Escribir " VideoJuego para asignatura Fundamentos de Programacion TIDS01 ";
	Escribir " Docente: Pablo Andres Saldaña Aceituno";
	Escribir " Fecha de entrega: 12 de julio del 2019";
	
	
FinAlgoritmo
