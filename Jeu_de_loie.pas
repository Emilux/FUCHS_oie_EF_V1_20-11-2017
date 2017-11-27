{Le joueur est caractérisé par un nombre nommé "place" compris entre 0 et 66. Il situe sa position sur le Jeu de l'Oie, sachant qu'après jet des deux dés, on applique les règles suivantes : On avance du nombre de cases indiqués par la somme des dés. Si on arrive juste sur la case 66, le jeu est terminé. Sinon on recule du nombre de points en trop. Une Oie toutes les neufs cases sauf en 63 double le déplacement. Une tête de mort case 58 renvoie en position de départ, case 0. On s'efforcera d'utiliser au maximum des CONSTANTES. Il faut produire un Algo, et un code lisible et clair. Il faut insérer des commentaires. Il faut vérifier si le jet est valide (valeurs entre 2 et 12). Il est conseillée d'utiliser l'opérateur MODULO pour vérifier si une case est un multiple de 9.
Algorithme Jeu_de_l'oie



Algorithme:Jeu-de-l'oie

//But:Simuler le jeu de l'oie pour 1 joueur 
//Principe:On lance le dé aléatoirement et déplace le joueur tout en respectant les règles écrites au dessus
//Entrée:Un joueur souhaitant jouer seul au jeu de l'oie 
//Sortie:Une partie joué/jouable par le joueur *

CONST:
	// Déclaration des constantes
	arv = 66; // Const de l'arrivé
	DblP = 63; // Case 63 n'est pas doublé
	mrt = 58; // Const de la case tête de mort (case 58)
	max = 12; // Nombre maximum que l'on peut faire avec les dès
	min = 2; // Nombre minimum pouvant être fait avec les dès
	Dbl = 9; // Toutes les 9 cases le lancé de dès est doublé

VAR:
	jet,place:ENTIER


DEBUT
	ECRIRE "Appuyez sur n'importe quel touche pour commencer la partie."
	LIRE()
	// Debut de la partie 
	// Initialisation des variables
	place <-- 0 // De base le joueur est sur la case débart (0)
	jet <-- 0 // De base le lancer du dès est de 0
	TANTQUE (place <> arv) FAIRE //Boucle qui vérifie si le joueur est bien pile sur l'arrivé ou non
		ECRIRE ("Pressez une touche pour lancer les dés.")
		LIRE()
		REPETER
			jet <-- RANDOM(max) //Jet du dé de manière aléatoire
		JUSQU'A jet >= min
		ECRIRE ("Votre jet de dés vaut: ",jet)
		place <-- place + jet 
		SI (place MOD Dbl = 0) ET (place <> DblP) ALORS //test pour doubler la valeur du jet si la case est un mutiple de 9 
			ECRIRE ("Vous êtes tombé sur une case qui est multiple de 9 votre jet de dés est doublé,votre jet de dés vaut:  ",jet*2)
			place<-- place + jet
		FINSI
		SI (place>arv) ALORS// au cas ou le joueur dépasse la case 66 il recule de la différence entre sa position et la case 66 
			place <-- arv-(place-arv)
			ECRIRE ("Vous avez dépassé la case 66 vous reculez et vosu retrouvez à la case " , place)
		FINSI
		SI place= mrt ALORS
			ECRIRE ("Vous êtes tombé sur la case 58 , retournez à la case départ.")
			place=0
		FINSI
		ECRIRE ("Vous êtes sur la case: ",place)
	FINTANTQUE
	ECRIRE ("Vous avez gagné la partie vous avez atteint la case 66. ")

FIN }
Program jeu_de_loie; 
USES crt;

CONST 
	// Déclaration des constantes
	arv = 66; // Const de l'arrivé
	DblP = 63; // Case 63 n'est pas doublé
	mrt = 58; // Const de la case tête de mort (case 58)
	max = 13; // Nombre maximum que l'on peut faire avec les dès
	min = 2; // Nombre minimum pouvant être fait avec les dès
	Dbl = 9; // Toutes les 9 cases le lancé de dès est doublé

VAR
	jet,place:INTEGER;
BEGIN
	Randomize;// Randomize permet d'initialiser le générateur de nombres aléatoires
	clrscr; // Rafraichissement de l'écran
	Writeln('Appuyez sur n''importe quel touche pour commencer la partie.');
	Readln();
	// Debut de la partie 
	// Initialisation des variables
	place := 0; // De base le joueur est sur la case débart (0)
	jet:=0; // De base le lancer du dès est de 0
	//Boucle qui vérifie si le joueur est bien pile sur l'arrivé ou non
	While (place <> arv) do
		BEGIN
			//Lancement du dès
			Writeln('Pressez une touche pour lancer les des.');
			Readln();
			//Boucle qui vérifie si le dès donne un nombre cohérent
			Repeat
				jet := random(max);//Le nombre donné doit être au max de 12 car il y'a 2 dès de 6 (13 car il simule un entier entre 0 et n-1)
			UNTIL (jet >= min); //Le nombre donné doit être de au moins 2 car il y'a 2 dès
			Writeln('Votre jet de des vaut: ',jet); // Afficher le nombre donné par le dès
			place := place+jet; //Ajoute le nombre donné par le dès a la case sur laquelle le joueur se trouve			
			IF(place MOD Dbl = 0) AND (place <> DblP) THEN // Vérifie si la case est un multiple de 9 et la case 63
				BEGIN 
					//Affiche que la case est bien un multiple de 9 et affiche combien vaut le jet de dès en doublé
					Writeln('Vous etes tombe sur une case qui est multiple de 9 votre jet de des est double,votre jet de des vaut:  ',jet*2);
					//Ajoute pour la deuxieme fois le nombre donné par le dès a la case sur laquelle le joueur se trouve et double ainsi son déplacement
					place:= place + jet ;
				END;
			IF (place > arv) THEN// Vérifie que si le joueur dépasse l'arrivé il revient en arrière du nombre de case en trop 
				BEGIN
					place:=arv-(place-arv); // Enlève le nombre de case en trop par rapport à l'arrivé
					Writeln('Vous avez depasse la case 66 vous reculez et vous retrouvez a la case ',place); // affiche la case à laquelle le joueur va etre replacé
				END;
			IF (place = mrt ) THEN // Vérifie si la case est une tête de mort ou non
				BEGIN
					Writeln('Vous etes tombe sur la case 58 , retournez à la case depart.'); // affiche au joueur qu'il est sur une case tête de mort
					place:=0; //Remet le joueur sur la case 0

				END;
			Writeln('Vous etes sur la case: ',place); //affiche la case sur laquelle le joueur se trouve
		END;
	//Sortie de la boucle qui vérifie si le joueur est bien pile sur l'arrivé ou non car le joueur est bien sur la case 66 pile
	Writeln('Vous avez gagne la partie,vous avez atteint la case 66. '); //Afficher au joueur qu'il a gagné
	Readln(); //Met le programme en attente
END.