import { KeyboardTypeOptions, StyleSheet, TextInput } from "react-native";

interface TextBoxProp{
    placeholder: string;
    placeholderTextColor?: string;
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
        placeholderTextColor="a3a3a3"
        value={value}
        onChangeText={onChangeText}
        secureTextEntry={secureTextEntry}
        keyboardType={keyboardType}
        />
    );
}

const styles = StyleSheet.create({
    textBox: {
        backgroundColor: "#d9d9d9",
        borderWidth: 2,
        borderColor: "black",
        borderRadius: 20,
        paddingHorizontal: 16,
        paddingVertical: 14,
        fontSize: 16,
        width: 220,
        marginBottom: 15,
    },
});