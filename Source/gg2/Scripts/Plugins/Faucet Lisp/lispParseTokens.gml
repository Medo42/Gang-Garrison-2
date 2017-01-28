// real lispParseTokens(real tokens)
// Parses a tokenised s-expression and returns a ds_list parse tree
// Warning! This will empty the token list.

var tokens;
tokens = argument0;

var list;
list = ds_list_create();

if (ds_list_find_value(tokens, 0) != '(')
    show_error("Error in Faucet Lisp code: first token isn't an opening bracket - what?", true);
else
    ds_list_delete(tokens, 0);

while (!ds_list_empty(tokens))
{
    var head;
    head = ds_list_find_value(tokens, 0);
    if (head == '(')
        ds_list_add(list, lispParseTokens(tokens));
    else if (head == ')')
    {
        ds_list_delete(tokens, 0);
        lispDesugarParseTree(list);
        return list;
    }
    else
    {
        ds_list_add(list, head);
        ds_list_delete(tokens, 0);
    }
}

show_error("Error in Faucet Lisp code: unexpected end of input - unmatched opening bracket", true);
