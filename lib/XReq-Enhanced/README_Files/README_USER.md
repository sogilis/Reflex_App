#______________________________________________XReq - User's Guide_________________________________________________


##1. Présentation
---

**XReq** est un outil de BDD (Behaviour  Driven Development), il permet d'écrire des tests lisibles de manière efficace.

**XReq** prend comme fichiers d'entités d'entrée décrivant vos spécifications et vos scénarios qui sont sous la forme de La matrice Given-When-Then avec le langage Gherkin et générer des tests pour ces fonctionnalités dans des langages tels que Ada, C, C ++ selon votre choix .


##2. Fonctionnement
---

**XReq** utilise des fichiers `.feature` qui contiennent la description du test ( les scénarios du test ) . Ces fichiers ont la structure suivante :
 
         __________________________________________________________________________
        |                                                                          |
        |     Feature: Feature_Name                                                | 
        |                                                                          |
        |     Scenario: Scenario_Name                                              |
        |         (Given) (Etant donné) un contexte,                               |
        |         (When) (Lorsque) l'utilisateur effectue certaines actions,       |
        |         (Then) (Alors) on doit pouvoir constater telles conséquences     |
        |__________________________________________________________________________|

exemple :

    Feature: Eating Oranges
    
      Scenario: Eating
        Given there are 12 oranges
        When I eat 5 oranges
        Then I should have 7 oranges


Ces fichiers sont parsés et **XReq** tente de génerer les `steps_definitions`. Les steps sont des fichiers Ada décrivant le comportement à associé à une ligne du fichier `.feature`.

Par exemple, les fichiers de step ressemblent à :

    package Oranges is
    
      --  @given ^there are ([0-9]+) oranges$
      procedure Given_there_are_n_oranges (Args : in out Arg_Type);
    
      --  @when ^I eat ([0-9]+) oranges$
      procedure When_i_eat_n_oranges (Args : in out Arg_Type);
      
      --  @then ^I should have ([0-9]+) oranges$
      procedure Then_i_should_have_n_oranges (Args : in out Arg_Type); 
    
    end Oranges;
    
et :

    with XReqLib.Asserts;         use XReqLib.Asserts;
    with XReqLib.Asserts.Integer; use XReqLib.Asserts.Integer;
    with Ada.Text_IO;             use Ada.Text_IO;
    with XReqLib.General;         use XReqLib.General;

    package body Oranges is

       Nb_Of_Oranges : Integer := 0;

       procedure Given_there_are_n_oranges (Args : in out Arg_Type) is
       begin
          Nb_Of_Oranges := Integer'Value (Args.Match (1));
       end Given_there_are_n_oranges;

       procedure When_i_eat_n_oranges (Args : in out Arg_Type) is
       begin
          Nb_Of_Oranges := Nb_Of_Oranges - Integer'Value (Args.Match (1));
       end When_i_eat_n_oranges;

       procedure Then_i_should_have_n_oranges (Args : in out Arg_Type) is
       begin
         Assert (Actual => Nb_Of_Oranges,
                 Match  => Args.Match (1),
                 Reason => "Wrong number of oranges");
       end Then_i_should_have_n_oranges;

    end Oranges;

Pour faire ce lien, **XReq** utilise les expressions régulières en commentaire au dessus de la déclaration des procédures. S'il trouve une expression régulière qui correspond, il l'utilisera dans les tests générés, sinon, il proposera la création d'une nouvelle procedure permettant de faire la correspondance.
                
Au meme temps, **XReq** génére les fichiers genereted définissant tous les cas de tests .
Par exemple, les fichiers de genereted ressemblent à :

    procedure Scenario_Eating_TC (Format     : in     Format_Ptr)

   is
   begin
         Format.Start_Scenario ("Eating", "./features/background.feature:6", Tags);
         Format.Enter_Scenario;
         Call_Hook (Hook_Begin, Hook_Scenario);

         --------------
         --  Set_Up  --
         --------------

         Set_Up ("./features/background.feature");
         Fail := Stop;

         ------------------
         --  Background  --
         ------------------

         Background (Format, Report, Stop, Count_Mode);
         Fail := Stop;

         ----------------
         --  Scenario  --
         ----------------

         Format.Begin_Scenario;
         --
         -- Given there are 12 oranges
         --
         declare
            Args   : Arg_Type;
            Prefix : constant Step_Kind := Step_Given;
            Stanza : constant String    := "there are 12 oranges";
            Pos    : constant String    := "./features/background.feature:7";
         begin
            Make (Args, "there are 12 oranges");
            Add_Sep   (Args, 1);
            Format.Start_Step (Prefix, Stanza, Pos);
            Format.Begin_Step;
            if Fail then
               Report.Count_Steps_Skipped := Report.Count_Steps_Skipped + 1;
               Format.Put_Step  (Args, Status_Skipped);
            else
               Call_Hook (Hook_Begin, Hook_Step);
               Given_there_are_12_oranges (Args);
               Call_Hook (Hook_End, Hook_Step);
               Report.Count_Steps_Passed := Report.Count_Steps_Passed + 1;
               Format.Put_Step (Args, Status_Passed);
            end if;
         exception
            when Err : others =>
              Call_Hook (Hook_End, Hook_Step);
              Report.Count_Steps_Failed := Report.Count_Steps_Failed + 1;
              Fail := True;
              Format.Put_Step  (Args, Status_Failed);
              Format.Put_Error (Err);
         end;
         Format.End_Step;
         Format.Stop_Step;
       
         --------------------
         --  Finalization  --
         --------------------

         Call_Hook (Hook_End, Hook_Scenario);
         if Fail then
            Report.Count_Scenario_Failed := Report.Count_Scenario_Failed + 1;
         Format.End_Scenario (Status_Failed);
         else
            Report.Count_Scenario_Passed := Report.Count_Scenario_Passed + 1;
         Format.End_Scenario (Status_Passed);
         end if;

         -----------------
         --  Tear_Down  --
         -----------------

         Tear_Down ("./features/background.feature");
         Fail := Stop;
         Format.Stop_Scenario;
      end if;
   end Scenario_Eating_TC;


Un fois que les liens sont faits, **XReq** génère les tests. L'exécution des tests générés crée un programme de test appelé test_name qui pourra exécuter tous les fonctionnalités spécifiées . Ce fichier se trouve dans la répertoire bin .

exemple de l'exécution du fichier exécutable test_oranges :

                          _____________________________________________
                         |                                             |
                         |    Feature: Eating Oranges                  |
                         |                                             |
                         |        Scenario: Eating                     |
                         |            Given there are 12 oranges       |
                         |            When I eat 5 oranges             |
                         |            Then I should have 7 oranges     |
                         |                                             |
                         |        1 scenarios (1 passed)               |
                         |        3 steps (3 passed)                   |
                         |_____________________________________________|


##3. Installation
---
       **xreq-stable-vX.Y.Z-1234567.tar.gz**
Cela produira un fichier d'archive situé dans le répertoire dist:

Utilisez cette archive pour l'installation sur un hôte différent.

Pour l'installer sur le même hôte, vous pouvez cd dans le répertoire `dist / xreq-stable-vX.Y.Z-1234567` 

et lancer le script` doinstall.sh` .

exemple : 
  cd dist/xreq-stable-v0.1.5-0dd13e3/ && sudo rm -rf /opt/Xreq/ && sudo chmod 777 /opt && ./doinstall.sh


##4. Utilisation
---

###4.1 Création d'un nouveau projet utilisant **XReq**
---
Afin de créer un nouveau projet avec des tests **XReq**, il est conseillé de se servir de l'exemple situé dans `.\examples`.

Le projet est à la structure suivante : 

* `features` contient l'ensemble des fichiers de test `.feature` ;
* `features\step_definitions` contient l'implémentation des steps ;
* `features\support` contient des helpers pour faire le liens entre le code et les tests (pas toujours nécessaire) ;
* `features\obj` contient les tests générés par XReq ;
* `src` contient les sources du projet ;

Il est conseillé de conserver cette structure des fichiers pour le développement de vos projets XReq car le plug-in gps fonctionne uniquement avec cette structure.

###4.2 Utiliser les commandes de makefile 
---

**XReq** donne des divers cibles disponibles pour faire : 
 
    Nettoyer votre projet : make clean 
    Configurer vos tests selon le langage choisit : make gen-ada ou make gen_c
    Construire tous les tests unitaires et d'intégration : make build-test
    Préparer un répertoire dist pour une installation future : make dist

Pour plus d'informations sur les commandes make et ses usages , Utilisez la commande : make help

exemple : 

    cd XReq/XReq-Enhanced/exemples/oranges 
    make clean 
    make gen-ada
    make build-test
    cd bin 
    ./test_oranges

##5. Ecriture des features
---

###5.1 Features de base
---

Une feature classique s'écrit de la manière suivante :

    Feature: Eating Oranges
    
      Scenario: Eating
        Given there are 12 oranges
        When I eat 5 oranges
        Then I should have 7 oranges
        
      Scenario: Eating a lot
        Given there are 12 oranges
        When I eat 12 oranges
        Then I should have 0 oranges
        
Il y a deux scénarios et ils seront exécutés à la suite.

###5.2 Background
---

Si l'on souhaite repeter une action avant chaque scénario, il est rébarbatif de répéter le step à chaque fois. Pour cela il existe le Background :

    Feature: Eating Oranges
    
    Background:
      Given I am hungry
    
      Scenario: Eating
        Given there are 12 oranges
        When I eat 5 oranges
        Then I should have 7 oranges
        
      Scenario: Eating a lot
        Given there are 12 oranges
        When I eat 12 oranges
        Then I should have 0 oranges
        
Dans ce cas là, le step  `Given I am hungry` sera exécuté avant le scénario `Eating` et avant le scenario `Eating a lot`.

###5.3 Scenario Outline
---

On remarque que les deux scénarii sont factorisables. Pour éviter cette répétition, on peut utiliser le **scénario outline**. Cela permet d'exécuter un même scénario avec des entrées différentes :


    Feature: Eating Oranges
    
    Background:
      Given I am hungry
    
      Scenario: Eating
        Given there are <start> oranges
        When I eat <eat> oranges
        Then I should have <left> oranges
        
    Examples:
        | start | eat | left |
        |   12  |  5  |  7   |
        |   12  |  12 |  0   |
        

Les tests exécutés seront identiques mais on gagne en lisibilité et en simplicité pour rajouter des cas de test.

###5.4 Variables
---

On remarque que dans les deux scenarii, le nombre d'orange de départ est le même. Pour factoriser cette valeur, il est possible d'utiliser le mécanisme de variables :

    Feature: Eating Oranges
    
    Background:
      Given I have a variable Nb_Oranges=12
    
      Scenario: Eating
        Given there are <start> oranges
        When I eat <eat> oranges
        Then I should have <left> oranges
        
      Examples:
        | start         | eat | left |
        | ${Nb_Oranges} |  5  |  7   |
        | ${Nb_Oranges} |  12 |  0   |
        
C'est trés pratique pour définir des constantes comme Pi par exemple.

###5.5 Tolérance Absolue
---

Afin de réaliser des vérifications, **XReq** permet d'utiliser des tolérances. On peut donc utiliser la syntaxe suivante :


    Feature: Eating Oranges
    
      Scenario: Eating
        Given there are <start> oranges
        When I eat <eat> oranges
        Then I should have <left> oranges
        
      Examples:
        | start | eat | left |
        | 12    |  5  |  7~1 |
        | 12    |  6  |  7~1 |
        | 12    |  4  |  7~1 |
        
Tout ces tests seront valides. L'assertion est réalisée avec une tolérance absolue, c'est a dire que les valeurs autorisées sont `[X-Tolérance .. X+Tolérance]`.

Afin d'utiliser cette fonctionnalité, il est nécessaire de modifier l'expression régulière du step. Elle doit maintenant ressembler à :

      --  @then ^I should have ([0-9]+(~[0-9])?) oranges$
      procedure Given_there_are_n_oranges (Args : in out Arg_Type);
      

###5.6 Tolérance Relative
---

Il est aussi tout à fait possible d'utiliser des tolérances relatives, pour cela, il faut utiliser la syntaxe suivante :


    Feature: Eating Oranges
    
      Scenario: Eating
        Given there are <start> oranges
        When I eat <eat> oranges
        Then I should have <left> oranges
        
      Examples:
        | start | eat | left   |
        | 105   |  5  | 100~1% |
        | 105   |  4  | 100~1% |
        | 105   |  6  | 100~1% |
        
Tout ces test seront valides. L'assertion est réalisé avec une tolérance relative, c'est a dire que les valeurs autorisées sont `[X-Tolérance .. X+Tolérance]`.

L'expression régulière doit aussi être modifiée pour pouvoir utiliser cette fonctionnalité :

      --  @then ^I should have ([0-9]+(~[0-9](%)?)?) oranges$
      procedure Given_there_are_n_oranges (Args : in out Arg_Type);
      

###5.7 Les comparateurs
---

Il est possible d'utiliser des comparateurs pour pouvoir faire des assertions. Les opérateurs disponibles sont : `<`, `>`, `<=` et `>=`.

    Feature: Eating Oranges
    
      Scenario: Eating
        Given there are <start> oranges
        When I eat <eat> oranges
        Then I should have <left> oranges
        
      Examples:
        | start | eat | left  |
        | 105   |  5  | >=100 |
        | 105   |  5  | <=100 |
        | 105   |  6  | <100  |
        | 105   |  4  | >100  |

L'expression régulière doit aussi être modifiée :

      --  @then ^I should have ((<|>|<=|>=)?[0-9]+) oranges$
      procedure Given_there_are_n_oranges (Args : in out Arg_Type);
      
###5.8 Les commentaires
---

Il est tout à fait possible de commenter un step dans un scénario, ou n'importe quelle ligne d'une feature d'ailleurs. Pour cela, il faut utiliser le symbole `#`.

    Feature: Eating Oranges
    
      Scenario: Eating
        Given there are 12 oranges
        When I eat 5 oranges
        Then I should have 7 oranges
        
    # Cette ligne et le scénario suivant sont commentés.
    #   Scenario: Eating a lot
    #     Given there are 12 oranges
    #     When I eat 12 oranges
    #     Then I should have 0 oranges
      
###5.9 Syntaxe alternative
---

Les mots clés classiques sont `Feature`, `Scenario`, `Background`, `Scenario Outline`, `Examples`, `Given`, `When` et `Then`. Il est toutefois posible de remplacer ces mots clés avec la correspondance suivante :

* `Feature` => `Requierement` ;
* `Scenario` => `Test Case` ;
* `Scenario outline` => `Test Case Template`.

##6. Implémentation des steps
---

Une fois que la feature est écrite, il faut implémenter les steps. C'est l'objet ce cette section.

###6.1 Récupération des paramètres
---

Afin de récupérer les paramètres présents dans les steps il faut utiliser les services fournis par **XReqLib**. Supposons que l'on ai le step suivant :

`When I eat 5 oranges and 6 lemons`

L'implémentation du step pour récupérer les paramètres est la suivante :

    procedure When_i_eat_n_oranges_and_m_lemons (Args : in out Arg_Type) is
    begin
       Nb_Of_Oranges := Nb_Of_Oranges - Integer'Value (Args.Match (1));
       Nb_Of_Lemons  := Nb_Of_Lemons  - Integer'Value (Args.Match (2));
    end When_i_eat_n_oranges_and_m_lemons;

On récupère les strings qui matchent les expressions régulières grâce à `Args.Match`.

Dans le cas du step décrit au dessus : 

* `Args.Match (1)` retournera `"5"`
* `Args.Match (2)` retournera `"6"`

###6.2 Variables
---

Dans cette section nous allons travailler sur l'exemple suivant :

    Feature: Eating Oranges
    
    Background:
      Given a variable Nb_Oranges=12
    
      Scenario: Eating
        Given there are ${Nb_Oranges} oranges
        When I eat 5 oranges
        Then I should have 7 oranges
        

####6.2.1 Stocker une variable
---

Pour stocker une variable, il faut utiliser la fonction `set_global` :


    procedure Given_A_Variable (args : in out Arg_Type) is
       name  : constant string := args.match(1);
       value : constant string := args.match(2);
    begin
       args.set_global(name, value);
    end Given_A_Variable;
    
Ici `name = "Nb_Oranges"` et `value = "12"`.

Les variables sont **globales** et donc communes à tous les scénarii.

####6.2.2 Utiliser une variable
---

Une fois que la variable est stockée, on l'utilise avec la fonction `match`, déjà utilisée pour récupérer les arguments des steps :

    procedure Given_There_Are_N_Oranges (args : in out Arg_Type) is
       Variable_Value  : constant String := args.match(1, replace => true);
    begin
       Nb_Oranges := Integer'Value(Variable_Value);
    end Given_There_Are_N_Oranges;

La variable `Variable_Value` contiendra `"12"`. Sans le `replace => true`, `Variable_Value` contiendra `"${Nb_Oranges}"`

####6.2.3 Purger les variables
---

Les variables étant des globales, il est nécessaire de pouvoir les purger à la demande. Pour cela, il existe la procédure `clear_globals`. Il est conseillé de l'utiliser tout le temps dans les backgrounds.

    procedure Given_all_variables_are_cleared (args : in out Arg_Type) is
    begin
        args.clear_globals;
    end Given_all_variables_are_cleared;
    
###6.3 Comparaisons
---

###6.3.1 Types prédefinis
---

Quelque soit le type de comparaison (`<`, `>`, `~`, `~ %`, `<=`, `>=`), l'utilisation est la même et dépend uniquement du type des données à vérifier.

Pour les types `Integer` et `Float`, il suffit d'utiliser l'assert définie dans `XReqLib.Asserts.Integer` ou `XReqLib.Asserts.Float` :


    procedure Then_I_Should_Have_N_Oranges (Args : in out Arg_Type) is
    begin
       Assert (Actual => Nb_Oranges,
               Match  => Args.Match (1),
               Reason => "Wrong number of oranges");
    end Then_I_Should_Have_N_Oranges; 
    
La procedure `Assert` determine elle même quel type d'assertion doit être effectué.

###6.3.2 Types Custom
---

Pour les types définis par l'utilisateur, il est nécessaire d'instancier un package générique. Le package à instancier sera différent en fonction du type de l'utilisateur.

Pour les types integer :

    with XReqLib.Asserts.Generic_Integer;

    package XReqLib.Asserts.Integer is new XReqLib.Asserts.Generic_Integer (MON_TYPE_INTEGER);

Pour les types flottants :

    with XReqLib.Asserts.Generic_Floating_Point;

    package XReqLib.Asserts.Float is new XReqLib.Asserts.Generic_Floating_Point (MON_TYPE_FLOTTANT);
    
Ensuite, l'utilisation se fait comme pour les types prédefinis.

##7. Exemples

Des exemples sont présents dans le répertoire exemples .

#_________________________________________Copyright (c) 2020 SOGILIS_______________________________________________#

