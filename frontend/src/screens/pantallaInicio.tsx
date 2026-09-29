import { useRouter } from "expo-router";
import { Image, StyleSheet, View } from "react-native";
import Boton from "../components/Boton";

export default function PantallaInicio() {
    const router = useRouter();

    return (
        <View style={styles.container}>
            <Image
                source={require("../../assets/images/EduGestLogo.png")}
                style={styles.logo}
                // resizeMode="contain"
            /> 

            <View style={styles.buttonsContainer}>
                <Boton
                label = "Pre-incripción"
                onPress ={() => router.push("/preinscripcion")}
                />

                <Boton
                label = "Iniciar sesión"
                onPress ={() => router.push("/")}
                />
            </View>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: "#9DB4F5",
        alignItems: "center",
        paddingVertical: 80,
    },
    logo: {
        width: 250,
        height: 200,
        marginTop: 10,
        marginBottom: 50,
    },
    buttonsContainer: {
        width: "100%",
        gap: 16,
        alignItems: "center",
        justifyContent: "center",
        marginBottom: 80,
    },
});