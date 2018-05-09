# Sphinx4 Language Model Generator

This [image](https://hub.docker.com/r/sskorol/sphinx-lm-generator/) helps to simplify a Sphinx4 language model generation process.

## Usage
Download latest image:
```sh
docker pull sskorol/sphinx-lm-generator
```
Create a folder with a text file, which contains a set of commands you want to create a language model for:
```fundamental
light on
tv on
light off
tv off
```
Run a container mapping the above folder, and passing a file with corresponding commands as argument:
```sh
docker run -v ~/data:/data sskorol/sphinx-lm-generator /data/commands.txt
```
Check **data** folder. There should be 2 new files generated: **commands.lm** and **commands.lm.bin**.

You can now use **commands.lm.bin** in your Sphinx4 code:
```java
Configuration configuration = new Configuration();
configuration.setAcousticModelPath("resource:/edu/cmu/sphinx/models/en-us/en-us");
configuration.setDictionaryPath("resource:/edu/cmu/sphinx/models/en-us/cmudict-en-us.dict");
configuration.setLanguageModelPath("resource:/model/commands.lm.bin");
```
