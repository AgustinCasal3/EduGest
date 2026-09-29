import { Stack } from "expo-router";

export default function RootLayout() {
    return (
        <Stack>
            <Stack.Screen name="index" options={{headerShown: false}} />
            <Stack.Screen name="preinscripcion" options={{headerShown: false}} />
            <Stack.Screen name="preinscripcion2" options={{headerShown: false}} />
        </Stack>
        
    );
}