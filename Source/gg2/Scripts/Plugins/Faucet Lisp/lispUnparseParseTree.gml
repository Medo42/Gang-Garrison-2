// real lispUnparseParseTree(real input)
// Takes ds_list parse tree (input) and returns it in s-expression string form

var input;
input = argument0;

var output, i, value;
output = '(';
for (i = 0; i < ds_list_size(input); i += 1)
{
    value = ds_list_find_value(input, i);
    if (is_string(value))
        output += value;
    else
        output += lispUnparseParseTree(value);
    if (i < ds_list_size(input) - 1)
        output += ' ';
}
output += ')'

return output;
