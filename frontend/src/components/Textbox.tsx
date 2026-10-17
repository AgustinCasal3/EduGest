import { KeyboardTypeOptions, StyleSheet, TextInput, StyleProp, TextStyle, TextInputProps } from "react-native";

interface TextBoxProp{
    placeholder: string;
    placeholderTextColor?: string;
    value?: string;
    onChangeText?: (Text: string) => void;
    secureTextEntry?: boolean;
    keyboardType?: KeyboardTypeOptions;
    autoCapitalize?: TextInputProps["autoCapitalize"];
    autoCorrect?: boolean;
    error?: boolean;
    style?: StyleProp<TextStyle>;
}

export default function TextBox ({
    placeholder,
    placeholderTextColor,
    value,
    onChangeText,
    secureTextEntry,
    keyboardType,
    autoCapitalize,
    autoCorrect,
    error,
    style,
}: TextBoxProp){
    return(
        <TextInput
        style={[styles.textBox, error && styles.textBoxError, style]}
        placeholder={placeholder}
        placeholderTextColor={placeholderTextColor ?? "#a3a3a3"}
        value={value}
        onChangeText={onChangeText}
        secureTextEntry={secureTextEntry}
        keyboardType={keyboardType}
        autoCapitalize={autoCapitalize}
        autoCorrect={autoCorrect}
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
        // marginBottom: 15,
    },
    textBoxError: {
        borderColor: "#d32f2f",
        backgroundColor: "#fdecea",
    },
});