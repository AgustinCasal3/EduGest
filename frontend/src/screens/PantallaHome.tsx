import { useEffect, useState } from "react";
import { useRouter } from "expo-router";
import { StyleSheet, View, Text, FlatList, ActivityIndicator } from "react-native";
import TarjetasInstituciones from "@/components/TarjetasInstituciones";
import { Institucion, obtenerMisInstituciones } from "@/services/ServicioInstituciones";

export default function PantallaHome() {
  const router = useRouter();
  const [instituciones, setInstituciones] = useState<Institucion[]>([]);
  const [cargando, setCargando] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    const cargar = async () => {
      try {
        const datos = await obtenerMisInstituciones();
        setInstituciones(datos);
      } catch (e) {
        setError((e as Error).message);
      } finally {
        setCargando(false);
      }
    };
    cargar();
  }, []);

  if (cargando) {
    return (
      <View style={style.centrado}>
        <ActivityIndicator size="large" />
      </View>
    );
  }

  if (error) {
    return (
      <View style={style.centrado}>
        <Text>{error}</Text>
      </View>
    );
  }

  return (
    <FlatList
      style={styles.container}
      contentContainerStyle={style.contenido}
      data={instituciones}
      keyExtractor={(item) => String(item.id)}
      ListEmptyComponent={<Text>No estás inscripto en ninguna institución</Text>}
      renderItem={({ item }) => (
        <TarjetasInstituciones
          nombreInstitucion={item.nombre}
          carreraInstitucion={`${item.carrera} - ${item.anio}`}
          direccioninstitucion={item.direccion}
          onPress={() =>
            router.push("/"
            //     {
            //   pathname: "/institucion/[id]",
            //   params: { id: String(item.id) },
            // }
        )
          }
        />
      )}
    />
  );
}

const style = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fafbff",
  },
  contenido: {
    alignItems: "center",
    gap: 16,
    paddingVertical: 16,
  },
  centrado: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#fafbff",
  },
});

// export default function PantallaHome() {

//     const router = useRouter();



//     return(
//         <View style={styles.container}>

//             <TarjetasInstituciones
//                 nombreInstitucion="ISFT220"
//                 carreraInstitucion="Desarrollo de software - 2026"
//                 direccioninstitucion="Virrey loreto 2564"
//                 onPress ={() => router.push("/")}
//             />

//             <TarjetasInstituciones
//                 nombreInstitucion="Centro atomico"
//                 carreraInstitucion="Ingenieria de materiales - 2025"
//                 direccioninstitucion="AV. Gral Paz 1499"
//                 onPress={() => router.push("/preinscripcionexitosa")}
            
//             />

//         </View>
//     );
// }

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: "#fafbff",
        alignItems: "center",  
    },
   
});