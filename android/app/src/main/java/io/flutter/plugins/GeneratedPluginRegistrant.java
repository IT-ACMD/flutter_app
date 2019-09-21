package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.jzoom.amaplocation.AmapLocationPlugin;
import com.pauldemarco.flutterblue.FlutterBluePlugin;
import io.flutter.plugins.pathprovider.PathProviderPlugin;
import com.yoozoo.sharesdk.SharesdkPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    AmapLocationPlugin.registerWith(registry.registrarFor("com.jzoom.amaplocation.AmapLocationPlugin"));
    FlutterBluePlugin.registerWith(registry.registrarFor("com.pauldemarco.flutterblue.FlutterBluePlugin"));
    PathProviderPlugin.registerWith(registry.registrarFor("io.flutter.plugins.pathprovider.PathProviderPlugin"));
    SharesdkPlugin.registerWith(registry.registrarFor("com.yoozoo.sharesdk.SharesdkPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
