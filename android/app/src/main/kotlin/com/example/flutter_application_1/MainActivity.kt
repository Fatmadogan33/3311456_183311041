package com.example.flutter_application_1
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutterembedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: FlutterActivity() {
      override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(FlutterEngine(this))
        }
}
