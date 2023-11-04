
# Translated Text to Armenian


This Bash script allows you to translate text from an auto-detected source language to Armenian using the Google Translate API. Additionally, it provides instructions on how to customize the translation language and create shortcuts for convenience.

## Table of Contents

- [Usage](#usage)
- [Customizing the Translation Language](#customizing-the-translation-language)
- [Creating a Shortcut](#creating-a-shortcut)
- [Contributing](#contributing)

## Usage

1. **Clone or Download Repository**:
   - Start by cloning or downloading this repository to your local machine.

2. **Install Dependencies**:
   - Make sure you have the necessary dependencies installed:
     - `wget`: To fetch data from the internet.
     - `jq`: A lightweight and flexible command-line JSON processor.
   - If you don't have them, you can install them using your package manager.

3. **Navigate to the Script Directory**:
   - Open a terminal and navigate to the directory where you saved the script.

4. **Run the Script**:
   - Execute the following command to run the script:

   ```bash
   ./translate_to_armenian.sh
   ```

5. **Input Text**:
   - The script will prompt you to provide the text you want to translate.

6. **Translation**:
   - Once you've entered the text, it will split it into sentences and translate each sentence to Armenian.

7. **View Translated Text**:
   - The translated text will be displayed in the terminal window.

## Customizing the Translation Language

By default, this script translates to Armenian (tl=hy). If you want to change the target language to something else, you can modify the `tl` parameter in the URL within the script.

- Find the line in the script where the translation occurs:

  ```bash
  translate="$(wget -U "Mozilla/5.0" -qO - "http://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=hy&dt=t&q=$(echo "$sentence" | sed "s/[\"'<>]//g")" | jq -r '.[0][0][0]')"
  ```

- Change the `tl=hy` part to your desired language code. For example, to translate to French, use `tl=fr`.

- Save the script.

Now, when you run the script, it will translate the text to your specified target language.

## Creating a Shortcut

To create a convenient shortcut for running the script, you can follow these steps:

1. **Make the Script Executable**:

   ```bash
   chmod +x translate_to_armenian.sh
   ```

2. **Create a Symbolic Link**:

   - Create a symbolic link to the script in a directory that's in your system's `PATH`. For example, you can create a symbolic link in `/usr/local/bin` to make it accessible system-wide:

   ```bash
   sudo ln -s /path/to/translate_to_armenian.sh /usr/local/bin/translate
   ```

   Replace `/path/to/translate_to_armenian.sh` with the actual path to your script.

3. **Run the Script with the Shortcut**:

   - Now you can run the script by simply typing `translate` in the terminal:

   ```bash
   translate
   ```

Enjoy using this script for easy text translation to the language of your choice!

## Contributing

If you would like to contribute to this project, feel free to open issues, suggest improvements, or submit pull requests. We welcome your input and collaboration!
