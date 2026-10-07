import { useRouter } from "expo-router";
import { Image, StyleSheet, TouchableOpacity, View, Text } from "react-native";
import TarjetasInstituciones from "@/components/TarjetasInstituciones";



export default function PantallaHome() {

    const router = useRouter();

    return(
        <TarjetasInstituciones
            nombreInstitucion="ISFT220"
            carreraInstitucion="Desarrollo de software - 2026"
            direccioninstitucion="Virrey loreto 2564"
            onPress ={() => router.push("/")}
        />
    );
}

const styles = StyleSheet.create({

    textoLabel: {
        fontSize: 15,
        marginTop: 10,
    },

    button: {
        backgroundColor: "#5B6FC7",
        paddingVertical: 16,
        borderRadius: 30,
        alignItems: "center",
        width: 220,
    },
    buttonText: {
        color: "white",
        fontSize: 16,
        fontWeight: "600",
    },
    botonMargin: {
        marginTop: 20,
    },
    textBox: {
        backgroundColor: "#d9d9d9",
        borderWidth: 2,
        borderColor: "black",
        borderRadius: 20,
        paddingHorizontal: 16,
        paddingVertical: 14,
        fontSize: 16,
        width: 220,
        // marginBottom: 15,
    },
});