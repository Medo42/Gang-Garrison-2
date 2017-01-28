// real lispDesugarParseTree(real list)
// De-sugars a ds_list parse tree *non-recursively*
// This replaces the '(...) shortcut with (quote ...)

var list;
list = argument0;

var i, atom, sublist;
for (i = 0; i < ds_list_size(list); i += 1)
{
    atom = ds_list_find_value(list, i);
    if (is_real(atom))
        continue;
    if (atom == "'")
    {
        if (i == ds_list_size(list) - 1)
            show_error("Error in Faucet Lisp code: quote operator must be followed by an atom to quote", true);
        sublist = ds_list_create();
        ds_list_add(sublist, 'quote');
        ds_list_add(sublist, ds_list_find_value(list, i + 1));
        ds_list_replace(list, i, sublist);
        ds_list_delete(list, i + 1);
    }
}
