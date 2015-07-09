// void i18nInit(string language)
// Loads strings for a specific language and initialises i18n subsystem
// "language" is an IETF language tag, e.g. "en", "de-DE", "zh-TW"
// This should be run ONCE on GG2 startup

var language;
language = argument0;

if (variable_global_exists('i18nStrings'))
    show_error("i18Init() has already been called. i18Init() must only be called once.", true);

// English is the default/built-in language, it doesn't need to be loaded
if (language == "en")
{
    global.i18nStrings = ds_map_create();
    exit;
}
    
var path;
path = working_directory + "\" + language + ".lang";
    
if (!file_exists(path))
{
    show_message("Could not locate language file for '" + language + "', falling back to 'en' (English)");
    i18nInit("en");
    exit;
}

var fp, content;
fp = file_text_open_read(working_directory + "\" + language + ".lang");
content = '';

while (!file_text_eof(fp))
{
    content += file_text_read_string(fp);
    content += chr(10) + chr(13); // CRLF
    file_text_readln(fp); // This doesn't actually "read" a line, skips to next
}

file_text_close(fp);

global.i18nStrings = ggon_decode(content);
