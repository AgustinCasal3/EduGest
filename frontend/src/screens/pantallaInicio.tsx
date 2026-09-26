import { View, Text, Image, TouchableOpacity, StyleSheet } from "react-native";
import { useRouter } from "expo-router";

export default function PantallaInicio() {
    const router = useRouter();

    return (
        <View style={styles.container}>
            <Image
                source={require("../../assets/images/EduGestLogo.png")}
                style={styles.logo}
                resizeMode="contain"
            /> 

            <View style={styles.buttonsContainer}>
                <TouchableOpacity
                    style={styles.button}
                    // onPress={() => router.push("/register")}
                >
                    <Text style={styles.buttonText}>Pre-inscribirse</Text>
                </TouchableOpacity>

                <TouchableOpacity
                    style={styles.button}
                    // onPress={() => router.push("/login")}
                >
                    <Text style={styles.buttonText}>Iniciar Sesión</Text>
                </TouchableOpacity>
            </View>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: "#9DB4F5",
        alignItems: "center",
        justifyContent: "space-between",
        paddingVertical: 80,
    },
    logo: {
        width: 220,
        height: 220,
        marginTop: 60,
    },
    buttonsContainer: {
        width: "80%",
        gap: 16,
    },
    button: {
        backgroundColor: "#5B6FC7",
        paddingVertical: 16,
        borderRadius: 30,
        alignItems: "center",
    },
    buttonText: {
        color: "white",
        fontSize: 16,
        fontWeight: "600",
    },
});