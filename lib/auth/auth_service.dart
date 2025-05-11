
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService{
  final SupabaseClient _supabase=Supabase.instance.client;

  //signin with email and password
  Future<AuthResponse> signinwithEmailPassword(String email,String password)async{
  return await _supabase.auth.signInWithPassword(
       email: email,
      password: password,

  );

  }
//signup with email and password

    Future<AuthResponse> SignUpwithemailpassword(String email,String password)async{
   return await _supabase.auth.signUp(
         email: email,
         password: password
     );
     }

    //SignOut
    Future<void> SignOut()async{
    await _supabase.auth.signOut();
    }

    //GetUserEmail
    String? GetCurrentUseremail(){
    final session=_supabase.auth.currentSession;
    final user=session?.user;

    return user?.email;
    }
}