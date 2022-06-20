package com.example.tesseract_latest;

import android.content.Context;
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngine.EngineLifecycleListener;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import com.googlecode.tesseract.android.TessBaseAPI;
import java.io.File;


public class TesseractLatestPlugin implements FlutterPlugin {
    private MethodChannel channel;
    private MainMethodCallHandler methodCallHandler;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        Context applicationContext = binding.getApplicationContext();
        BinaryMessenger messenger = binding.getBinaryMessenger();
        methodCallHandler = new MainMethodCallHandler(applicationContext, messenger);

        channel = new MethodChannel(messenger, "tesseract_latest");
        channel.setMethodCallHandler(methodCallHandler);
        @SuppressWarnings("deprecation")
        FlutterEngine engine = binding.getFlutterEngine();
        engine.addEngineLifecycleListener(new EngineLifecycleListener() {
            @Override
            public void onPreEngineRestart() {
            }

            @Override
            public void onEngineWillDestroy() {
            }
        });
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        methodCallHandler = null;

        channel.setMethodCallHandler(null);
    }

}
// import androidx.annotation.NonNull;

// import io.flutter.embedding.engine.plugins.FlutterPlugin;
// import io.flutter.plugin.common.MethodCall;
// import io.flutter.plugin.common.MethodChannel;
// import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
// import io.flutter.plugin.common.MethodChannel.Result;

// /** TesseractLatestPlugin */
// public class TesseractLatestPlugin implements FlutterPlugin, MethodCallHandler {
//   /// The MethodChannel that will the communication between Flutter and native Android
//   ///
//   /// This local reference serves to register the plugin with the Flutter Engine and unregister it
//   /// when the Flutter Engine is detached from the Activity
//   private MethodChannel channel;

//   @Override
//   public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
//     channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "tesseract_latest");
//     channel.setMethodCallHandler(this);
//   }

//   @Override
//   public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
//     if (call.method.equals("getPlatformVersion")) {
//       result.success("Android " + android.os.Build.VERSION.RELEASE);
//     } else {
//       result.notImplemented();
//     }
//   }

//   @Override
//   public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
//     channel.setMethodCallHandler(null);
//   }
// }
