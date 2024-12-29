package com.embelSoft.controller;


import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CSVWriter {

    public static void main() {
        // Define the data with options
        List<String[]> data = new ArrayList<>();
        data.add(new String[]{"Name", "Option"});
        data.add(new String[]{"John", "Option 1"});
        data.add(new String[]{"Alice", "Option 2"});
        data.add(new String[]{"Bob", "Option 1"});
        data.add(new String[]{"Eve", "Option 3"});

        // Specify the file path for the CSV file
        String csvFilePath = "C:/Users/Atharva Solaskar/Desktop/data_with_options.csv";

        // Create and write to the CSV file
        try (FileWriter writer = new FileWriter(csvFilePath)) {
            for (String[] row : data) {
                writer.write(String.join(",", row) + "\n");
            }
            System.out.println("CSV file '" + csvFilePath + "' has been created.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

