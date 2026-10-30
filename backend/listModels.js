require('dotenv').config();
const { GoogleGenAI } = require('@google/genai');

const ai = new GoogleGenAI({ apiKey: process.env.GEMINI_API_KEY || process.env.GEMINI_API_KEY });

async function listarModelos() {
    try {
        const response = await ai.models.list();
        console.log('--- Modelos disponibles en tu API Key ---');
        for await (const model of response) {
            // Mostramos los modelos que contengan 'flash' (son los optimizados para velocidad)
            if (model.name.includes('flash')) {
                console.log(model.name.replace('models/', ''));
            }
        }
    } catch (error) {
        console.error('❌ Error al consultar modelos:', error);
    }
}

listarModelos();