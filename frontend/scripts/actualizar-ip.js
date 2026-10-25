// scripts/actualizar-ip.js
const fs = require("fs");
const os = require("os");
const path = require("path");

const PUERTO = 3000; // el puerto de tu backend
const ARCHIVO_ENV = path.join(__dirname, "..", ".env");

// Adaptadores virtuales que no sirven (VPN, Docker, WSL, VMs...)
const IGNORAR = /vmware|virtualbox|vethernet|wsl|docker|hyper-v|vpn|tailscale|loopback/i;

function obtenerIP() {
  const candidatas = [];

  for (const [nombre, interfaces] of Object.entries(os.networkInterfaces())) {
    if (IGNORAR.test(nombre)) continue;
    for (const i of interfaces ?? []) {
      const esIPv4 = i.family === "IPv4" || i.family === 4;
      if (esIPv4 && !i.internal) candidatas.push({ nombre, ip: i.address });
    }
  }

  console.log("IPs encontradas:", candidatas);

  const elegida = candidatas.find((c) => c.ip.startsWith("192.168.")) ?? candidatas[0];
  return elegida ? elegida.ip : null; // null si no encontró nada
}

function actualizarEnv(ip) {
  const linea = `EXPO_PUBLIC_API_URL=http://${ip}:${PUERTO}/api`;
  let contenido = fs.existsSync(ARCHIVO_ENV) ? fs.readFileSync(ARCHIVO_ENV, "utf8") : "";

  if (contenido.includes(linea)) {
    console.log("✔ El .env ya tenía la IP correcta, no se tocó nada.");
    return;
  }

  if (/^EXPO_PUBLIC_API_URL=.*$/m.test(contenido)) {
    contenido = contenido.replace(/^EXPO_PUBLIC_API_URL=.*$/m, linea);
  } else {
    contenido += (contenido && !contenido.endsWith("\n") ? "\n" : "") + linea + "\n";
  }

  fs.writeFileSync(ARCHIVO_ENV, contenido);
  console.log(`✔ .env actualizado: ${linea}`);
}

function actualizar() {
  const ip = obtenerIP();

  if (!ip) {
    console.warn("⚠ No se encontró ninguna IP. Se deja el .env como estaba.");
    return;
  }

  actualizarEnv(ip);

  // Para que Expo use la IP nueva en esta misma ejecución
  process.env.EXPO_PUBLIC_API_URL = `http://${ip}:${PUERTO}/api`;
}

module.exports = actualizar;

// Si lo corrés a mano (node scripts/actualizar-ip.js) también funciona
if (require.main === module) actualizar();