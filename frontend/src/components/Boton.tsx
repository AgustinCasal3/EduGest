import { TouchableOpacity, Text, StyleSheet } from "react-native";

interface BotonProps{
    label: string;
    onPress: () => void;
}

export default function Boton({label, onPress}: BotonProps){
    return(
        <TouchableOpacity style={styles.boton} onPress={onPress}>
            <Text style={styles.textoBoton}>{label}</Text>
        </TouchableOpacity>
    );
}

const styles = StyleSheet.create({
    boton: {
        backgroundColor: "#5B6FC7",
        paddingVertical: 16,
        borderRadius: 30,
        alignItems: "center",
        width: 220,
    },
    textoBoton: {
        color: "white",
        fontSize: 16,
        fontWeight: "600",
    },
})