// services/ServicioToken.ts
import { Platform } from "react-native";
import * as SecureStore from "expo-secure-store";

const CLAVE = "token";

export async function guardarToken(token: string): Promise<void> {
  if (Platform.OS === "web") {
    localStorage.setItem(CLAVE, token);
    return;
  }
  await SecureStore.setItemAsync(CLAVE, token);
}

export async function obtenerToken(): Promise<string | null> {
  if (Platform.OS === "web") {
    return localStorage.getItem(CLAVE);
  }
  return await SecureStore.getItemAsync(CLAVE);
}

export async function borrarToken(): Promise<void> {
  if (Platform.OS === "web") {
    localStorage.removeItem(CLAVE);
    return;
  }
  await SecureStore.deleteItemAsync(CLAVE);
}