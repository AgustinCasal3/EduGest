import { TextInput, StyleSheet, KeyboardTypeOptions } from "react-native";

interface TextBoxProp{
    placeholder: string;
    value: string;
    onChangeText?: (Text: string) => void;
    secureTextEntry?: boolean;
    keyboardType?: KeyboardTypeOptions;
}

export default function TextBox ({
    placeholder,
    value,
    onChangeText,
    secureTextEntry,
    keyboardType,
}: TextBoxProp){
    return(
        <TextInput
        style={styles.textBox}
        placeholder={placeholder}
        value={value}
        onChangeText={onChangeText}
        secureTextEntry={secureTextEntry}
        keyboardType={keyboardType}
        />
    );
}

const styles = StyleSheet.create({
    textBox: {
        backgroundColor: "blue",
        borderRadius: 12,
        paddingHorizontal: 16,
        paddingVertical: 14,
        fontSize: 16,
        width: 220,
    },
});