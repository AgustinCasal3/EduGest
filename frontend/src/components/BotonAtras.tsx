import { Image, StyleSheet, TouchableOpacity, ViewStyle, StyleProp } from "react-native";

interface BotonProps{
    onPress: () => void;
    style?: StyleProp<ViewStyle>;
}

export default function BotonAtras({onPress, style}: BotonProps){
    return(
        <TouchableOpacity style={[styles.botonAtras, style]} onPress={onPress}>
            <Image 
                source={require("../../assets/images/BotonAtras.png")}
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
        top: 30,
        left: 10,
        zIndex: 2,
    },
})