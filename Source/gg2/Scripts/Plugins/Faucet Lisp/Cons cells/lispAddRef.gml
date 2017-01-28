// real lispAddRef(real/string thing)
// Increments the reference counter of a thing, if reference-counted

var thing;
thing = argument0;

// Strings aren't reference-counted
if (is_string(thing))
    exit;

// Nil isn't reference-counted
if (lispIsNil(thing))
    exit;

if (!variable_global_exists("lispReferenceCount"))
    global.lispReferenceCount = ds_map_create();

if (ds_map_exists(global.lispReferenceCount, thing))
{
    var refcount;
    refcount = ds_map_find_value(global.lispReferenceCount, thing);
    refcount += 1;
    ds_map_replace(global.lispReferenceCount, thing, refcount);
}
else
    ds_map_add(global.lispReferenceCount, thing, 1);
