import { View, Text, Image, TouchableOpacity, StyleSheet, } from "react-native";
import { useRouter } from "expo-router";
import  Boton  from "../components/Boton"
import TextBox from "../components/Textbox";

export default function PantallaPreinscripcion() {
    const router = useRouter();

    return (
        <View style={styles.container}>
            <Image
                source={require("../../assets/images/EduGestLogo.png")}
                style={styles.logo}
                resizeMode="contain"
            /> 

            <View style={styles.formContainer}>
                <TextBox
                    placeholder="we"
                    value=""
                    keyboardType="default"
                />
            </View>
            
        </View>
    ); 
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: "#fafbff",
        alignItems: "center",
        justifyContent: "space-between",
        paddingVertical: 80,
    },
    logo: {
        width: 200,
        height: 200,
        marginTop: 10,
    },
    formContainer: {
        width: "100%",
        gap: 16,
        alignItems: "center",
        justifyContent: "center",
        marginBottom: 80,
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
});