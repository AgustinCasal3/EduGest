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
      <View style={styles.centrado}>
        <ActivityIndicator size="large" />
      </View>
    );
  }

  if (error) {
    return (
      <View style={styles.centrado}>
        <Text>{error}</Text>
      </View>
    );
  }

  return (

    <FlatList
      style={styles.container}
      contentContainerStyle={styles.contenido}
      data={instituciones}
      keyExtractor={(item) => String(item.institucion_id)}
      ListEmptyComponent={<Text>No estás inscripto en ninguna institución</Text>}
      renderItem={({ item }) => (
        <TarjetasInstituciones
          nombreInstitucion={item.institucion_nombre}
          carreraInstitucion={`${item.carrera_nombre} - ${item.anio_lectivo}`}
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

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fafbff",
    // alignItems: "center",  
  },
  contenido: {
    // alignItems: "center",   // acá sí va, en contentContainerStyle
    paddingHorizontal: 16,  // el margen lateral lo da el padding, no un porcentaje
    paddingVertical: 16,
    gap: 16,
  },
  centrado: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#fafbff",
  },
});