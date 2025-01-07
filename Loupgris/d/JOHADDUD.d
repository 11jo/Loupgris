BEGIN ~JOHADDUD~

// Yoshimo in party

IF ~Global("JOLoupgris_The_Yoshimo","MYAREA",1)~ THEN BEGIN Yosh01
  SAY ~Toi t'es un chef !~
  IF ~~ THEN EXTERN YOSHJ Yosh01Yosh
END


IF ~~ THEN BEGIN Yosh02
  SAY ~Le plus roublard de tous, pour sûr...~
  IF ~~ THEN EXTERN YOSHJ Yosh02Yosh
END

// Yoshimo in party

// Main talk 1

IF ~Global("JOLoupgris_The_Night","GLOBAL",2)
OR(2)
		Class(LastTalkedToBy,THIEF_ALL)
		Kit(LastTalkedToBy,STALKER)
!Kit(LastTalkedToBy,SWASHBUCKLER)~ THEN BEGIN 0
  SAY ~Vouiii ?~
  IF ~Gender(LastTalkedToBy,FEMALE)~ THEN REPLY ~Excusez-moi, je ne fais que passer.~ GOTO 1
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY ~Excusez-moi, je ne fais que passer.~ GOTO 2
  IF ~~ THEN REPLY ~C'est à moi que vous parlez ?~ GOTO 3
END

IF ~~ THEN BEGIN 1
  SAY ~Petite joueuse...~
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN 2
  SAY ~Petit joueur...~
  IF ~~ THEN EXIT
END

// Main talk 2 no assassin in party

IF ~Global("JOLoupgris_The_Night_Is_Near","LOCALS",0)
Global("JOLoupgris_The_Night","GLOBAL",2)~ THEN BEGIN Nope
  SAY ~Vot' vie n'a aucun intérêt pour moi.~
  IF ~~ THEN DO ~SetGlobal("JOLoupgris_The_Night_Is_Near","LOCALS",1)~ EXIT
END

IF ~Global("JOLoupgris_The_Night_Is_Near","LOCALS",1)
Global("JOLoupgris_The_Night","GLOBAL",2)~ THEN BEGIN Nope1
  SAY ~Hum ?~
  IF ~~ THEN DO ~SetGlobal("JOLoupgris_The_Night_Is_Near","LOCALS",2)~ EXIT
END

IF ~Global("JOLoupgris_The_Night_Is_Near","LOCALS",2)
Global("JOLoupgris_The_Night","GLOBAL",2)~ THEN BEGIN Nope2
  SAY ~Quelqu'un t'appelle là-bas... Loin d'ici...~
  IF ~~ THEN DO ~SetGlobal("JOLoupgris_The_Night_Is_Near","LOCALS",3)~ EXIT
END

IF ~Global("JOLoupgris_The_Night","GLOBAL",2)
!GlobalGT("JOLoupgris_The_Night_Is_Near","LOCALS",6)
GlobalGT("JOLoupgris_The_Night_Is_Near","LOCALS",2)~ THEN BEGIN Nope3
  SAY ~Et maintenant ?~
  IF ~~ THEN DO ~IncrementGlobal("JOLoupgris_The_Night_Is_Near","LOCALS",1)~ EXIT
END

IF ~Global("JOLoupgris_The_Night_Is_Near","LOCALS",7)
Global("JOLoupgris_The_Night","GLOBAL",2)
Gender(LastTalkedToBy,MALE)~ THEN BEGIN Nope4
  SAY ~Soit pas surpris si tu te retrouve avec une lame dans la panse...~
  IF ~~ THEN DO ~SetGlobal("JOLoupgris_The_Night","GLOBAL",9) SetGlobal("JOLoupgris_The_Night_Is_Near","LOCALS",0)~ EXIT
END

IF ~Global("JOLoupgris_The_Night_Is_Near","LOCALS",7)
Global("JOLoupgris_The_Night","GLOBAL",2)
Gender(LastTalkedToBy,FEMALE)~ THEN BEGIN Nope5
  SAY ~Soit pas surprise si tu te retrouve avec une lame dans la panse...~
  IF ~~ THEN DO ~SetGlobal("JOLoupgris_The_Night","GLOBAL",9) SetGlobal("JOLoupgris_The_Night_Is_Near","LOCALS",0)~ EXIT
END

// Main talk 3 processing

IF ~~ THEN BEGIN 3
  SAY ~Allez savoir...~
  IF ~~ THEN REPLY ~C'est à moi que vous parlez ?~ GOTO 4
END

IF ~~ THEN BEGIN 4
  SAY ~Peut-être bien...~
  IF ~~ THEN REPLY ~J'ai une lame avec votre non dessus !~ GOTO 5
END

IF ~~ THEN BEGIN 5
  SAY ~C'est possible, mais êtes vous sûr de l'utiliser de la manière la plus efficace ?~
  IF ~Gender(LastTalkedToBy,FEMALE)~ THEN REPLY ~Hein ? Le bout pointu entre par là.~ GOTO 6WOMAN
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY ~Hein ? Le bout pointu entre par là.~ GOTO 6MAN
  IF ~Gender(LastTalkedToBy,FEMALE)~ THEN REPLY ~Vous me prenez pour une rigolote, hop hop !.~ GOTO 6WOMAN
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY ~Vous me prenez pour un rigolo, ho ho !.~ GOTO 6MAN
  IF ~Gender(LastTalkedToBy,FEMALE)~ THEN REPLY ~Venez en au fait !~ GOTO 6WOMAN
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY ~Venez en au fait !~ GOTO 6MAN
  IF ~~ THEN REPLY ~Du vent le mendiant !~ EXIT
END

IF ~~ THEN BEGIN 6WOMAN
  SAY ~Tout dépend de vos préférences, dîtes moi... Quel genre de tueuse êtes vous ?~
  IF ~~ THEN GOTO 7
END

IF ~~ THEN BEGIN 6MAN
  SAY ~Tout dépend de vos préférences, dîtes moi... Quel genre de tueur êtes vous ?.~
  IF ~~ THEN GOTO 7
END

IF ~~ THEN BEGIN 7
  SAY ~Soyez pas timide...~
  IF ~~ THEN REPLY ~Les plus de souffrances possibles, sans effort et sans me soucier des conséquences.~ GOTO 8Sournoise
  IF ~~ THEN REPLY ~J'aime rester au chevet de mes victimes et voir la lueur de vie s’éteindre alors qu'elles cherchent à comprendre ce qu'il les a frappées.~ GOTO 8Furtive
  IF ~~ THEN REPLY ~J'adore remuer ma lame dans les tripes des pauvres bougres qui ont le malheur de croiser mon chemin et je suis du genre à regarder mes proies en face lorsque je leur mets à l'envers.~ GOTO 8Vilain
  IF ~~ THEN REPLY ~C'est une blague, charlatan !~ EXIT
END

// Main talk 4 Sournoise

IF ~~ THEN BEGIN 8Sournoise
  SAY ~Pour ça il faut être capable d'attaquer dans le dos sans être invisible.~
  IF ~Global("JOLoupgris_8Sournoise","GLOBAL",0)~ THEN REPLY ~Trêve de bavardages, vous sembliez sous entendre que c'était faisable ?~ GOTO 9.1Sournoise
  IF ~Global("JOLoupgris_8Sournoise","GLOBAL",1)~ THEN REPLY ~Trêve de bavardages et passons au carnage !~ GOTO 9.2Sournoise
  IF ~Global("JOLoupgris_8Sournoise","GLOBAL",2)~ THEN REPLY ~Trêve de bavardages, le meurtre n'attend pas.~ GOTO 9.3Sournoise
  IF ~Gender(LastTalkedToBy,FEMALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6WOMAN
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6MAN
  IF ~~ THEN REPLY ~C'est une blague, charlatan !~ EXIT
END

IF ~~ THEN BEGIN 9.1Sournoise
  SAY ~Vôtre soif de sang ne sera pas en reste avec la tablette Sournoise, pour 1000 pièces d'or elle est à vous !~
  IF ~Gender(LastTalkedToBy,FEMALE) PartyGoldGT(999)~ THEN REPLY ~Je vois que vous n'hésitez pas à me détrousser au passage.~ DO ~SetGlobal("JOLoupgris_8Sournoise","GLOBAL",1) TakePartyGold(1000)~ GOTO 10SournoiseWOMAN
  IF ~Gender(LastTalkedToBy,MALE) PartyGoldGT(999)~ THEN REPLY ~Je vois que vous n'hésitez pas à me détrousser au passage.~ DO ~SetGlobal("JOLoupgris_8Sournoise","GLOBAL",1) TakePartyGold(1000)~ GOTO 10SournoiseMAN
  IF ~Gender(LastTalkedToBy,FEMALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6WOMAN
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6MAN
  IF ~~ THEN REPLY ~C'est une blague, charlatan !~ EXIT
END

IF ~~ THEN BEGIN 9.2Sournoise
  SAY ~Vôtre soif de sang pourra-elle être étanchée avec la tablette Sournoise ? Pour 5000 pièces d'or elle est à vous !~
  IF ~Gender(LastTalkedToBy,FEMALE) PartyGoldGT(4999)~ THEN REPLY ~Je vois que vous ne vous contentez pas d'une seule bourse...~ DO ~SetGlobal("JOLoupgris_8Sournoise","GLOBAL",2) TakePartyGold(5000)~ GOTO 10SournoiseWOMAN
  IF ~Gender(LastTalkedToBy,MALE) PartyGoldGT(4999)~ THEN REPLY ~Je vois que vous ne vous contentez pas d'une seule bourse...~ DO ~SetGlobal("JOLoupgris_8Sournoise","GLOBAL",2) TakePartyGold(5000)~ GOTO 10SournoiseMAN
  IF ~Gender(LastTalkedToBy,FEMALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6WOMAN
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6MAN
  IF ~~ THEN REPLY ~C'est une blague, charlatan !~ EXIT
END

IF ~~ THEN BEGIN 9.3Sournoise
  SAY ~Vôtre soif de sang sera décuplé (comme le prix...) avec la tablette Sournoise, pour 10000 pièces d'or elle est à vous !~
  IF ~Gender(LastTalkedToBy,FEMALE) PartyGoldGT(9999)~ THEN REPLY ~Je vois c'est un peu la bourse ou la vie !~ DO ~TakePartyGold(10000)~ GOTO 10SournoiseWOMAN
  IF ~Gender(LastTalkedToBy,MALE) PartyGoldGT(9999)~ THEN REPLY ~Je vois c'est un peu la bourse ou la vie !~ DO ~TakePartyGold(10000)~ GOTO 10SournoiseMAN
  IF ~Gender(LastTalkedToBy,FEMALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6WOMAN
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6MAN
  IF ~~ THEN REPLY ~C'est une blague, charlatan !~ EXIT
END

IF ~~ THEN BEGIN 10SournoiseWOMAN
  SAY ~Et une tablette sournoise pour une assassin sournoise.~
  IF ~~ THEN DO ~GiveItemCreate("jodo916",LastTalkedToBy(),0,0,0)~ EXIT // NOT SET
END

IF ~~ THEN BEGIN 10SournoiseMAN
  SAY ~Et une tablette sournoise pour une assassin sournois.~
  IF ~~ THEN DO ~GiveItemCreate("jodo916",LastTalkedToBy(),0,0,0)~ EXIT // NOT SET
END

// Main talk 5 Furtive

IF ~~ THEN BEGIN 8Furtive
  SAY ~Pour ça il faut être capable d'attaquer de face lorsque l'on est invisible.~
  IF ~Global("JOLoupgris_8Furtive","GLOBAL",0)~ THEN REPLY ~Trêve de bavardages, vous sembliez sous entendre que c'était faisable ?~ GOTO 9.1Furtive
  IF ~Global("JOLoupgris_8Furtive","GLOBAL",1)~ THEN REPLY ~Trêve de bavardages et passons au carnage !~ GOTO 9.2Furtive
  IF ~Global("JOLoupgris_8Furtive","GLOBAL",2)~ THEN REPLY ~Trêve de bavardages, le meurtre n'attend pas.~ GOTO 9.3Furtive
  IF ~Gender(LastTalkedToBy,FEMALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6WOMAN
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6MAN
  IF ~~ THEN REPLY ~C'est une blague, charlatan !~ EXIT
END

IF ~~ THEN BEGIN 9.1Furtive
  SAY ~Vôtre soif de sang ne sera pas en reste avec la tablette Furtive, pour 1000 pièces d'or elle est à vous !~
  IF ~Gender(LastTalkedToBy,FEMALE) PartyGoldGT(999)~ THEN REPLY ~Je vois que vous n'hésitez pas à me détrousser au passage.~ DO ~SetGlobal("JOLoupgris_8Furtive","GLOBAL",1) TakePartyGold(1000)~ GOTO 10FurtiveWOMAN
  IF ~Gender(LastTalkedToBy,MALE) PartyGoldGT(999)~ THEN REPLY ~Je vois que vous n'hésitez pas à me détrousser au passage.~ DO ~SetGlobal("JOLoupgris_8Furtive","GLOBAL",1) TakePartyGold(1000)~ GOTO 10FurtiveMAN
  IF ~Gender(LastTalkedToBy,FEMALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6WOMAN
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6MAN
  IF ~~ THEN REPLY ~C'est une blague, charlatan !~ EXIT
END

IF ~~ THEN BEGIN 9.2Furtive
  SAY ~Vôtre soif de sang pourra-elle être étanchée avec la tablette Furtive ? Pour 5000 pièces d'or elle est à vous !~
  IF ~Gender(LastTalkedToBy,FEMALE) PartyGoldGT(4999)~ THEN REPLY ~Je vois que vous ne vous contentez pas d'une seule bourse...~ DO ~SetGlobal("JOLoupgris_8Furtive","GLOBAL",2) TakePartyGold(5000)~ GOTO 10FurtiveWOMAN
  IF ~Gender(LastTalkedToBy,MALE) PartyGoldGT(4999)~ THEN REPLY ~Je vois que vous ne vous contentez pas d'une seule bourse...~ DO ~SetGlobal("JOLoupgris_8Furtive","GLOBAL",2) TakePartyGold(5000)~ GOTO 10FurtiveMAN
  IF ~Gender(LastTalkedToBy,FEMALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6WOMAN
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6MAN
  IF ~~ THEN REPLY ~C'est une blague, charlatan !~ EXIT
END

IF ~~ THEN BEGIN 9.3Furtive
  SAY ~Vôtre soif de sang sera décuplé (comme le prix...) avec la tablette Furtive, pour 10000 pièces d'or elle est à vous !~
  IF ~Gender(LastTalkedToBy,FEMALE) PartyGoldGT(9999)~ THEN REPLY ~Je vois c'est un peu la bourse ou la vie !~ DO ~TakePartyGold(10000)~ GOTO 10FurtiveWOMAN
  IF ~Gender(LastTalkedToBy,MALE) PartyGoldGT(9999)~ THEN REPLY ~Je vois c'est un peu la bourse ou la vie !~ DO ~TakePartyGold(10000)~ GOTO 10FurtiveMAN
  IF ~Gender(LastTalkedToBy,FEMALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6WOMAN
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6MAN
  IF ~~ THEN REPLY ~C'est une blague, charlatan !~ EXIT
END

IF ~~ THEN BEGIN 10FurtiveWOMAN
  SAY ~Et une tablette Furtive pour une assassin furtive.~
  IF ~~ THEN DO ~GiveItemCreate("join916",LastTalkedToBy(),0,0,0)~ EXIT // NOT SET
END

IF ~~ THEN BEGIN 10FurtiveMAN
  SAY ~Et une tablette Furtive pour une assassin furtif.~
  IF ~~ THEN DO ~GiveItemCreate("join916",LastTalkedToBy(),0,0,0)~ EXIT // NOT SET
END

// Main talk 6 Vilain

IF ~~ THEN BEGIN 8Vilain
  SAY ~Pour ça il faut être capable d'attaquer de face sans se soucier d'être vu.~
  IF ~Global("JOLoupgris_8Vilain","GLOBAL",0)~ THEN REPLY ~Trêve de bavardages, vous sembliez sous entendre que c'était faisable ?~ GOTO 9.1Vilain
  IF ~Global("JOLoupgris_8Vilain","GLOBAL",1)~ THEN REPLY ~Trêve de bavardages et passons au carnage !~ GOTO 9.2Vilain
  IF ~Global("JOLoupgris_8Vilain","GLOBAL",2)~ THEN REPLY ~Trêve de bavardages, le meurtre n'attend pas.~ GOTO 9.3Vilain
  IF ~Gender(LastTalkedToBy,FEMALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6WOMAN
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6MAN
  IF ~~ THEN REPLY ~C'est une blague, charlatan !~ EXIT
END

IF ~~ THEN BEGIN 9.1Vilain
  SAY ~Vôtre soif de sang ne sera pas en reste avec la tablette du Vilain, pour 1000 pièces d'or elle est à vous !~
  IF ~Gender(LastTalkedToBy,FEMALE) PartyGoldGT(999)~ THEN REPLY ~Je vois que vous n'hésitez pas à me détrousser au passage.~ DO ~SetGlobal("JOLoupgris_8Vilain","GLOBAL",1) TakePartyGold(1000)~ GOTO 10VilainWOMAN
  IF ~Gender(LastTalkedToBy,MALE) PartyGoldGT(999)~ THEN REPLY ~Je vois que vous n'hésitez pas à me détrousser au passage.~ DO ~SetGlobal("JOLoupgris_8Vilain","GLOBAL",1) TakePartyGold(1000)~ GOTO 10VilainMAN
  IF ~Gender(LastTalkedToBy,FEMALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6WOMAN
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6MAN
  IF ~~ THEN REPLY ~C'est une blague, charlatan !~ EXIT
END

IF ~~ THEN BEGIN 9.2Vilain
  SAY ~Vôtre soif de sang pourra-elle être étanchée avec la tablette du Vilain ? Pour 5000 pièces d'or elle est à vous !~
  IF ~Gender(LastTalkedToBy,FEMALE) PartyGoldGT(4999)~ THEN REPLY ~Je vois que vous ne vous contentez pas d'une seule bourse...~ DO ~SetGlobal("JOLoupgris_8Vilain","GLOBAL",2) TakePartyGold(5000)~ GOTO 10VilainWOMAN
  IF ~Gender(LastTalkedToBy,MALE) PartyGoldGT(4999)~ THEN REPLY ~Je vois que vous ne vous contentez pas d'une seule bourse...~ DO ~SetGlobal("JOLoupgris_8Vilain","GLOBAL",2) TakePartyGold(5000)~ GOTO 10VilainMAN
  IF ~Gender(LastTalkedToBy,FEMALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6WOMAN
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6MAN
  IF ~~ THEN REPLY ~C'est une blague, charlatan !~ EXIT
END

IF ~~ THEN BEGIN 9.3Vilain
  SAY ~Vôtre soif de sang sera décuplé (comme le prix...) avec la tablette du Vilain, pour 10000 pièces d'or elle est à vous !~
  IF ~Gender(LastTalkedToBy,FEMALE) PartyGoldGT(9999)~ THEN REPLY ~Je vois c'est un peu la bourse ou la vie !~ DO ~TakePartyGold(10000)~ GOTO 10VilainWOMAN
  IF ~Gender(LastTalkedToBy,MALE) PartyGoldGT(9999)~ THEN REPLY ~Je vois c'est un peu la bourse ou la vie !~ DO ~TakePartyGold(10000)~ GOTO 10VilainMAN
  IF ~Gender(LastTalkedToBy,FEMALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6WOMAN
  IF ~Gender(LastTalkedToBy,MALE)~ THEN REPLY ~Bon, j'aime aussi d'autres méthodes.~ GOTO 6MAN
  IF ~~ THEN REPLY ~C'est une blague, charlatan !~ EXIT
END

IF ~~ THEN BEGIN 10VilainWOMAN
  SAY ~Et une tablette du Vilain pour une grosse vilaine.~
  IF ~~ THEN DO ~GiveItemCreate("jovi916",LastTalkedToBy(),0,0,0)~ EXIT // NOT SET
END

IF ~~ THEN BEGIN 10VilainMAN
  SAY ~Et une tablette du Vilain pour un gros vilain.~
  IF ~~ THEN DO ~GiveItemCreate("jovi916",LastTalkedToBy(),0,0,0)~ EXIT // NOT SET
END



// End Main talk



// Yoshimo

APPEND YOSHJ

	IF ~~ THEN BEGIN Yosh01Yosh
		SAY ~Pardon ?~
		IF ~~ THEN EXTERN JOHADDUD Yosh02
	END

	IF ~~ THEN BEGIN Yosh02Yosh
		SAY ~Un fou à lier ! Oui, c'est la seule explication...~
		IF ~~ THEN EXIT
	END

END

// One Commoner on Copper Coronet roof

BEGIN ~JOSLOUM2~

	IF ~/*TimeOfDay(NIGHT)*/ RandomNum(2,1)~ THEN BEGIN 0JOSLOUM2
		SAY ~C'est toujours la même chose...~
		IF ~~ THEN EXIT
	END

	IF ~/*TimeOfDay(DAY)*/ RandomNum(2,2)~ THEN BEGIN 1JOSLOUM2
		SAY ~C'est ma place !~
		IF ~~ THEN EXIT
	END
