import { Image, StyleSheet, TouchableOpacity, View, Text } from "react-native";

interface TarjetasProps{
    nombreInstitucion: string,
    carreraInstitucion: string,
    direccioninstitucion: string,
    onPress: () => void,
}

export default function TarjetasInstituciones({nombreInstitucion, carreraInstitucion, direccioninstitucion, onPress}: TarjetasProps){
    return(
        <TouchableOpacity style={styles.container} onPress={onPress}>
            <View style={styles.instituciones}>

                <View style={styles.institucionesDivision}>
                    <Text style={styles.institucionTitulo}>{nombreInstitucion}</Text>
                    <Text>{carreraInstitucion}</Text>

                    <TouchableOpacity style={styles.botonMenu}>
                        <Text>⋮</Text>
                    </TouchableOpacity>
                </View>
                <View style={styles.institucionesDivision}>
                    <Text style={styles.textoDireccion}>{direccioninstitucion}</Text>

                    <Text>&gt;</Text>
                    
                </View>
            </View>
            
        </TouchableOpacity>
    );
}

const styles = StyleSheet.create({
     container: {
        flex: 1,
        backgroundColor: "#fafbff",
        alignItems: "center",
        
    },
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
        alignContent: "space-between",

    },

    textoDireccion: {
        padding: "2%",
    },

    botonMenu: {
        position: "absolute",
        top: "10%",
        right: "5%",
        zIndex: 1, // para que quede por encima de los textos
    }
})