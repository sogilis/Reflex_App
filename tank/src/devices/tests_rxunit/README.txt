
Rxunit permet d'effectuer des tests unitaires sur un module de programme.


Pour utiliser RxUnit, on a  cr�� les fichiers suivant, par exemple pour
les valves :

devices-valves_suite.ads
devices-valves_suite.adb

Puis les fichiers contenant les tests :

devices-valves-tests.ads
devices-valves-tests.adb

et enfin un fichier qui est le point d'entr�e du programme de test, par exemple

test_valves.adb

Le fichier Devices.Valves_Suite contient la d�claration de la suite de tests :

with Devices.Valves.Tests;  <-- Import du fichier tests

package body Devices.Valves_Suite is

   Result : aliased Test_Suite;

   Test_Case_Events : aliased Devices.Valves.Tests.Test_Case; <-- Declaration du type tests_case prope � Valves

   function Suite return Access_Test_Suite is
   begin
      Add_Test (Result'Access, Test_Case_Events'Access);

      return Result'Access;
   end Suite;

end Devices.Valves_Suite;

--

Dans le fichier Devices.Valves.Tests.adb on place les tests de la mani�re suivant :

   procedure Test_Cyclic
     (R : in out RxUnit.Test_Cases.Test_Case'Class)

Cette procedure doit estre enregistr� pour qu'elle soit appell�e automatiquement dans la fonction Register_Tests en fin de fichier Devices.Valves.Tests.adb

* le fichier Devices.Valves.Tests.adb est un package fils de Devices.valves
                    <------------>
Enfin le fihier dans la directory main est un procedure qui est le point d'entr�e du programme de tests :

with RxUnit.Reporter.Text; 
with RxUnit.Run;
with Devices.Valves_Suite; <-- Import de la suite de tests

procedure Test_Valves is

   procedure Run
   is new RxUnit.Run.Test_Runner (Devices.Valves_Suite.Suite); <-- Instanciation de Test_Suite
   
   Reporter : RxUnit.Reporter.Text.Text_Reporter;
   --  Reporter : RxUnit.Reporter.XML.XML_Reporter;

begin
   Run (Reporter);   <-- Lancement des tests
end Test_Valves;


Un test est compos� d'une proedure exemple Test_Cyclic

   procedure Test_Cyclic
     (R : in out RxUnit.Test_Cases.Test_Case'Class)
   is
      Valve        : Valve_Record;
      Open         : Boolean;
      Close        : Boolean;
      Opened       : Boolean;
      Closed       : Boolean;
      Open_Order   : Boolean;
      Close_Order  : Boolean;
   begin
      Initialize (Valve);    <-- Initialise Valves
      
      --  Initial State
      
      Open   := False;      <-- Force les entr�es du module Valves
      Close  := False;
      Opened := False;
      Closed := False;
      
      Valve.Cyclic                   <-- Appel de Valve
	( Open         => Open,
	 Close        => Close,
	 Opened       => Opened,
	 Closed       => Close,
	 Open_Order   => Open_Order,
	 Close_Order  => Close_Order);

      -- V�rification que le graf de Valve est dans l'�tat Waiting_State
      
      Assert (Valve.State = Waiting_State, "Cyclic: State = Waiting_State");
              <------------------------->  <----------------------------->
              Condition � v�rifier           Message en cas d'erreur.

      Assert
	(Open_Order = False,
	 "Cyclic: State = Waiting_State: Open_Order must be false");
      Assert
	(Close_Order = False,
	 "Cyclic: State = Waiting_State: Close_Order must be false");
	      
