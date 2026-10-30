require('dotenv').config();
const { GoogleGenAI } = require('@google/genai');

const ai = new GoogleGenAI({ apiKey: process.env.GEMINI_API_KEY });

async function probarIA() {
    console.log('⚡ Enviando consulta optimizada...');
    console.time('⏱️ Tiempo total de respuesta'); // Mide los milisegundos exactos

    try {
        const response = await ai.models.generateContent({
            // 'gemini-1.5-flash-8b' es la versión más rápida y liviana del tier gratuito
            model: 'gemini-3.1-flash-lite', 
            contents: 'holi podriamos rolear como chicas de anime neko? crea un escenario y una escena interesante con una premisa prometedora',
            config: {
                maxOutputTokens: 1000, // Limita la respuesta para que no demore redactando de más
                temperature: 1      // Equilibrio entre precisión y creatividad
            }
        });

        console.log('\n✅ Respuesta recibida de Gemini:');
        console.log(response.text);
    } catch (error) {
        console.error('❌ Error:', error);
    } finally {
        console.timeEnd('⏱️ Tiempo total de respuesta');
    }
}

probarIA();