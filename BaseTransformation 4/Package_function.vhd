

library IEEE;


use ieee.math_real.all;

package FUNC is

function Rof (input : integer) return integer ;
function n_csa (i ,n:integer   ) return integer ;

function   counter_EVEN (input : integer)RETURN INTEGER  ; 
function   counter_ODD (input : integer)RETURN INTEGER  ;
  
END PACKAGE;

package body FUNC is
 
	-- it'll do for now
	function Rof (input : integer) return integer is
	variable y:integer;
	begin

	if input>0 then
	  y:=input ;
	  else 
	    y:=1;
		end if;
return y;
end rof;



function n_csa (i ,n:integer  ) return integer  is 

variable ncsa:INTEGER;
variable cin_O:INTEGER; 

begin 

ncsa:=(i-2);
cin_O:=(n*2)-ncsa-1; 
   return cin_O;

end n_csa;






function   counter_EVEN (input : integer)RETURN INTEGER  is 

variable RESULT :INTEGER:=0 ;
begin 
  FOR i IN 1 TO input LOOP
  IF (I MOD 2)=0 THEN 
    RESULT :=RESULT+1;
 END IF;
 END LOOP; 
 RETURN RESULT ; 
 END  counter_EVEN;
 
function   counter_ODD (input : integer)RETURN INTEGER  is 

variable RESULT :INTEGER:=0 ;
begin 
  FOR i IN 1 TO input LOOP
  IF (I MOD 2)>0 THEN 
    RESULT :=RESULT+1;
 END IF;
 END LOOP; 
 RETURN RESULT ; 
 END  counter_ODD; 
   
end FUNC;
 
 
 




