package main

import (
	"flag"
	"fmt"
	"os"
	"path/filepath"

	"google.golang.org/protobuf/encoding/protojson"
	"google.golang.org/protobuf/proto"
)

func write_to_file(filename string, data []byte) error {
	return os.WriteFile(filename, data, 0644)
}

func read_from_file(filename string) ([]byte, error) {
	data, err := os.ReadFile(filename)
	if err != nil {
		return nil, fmt.Errorf("failed to read file %s: %w", filename, err)
	}
	return data, nil
}

func marshal_data_write_to_file(outputDir, filename string, data []byte) error {
	// Create output directory if it doesn't exist
	if err := os.MkdirAll(outputDir, 0755); err != nil {
		return fmt.Errorf("failed to create output directory %s: %w", outputDir, err)
	}

	outputPath := filepath.Join(outputDir, fmt.Sprintf("%s.bin", filename))
	if err := write_to_file(outputPath, data); err != nil {
		return fmt.Errorf("failed to write to file %s: %w", outputPath, err)
	}

	return nil
}

func marshal_and_write_test_case(outputDir, name string, testCase proto.Message, format string) {
	if format == "json" {
		data, err := protojson.Marshal(testCase)
		if err != nil {
			fmt.Fprintf(os.Stderr, "Error marshaling %s to JSON: %v\n", name, err)
			return
		}
		outputPath := filepath.Join(outputDir, fmt.Sprintf("%s.json", name))
		if err := write_to_file(outputPath, data); err != nil {
			fmt.Fprintf(os.Stderr, "Error writing JSON %s: %v\n", name, err)
			os.Exit(1)
		}
	} else {
		options := proto.MarshalOptions{
			Deterministic: true,
		}
		data, err := options.Marshal(testCase)
		if err != nil {
			fmt.Fprintf(os.Stderr, "Error marshaling %s: %v\n", name, err)
			return
		}
		if err := marshal_data_write_to_file(outputDir, name, data); err != nil {
			fmt.Fprintf(os.Stderr, "Error generating %s: %v\n", name, err)
			os.Exit(1)
		}
	}
}

func main() {
	var outputDir = flag.String("o", "./bin", "Output directory for generated files")
	flag.StringVar(outputDir, "output", "./bin", "Output directory for generated files")
	var format = flag.String("f", "bin", "Output format: bin or json")
	flag.StringVar(format, "format", "bin", "Output format: bin or json")
	var help = flag.Bool("help", false, "Show help message")

	flag.Usage = func() {
		fmt.Fprintf(os.Stderr, "Usage: %s [OPTIONS]\n\n", os.Args[0])
		fmt.Fprintf(os.Stderr, "Generate protobuf test case files.\n\n")
		fmt.Fprintf(os.Stderr, "Options:\n")
		flag.PrintDefaults()
		fmt.Fprintf(os.Stderr, "\nExamples:\n")
		fmt.Fprintf(os.Stderr, "  %s                           # Generate bin files to ./bin\n", os.Args[0])
		fmt.Fprintf(os.Stderr, "  %s -o ./test-data            # Generate bin files to ./test-data\n", os.Args[0])
		fmt.Fprintf(os.Stderr, "  %s --output /tmp/protobuf    # Generate bin files to /tmp/protobuf\n", os.Args[0])
		fmt.Fprintf(os.Stderr, "  %s -f json                   # Generate json files to ./bin\n", os.Args[0])
		fmt.Fprintf(os.Stderr, "  %s --format json             # Generate json files to ./bin\n", os.Args[0])
	}

	flag.Parse()
	if *help {
		flag.Usage()
		os.Exit(0)
	}

	for i, testCase := range p3testCases {
		name := fmt.Sprintf("proto3_test_case_%d", i+1)
		marshal_and_write_test_case(*outputDir, name, testCase, *format)
	}
	for i, testCase := range p2testCases {
		name := fmt.Sprintf("proto2_test_case_%d", i+1)
		marshal_and_write_test_case(*outputDir, name, testCase, *format)
	}

	name := "proto3_empty"
	if *format == "json" {
		outputPath := filepath.Join(*outputDir, fmt.Sprintf("%s.json", name))
		if err := write_to_file(outputPath, []byte("{}")); err != nil {
			fmt.Fprintf(os.Stderr, "Error writing JSON %s: %v\n", name, err)
			os.Exit(1)
		}
	} else {
		write_to_file(filepath.Join(*outputDir, fmt.Sprintf("%s.bin", name)), emptyTestCase)
	}
}
