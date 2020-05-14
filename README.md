# cli-tools
Command line tools in Bash developed by Luiz Felipe.  
For see help about any tool, just run:
```
$ toolname -h
```

## log
This tool creates sections to log all the commands inserted in the Terminal.  
The log can be exported in simple text format or HTML.  
Is possible restore the section and navigate by the commands.

## new
```
new [-h|-e|-b] <mbr|raw|template_name> [option=value...]
```
Creates a new text or binary file using templates.
The texts templates have special tags to insert content by option, file or environment variable.
The binaries templates is a sequence of commands to construct a binary format.
For see examples of templates, see the [templates](./templates) directory.

## shellcoder
Tool for write shellcodes using nasm. For see help, run the tool and insert "/help"

## ccs
Encrypts literal strings in C source code to be decrypted in runtime.  
Example:
```c
#include <stdio.h>
#include <string.h>

int main(void)
{
  char input[65];
  char passwd[] = _E("my-password");

  scanf("%64[^\n]", input);

  if ( !strcmp(input, cdec(passwd)) ) {
    puts("Welcome back!");
  } else {
    puts("Who are you?");
  }

  return 0;
}
```
## pack
This tool packs a bash script in one output file, including the loaded files
with `source` instruction like the C `#include` directive.

## cb
A command-line calculator like BC.

## ps-fields
This is a prompt with customizable fields. By default it's just displayed informations about a git project if you is inside a project folder showing the current branch and number of files tracked and untracked. But you can create new fields running customizable code.

To install, just source the `.ps-fields.sh` file in the `.bashrc` or `.profile` file inside your home.  
You can create new fields just setting the `PSF` array, any value in the array is a command to be executed. The output of the command is displayed in the field:

![ps-fields-1](https://i.imgur.com/RVvkKMb.png)

You can create functions or scripts and run it in the field to do complex fields.  
To delete a field, just do `unset PSF[field-number]` or `unset PSF` to delete all fields.