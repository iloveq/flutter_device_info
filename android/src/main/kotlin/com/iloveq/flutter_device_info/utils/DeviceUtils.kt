package com.sohu.supermarie.utils

import android.annotation.SuppressLint
import android.content.ContentResolver
import android.os.Build
import android.provider.Settings
import com.google.gson.Gson
import java.util.*

class DeviceUtils {

    companion object {

        var METHOD_NAME_GET_DEVICE_INFO = "getDeviceInfo"

        fun getDeviceInfoJsonStr(contentResolver: ContentResolver?): String {
            val build: MutableMap<String, Any> = HashMap()
            build["board"] = Build.BOARD
            build["brand"] = Build.BRAND
            build["device"] = Build.DEVICE
            build["isPhysicalDevice"] = !isEmulator()
            build["androidId"] = getAndroidId(contentResolver)
            build["release"] = Build.VERSION.RELEASE
            build["sdkInt"] = Build.VERSION.SDK_INT
            build["svd"] = Build.BRAND
            return Gson().toJson(build)
        }


        @SuppressLint("HardwareIds")
        private fun getAndroidId(contentResolver: ContentResolver?): String {
            var retAndroidId = getUUID()
            try {
                contentResolver?.let {
                    retAndroidId = Settings.Secure.getString(contentResolver, Settings.Secure.ANDROID_ID)
                }
            } catch (e: Exception) {
                return retAndroidId
            }
            return retAndroidId
        }

        /**
         * A simple emulator-detection based on the flutter tools detection logic and a couple of legacy
         * detection systems
         */
        private fun isEmulator(): Boolean {
            return (Build.BRAND.startsWith("generic") && Build.DEVICE.startsWith("generic")
                    || Build.FINGERPRINT.startsWith("generic")
                    || Build.FINGERPRINT.startsWith("unknown")
                    || Build.HARDWARE.contains("goldfish")
                    || Build.HARDWARE.contains("ranchu")
                    || Build.MODEL.contains("google_sdk")
                    || Build.MODEL.contains("Emulator")
                    || Build.MODEL.contains("Android SDK built for x86")
                    || Build.MANUFACTURER.contains("Genymotion")
                    || Build.PRODUCT.contains("sdk_google")
                    || Build.PRODUCT.contains("google_sdk")
                    || Build.PRODUCT.contains("sdk")
                    || Build.PRODUCT.contains("sdk_x86")
                    || Build.PRODUCT.contains("vbox86p")
                    || Build.PRODUCT.contains("emulator")
                    || Build.PRODUCT.contains("simulator"))
        }

        private fun getUUID(): String {
            val uuid = UUID.randomUUID().toString()
            val time = System.currentTimeMillis().toString()
            return uuid + time
        }

    }
}