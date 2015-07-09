// string _(string name)
// Looks up the named language string in the current language
// If unavailable, simply returns the string given
// Usage-wise, the name should just be the English text

var name;
name = argument0;

if (ds_map_exists(global.i18nStrings, name))
    return ds_map_find_value(global.i18nStrings, name);
else
    return name;
