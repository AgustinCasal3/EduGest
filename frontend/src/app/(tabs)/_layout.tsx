// src/app/(tabs)/_layout.tsx
import { Tabs } from "expo-router";
import { Image } from "react-native";

export default function TabsLayout() {
  return (
    <Tabs
      screenOptions={{
        headerShown: false,          // sin título arriba
        tabBarShowLabel: false,      // solo íconos, como en tu foto
        tabBarActiveTintColor: "#000",
        tabBarInactiveTintColor: "#777",
        tabBarStyle: {
          backgroundColor: "#d9d9d9",
          height: 64,
          borderTopWidth: 0,
        },
      }}
    >
      <Tabs.Screen
        name="foro"
        options={{
            tabBarIcon: ({ color, size }) => (
                <Image
                    source={require("../../../assets/images/foro.png")}
                    style={{ width: size, height: size, tintColor: color }}
                    resizeMode="contain"
                />
            ),
        }}
      />
      <Tabs.Screen
        name="chat"
        options={{
            tabBarIcon: ({ color, size }) => (
                <Image
                    source={require("../../../assets/images/chat.png")}
                    style={{ width: size, height: size, tintColor: color }}
                    resizeMode="contain"
                />
            ),
        }}
      />
      <Tabs.Screen
        name="materias"
        options={{
            tabBarIcon: ({ color, size }) => (
                <Image
                    source={require("../../../assets/images/materias.png")}
                    style={{ width: size, height: size, tintColor: color }}
                    resizeMode="contain"
                />
            ),
        }}
      />
      <Tabs.Screen
        name="perfil"
        options={{
            tabBarIcon: ({ color, size }) => (
                <Image
                    source={require("../../../assets/images/iconoCuenta.png")}
                    style={{ width: size, height: size, tintColor: color }}
                    resizeMode="contain"
                />
            ),
        }}
      />
    </Tabs>
  );
}