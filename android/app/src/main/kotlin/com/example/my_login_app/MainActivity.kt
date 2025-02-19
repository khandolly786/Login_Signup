package com.example.my_login_app

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import com.google.firebase.FirebaseApp

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        FirebaseApp.initializeApp(this) // ✅ Firebase Initialize
    }
}
