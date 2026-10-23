// frontend/src/screens/PantallaInstitucion.tsx
import React, { useEffect, useState } from "react";
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  ActivityIndicator,
  TouchableOpacity,
} from "react-native";
import { useLocalSearchParams, useRouter } from "expo-router";
import BotonAtras from "@/components/BotonAtras";
import { obtenerToken } from "@/services/ServicioToken";

//import { API_URL } from "./configuracion";

interface Charla {
  id: number;
  nombre: string;
}

interface MateriasAnio {
  anio: number;
  charlas: Charla[];
}

interface DatosForo {
  institucion: string;
  carrera: string;
  charlasGenerales: Charla[];
  materiasPorAnio: MateriasAnio[];
}

// IP asignada a tu backend local
const API_URL = "http://10.0.50.15:3000/api";

export default function PantallaInstitucion() {
  const { id } = useLocalSearchParams<{ id: string }>();
  const router = useRouter();

  const [cargando, setCargando] = useState(true);
  const [datos, setDatos] = useState<DatosForo | null>(null);
  const [error, setError] = useState("");

  useEffect(() => {
    const cargarDatosForo = async () => {
      try {
        const token = await obtenerToken();

        if (!token) {
          throw new Error("No hay una sesión activa");
        }

        const respuesta = await fetch(`${API_URL}/foros/${id}`, {
          headers: {
            "Content-Type": "application/json",
            Authorization: `Bearer ${token}`,
          },
        });

        if (!respuesta.ok) {
          const resError = await respuesta.json();
          throw new Error(resError.error || "Error al obtener los datos del foro");
        }

        const data = await respuesta.json();
        setDatos(data);
      } catch (e) {
        setError((e as Error).message);
      } finally {
        setCargando(false);
      }
    };

    if (id) {
      cargarDatosForo();
    }
  }, [id]);

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
        <BotonAtras onPress={() => router.back()} />
        <Text style={styles.textoError}>{error}</Text>
      </View>
    );
  }

  return (
    <View style={styles.pantalla}>
      <View style={styles.header}>
        <BotonAtras onPress={() => router.back()} />
        <View style={styles.headerTitulos}>
          <Text style={styles.tituloHeader}>{datos?.institucion}</Text>
          <Text style={styles.subtituloHeader}>{datos?.carrera}</Text>
        </View>
      </View>

      <ScrollView style={styles.container} contentContainerStyle={styles.contenido}>
        {/* Sección Charlas Generales */}
        <Text style={styles.tituloSeccion}>Charlas Generales</Text>
        {datos?.charlasGenerales && datos.charlasGenerales.length > 0 ? (
          datos.charlasGenerales.map((charla) => (
            <TouchableOpacity
              key={charla.id}
              style={styles.itemClickable}
              onPress={() => router.push(`/chatbot` as any)}
            >
              <Text style={styles.textoItem}>• {charla.nombre}</Text>
            </TouchableOpacity>
          ))
        ) : (
          <Text style={styles.textoVacio}>No hay charlas generales registradas</Text>
        )}

        <View style={styles.divisor} />

        {/* Sección Materias por Año */}
        <Text style={styles.tituloSeccion}>Materias</Text>
        {datos?.materiasPorAnio && datos.materiasPorAnio.length > 0 ? (
          datos.materiasPorAnio.map((bloqueAnio) => (
            <View key={bloqueAnio.anio} style={styles.bloqueAnio}>
              <View style={styles.encabezadoAnio}>
                <Text style={styles.textoAnio}>{bloqueAnio.anio}° Año</Text>
                <View style={styles.lineaAnio} />
              </View>

              {bloqueAnio.charlas.map((charlaMateria) => (
                <TouchableOpacity
                  key={charlaMateria.id}
                  style={styles.itemClickable}
                  onPress={() => router.push(`/chatbot` as any)}
                >
                  <Text style={styles.textoItem}>{charlaMateria.nombre}</Text>
                </TouchableOpacity>
              ))}
            </View>
          ))
        ) : (
          <Text style={styles.textoVacio}>No hay materias registradas</Text>
        )}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  pantalla: {
    flex: 1,
    backgroundColor: "#ffffff",
  },
  header: {
    flexDirection: "row",
    alignItems: "center",
    paddingTop: 50,
    paddingHorizontal: 16,
    paddingBottom: 10,
    backgroundColor: "#fafbff",
    borderBottomWidth: 1,
    borderBottomColor: "#eee",
  },
  headerTitulos: {
    marginLeft: 10,
    flex: 1,
  },
  tituloHeader: {
    fontSize: 18,
    fontWeight: "bold",
    color: "#333",
  },
  subtituloHeader: {
    fontSize: 14,
    color: "#666",
  },
  container: {
    flex: 1,
  },
  contenido: {
    padding: 20,
  },
  centrado: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    padding: 20,
    backgroundColor: "#ffffff",
  },
  textoError: {
    color: "#d32f2f",
    fontSize: 16,
    marginTop: 20,
    textAlign: "center",
  },
  tituloSeccion: {
    fontSize: 18,
    fontWeight: "600",
    color: "#333",
    marginBottom: 12,
  },
  itemClickable: {
    paddingVertical: 8,
    paddingHorizontal: 4,
  },
  textoItem: {
    fontSize: 15,
    color: "#444",
  },
  textoVacio: {
    fontSize: 13,
    color: "#888",
    fontStyle: "italic",
    marginBottom: 10,
  },
  divisor: {
    height: 1,
    backgroundColor: "#e0e0e0",
    marginVertical: 16,
  },
  bloqueAnio: {
    marginTop: 10,
    marginBottom: 10,
  },
  encabezadoAnio: {
    flexDirection: "row",
    alignItems: "center",
    marginBottom: 8,
  },
  textoAnio: {
    fontSize: 15,
    fontWeight: "bold",
    color: "#5B6FC7",
    marginRight: 8,
  },
  lineaAnio: {
    flex: 1,
    height: 1,
    backgroundColor: "#5B6FC7",
  },
});