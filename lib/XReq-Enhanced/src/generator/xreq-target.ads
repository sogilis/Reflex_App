package XReq.Target is

   Invalid_Target : exception;

   type Target_Type is (Target_x86_64, Target_Arm_Eabi);

   function Get_Target (Target : String) return Target_Type;

end XReq.Target;
