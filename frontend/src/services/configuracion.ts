export const API_URL = process.env.EXPO_PUBLIC_API_URL ?? "";

if (!API_URL) {
  console.warn("Falta EXPO_PUBLIC_API_URL en el .env");
}