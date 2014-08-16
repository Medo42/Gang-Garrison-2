// creates game objects per the list in the entity data

// argument0: entity data

var ent_file, ent_fileName;

ent_fileName = program_directory + "\Decompiled\Entities\" + global.map + ".ent";
ent_file = file_text_open_write(ent_fileName);
file_text_write_string(ent_file, "{ENTITIES}");
file_text_write_string(ent_file, chr(10));
file_text_write_string(ent_file, argument0);
file_text_write_string(ent_file, chr(10));
file_text_write_string(ent_file, "{END ENTITIES}");
file_text_close(ent_file);

// we are finally done!
load_decomp();
exit;