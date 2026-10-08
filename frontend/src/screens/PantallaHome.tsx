import { useRouter } from "expo-router";
import { Image, StyleSheet, TouchableOpacity, View, Text } from "react-native";
import TarjetasInstituciones from "@/components/TarjetasInstituciones";



export default function PantallaHome() {

    const router = useRouter();

    return(
        <View style={styles.container}>

            <TarjetasInstituciones
                nombreInstitucion="ISFT220"
                carreraInstitucion="Desarrollo de software - 2026"
                direccioninstitucion="Virrey loreto 2564"
                onPress ={() => router.push("/")}
            />

            <TarjetasInstituciones
                nombreInstitucion="Centro atomico"
                carreraInstitucion="Ingenieria de materiales - 2025"
                direccioninstitucion="AV. Gral Paz 1499"
                onPress={() => router.push("/preinscripcionexitosa")}
            
            />

        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: "#fafbff",
        alignItems: "center",  
    },
   
});