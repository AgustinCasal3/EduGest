import {View, Text, StyleSheet, TouchableOpacity,TextInput, Image, ScrollView, Pressable, Platform, useWindowDimensions, KeyboardAvoidingView} from "react-native";
import { useRouter } from "expo-router";
import { useState } from "react"
import BotonAtras from "@/components/BotonAtras";
import { useSafeAreaInsets } from "react-native-safe-area-context";

export default function ChatBot() {
    const router = useRouter();
    const [menuAbierto, setMenuAbierto] = useState(false);
    const { width } = useWindowDimensions();
    const insets = useSafeAreaInsets();
    const esMovil = width < 768;
  

  return(
    <View style={styles.container}>

      {menuAbierto && (
        <>
          {esMovil && (
            <Pressable style={styles.fondoOscuro} onPress={() => setMenuAbierto(false)}/>
          )}
          <View style={[styles.contenedorIzquierda, esMovil && styles.contenedorIzquierdaMovil, { paddingTop: insets.top },]}>
              <View style={styles.botonesMenu}>
                <BotonAtras onPress={() => router.back()} style={styles.botonAtras}/>
                <Text>Nombre del chat</Text>
              </View>
              <Pressable style={({hovered}: any) => [styles.botonNuevoChat, hovered && styles.botonHover]}><Image style={styles.imagenMas} source={require("../../assets/images/simboloMas.png")}/><Text style={styles.textoNuevoChat}>Nuevo chat</Text></Pressable>
              <Text style={styles.textoChat}>Chats</Text>
              <ScrollView>
                <Pressable style={({hovered}: any) => [styles.botonChats, hovered && styles.botonHover]}><Text style={styles.textoBotonChat}>Hola lorem</Text></Pressable>
                <Pressable style={({hovered}: any) => [styles.botonChats, hovered && styles.botonHover]}><Text style={styles.textoBotonChat}>Hola lorem</Text></Pressable>
                <Pressable style={({hovered}: any) => [styles.botonChats, hovered && styles.botonHover]}><Text style={styles.textoBotonChat}>Hola lorem</Text></Pressable>
                <Pressable style={({hovered}: any) => [styles.botonChats, hovered && styles.botonHover]}><Text style={styles.textoBotonChat}>Hola lorem</Text></Pressable>
                <Pressable style={({hovered}: any) => [styles.botonChats, hovered && styles.botonHover]}><Text style={styles.textoBotonChat}>Hola lorem</Text></Pressable>
                <Pressable style={({hovered}: any) => [styles.botonChats, hovered && styles.botonHover]}><Text style={styles.textoBotonChat}>Hola lorem</Text></Pressable>
                <Pressable style={({hovered}: any) => [styles.botonChats, hovered && styles.botonHover]}><Text style={styles.textoBotonChat}>Hola lorem</Text></Pressable>
                <Pressable style={({hovered}: any) => [styles.botonChats, hovered && styles.botonHover]}><Text style={styles.textoBotonChat}>Hola lorem</Text></Pressable>
                <Pressable style={({hovered}: any) => [styles.botonChats, hovered && styles.botonHover]}><Text style={styles.textoBotonChat}>Hola lorem</Text></Pressable>
                <Pressable style={({hovered}: any) => [styles.botonChats, hovered && styles.botonHover]}><Text style={styles.textoBotonChat}>Hola lorem</Text></Pressable>
              </ScrollView>
              <View style={styles.contenedorCuenta}>
                <Image source={require("../../assets/images/iconoCuenta.png")}/>
                <Text> Nombre del usuario</Text>
              </View>
          </View>
        </>


      )}

      <KeyboardAvoidingView style={styles.contenedorDerecha} behavior={Platform.OS === "ios" ? "padding" : undefined}>
        <TouchableOpacity style={[styles.botonMenu, {marginTop: insets.top + 10, marginLeft: 10}]} onPress={() => setMenuAbierto(!menuAbierto)}><Image source={require("../../assets/images/menu.png")}/></TouchableOpacity>
        <ScrollView style={styles.scrollChat} contentContainerStyle={styles.scrollChatContenido}>
          <View style={styles.contenedorChat}>
            <Text style={styles.textPregunta}>hola Lorem Lorem Lorem hola Lorem Lorem Lorem hola Lorem Lorem Lorem hola Lorem Lorem Lorem</Text>
            <Text style={styles.textRespuesta}>Lorem ipsum dolor sit amet consectetur adipisicing elit. Nesciunt aliquam cum error! Asperiores debitis qui tempora quisquam vitae facilis rerum repellat consectetur ut. Maxime eveniet repellat soluta dignissimos quae consequatur. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis exercitationem vitae cum nam iure dignissimos officia, quam dolore ea nihil sed assumenda aut inventore et fugit tempore voluptate, veritatis impedit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Necessitatibus laborum exercitationem sapiente iure, sint, doloribus, distinctio quos laboriosam labore ipsa ex voluptas? Fuga earum voluptas enim magni explicabo amet id? Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam facilis vel hic repellendus voluptatem veritatis explicabo enim, consequatur atque itaque quidem assumenda vero necessitatibus sint perspiciatis possimus at debitis voluptatibus?
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Nesciunt aliquam cum error! Asperiores debitis qui tempora quisquam vitae facilis rerum repellat consectetur ut. Maxime eveniet repellat soluta dignissimos quae consequatur. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis exercitationem vitae cum nam iure dignissimos officia, quam dolore ea nihil sed assumenda aut inventore et fugit tempore voluptate, veritatis impedit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Necessitatibus laborum exercitationem sapiente iure, sint, doloribus, distinctio quos laboriosam labore ipsa ex voluptas? Fuga earum voluptas enim magni explicabo amet id? Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam facilis vel hic repellendus voluptatem veritatis explicabo enim, consequatur atque itaque quidem assumenda vero necessitatibus sint perspiciatis possimus at debitis voluptatibus?
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Nesciunt aliquam cum error! Asperiores debitis qui tempora quisquam vitae facilis rerum repellat consectetur ut. Maxime eveniet repellat soluta dignissimos quae consequatur. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis exercitationem vitae cum nam iure dignissimos officia, quam dolore ea nihil sed assumenda aut inventore et fugit tempore voluptate, veritatis impedit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Necessitatibus laborum exercitationem sapiente iure, sint, doloribus, distinctio quos laboriosam labore ipsa ex voluptas? Fuga earum voluptas enim magni explicabo amet id? Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam facilis vel hic repellendus voluptatem veritatis explicabo enim, consequatur atque itaque quidem assumenda vero necessitatibus sint perspiciatis possimus at debitis voluptatibus?
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Nesciunt aliquam cum error! Asperiores debitis qui tempora quisquam vitae facilis rerum repellat consectetur ut. Maxime eveniet repellat soluta dignissimos quae consequatur. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quis exercitationem vitae cum nam iure dignissimos officia, quam dolore ea nihil sed assumenda aut inventore et fugit tempore voluptate, veritatis impedit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Necessitatibus laborum exercitationem sapiente iure, sint, doloribus, distinctio quos laboriosam labore ipsa ex voluptas? Fuga earum voluptas enim magni explicabo amet id? Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam facilis vel hic repellendus voluptatem veritatis explicabo enim, consequatur atque itaque quidem assumenda vero necessitatibus sint perspiciatis possimus at debitis voluptatibus?
            </Text>
          </View>
        </ScrollView>

        <View style={[styles.zonaMensaje, {paddingBottom: Math.max(insets.bottom, 15)}]}>
          <View style={styles.contenedorMensaje}>
            <TextInput placeholder="Escriba un mensaje..." multiline maxLength={500 } style={styles.textboxMensaje}></TextInput>
            <TouchableOpacity style={styles.botonEnviar}><Image source={require("../../assets/images/fechaArriba.png")}/></TouchableOpacity> 
          </View>
        </View>
      </KeyboardAvoidingView>
    </View>
  );
}


const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#232827",
    flexDirection: "row",
  },
  titulo: {
    textAlign: "center",
    marginBottom: 25,
    fontSize: 32,
    fontWeight: "bold",
    color: "#333",
    marginTop: 0,
  },
  contenedor: {
    flexDirection: "row",
    justifyContent: "center",
    flexWrap: "wrap",
    gap: 25,
  },
  contenedorHorizontal: {
    flexDirection: "row",
    justifyContent: "center",
    flexWrap: "wrap",
    gap: 25,
    marginTop: 50,
  },
  contenedorIzquierda: {
    width: "20%",
    minWidth: 220,
    backgroundColor: "#e7edec",
  },
  contenedorIzquierdaMovil: {
    position: "absolute",
    top: 0, bottom: 0, left: 0, right: 0,
    backgroundColor: "#e7edec",
    zIndex: 10,
    elevation: 10,
  },
  fondoOscuro: {
    position: "absolute",
    top: 0, bottom: 0, left: 0, right: 0,
    backgroundColor: "rgba(0,0,0,0.5)",
    zIndex: 10,
    elevation: 10,
  },

  contenedorDerecha: {
    flex: 1,
    flexDirection: "column",
  },
  scrollChat: {
    flex: 1,
  },
  scrollChatContenido: {
    alignItems: "center",
    paddingTop: 10,
    paddingBottom: 20,
  },
  contenedorChat: {
    width: "100%",
    maxWidth: 800,
    paddingHorizontal: 20,
  },
  zonaMensaje: {
    // position: "absolute",
    // bottom: 0,
    // left: 15,
    // right: 15,
    alignItems: "center",
    paddingHorizontal: 15,
    paddingTop: 10,
    // paddingBottom: 30,
    // pointerEvents: "box-none",
    // zIndex: 1,
    backgroundColor: "#232827",
  },
  contenedorMensaje: {
    width: "100%",
    maxWidth: 800,
    borderColor: "#e7edec",
    borderWidth: 1,
    borderRadius: 20,
    minHeight: 60,
    maxHeight: 200,
    flexDirection: "row",
    alignItems: "flex-end",
    padding: 10,
    gap: 10,
  },
  textboxMensaje: {
    flex: 1,
    color: "#e7edec",
    fontSize: 16,
    paddingHorizontal: 5,
    outlineStyle: "none",
  } as any,
  textRespuesta: {
    fontSize: 17,
    color: "#e7edec",
  },
  textPregunta: {
    fontSize: 17,
    color: "#e7edec",
    backgroundColor: "#6b7472",
    width: "auto",
    maxWidth: 600,
    alignSelf: "flex-end",
    padding: 5,
    borderRadius: 10,
    marginTop: 20,
    marginBottom: 20,
  },
  botonEnviar: {
    backgroundColor: "#e7edec",
    borderRadius: 15,
    height: 30,
    width: 30,
    justifyContent: "center",
    alignItems: "center",
  },
  contenedorBotones:{
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    width: "100%",
    paddingHorizontal: 20,
  },
  contenedorScroll:{
    flex: 1,
    backgroundColor: "#f5f5f5",
    borderRadius: 10,
    marginBottom: 30,
    overflow: "hidden",
  },
  contenedorCuenta: {
    flexDirection: "row",
    alignItems: "center",
    height: 60,
    borderTopWidth: 0.5,
    borderColor: "#232827",
  },
  botonesIzquierda:{
    flexDirection: "row",
    alignItems: "center",
    gap: 10
  },
  card: {
    width: 230,
    padding: 20,
    backgroundColor: "#f5f5f5",
    borderRadius: 12,
    alignItems: "center",
    margin: 10,
    shadowColor: "#000",
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.1,
    shadowRadius: 5,
    elevation: 5,
  },
  icono: {
    fontSize: 45,
    marginBottom: 10,
  },
  tituloCard: {
    fontSize: 20,
    fontWeight: "bold",
    textAlign: "center",
  },
  descripcion: {
    textAlign: "center",
    marginTop: 5,
    color: "#333",
  },
  contenedorNotas: {
    flexDirection: "row",
    flexWrap: "wrap",
    justifyContent: "flex-start",
    gap: 20,
    padding: 20,
    paddingBottom: 30,
  },
  input: {
    borderWidth: 1,
    borderColor: "#ccc",
    borderRadius: 12,
    padding: 10,
    backgroundColor: "#fafafa",
    width: 250,
  },
  botonAtras:{
    position: "relative",
    top: 0,
    left: 0,
    padding: 14,
    borderRadius: 10,
    justifyContent: "center",
    alignItems: "center",
    color:"#f5f5f5",
    fontWeight: "bold",
    fontSize: 19,
    height: 40,
    width: 40,
  },
  botonMenu: {
    padding: 14,
    borderRadius: 20,
    justifyContent: "center",
    alignItems: "center",
    color:"#f5f5f5",
    backgroundColor: "#fdfdfd",
    fontWeight: "bold",
    fontSize: 19,
    height: 40,
    width: 40,
  },
  botonesMenu: {
    flexDirection: "row",
    alignItems: "center",
  },
  botonNuevoChat: {
    width: "100%",
    flexDirection: "row",
    borderRadius: 10,
  },
  botonHover: {
    backgroundColor: "#e0e0e0",
  },
  imagenMas: {
    marginLeft: 0,
  },
  textoNuevoChat: {
    marginTop: 1.5,
  },
  botonChats: {
    flex: 1,
    height: 30,
    marginBottom: 0.4,
    alignItems: "center",
    flexDirection: "row",
    borderRadius: 10,
  },
  textoBotonChat: {
    marginLeft: 10,
    marginBottom: 1.5,
  },
  contenedorFormulario:{
    marginTop: 50,
  },
  textoChat:{
    marginTop: 10,
  },
  textoChico:{
    fontSize: 11,
    marginBottom: 30,
  },
  iconoCuenta:{
    width: 150,
    height: 150,
    color: "#040505",
    marginTop: 100,
  },
  imagenChatbot:{
    width: 60,
    height: 60,
  },
  imagenFlecha:{
    width: 30,
    height: 30,
  },
  imagenRutinaDeEjercicios:{
    width: 505,
    height: 455,
  },
  link:{
    color: "#0004d8"

  }
});