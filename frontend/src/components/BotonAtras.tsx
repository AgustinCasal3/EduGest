import { Image, StyleSheet, TouchableOpacity } from "react-native";

interface BotonProps{
    onPress: () => void;
}

export default function BotonAtras({onPress}: BotonProps){
    return(
        <TouchableOpacity style={styles.botonAtras} onPress={onPress}>
            <Image 
                source={require("../../assets/images/BotonAtras.svg")}
                resizeMode="contain"
            />
        </TouchableOpacity>
    );
}

const styles = StyleSheet.create({
    botonAtras: {
        paddingVertical: 16,
        borderRadius: 10,
        justifyContent: "center",
        alignItems: "center",
        width: 30,
        height: 20,
        position: "absolute",
        top: 10,
        left: 10,
    },
})