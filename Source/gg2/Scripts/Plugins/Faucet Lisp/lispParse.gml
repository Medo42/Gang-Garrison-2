// real lispParse(string input)
// Parses a Faucet Lisp s-expression string (input) and returns result as a ds_list

var input;
input = argument0;

var tokens;
tokens = lispTokenise(input);

var result;
result = lispParseTokens(tokens);

ds_list_destroy(tokens);

var list;
list = lispParseTreeToConsList(result);

show_message(input + "##became:##" + lispUnparseParseTree(list));
lispDestroyCell(list);

show_message("Un-garbage-collected cells remaining: " + string(ds_map_size(global.lispReferenceCount)));
