// real lispTokensToConsList(real tokens)
// Takes a ds_list parse tree and returns a version made of cons cells (i.e. a lisp list)

var tokens;
tokens = argument0;

var i, tail, token;
tail = lispNil();
for (i = ds_list_size(tokens) - 1; i >= 0; i -= 1)
{
    token = ds_list_find_value(tokens, i);
    // If it's real then it's a ds_list handle, so we'll go all recursive
    if (is_real(token))
        token = lispParseTreeToConsList(token);
    tail = lispCons(token, tail);
}

return tail;
