import { Image, StyleSheet, TouchableOpacity, View, Text } from "react-native";

interface TarjetasProps{
    nombreInstitucion: string,
    carreraInstitucion: string,
    direccioninstitucion: string,
    onPress: () => void,
}

export default function TarjetasInstituciones({nombreInstitucion, carreraInstitucion, direccioninstitucion, onPress}: TarjetasProps){
    return(
        <TouchableOpacity style={styles.instituciones} onPress={onPress}>

            <View style={styles.institucionesDivision}>
                <Text style={styles.institucionTitulo}>{nombreInstitucion}</Text>
                <Text style={styles.textoSubtitulo}>{carreraInstitucion}</Text>

                <TouchableOpacity style={styles.botonMenu}>
                    <Text>⋮</Text>
                </TouchableOpacity>
            </View>

            <View style={styles.institucionesDivision}>
                
                <View style={styles.filaDireccion}>

                <Text style={styles.textoSubtitulo}>{direccioninstitucion}</Text>

                <Text style={styles.flechaDerecha}>&gt;</Text>
                </View>
                
            </View>
        </TouchableOpacity>
    );
}

const styles = StyleSheet.create({
    instituciones: {
        height: "30%",
        width: "25%",
        marginTop: 30,

        backgroundColor: "lightgray",

        borderRadius: 20,
    },

    institucionTitulo: {
        fontSize: 23,
        padding: "2%",
    },

    institucionesDivision: {
        height: "50%",
        justifyContent: "flex-end",
    },

    textoSubtitulo: {
        padding: "2%",
    },

    filaDireccion: {
        flexDirection: "row",
        justifyContent: "space-between",
        alignItems: "center",
        paddingBottom: "2.5%",
    },

    flechaDerecha: {
        paddingRight: "8%",
    },

    botonMenu: {
        height: "25%",
        width: "6%",

        top: "10%",
        right: "5%",
        zIndex: 1, // para que quede por encima de los textos
        
        display: "flex",
        justifyContent: "center",
        alignItems: "center",
        position: "absolute",

        borderRadius: "100%",
    }
})