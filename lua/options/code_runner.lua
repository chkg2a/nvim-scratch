require("code_runner").setup({
	filetype = {
		c = {
			"cd '$dir' &&",
			"gcc $fileName -o out.$fileNameWithoutExt -Ofast -march=native &&",
			"/usr/bin/time -o memUsage.txt -f%M ./out.$fileNameWithoutExt &&",
			"echo '' &&",
			"cat memUsage.txt | awk '{printf \"Memory Usage: %.1f MB\\n\", $1/1024}' &&",
			"rm ./out.$fileNameWithoutExt &&",
			"rm ./memUsage.txt",
		},
		java = {
			"cd '$dir' &&",
			"javac $fileName &&",
			"java $fileNameWithoutExt &&",
			"rm *.class &&",
		},
		cpp = {
			"cd '$dir' &&",
			"g++ $fileName -o out.$fileNameWithoutExt -Ofast -march=native -lfn&&",
			"/usr/bin/time -o memUsage.txt -f%M ./out.$fileNameWithoutExt &&",
			"echo '' &&",
			"cat memUsage.txt | awk '{printf \"Memory Usage: %.1f MB\\n\", $1/1024}' &&",
			"rm ./out.$fileNameWithoutExt &&",
			"rm ./memUsage.txt",
		},
		python = "python3 -u",
    asm = {
			"cd '$dir' &&",
      "nasm -f elf64 $fileName &&",
      "ld $fileNameWithoutExt.o -o $fileNameWithoutExt &&",
      "./$fileNameWithoutExt"
    }
	},
})
