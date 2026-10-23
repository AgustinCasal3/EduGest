// frontend/src/screens/PantallaHome.tsx
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
        <ActivityIndicator size="large" color="#5B6FC7" />
      </View>
    );
  }

  if (error) {
    return (
      <View style={styles.centrado}>
        <Text style={styles.textoError}>{error}</Text>
      </View>
    );
  }

  return (
    <FlatList
      style={styles.container}
      contentContainerStyle={styles.contenido}
      data={instituciones}
      keyExtractor={(item) => String(item.institucion_id)}
      ListEmptyComponent={
        <Text style={styles.textoVacio}>No estás inscripto en ninguna institución</Text>
      }
      renderItem={({ item }) => (
        <TarjetasInstituciones
          nombreInstitucion={item.institucion_nombre}
          carreraInstitucion={`${item.carrera_nombre}\n${item.anio_lectivo}`}
          direccioninstitucion={item.direccion}
          onPress={() =>
            router.push({
              pathname: "/institucion/[id]",
              params: { id: String(item.institucion_id) },
            })
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
  },
  contenido: {
    paddingHorizontal: 16,
    paddingVertical: 16,
    gap: 16,
  },
  centrado: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#fafbff",
  },
  textoError: {
    color: "#d32f2f",
    fontSize: 16,
  },
  textoVacio: {
    textAlign: "center",
    color: "#666",
    marginTop: 30,
  },
});